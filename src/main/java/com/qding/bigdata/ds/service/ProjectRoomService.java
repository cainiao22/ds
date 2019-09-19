package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.ProjectRoomInfo;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/5/9 20:18
 * @description
 */
public interface ProjectRoomService {

    Result<List<ProjectRoomInfo>> getRoomInfoByIds(String[] roomIds) throws Exception;
}
