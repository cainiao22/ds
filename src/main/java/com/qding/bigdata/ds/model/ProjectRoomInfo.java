package com.qding.bigdata.ds.model;

import com.qding.bigdata.ds.annotation.HBaseColumn;
import com.qding.bigdata.ds.annotation.HBaseRowKey;

/**
 * @author yanpf
 * @date 2018/5/9 20:24
 * @description
 */
public class ProjectRoomInfo {


    private Boolean isBind;
    /**
     * 房间id
     */
    @HBaseRowKey
    private String roomId;

    /**
     * 房间名称
     */
    @HBaseColumn(name = "room_name")
    private String roomName;

    /**
     * 所属单元
     */
    @HBaseColumn(name = "unit")
    private String unit;

    /**
     * 所属楼层
     */
    @HBaseColumn(name = "floor")
    private String floor;

    /**
     * 社区Id
     */
    @HBaseColumn(name = "project_id")
    private String projectId;

    /**
     * 社区名称
     */
    @HBaseColumn(name = "project_name")
    private String projectName;

    /**
     * 城市ID
     */
    @HBaseColumn(name = "region_id")
    private String regionId;

    /**
     * 城市名称
     */
    @HBaseColumn(name = "region_name")
    private String regionName;

    /**
     * 所属楼栋id
     */
    @HBaseColumn(name = "building_id")
    private String buildingId;

    /**
     * 所属楼栋名称
     */
    @HBaseColumn(name = "building_name")
    private String buildingName;

    /**
     * 龙湖所属房间id
     */
    @HBaseColumn(name = "csm_room_id")
    private String csmRoomId;

    /**
     * 房屋交付状态
     */
    @HBaseColumn(name = "deliver_status")
    private String deliverStatus;

    /**
     * 组团名
     */
    @HBaseColumn(name = "group_name")
    private String groupName;

    public Boolean getBind() {
        return isBind;
    }

    public void setBind(Boolean bind) {
        isBind = bind;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getRegionId() {
        return regionId;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public String getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(String buildingId) {
        this.buildingId = buildingId;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getCsmRoomId() {
        return csmRoomId;
    }

    public void setCsmRoomId(String csmRoomId) {
        this.csmRoomId = csmRoomId;
    }

    public String getDeliverStatus() {
        return deliverStatus;
    }

    public void setDeliverStatus(String deliverStatus) {
        this.deliverStatus = deliverStatus;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
