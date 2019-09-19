package com.qding.bigdata.ds.datatransform.service;

import com.qding.bigdata.ds.datatransform.commonData.TransResult;
import com.qding.bigdata.ds.model.DataInfoList;

/**
 * Created by lzs on 2018/5/17.
 */
public interface TransformDataService {
    TransResult execute(DataInfoList dataParam);
    public TransResult insert(DataInfoList dataParam);
}
