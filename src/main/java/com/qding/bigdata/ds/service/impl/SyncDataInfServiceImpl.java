package com.qding.bigdata.ds.service.impl;

import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.dao.CommonDataSqlDao;
import com.qding.bigdata.ds.dao.CommonDataSummaryDao;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.model.CommonDataSql;
import com.qding.bigdata.ds.model.CommonDataSummary;
import com.qding.bigdata.ds.service.SyncDataInfService;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by syj on 2018/8/2.
 */
@Service
public class SyncDataInfServiceImpl implements SyncDataInfService {
    @Autowired
    CommonDataSummaryDao commonDataSummaryDao;
    @Autowired
    CommonDataSqlDao commonDataSqlDao;

    CommonDataSummaryDao executorDataSummaryDao;

    CommonDataSqlDao executorDataSqlDao;


    @Resource(name = "dssqlSessionExecutor")
    public void initExecutorGPDao(SqlSession sqlSession) {
        this.executorDataSummaryDao = sqlSession.getMapper(CommonDataSummaryDao.class);
        this.executorDataSqlDao = sqlSession.getMapper(CommonDataSqlDao.class);
    }
    // getByName  //在ds_common_data_summary
    //getBySummaryId   //在ds_common_data_sql表查询  commonDataSummaryId and disabled = 0

    @Override
    public CommonDataSummary getByName(CommonDataDetail commonDataDetail) {
        CommonDataSummary summary = commonDataSummaryDao.getByName(commonDataDetail.getName());
        return summary;
    }
    @Override
    public CommonDataSummary executorgetByName(CommonDataDetail commonDataDetail) {
        CommonDataSummary summary = executorDataSummaryDao.getByName(commonDataDetail.getName());
        return summary;
    }
    @Override
    public CommonDataSql getBySummaryId(Integer SummaryId){
        CommonDataSql bySummaryId = commonDataSqlDao.getBySummaryId(SummaryId);
         return  bySummaryId;
    }
    @Override
    public Result save(CommonDataDetail commonDataDetail ) {
        //往切换数据源后的数据库中ds_common_data_summary添加数据
        CommonDataSummary commonDataSummary = new CommonDataSummary();
        BeanUtils.copyProperties(commonDataDetail, commonDataSummary);
        commonDataSummary.setCreateTime(new Date());
        commonDataSummary.setUpdateTime(new Date());
        executorDataSummaryDao.insertSelective(commonDataSummary);
        commonDataDetail.setCommonDataSummaryId(commonDataSummary.getId());
        //往切换数据源后的数据库中ds_common_data_sql添加数据
        CommonDataSql commonDataSql = new CommonDataSql();
        BeanUtils.copyProperties(commonDataDetail, commonDataSql);
        commonDataSql.setCreateTime(new Date());
        commonDataSql.setUpdateTime(new Date());
        executorDataSqlDao.insertSelective(commonDataSql);
        return Result.success();
    }

    /**
     *
     * @param commonDataDetail
     * @param Summary 切换数据源之后的查询ds_common_data_summary得到的结果
     * @return
     */
    @Override
    public Result update(CommonDataDetail commonDataDetail,CommonDataSummary Summary) {

        //修改切换数据源后的数据库中ds_common_data_summary
        Summary.setAlias(commonDataDetail.getAlias());
        Summary.setCacheTime(commonDataDetail.getCacheTime());
        Summary.setDataSource(commonDataDetail.getDataSource());
        Summary.setName(commonDataDetail.getName());
        Summary.setOwner(commonDataDetail.getOwner());
        Summary.setUpdateTime(new Date());
        executorDataSummaryDao.updateByPrimaryKeySelective(Summary);
        commonDataDetail.setCommonDataSummaryId(Summary.getId());
        //修改所有跟summaryid关联的数据的disabled为1；
        int i1 = executorDataSqlDao.deleteBySummaryId(Summary.getId());
        //往切换数据源后的数据库中ds_common_data_sql添加数据
        CommonDataSql commonDataSql = new CommonDataSql();
        BeanUtils.copyProperties(commonDataDetail, commonDataSql);
        commonDataSql.setCreateTime(new Date());
        commonDataSql.setUpdateTime(new Date());
        executorDataSqlDao.insertSelective(commonDataSql);
        return Result.success();
    }

}
