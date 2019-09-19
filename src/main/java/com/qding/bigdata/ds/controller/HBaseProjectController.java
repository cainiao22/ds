package com.qding.bigdata.ds.controller;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.service.ProjectRoomService;
import com.qding.bigdata.ds.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author yanpf
 * @date 2018/5/8 17:23
 * @description 获取社区对应的room信息
 */

@Controller
@RequestMapping("hbaseProject")
public class HBaseProjectController {

    @Autowired
    ProjectService hbaseProjectService;

    @Autowired
    ProjectRoomService hbaseRoomService;



    @ResponseBody
    @RequestMapping("getRoomIdListById")
    public Result getRoomIdListById(String projectId, Integer currentPage, Integer pageSize, Boolean isBind){
        if(currentPage != null && currentPage == 0){
            currentPage = 1;
        }
        return hbaseProjectService.getRoomIdByProjectIdForPage(projectId, isBind, pageSize, currentPage);
    }

    @ResponseBody
    @RequestMapping("getRoomInfo")
    public Result getRoomInfo(String[] roomIds) throws Exception {
        return hbaseRoomService.getRoomInfoByIds(roomIds);
    }

    @ResponseBody
    @RequestMapping("getRoomListById")
    public Result getRoomInfoListById(String projectId, Integer currentPage, Integer pageSize, Boolean isBind){
        if(currentPage != null && currentPage == 0){
            currentPage = 1;
        }
        return hbaseProjectService.getRoomInfoByProjectIdForPage(projectId, isBind, pageSize, currentPage);
    }
}
