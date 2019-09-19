package com.qding.bigdata.ds.datatransform.transport;

import com.qding.bigdata.ds.datatransform.channel.Channel;
import com.qding.bigdata.ds.datatransform.record.TerminatedRecord;

/**
 * @author yanpf
 * @date 2018/4/26 10:20
 * @description
 */
public abstract class Reader {

    protected Channel channel;

    public Reader(Channel channel) {
        this.channel = channel;
    }

    public void start(){
        new Thread(new Runnable() {
            @Override
            public void run() {
                Reader.this.init();
                try {
                    Reader.this.preHandle();
                    Reader.this.read();
                }catch (Exception e){

                }finally {
                    Reader.this.postHandle();
                }
            }
        }).start();

    }

    protected abstract void init();

    protected abstract void preHandle();

    protected abstract void read();

    public void postHandle(){
        channel.push(TerminatedRecord.getInstance());
    }
}
