package com.qding.bigdata.ds.datatransform.channel;

import com.qding.bigdata.ds.datatransform.record.Record;

import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * @author yanpf
 * @date 2018/4/26 12:07
 * @description
 */
public class MemoryChannel implements Channel {

    private BlockingQueue<Record> queue = new LinkedBlockingQueue<Record>(10);

    @Override
    public void push(Record record) {
        try {
            queue.put(record);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Record pull(){
        try {
            return queue.take();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int drainTo(List<Record> container){
       return queue.drainTo(container);
    }
}
