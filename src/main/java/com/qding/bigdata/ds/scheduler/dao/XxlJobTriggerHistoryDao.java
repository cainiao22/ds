package com.qding.bigdata.ds.scheduler.dao;

import com.qding.bigdata.ds.model.scheduler.XxlJobTriggerHistory;

import java.util.List;

public interface XxlJobTriggerHistoryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(XxlJobTriggerHistory record);

    int insertSelective(XxlJobTriggerHistory record);

    XxlJobTriggerHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(XxlJobTriggerHistory record);

    int updateByPrimaryKey(XxlJobTriggerHistory record);

    List<XxlJobTriggerHistory> selectByJobLogId(Integer jobLogId);
}