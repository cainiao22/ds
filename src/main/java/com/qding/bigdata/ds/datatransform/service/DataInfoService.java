package com.qding.bigdata.ds.datatransform.service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.DataInfoList;

import java.util.List;

/**
 * Created by syj on 2018/6/11.
 */
public interface DataInfoService {
  /*  List<DataInfoList> list(DataInfoList t);*/
    SearchResult<DataInfoList> queryList(DataInfoList param);

    DataInfoList queryByID(String id);
}
