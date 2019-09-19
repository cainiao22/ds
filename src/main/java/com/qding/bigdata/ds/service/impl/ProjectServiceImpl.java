package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.common.PageResult;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.component.HbaseHandler;
import com.qding.bigdata.ds.model.HbaseQueryParam;
import com.qding.bigdata.ds.model.ProjectRoomInfo;
import com.qding.bigdata.ds.service.ProjectRoomService;
import com.qding.bigdata.ds.service.ProjectService;
import org.apache.hadoop.hbase.Cell;
import org.apache.hadoop.hbase.CellUtil;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.util.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author yanpf
 * @date 2018/5/9 16:34
 * @description
 */

@Service
public class ProjectServiceImpl implements ProjectService {

    private static final String HBASE_TABLE_NAME = "hbase_room_bind_info";

    private static final String HBASE_FAMILY_IS_BIND = "isbind";

    private static final String HBASE_FAMILY_NO_BIND = "nobind";

    private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private static final int YESTORDAY_DATA_HOUR = 7;

    @Autowired
    ProjectRoomService projectRoomService;

    @Autowired
    HbaseHandler hbaseHandler;

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public Result getRoomIdByProjectIdForPage(String projectId, Boolean isBind, final Integer pageSize, final Integer currentPage) {
        HbaseQueryParam param = new HbaseQueryParam();
        param.setTableName(HBASE_TABLE_NAME);
        param.setRowKey(projectId);
        param.setMaxVersions(2);
        if(isBind != null && isBind == true){
            param.getFamily().add(HBASE_FAMILY_IS_BIND);
        }else if(isBind != null && isBind == false){
            param.getFamily().add(HBASE_FAMILY_NO_BIND);
        }
        try{
            final Result rooms = hbaseHandler.getByRowKey(param, new HbaseHandler.HandleCallBack<Result>() {
                @Override
                public Result callBack(org.apache.hadoop.hbase.client.Result result) {
                    List<String> list = new ArrayList<String>();
                    PageResult pageResult = new PageResult();
                    pageResult.setPageSize(pageSize);
                    pageResult.setCurrentPage(currentPage);
                    if(result != null){
                        int total = result.size();
                        pageResult.setTotal(total);
                        int offset = 0;
                        if(pageSize != null && currentPage != null){
                            offset = pageSize*(currentPage - 1);
                        }
                        if(offset >= total){
                            return pageResult;
                        }

                        List<Cell> cellList = result.listCells();
                        Calendar calendar = Calendar.getInstance();
                        //数据库每天2点更新,3点以后一定是最新的了
                        String curTimestamp = dateFormat.format(calendar.getTime());
                        if(calendar.get(Calendar.HOUR_OF_DAY) <= YESTORDAY_DATA_HOUR){
                            calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
                            curTimestamp = dateFormat.format(calendar.getTime());
                        }
                        for(int i=0; i<total; i++){
                            Cell cell = cellList.get(i);
                            long timestamp = cell.getTimestamp();
                            if(curTimestamp.equals(dateFormat.format(new Date(timestamp)))) {
                                list.add(Bytes.toString(CellUtil.cloneQualifier(cell)));
                            }
                        }
                        List<String> subList = list;
                        int end = list.size();
                        if(pageSize != null){
                            end = Math.min(offset + pageSize, total);
                        }
                        if(end < total){
                            subList = list.subList(offset, end);
                        }
                        pageResult.setData(subList);
                    }

                    return pageResult;
                }
            });

            return rooms;

        }catch (Exception e){
            return Result.failed(500, "数据获取异常:" + e.getMessage());
        }

    }

