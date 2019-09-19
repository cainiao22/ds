package com.qding.bigdata.ds.dao;


import com.qding.bigdata.ds.model.DataInfoList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by syj on 2018/6/11.
 */
@Repository
public interface DataInfoDao  {
    int count(DataInfoList param);
    List<DataInfoList> list(DataInfoList param);
    void save(DataInfoList dataInfoList);
    DataInfoList queryById(@Param("id")String id);
}
