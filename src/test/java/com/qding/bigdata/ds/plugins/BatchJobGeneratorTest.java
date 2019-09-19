package com.qding.bigdata.ds.plugins;


import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qding.bigdata.ds.dao.CommonDataSqlDao;
import com.qding.bigdata.ds.dao.CommonDataSummaryDao;
import com.qding.bigdata.ds.model.CommonDataSql;
import com.qding.bigdata.ds.model.CommonDataSummary;
import com.qding.bigdata.ds.model.MetaField;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.MetaTableMonitor;
import com.qding.bigdata.ds.service.MetaFieldService;
import com.qding.bigdata.ds.service.MetaTableMonitorService;
import com.qding.bigdata.ds.service.MetaTableService;
import com.qding.bigdata.ds.util.UUIDUtil;

/**
 * Created by yanpf on 2017/7/25.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class BatchJobGeneratorTest {

    @Autowired
    MetaTableService metaTableService;

    @Autowired
    MetaFieldService metaFieldService;

    @Autowired
    MetaTableMonitorService metaTableMonitorService;

    private String sql = "select 100*(a-b)/b from (SELECT  sum(case when dt=${当天-1} then 1 else 0 end) a,sum(case when dt=${当天-2} then 1 else 0 end) b\n" +
            "  FROM tableName where dt in (${当天-1},${当天-2}))t";

    private String sq2 = "select coalesce(count(1), 0) from (SELECT  sum(case when dt=${当天-1} then 1 else 0 end) a,sum(case when dt=${当天-2} then 1 else 0 end) b\n" +
            "  FROM tableName where dt in (${当天-1},${当天-2}))t";

    private String sq3 = "select coalesce(count(1), 0) from tableName";

    //@Test
    public void batchGenerateJobsForMetaTable() throws Exception {

        MetaTable metaTable = new MetaTable();
        List<MetaTable> metaTables = metaTableService.listAll(metaTable);
        metaTableMonitorService.listAll(null);
        for (MetaTable table : metaTables) {
            if(table.getId() == null){
                continue;
            }
            MetaField metaField = new MetaField();
            metaField.setTableId(table.getId());
            metaField.setIsDate(1);
            /*List<MetaField> fields = metaFieldService.listAll(metaField);
            if(fields == null || fields.isEmpty()){
                continue;
            }*/
            System.out.println("为表添加规则, metaTableId:" + table.getId() + "为表添加规则, tableName:" + table.getName() + ", 名称字段为:" + table.getName());
            String realSeq = sq3.replace("tableName", String.format("%s.%s", table.getType(), table.getName()));
            System.out.println("添加的sql为:{" + realSeq + "}");
            MetaTableMonitor metaTableMonitor = new MetaTableMonitor();
            metaTableMonitor.setCreateTime(new Date());
            metaTableMonitor.setEnableMonitor(1);
            metaTableMonitor.setId(UUIDUtil.createId());
            metaTableMonitor.setMonitorjobScheduleHour(8);
            metaTableMonitor.setMonitorjobScheduleMinute(0);
            metaTableMonitor.setMonitorSql(realSeq);
            metaTableMonitor.setMetaTableId(table.getId());
            metaTableMonitor.setMonitorName("全表数据量大于1");
            metaTableMonitor.setValueMin(1);
            metaTableMonitor.setValueMax(999999999);
            metaTableMonitor.setPriority(5);
            metaTableMonitor.setUpdateTime(new Date());
            metaTableMonitorService.save(metaTableMonitor);
        }

    }

    @Autowired
    CommonDataSqlDao commonDataSqlDao;

    @Autowired
    CommonDataSummaryDao commonDataSummaryDao;

    @Test
    public void test(){
        CommonDataSql commonDataSql = new CommonDataSql();
        commonDataSql.setCommonDataSummaryId(1);
        commonDataSql.setCreateTime(new Date());
        commonDataSql.setUpdateTime(new Date());
        commonDataSql.setQueryContent("jhjjjj");
        commonDataSqlDao.insert(commonDataSql);
    }

    //@Test
    public void testSummary(){
        CommonDataSummary commonDataSummary = new CommonDataSummary();
        commonDataSummary.setAlias("中俄");
        commonDataSummary.setDataSource("SQL");
        commonDataSummary.setDescription("测试");
        commonDataSummary.setName("tanlele");
        commonDataSummary.setOwner("yanpf");
        commonDataSummary.setCreateTime(new Date());
        commonDataSummary.setUpdateTime(new Date());
        commonDataSummaryDao.insert(commonDataSummary);
    }


}