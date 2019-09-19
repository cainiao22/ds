package com.qding.bigdata.ds.datatransform.controller;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.controller.BasicController;
import com.qding.bigdata.ds.datatransform.commonData.TransResult;
import com.qding.bigdata.ds.datatransform.enums.CommonDataTypeEnum;
import com.qding.bigdata.ds.datatransform.service.TransformDataService;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.DataInfoList;
import com.qding.bigdata.ds.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TransformController extends BasicController {

    @Autowired
    TransformDataService transformDataService;
   @Autowired
    ConfigService configService;


    @RequestMapping("/transMetaToTarget")
    public ModelAndView transMetaToTarget() {
        ModelAndView modelAndView = initModelAndView("transMetaToTarget");
        List<String> dataSources=new ArrayList<String>();
        CommonDataTypeEnum[] values = CommonDataTypeEnum.values();
        for (CommonDataTypeEnum em:values) {
            dataSources.add(em.getDataSource());
        }
        modelAndView.addObject("dataSources",dataSources);
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据同步);
        return modelAndView;
    }

    @RequestMapping("/toFailSqlJsp")
    public ModelAndView toFailSqlJsp(String sql) {
        ModelAndView modelAndView =super.initModelAndView();
        modelAndView.setViewName("faildeSql");
        System.out.println(sql);
        modelAndView.addObject("sql",sql);
        modelAndView.addObject(Constant.SIDEBAR_MENU, SideBarMenu.数据同步);
        return modelAndView;
    }

    /**
     * 查询数据库
     * @param dataType
     * @return
     */
    @RequestMapping("/configList")
    @ResponseBody
    public List<String> configList(String dataType){
        List<String> configKeys=null;
        if (dataType!=null){
            String DATABASE_PARAM_TYPE = "DATABASE_PARAM_TYPE_"+dataType.toUpperCase();
            List<Config> configs = configService.getConfigByType(DATABASE_PARAM_TYPE);
            configKeys=new ArrayList<String>();
            for (Config cof: configs) {
                configKeys.add(cof.getConfigKey());
            }
        }
        return configKeys;
    }

    /**
     * 建表
     * @param dataInfo
     * @return
     */
    @RequestMapping("/transformData")
    @ResponseBody
    public TransResult transformData(DataInfoList dataInfo){
        TransResult transResult=new TransResult();
        if (dataInfo!=null){
            transResult=transformDataService.execute(dataInfo);
        }
        return transResult;
    }

    /**
     * 插入
     * @param dataInfo
     * @return
     */
    @RequestMapping("/importDataFromMysql")
    @ResponseBody
    public TransResult importDataFromMysql(DataInfoList dataInfo){
        TransResult transResult=new TransResult();
        if (dataInfo!=null){
            transResult=transformDataService.insert(dataInfo);
        }
        return transResult;
    }


}


 /*@RequestMapping("/importDataFromMysqlBetter")
    @ResponseBody
    public int importDataFromMysqlBetter() throws Exception {
        System.setProperty("HADOOP_USER_NAME","hive");
        String[] args = new String[] {
                "/data/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/bin/sqoop", "import",
                "--hive-table", "test1",
                "--connect", "jdbc:mysql://10.37.5.111:3306/devds",
                "--table", "test1",
                "--username", "ds",
                "--password", "123456!",
                "--hive-table", "test1",
                "--fields-terminated-by", "'\\t'",
                "-m 1",
                "--lines-terminated-by", "'\\n'"
        };
        StringBuilder sb = new StringBuilder();
        for (String arg : args) {
            sb.append(arg).append(" ");
        }

        ProcessBuilder processBuilder = new ProcessBuilder(sb.toString());
        Map<String, String> environment = processBuilder.environment();
        for (Map.Entry<String, String> entry : environment.entrySet()) {
            log.info(entry.getKey() + ": " + entry.getValue());
        }

        Map<String, String> getenv = System.getenv();
        for (Map.Entry<String, String> entry : getenv.entrySet()) {
            log.info(entry.getKey() + ": " + entry.getValue());
        }

        final Process p = processBuilder.start();

        new Thread(){
            @Override
            public void run() {
                InputStream in = p.getInputStream();
                InputStreamReader reader = new InputStreamReader(in);
                BufferedReader bufferedReader = new BufferedReader(reader);
                String s = null;
                try {
                    s = bufferedReader.readLine();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                while(s != null){
                    log.info(s);
                }
            }
        }.start();

        return 0;


    }*/
/*
  System.setProperty("HADOOP_USER_NAME","hive");
          String curClasspath = System.getProperty ("java.class.path");

          curClasspath = curClasspath + File.pathSeparator + "/data/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/jars";


                */
/*"/data/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/jars/hadoop-common-2.6.5-cdh5.5.2.jar"
                + File.pathSeparator +"/data/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/jars/hadoop-mapreduce-client-core-2.6.5-cdh5.5.2.jar"
                + File.pathSeparator + "/data/cloudera/parcels/CDH-5.12.0-1.cdh5.12.0.p0.29/jars/sqoop-1.4.7.jar";*//*

          System.setProperty ("java.class.path", curClasspath);
          String[] args = new String[] {
          "--connect","jdbc:mysql://10.37.5.111:3306/devds",
          "--driver","com.mysql.jdbc.Driver",
          "-username","ds",
          "-password","123456!",
          "--table","test1",
          "--direct",
          "--split-by","id",
          "-m","1",
          "--hive-import",
          "--delete-target-dir",
               */
/* "--hive-table","test1",*//*

          "--fields-terminated-by", "'\\t'",
               */
/* "--hive-partition-key","",
                "--hive-partition-value","",*//*

          "--target-dir","/user/hive/warehouse/test1"
          };

          String[] expandArguments = OptionsFileUtil.expandArguments(args);
          SqoopTool tool = SqoopTool.getTool("import");
          Configuration conf = new Configuration();
          conf.set("fs.default.name", "hdfs://10.37.251.86:8020");//设置HDFS服务地址
          Configuration loadPlugins = SqoopTool.loadPlugins(conf);
          Sqoop sqoop = new Sqoop((com.cloudera.sqoop.tool.SqoopTool) tool, loadPlugins);
          int i = Sqoop.runSqoop(sqoop, expandArguments);
          System.out.println(i);
          return i;
          }*/
