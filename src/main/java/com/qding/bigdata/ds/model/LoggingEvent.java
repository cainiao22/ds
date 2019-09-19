package com.qding.bigdata.ds.model;

import com.alibaba.fastjson.JSON;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yanpf
 * @date 2018/6/27 16:39
 * @description
 */
public class LoggingEvent {


    /**
     * 用户名
     */
    private String user;
    /**
     * 用户中文名
     */
    private String userName;

    /**
     * 来源
     */
    private String source;

    /**
     * 事件名称（接口）
     */
    private String eventName;

    /**
     * 参数
     */
    private Object params;

    private Long timeUsed;

    private Date createTime;

    private int code;

    private String msg;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public Object getParams() {
        return params;
    }

    public void setParams(Object params) {
        this.params = params;
    }

    public Long getTimeUsed() {
        return timeUsed;
    }

    public void setTimeUsed(Long timeUsed) {
        this.timeUsed = timeUsed;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    @Override
    public String toString() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("user", user);
        map.put("user_name", userName);
        map.put("source", source);
        map.put("time", createTime.getTime());
        map.put("interface_name", eventName);

        return JSON.toJSONString(map);
    }
}
