package com.qding.bigdata.ds.service;

import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.TableConfig;

import java.util.List;

/**
 * Created by yanpf on 2017/9/5.
 */
public interface ConfigService {
    Config getConfig(String type, String key);

    List<Config> getConfigByType(String type);

    SearchResult<Config> query(Config param);

    Config getConfigById(String id);

    void save(Config config);

    void update(Config config);

    void delete(String id);

    SearchResult<TableConfig> queryTableConfig(Config param);

    TableConfig getTableConfigById(String id);
}