    @Override
    public Result getRoomInfoByProjectIdForPage(String projectId, Boolean isBind, final Integer pageSize, final Integer currentPage) {
        HbaseQueryParam param = new HbaseQueryParam();
        param.setTableName(HBASE_TABLE_NAME);
        param.setRowKey(projectId);
        param.setMaxVersions(2);
        if(isBind != null && isBind == true){
            param.getFamily().add(HBASE_FAMILY_IS_BIND);
        }else if(isBind != null && isBind == false){
            param.getFamily().add(HBASE_FAMILY_NO_BIND);
        }
        try{
            final PageResult<List<Pair<String, Boolean>>> rooms = hbaseHandler.getByRowKey(param, new HbaseHandler.HandleCallBack<PageResult>() {
                @Override
                public PageResult callBack(org.apache.hadoop.hbase.client.Result result) {
                    List<Pair<String, Boolean>> list = new ArrayList<Pair<String, Boolean>>();
                    PageResult pageResult = new PageResult();
                    pageResult.setPageSize(pageSize);
                    pageResult.setCurrentPage(currentPage);
                    if(result != null){
                        int total = result.size();
                        int offset = 0;
                        if(pageSize != null && currentPage != null){
                            offset = pageSize*(currentPage - 1);
                        }
                        if(offset >= total){
                            return pageResult;
                        }

                        List<Cell> cellList = result.listCells();
                        Calendar calendar = Calendar.getInstance();
                        //数据库每天2点更新,3点以后一定是最新的了
                        String curTimestamp = dateFormat.format(calendar.getTime());
                        if(calendar.get(Calendar.HOUR_OF_DAY) <= YESTORDAY_DATA_HOUR){
                            calendar.set(Calendar.DATE, calendar.get(Calendar.DATE) - 1);
                            curTimestamp = dateFormat.format(calendar.getTime());
                        }
                        for(int i=0; i<total; i++){
                            Cell cell = cellList.get(i);
                            long timestamp = cell.getTimestamp();
                            if(curTimestamp.equals(dateFormat.format(new Date(timestamp)))) {
                                String roomId = Bytes.toString(CellUtil.cloneQualifier(cell));
                                String isBind = Bytes.toString(CellUtil.cloneFamily(cell));
                                if(HBASE_FAMILY_IS_BIND.equals(isBind.toLowerCase())){
                                    list.add(new Pair<String, Boolean>(roomId, true));
                                }else{
                                    list.add(new Pair<String, Boolean>(roomId, false));
                                }

                            }
                        }
						if(offset >= list.size()){
                            return pageResult;
                        }
                        pageResult.setTotal(list.size());
                        List<Pair<String, Boolean>> subList = list;
                        int end = list.size();
                        if(pageSize != null){
                            end = Math.min(offset + pageSize, total);
                        }
                        if(end < total){
                            subList = list.subList(offset, end);
                        }
                        pageResult.setData(subList);
                    }
                    return pageResult;
                }
            });
            if(rooms.getData() == null || rooms.getData().size() == 0){
                return Result.success(Collections.EMPTY_LIST);
            }
            String[] roomIds = new String[rooms.getData().size()];
            Map<String, Boolean> map = new HashMap<String, Boolean>();
            int i = 0;
            for (Pair<String, Boolean> pair : rooms.getData()) {
                roomIds[i] = pair.getFirst();
                map.put(pair.getFirst(), pair.getSecond());
                i++;
            }

            Result<List<ProjectRoomInfo>> roomInfoResult = projectRoomService.getRoomInfoByIds(roomIds);
            List<ProjectRoomInfo> roomInfos = roomInfoResult.getData();
            if(roomInfos == null){
                return roomInfoResult;
            }
            for (ProjectRoomInfo roomInfo : roomInfos) {
                roomInfo.setBind(map.get(roomInfo.getRoomId()));
            }

            Map<String, ProjectRoomInfo> roomInfoMap = new HashMap<String, ProjectRoomInfo>();
            for (ProjectRoomInfo roomInfo : roomInfos) {
                roomInfoMap.put(roomInfo.getRoomId(), roomInfo);
            }

            PageResult<List<ProjectRoomInfo>> finalResult = new PageResult<List<ProjectRoomInfo>>();
            finalResult.setData(new ArrayList<ProjectRoomInfo>());
            finalResult.setPageSize(rooms.getPageSize());
            finalResult.setCurrentPage(rooms.getCurrentPage());
            finalResult.setTotal(rooms.getTotal());
            for (String roomId : roomIds) {
                ProjectRoomInfo roomInfo = roomInfoMap.get(roomId);
                if(roomInfo != null) {
                    finalResult.getData().add(roomInfo);
                }else{
                    ProjectRoomInfo nullRoom = new ProjectRoomInfo();
                    nullRoom.setRoomId(roomId);
                    nullRoom.setBind(map.get(roomId));
                    finalResult.getData().add(nullRoom);
                }
            }

            return finalResult;

        }catch (Exception e){
            return Result.failed(500, "数据获取异常:" + e.getMessage());
        }
    }
}
