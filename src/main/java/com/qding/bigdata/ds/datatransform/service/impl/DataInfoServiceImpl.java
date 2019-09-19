package com.qding.bigdata.ds.datatransform.service.impl;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.DataInfoDao;
import com.qding.bigdata.ds.datatransform.service.DataInfoService;
import com.qding.bigdata.ds.model.DataInfoList;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by syj on 2018/6/11.
 */
@Service
public class DataInfoServiceImpl implements DataInfoService{
    @Autowired
    private DataInfoDao dataInfoDao;
    @Override
    public SearchResult<DataInfoList> queryList(DataInfoList param) {
        SearchResult<DataInfoList> result = new SearchResult<DataInfoList>();
        if(StringUtils.isNotBlank(param.getAlias())||StringUtils.isNotBlank(param.getOwnerd())){
            param.setOffset(0);
            param.setPage(1);
            param.setPageCount(10);
        }
        result.setCurrentPage(param.getPage());
        result.setPageCount(param.getPageCount());
        if (StringUtils.isBlank(param.getSortAndDesc())) {
            param.setSortAndDesc("create_time desc");
        }
        List<DataInfoList> list = dataInfoDao.list(param);
        result.setRows(list);
        int totalCount = dataInfoDao.count(param);
        result.setTotal(totalCount);
        return result;
    }
    @Override
    public DataInfoList queryByID(String id) {
        return dataInfoDao.queryById(id);
    }

}
