package com.qding.bigdata.ds.component;

import com.alibaba.fastjson.JSONObject;
import io.netty.bootstrap.Bootstrap;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LengthFieldBasedFrameDecoder;
import io.netty.handler.codec.LengthFieldPrepender;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.net.InetSocketAddress;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created by yanpf on 2017/9/7.
 */

public class NettyClientHandler {

    private static final Charset UTF_8 = Charset.forName("utf-8");

    private ClientHandler clientHandler = new ClientHandler();

    private Bootstrap bootstrap;

    private ChannelFuture future;

    private boolean init = false;

    private boolean isClosed = false;

    public void start() {
        if(init) {
            throw new RuntimeException("client is already started");
        }
        //thread model: one worker thread pool,contains selector thread and workers‘.
        EventLoopGroup workerGroup = new NioEventLoopGroup(2);//1 is OK
        try {
            bootstrap = new Bootstrap();
            bootstrap.group(workerGroup)
                    .channel(NioSocketChannel.class) //create SocketChannel transport
                    .option(ChannelOption.CONNECT_TIMEOUT_MILLIS,10000)
                    .handler(new ChannelInitializer<SocketChannel>() {
                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception {
                            ch.pipeline().addLast(new LengthFieldBasedFrameDecoder(10240, 0, 2, 0, 2))
                                    .addLast(new StringDecoder(UTF_8))
                                    .addLast(new LengthFieldPrepender(2))
                                    .addLast(new StringEncoder(UTF_8))
                                    .addLast(clientHandler);//the same as ServerBootstrap
                        }
                    });
            //keep the connection with server，and blocking until closed!
            future = bootstrap.connect(new InetSocketAddress("127.0.0.1", 18080)).sync();
            init = true;
        } catch (Exception e) {
            isClosed = true;
        } finally {
            if(isClosed) {
                workerGroup.shutdownGracefully();
            }
        }
    }

    public void close() {
        if(isClosed) {
            return;
        }
        try {
            future.channel().close();
        } finally {
            bootstrap.group().shutdownGracefully();
        }
        isClosed = true;
    }

    /**
     * 发送消息
     * @param message
     * @return
     * @throws Exception
     */
    public String send(String message) throws Exception {
        if(isClosed || !init) {
            throw new RuntimeException("client has been closed!");
        }
        //send a request call,and blocking until recevie a response from server.
        return clientHandler.call(message,future.channel());
    }
}

class ClientHandler extends SimpleChannelInboundHandler<String> {

    private Map<Integer,String> response = new ConcurrentHashMap<Integer, String>();

    //key is sequence ID，value is request thread.
    private final Map<Integer,Thread> waiters = new ConcurrentHashMap<Integer, Thread>();

    private final AtomicInteger sequence = new AtomicInteger();


    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        //当channel就绪后。
        System.out.println("client channel is ready!");
        //ctx.writeAndFlush("started");//阻塞知道发送完毕
    }

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, String message) throws Exception {
        JSONObject json = JSONObject.parseObject(message);
        Integer id = json.getInteger("id");
        response.put(id,json.getString("md5Hex"));

        Thread thread = waiters.remove(id);//读取到response后，从waiters中移除并唤醒线程。
        synchronized (thread) {
            thread.notifyAll();
        }
    }


    public String call(String message,Channel channel) throws Exception {
        int id = sequence.incrementAndGet();//产生一个ID，并与当前request绑定
        Thread current = Thread.currentThread();
        waiters.put(id,current);
        JSONObject json = new JSONObject();
        json.put("id",id);
        json.put("source",message);
        channel.writeAndFlush(json.toString());
        while (!response.containsKey(id)) {
            synchronized (current) {
                current.wait();//阻塞请求调用者线程，直到收到响应响应
            }
        }
        waiters.remove(id);
        return response.remove(id);

    }
}
