package com.qding.bigdata.ds.datatransform.component;

import com.qding.bigdata.ds.datatransform.model.DataInfo;
import com.qding.bigdata.ds.datatransform.record.MetaRecord;

/**
 * Created by lzs on 2018/5/22.
 */
public interface MetaTableInfo {
   MetaRecord getMetaRecord(DataInfo dataParam);
}
