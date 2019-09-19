package com.qding.bigdata.ds.datatransform.transport.sql.hive;

import com.qding.bigdata.ds.datatransform.channel.Channel;
import com.qding.bigdata.ds.datatransform.record.Record;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;
import com.qding.bigdata.ds.datatransform.record.TerminatedRecord;
import com.qding.bigdata.ds.datatransform.transport.Writer;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/4/26 12:13
 * @description
 */
public class HiveMetaWriter extends Writer {

    private static final String CREATE_TABLE = "CREATE TABLE ${tableName} (\n" +
            "  `id` char(32) NOT NULL,\n" +
            "  `config_type` text NOT NULL,\n" +
            "  `config_key` text NOT NULL,\n" +
            "  `config_parent` text,\n" +
            "  `config_value` mediumtext NOT NULL,\n" +
            "  `config_order` int(32) DEFAULT '0',\n" +
            "  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,\n" +
            "  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',\n" +
            "  `description` mediumtext,\n" +
            "  `status` enum('SUC','RUN','IDEL') DEFAULT NULL\n" +
            ")";

    public HiveMetaWriter(Channel channel) {
        super(channel);
    }

    @Override
    protected void init() {

    }

    @Override
    protected void preHandle() {

    }

    @Override
    protected void write() {
        while(true) {
            List<Record> list = new ArrayList<Record>();
            channel.drainTo(list);
            for(Record record : list) {
                if (TerminatedRecord.class.isInstance(record)) {
                    System.out.println("任务完毕 退出!!!");
                    return;
                }
                MetaRecord realRecord = (MetaRecord) record;

                System.out.println(realRecord.toString());
            }
        }

    }
}
