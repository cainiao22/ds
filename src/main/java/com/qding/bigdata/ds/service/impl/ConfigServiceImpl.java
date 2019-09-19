package com.qding.bigdata.ds.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.TableConfig;
import com.qding.bigdata.ds.service.ConfigService;
import com.qding.bigdata.ds.util.UUIDUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by yanpf on 2017/9/5.
 */

@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    ConfigDao configDao;

    @Override
    public Config getConfig(String type, String key) {
        return configDao.getConfigByKey(type, key);
    }

    @Override
    public List<Config> getConfigByType(String type) {
        return configDao.getConfigByType(type);
    }

    @Override
    public SearchResult<Config> query(Config param) {
        SearchResult<Config> result = new SearchResult<Config>();
        List<Config> list = configDao.list(param);
        int count = configDao.count(param);
        result.setPageCount(param.getPageCount());
        result.setRows(list);
        result.setTotal(count);
        result.setCurrentPage(param.getPage());

        return result;
    }

    @Override
    public Config getConfigById(String id) {
        Config param = new Config();
        param.setId(id);
        Config config = configDao.getById(param);
        return config;
    }
    @Override
    public TableConfig getTableConfigById(String id) {
        Config param = new Config();
        param.setId(id);
        Config config = configDao.getById(param);
        TableConfig tableConfig;
        if(config==null){
            tableConfig=new TableConfig();
        }else{
            tableConfig = JSON.parseObject(config.getConfigValue(), TableConfig.class);
            tableConfig.setConfigKey(config.getConfigKey());
            tableConfig.setConfigOrder(config.getConfigOrder());
            tableConfig.setId(config.getId());
            tableConfig.setConfigParent(config.getConfigParent());
            tableConfig.setConfigType(config.getConfigType());
            tableConfig.setCreateTime(config.getCreateTime());
            tableConfig.setDescription(config.getDescription());
            tableConfig.setUpdateTime(config.getUpdateTime());
        }
        return tableConfig;
    }
    @Override
    public void save(Config config) {
        config.setId(UUIDUtil.createId());
        config.setCreateTime(new Date());
        config.setUpdateTime(new Date());
        configDao.save(config);
    }

    @Override
    public void update(Config config) {
        configDao.updateById(config);
    }

    @Override
    public void delete(String id) {
        Config config = new Config();
        config.setId(id);
        configDao.delete(config);
    }
    @Override
    public SearchResult<TableConfig> queryTableConfig(Config param) {
        SearchResult<TableConfig> result = new SearchResult<TableConfig>();
        if(StringUtils.isNotBlank(param.getConfigKey())||StringUtils.isNotBlank(param.getConfigType())){
            param.setOffset(0);
            param.setPage(1);
            param.setPageCount(10);
        }
        List<Config> list = configDao.list(param);
        List<TableConfig> tableConfigList=new ArrayList<TableConfig>();
        for(Config config : list){
            TableConfig tableConfig = JSON.parseObject(config.getConfigValue(), TableConfig.class);
            tableConfig.setConfigKey(config.getConfigKey());
            tableConfig.setConfigOrder(config.getConfigOrder());
            tableConfig.setId(config.getId());
            tableConfig.setConfigParent(config.getConfigParent());
            tableConfig.setConfigType(config.getConfigType());
            tableConfig.setCreateTime(config.getCreateTime());
            tableConfig.setDescription(config.getDescription());
            tableConfig.setUpdateTime(config.getUpdateTime());
            tableConfigList.add(tableConfig);
        }
        int count = configDao.count(param);
        result.setPageCount(param.getPageCount());
        result.setRows(tableConfigList);
        result.setTotal(count);
        result.setCurrentPage(param.getPage());

        return result;
    }

}
