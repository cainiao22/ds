package com.qding.bigdata.ds.scheduler.controller;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.qding.bigdata.ds.scheduler.model.Graph;
import com.qding.bigdata.ds.scheduler.model.GraphNode;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.controller.BasicController;
import com.qding.bigdata.ds.enums.SchedulerTypeEnum;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.CommonDataDetail;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.DataBaseParams;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.scheduler.service.SchedulerService;
import com.qding.bigdata.ds.service.ConfigService;
import com.qding.bigdata.ds.service.MetaTableService;
import com.qding.bigdata.ds.service.SchemeService;

@Controller
public class SchedulerController extends BasicController {
    @Autowired
    private SchemeService schemeService;
    @Autowired
    private ConfigService configService;
	@Autowired
	private SchedulerService schedulerService;
	@Autowired
	private MetaTableService metaTableService;

	@RequestMapping("schedulerJobList")
	public ModelAndView schedulerJobList(SchedulerJob jobParam) {
		ModelAndView mav = this.initModelAndView();
		mav.addObject("schdJobTypes", SchedulerTypeEnum.values());
		mav.addObject("jobParam", jobParam);
		mav.addObject(Constant.SIDEBAR_MENU, SideBarMenu.作业列表);
		return mav;

	}

	@RequestMapping(value = { "createSchedulerJob", "schedulerJobDetail" })
	public ModelAndView schedulerJobDetail(SchedulerJob jobParam) {
		ModelAndView mav = this.initModelAndView("schedulerJobDetail");
		mav.addObject("schdJobTypes", SchedulerTypeEnum.values());
		mav.addObject(Constant.SIDEBAR_MENU, SideBarMenu.新建作业);
		List<SchedulerJob> allJobs = this.schedulerService.listAll(new SchedulerJob());
		mav.addObject("allJobs", allJobs);
		 List<Config> dbConfigList = configService.getConfigByType("DATABASE_PARAM_TYPE");
	        mav.addObject("dbConfigList", dbConfigList);

		if (jobParam.getJobId() != null) {
			SchedulerJob job = this.schedulerService.getOne(jobParam);
			mav.addObject("job", job);
			if (StringUtils.isNotBlank(job.getDependency())) {
				mav.addObject("dependencyJobIds", new HashSet<String>(Arrays.asList(job.getDependency().split(","))));
			}
		}
		mav.addObject("allMetaTables", this.metaTableService.listAll(new MetaTable()));

		return mav;

	}

	@ResponseBody
	@RequestMapping("schedulerJobListData")
	public SearchResult<SchedulerJob> schedulerJobListData(SchedulerJob jobParam) {
		return schedulerService.listData(jobParam);
	}

	@ResponseBody
	@RequestMapping("saveSchedulerJob")
	public Result save(SchedulerJob jobParam) {
		return schedulerService.saveOrUpdate(jobParam);
	}

	@ResponseBody
	@RequestMapping("delSchedulerJob")
	public Result delSchedulerJob(SchedulerJob jobParam) {
		return schedulerService.deleteSchedulerJob(jobParam);
	}

	@ResponseBody
	@RequestMapping("getJobParam")
	public Object getJobParam(SchedulerJob jobParam) {
		if (jobParam.getJobId() != null) {
			SchedulerJob job = this.schedulerService.getOne(jobParam);
			return job.getExecutorParam();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("getGraph")
	public String getGraph(SchedulerJob jobParam){
		Graph<SchedulerJob> graph = schedulerService.getGraph(jobParam);
		Map<String, GraphNode> map = new HashMap<String, GraphNode>();
		for (GraphNode<SchedulerJob> node : graph.getNodeList()) {
			map.put(node.getId(), node);
		}

		return JSON.toJSONString(map);
	}

	@RequestMapping("schedulerGraph")
	public ModelAndView schedulerGraph(SchedulerJob jobParam){
		ModelAndView mv = new ModelAndView("schedulerGraph");
		Graph<SchedulerJob> graph = schedulerService.getGraph(jobParam);
		Map<String, GraphNode> map = new HashMap<String, GraphNode>();
		for (GraphNode<SchedulerJob> node : graph.getNodeList()) {
			map.put(node.getId(), node);
		}
		mv.addObject("nodes", JSON.toJSONString(map));
		return mv;
	}
}
