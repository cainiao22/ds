package com.qding.bigdata.ds.dao;

import com.qding.bigdata.ds.model.DataxConfigFile;
import org.apache.ibatis.annotations.Param;

public interface DataxConfigFiltDao {

    DataxConfigFile queryDataBaseInfo(@Param(value = "dataxConfigFile") DataxConfigFile dataxConfigFile);
}
