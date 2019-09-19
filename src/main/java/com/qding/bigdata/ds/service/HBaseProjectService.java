package com.qding.bigdata.ds.service;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/5/8 17:13
 * @description
 */
public interface HBaseProjectService {

    List<String> getRoomListById(String tableName, String rowKey, String family) throws Exception;
}
