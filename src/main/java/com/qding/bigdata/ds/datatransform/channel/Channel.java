package com.qding.bigdata.ds.datatransform.channel;

import com.qding.bigdata.ds.datatransform.record.Record;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/4/26 10:18
 * @description
 */
public interface Channel {

    public void push(Record record);

    Record pull();

    public int drainTo(List<Record> container);
}
