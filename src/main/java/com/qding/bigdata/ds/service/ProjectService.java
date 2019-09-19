package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.Result;


/**
 * @author yanpf
 * @date 2018/5/9 16:33
 * @description
 */
public interface ProjectService {

    Result getRoomIdByProjectIdForPage(String projectId, Boolean isBind, Integer pageSize, Integer currentPage);

    Result getRoomInfoByProjectIdForPage(String projectId, Boolean isBind, Integer pageSize, Integer currentPage);

}
