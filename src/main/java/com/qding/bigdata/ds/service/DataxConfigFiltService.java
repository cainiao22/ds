package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.model.DataxConfigFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public interface DataxConfigFiltService {
    Map<String, Object> queryDataBaseInfo(DataxConfigFile dataxConfigFile);

    Map<String,Object> createJsonFile(DataxConfigFile dataxConfigFile, HttpServletRequest request);

    Map<String,Object> delJsonFile(String jsonPath);
}
