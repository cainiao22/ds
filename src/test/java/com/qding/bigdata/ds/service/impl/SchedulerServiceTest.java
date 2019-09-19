package com.qding.bigdata.ds.service.impl;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.model.scheduler.SchedulerJobDependency;
import com.qding.bigdata.ds.scheduler.dao.SchedulerDao;
import com.qding.bigdata.ds.scheduler.model.Graph;
import com.qding.bigdata.ds.scheduler.model.GraphNode;
import com.qding.bigdata.ds.scheduler.service.impl.SchedulerServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author yanpf
 * @date 2018/3/12 17:17
 * @description
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring/controller-servlet.xml","classpath*:/spring/applicationContext.xml"})
public class SchedulerServiceTest {


    @Test
    public void testAAA() throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        map.put("a", "b");
        System.out.println(JSON.toJSONString(map));
    }

    @Test
    public void test() throws Exception {
        SchedulerJob schedulerJob = new SchedulerJob();
        schedulerJob.setJobId(4);
        schedulerJob.setParentJobKey("1_7,1_8");
        SchedulerServiceImpl schemeService = new SchedulerServiceImpl();
        //schemeService.schedulerDao = new InvokeDao();
        Graph<SchedulerJob> graph = schemeService.getGraph(schedulerJob);
        Map<String, GraphNode> map = new HashMap<String, GraphNode>();
        for (GraphNode<SchedulerJob> node : graph.getNodeList()) {
            map.put(node.getId(), node);
        }
        System.out.println(JSON.toJSONString(map));
    }

    public static class InvokeDao implements SchedulerDao {

        @Override
        public void deleteDependency(SchedulerJob job) {

        }

        @Override
        public void saveDependency(SchedulerJobDependency schedulerJobDependency) {

        }

        @Override
        public List<SchedulerJob> getchildrenJobs(SchedulerJob job) {
            List<SchedulerJob> result = new ArrayList<SchedulerJob>();
            SchedulerJob temp = null;
            switch (job.getJobId()){
                case 1:
                    break;
                case 2:
                    break;
                case 3: {
                    SchedulerJob num2 = new SchedulerJob();
                    num2.setJobId(2);
                    num2.setParentJobKey("1_3,1_4");
                    SchedulerJob num1 = new SchedulerJob();
                    num1.setJobId(1);
                    num1.setParentJobKey("1_3");
                    result.add(num1);
                    result.add(num2);
                    break;
                }
                case 4: {
                    SchedulerJob num2 = new SchedulerJob();
                    num2.setJobId(2);
                    num2.setParentJobKey("1_3,1_4");
                    result.add(num2);
                    break;
                }
                case 5: {
                    SchedulerJob num3 = new SchedulerJob();
                    num3.setJobId(3);
                    num3.setParentJobKey("1_5,1_6,1_7");
                    result.add(num3);
                    break;
                }
                case 6: {
                    SchedulerJob num3 = new SchedulerJob();
                    num3.setJobId(3);
                    num3.setParentJobKey("1_5,1_6,1_7");
                    result.add(num3);
                    break;
                }
                case 7: {
                    SchedulerJob num3 = new SchedulerJob();
                    num3.setJobId(3);
                    num3.setParentJobKey("1_5,1_6,1_7");
                    result.add(num3);
                    SchedulerJob num4 = new SchedulerJob();
                    num4.setJobId(4);
                    num4.setParentJobKey("1_7,1_8");
                    result.add(num4);
                    break;
                }
                case 8:{
                    SchedulerJob num4 = new SchedulerJob();
                    num4.setJobId(4);
                    num4.setParentJobKey("1_7,1_8");
                    result.add(num4);
                    break;
                }

                case 9:{
                    SchedulerJob num7 = new SchedulerJob();
                    num7.setJobId(7);
                    num7.setParentJobKey("1_9,1_10");
                    result.add(num7);
                    break;
                }

                case 10:{
                    SchedulerJob num7 = new SchedulerJob();
                    num7.setJobId(7);
                    num7.setParentJobKey("1_9,1_10");
                    result.add(num7);
                    break;
                }

            }
            for (SchedulerJob schedulerJob : result) {
                schedulerJob.setJobName("job_" + schedulerJob.getJobId());
            }
            return result;
        }

        @Override
        public List<SchedulerJob> list(SchedulerJob job) {
            return null;
        }

        @Override
        public void save(SchedulerJob job) {

        }

        @Override
        public int updateById(SchedulerJob job) {
            return 0;
        }

        @Override
        public SchedulerJob getById(SchedulerJob job) {
            SchedulerJob result = null;
            switch (job.getJobId()){
                case 1:
                    SchedulerJob num1 = new SchedulerJob();
                    num1.setJobId(1);
                    num1.setParentJobKey("1_3");
                    result = num1;
                    break;
                case 2:
                    SchedulerJob num2 = new SchedulerJob();
                    num2.setJobId(2);
                    num2.setParentJobKey("1_3,1_4");
                    result = num2;
                    break;
                case 3: {
                    SchedulerJob num3 = new SchedulerJob();
                    num3.setJobId(3);
                    num3.setParentJobKey("1_5,1_6,1_7");
                    result = num3;
                    break;
                }
                case 4: {
                    SchedulerJob num4 = new SchedulerJob();
                    num4.setJobId(4);
                    num4.setParentJobKey("1_7,1_8");
                    result = num4;
                    break;
                }
                case 5: {
                    SchedulerJob num5 = new SchedulerJob();
                    num5.setJobId(5);
                    result = num5;
                    break;
                }
                case 6: {
                    SchedulerJob num6 = new SchedulerJob();
                    num6.setJobId(6);
                    result = num6;
                    break;
                }
                case 7: {
                    SchedulerJob num7 = new SchedulerJob();
                    num7.setJobId(7);
                    num7.setParentJobKey("1_9,1_10");
                    result = num7;
                    break;
                }
                case 8:{
                    SchedulerJob num8 = new SchedulerJob();
                    num8.setJobId(8);
                    result = num8;
                    break;
                }

                case 9:{
                    SchedulerJob num9 = new SchedulerJob();
                    num9.setJobId(9);
                    result = num9;
                    break;
                }

                case 10:{
                    SchedulerJob num10 = new SchedulerJob();
                    num10.setJobId(10);
                    result = num10;
                    break;
                }

            }
            result.setJobName("job_" + job.getJobId());
            return result;
        }

        @Override
        public Integer count(SchedulerJob job) {
            return null;
        }

        @Override
        public void delete(SchedulerJob job) {

        }

        @Override
        public List<SchedulerJob> listByIDs(String ids) {
            return null;
        }
    }
}

