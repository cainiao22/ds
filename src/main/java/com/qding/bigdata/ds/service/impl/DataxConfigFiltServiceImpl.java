package com.qding.bigdata.ds.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.dao.DataxConfigFiltDao;
import com.qding.bigdata.ds.datatransform.utils.JdbcUtil;
import com.qding.bigdata.ds.model.DataxConfigFile;
import com.qding.bigdata.ds.service.DataxConfigFiltService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DataxConfigFiltServiceImpl implements DataxConfigFiltService{

    @Autowired
    private DataxConfigFiltDao dataxConfigFiltMapper;

    /**
     * 查询数据库信息
     * @param dataxConfigFile
     * @return
     */
    @Override
    public Map<String, Object> queryDataBaseInfo(DataxConfigFile dataxConfigFile) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            //获取数据库字段信息
            DataxConfigFile config = dataxConfigFiltMapper.queryDataBaseInfo(dataxConfigFile);
            if (null != config){
                String metaConfigValue= config.getConfigValue();
                DataxConfigFile metaConfigValueModel = JSON.parseObject(metaConfigValue, DataxConfigFile.class);//转换成JSON格式
                String ss = metaConfigValueModel.getUrl();//获取数据库连接地址
                String db = metaConfigValueModel.getDb();//获取数据库名称
                metaConfigValueModel.setUrl("jdbc:"+dataxConfigFile.getDataBaseType()+"://"+ss+"/"+db);//拼接地址
                map.put("metaConfigValueModel",metaConfigValueModel);
                map.put("success",true);
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","系统异常!请稍后再试!");
            map.put("errInfo",e.getMessage());
            map.put("success",false);
        }
        return map;
    }

    /**
     * 生成JSON文件
     * @param dataxConfigFile
     * @param request
     * @return
     */
    @Override
    public Map<String, Object> createJsonFile(DataxConfigFile dataxConfigFile, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSetMetaData rsmd = null;
        List<String> list = new ArrayList<String>();
        try {
            //连接JDBC执行sql
            conn = JdbcUtil.getConnectionInfo(dataxConfigFile);
            DatabaseMetaData databaseMetaData = conn.getMetaData();
            rs = databaseMetaData.getColumns(null, "%", dataxConfigFile.getTableName(), "%");

            if(null != rs){
                while(rs.next()){
                    list.add(rs.getString("COLUMN_NAME"));
                }
                map.put("list",list);
                map.put("dataName",dataxConfigFile.getDataBaseType()+"reader");
                map.put("username",dataxConfigFile.getUsername());
                map.put("password",dataxConfigFile.getPassword());
                map.put("jdbcUrl",dataxConfigFile.getJdbcUrl());
                map.put("defaultFS",dataxConfigFile.getDefaultFS());
                map.put("path",dataxConfigFile.getPath());
                map.put("fileName",dataxConfigFile.getFileName());
                map.put("fieldDelimiter",dataxConfigFile.getFieldDelimiter());
                map.put("writeMode",dataxConfigFile.getWriteMode());
                map.put("compress",dataxConfigFile.getCompress());
                map.put("tableName",dataxConfigFile.getTableName());
                Configuration configuration = new Configuration();

                String htmlName = "dataxFreemarker.ftl";//模版名称
                URL resource = getClass().getClassLoader().getResource("templates");//模版目录
                String ftlpath = resource.getPath();
                configuration.setDirectoryForTemplateLoading(new File(ftlpath));
                Template template = configuration.getTemplate(htmlName);

                String realPath = request.getSession().getServletContext().getRealPath("/json");//获取文件目录
                String json = realPath+"/"+dataxConfigFile.getFileName()+".json";//文件输出路径
                // 合并模板文件以及数据将其进行输出
                FileOutputStream fileOutputStream = new FileOutputStream(json);
                OutputStreamWriter outputStreamWriter = new OutputStreamWriter(fileOutputStream);
                BufferedWriter bufferedWriter = new BufferedWriter(outputStreamWriter);
                template.process(map, bufferedWriter);
                bufferedWriter.close();
                fileOutputStream.close();
                outputStreamWriter.close();
                map.put("success",true);
                map.put("fileName",dataxConfigFile.getFileName());
                map.put("jsonPath",json);
            }
        }catch (Exception e){
            if(null == rs){
                map.put("success",false);
                map.put("msg","sql执行失败~!请检查sql是否填写正确!");
                map.put("errInfo",e.getMessage());
                return map;
            }
            e.printStackTrace();
            map.put("success",false);
            map.put("msg","系统异常!请稍后再试");
            map.put("errInfo",e.getMessage());
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return map;
    }

    /**
     * 删除JSON文件
     * @param jsonPath
     * @return
     */
    @Override
    public Map<String, Object> delJsonFile(String jsonPath) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            File f = new File(jsonPath);  // 输入要删除的文件位置
            if(f.exists()){
                f.delete();
            }
            map.put("success",true);
            map.put("msg","JSON文件已删除!");
        }catch (Exception e){
            e.printStackTrace();
            map.put("success",false);
            map.put("errInfo",e.getMessage());
        }
        return map;
    }
}
