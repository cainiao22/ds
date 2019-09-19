package com.qding.bigdata.ds.datatransform.transport;

import com.qding.bigdata.ds.datatransform.channel.Channel;
import com.qding.bigdata.ds.datatransform.record.TerminatedRecord;

/**
 * @author yanpf
 * @date 2018/4/26 10:22
 * @description
 */
public abstract class Writer {

    protected Channel channel;

    public Writer(Channel channel) {
        this.channel = channel;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) {
        this.channel = channel;
    }

    public void start(){
        new Thread(new Runnable() {
            @Override
            public void run() {
                Writer.this.init();
                try {
                    Writer.this.preHandle();
                    Writer.this.write();
                }catch (Exception e){

                }finally {
                    Writer.this.postHandle();
                }
            }
        }).start();

    }

    protected abstract void init();

    protected abstract void preHandle();

    protected abstract void write();

    public void postHandle(){
        channel.push(TerminatedRecord.getInstance());
    }

}
