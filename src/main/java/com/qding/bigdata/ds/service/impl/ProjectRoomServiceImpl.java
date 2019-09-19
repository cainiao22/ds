package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.component.HbaseHandler;
import com.qding.bigdata.ds.model.HBaseBatchQueryParam;
import com.qding.bigdata.ds.model.HbaseColumn;
import com.qding.bigdata.ds.model.ProjectRoomInfo;
import com.qding.bigdata.ds.service.ProjectRoomService;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.util.Bytes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/5/9 20:19
 * @description
 */

@Service
public class ProjectRoomServiceImpl implements ProjectRoomService {

    @Autowired
    HbaseHandler hbaseHandler;

    private static final String HBASE_TABLE_NAME = "hbase_room_profile";
    private static final String HBASE_FAMILY_NAME = "room_info";

    @Override
    public Result<List<ProjectRoomInfo>> getRoomInfoByIds(final String[] roomIds) throws Exception {
        if(roomIds.length == 0){
            return Result.success(Collections.EMPTY_LIST);
        }
        HBaseBatchQueryParam param = new HBaseBatchQueryParam();
        param.setRowkeyList(roomIds);
        param.setTableName(HBASE_TABLE_NAME);
        param.getFamily().add(HBASE_FAMILY_NAME);

        List<ProjectRoomInfo> list = hbaseHandler.getByBatchRowKey(param, ProjectRoomInfo.class);

        return Result.success(list);
    }
}
