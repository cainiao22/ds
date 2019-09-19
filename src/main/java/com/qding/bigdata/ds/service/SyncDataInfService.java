package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.model.CommonDataSql;
import com.qding.bigdata.ds.model.CommonDataSummary;
import org.springframework.beans.BeanUtils;

import java.util.Date;

/**
 * Created by syj on 2018/8/2.
 */
public interface SyncDataInfService {

    public CommonDataSummary getByName(CommonDataDetail commonDataDetail);
    public CommonDataSummary executorgetByName(CommonDataDetail commonDataDetail);
    public CommonDataSql getBySummaryId(Integer SummaryId);

    public Result save(CommonDataDetail commonDataDetail );
    public Result update(CommonDataDetail commonDataDetail,CommonDataSummary Summary);

}
