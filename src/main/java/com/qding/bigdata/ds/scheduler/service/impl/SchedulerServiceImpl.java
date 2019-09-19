package com.qding.bigdata.ds.scheduler.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.dao.MetaTableDao;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.MetaTable;
import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import com.qding.bigdata.ds.scheduler.dao.XxlJobLogDao;
import com.qding.bigdata.ds.scheduler.enums.SchedulerJobStatusEnum;
import com.qding.bigdata.ds.scheduler.model.Edge;
import com.qding.bigdata.ds.scheduler.model.Graph;
import com.qding.bigdata.ds.scheduler.model.GraphNode;
import org.apache.commons.lang3.StringUtils;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.common.Result;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.BaseDao;
import com.qding.bigdata.ds.enums.SchedulerTypeEnum;
import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.model.scheduler.SchedulerJobDependency;
import com.qding.bigdata.ds.scheduler.dao.SchedulerDao;
import com.qding.bigdata.ds.scheduler.service.SchedulerService;
import com.qding.bigdata.ds.service.impl.BaseServiceImpl;
import com.xxl.job.admin.core.schedule.XxlJobDynamicScheduler;
import org.springframework.util.CollectionUtils;

@Service
public class SchedulerServiceImpl extends BaseServiceImpl<SchedulerJob> implements SchedulerService {

	@Autowired
	private SchedulerDao schedulerDao;

	@Autowired
	private XxlJobLogDao xxlJobLogDao;

	@Override
	public BaseDao<SchedulerJob> getDao() {
		return schedulerDao;
	}

	@Autowired
	ConfigDao configDao;

	@Autowired
	MetaTableDao metaTableDao;

	@Override
	public SearchResult<SchedulerJob> listData(SchedulerJob job) {
		List<SchedulerJob> list = list(job);
		for (SchedulerJob schedulerJob : list) {
			this.fillLatestExecuteLog(schedulerJob, 1);
		}
		SearchResult<SchedulerJob> result = new SearchResult<SchedulerJob>();
		result.setPageCount(job.getPageCount());
		result.setCurrentPage(job.getPage());
		result.setTotal(this.count(job));
		result.setRows(list);
		return result;
	}

	@Override
	public Result saveOrUpdate(SchedulerJob job) {
		if (job.getDependency().endsWith(",")) {
			job.setDependency(job.getDependency().substring(0, job.getDependency().length() - 1));
		}
		job.setParentJobKey(job.getDependency());
		this.log.debug(job);
		this.fillJobParam(job);
		if (job.getJobId() != null) {
			this.update(job);
		} else {
			this.save(job);
		}
		this.saveDependency(job);


		try {
			String quartzJobId = String.valueOf(job.getJobId());
			String quartzJobGroupId = String.valueOf(job.getJobGroup());
			if (job.getSchdStatus() != 1) {
				XxlJobDynamicScheduler.removeJob(quartzJobId, quartzJobGroupId);
			}
			if (job.getSchdStatus() == 1) {
				if (XxlJobDynamicScheduler.checkExists(quartzJobId, quartzJobGroupId)) {
					XxlJobDynamicScheduler.rescheduleJob(quartzJobGroupId, quartzJobId, job.getJobCron());
				} else {
					XxlJobDynamicScheduler.addJob(String.valueOf(job.getJobId()), String.valueOf(job.getJobGroup()),
							job.getJobCron());
				}
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
			return Result.failed(-1, "Schduler save failed.");
		}
		return Result.success();
	}

	private synchronized void saveDependency(SchedulerJob job) {
		this.schedulerDao.deleteDependency(job);
		if (StringUtils.isEmpty(job.getDependency())) {
			return;
		}
		String[] jobIDs = job.getDependency().split(",");

		if (jobIDs.length < 1) {
			return;
		}

		for (String dependencyJobId : jobIDs) {
			this.schedulerDao.saveDependency(
					new SchedulerJobDependency(job.getJobId(), Integer.parseInt(dependencyJobId.split("_")[1])));
		}
	}

	private void fillJobParam(SchedulerJob job) {
		if (job.getExecutorHandler().equals(SchedulerTypeEnum.DWSQL.getHandler())) {
			fillJobParamForSqlHandler(job);
			return;
		}
		if (job.getExecutorHandler().equals(SchedulerTypeEnum.SHELL.getHandler())) {
			fillJobParamForShellHandler(job);
			return;
		}
		//数据同步任务
		if (job.getExecutorHandler().equals(SchedulerTypeEnum.DATA_INTEGERATION.getHandler())) {
			fillJobParamForDIHandler(job);
			return;
		}

	}

	private void fillJobParamForShellHandler(SchedulerJob job) {
		JSONObject jo = JSONObject.parseObject(job.getExecutorParam());
		jo.put("glueSource", jo.getString("shell"));
		jo.put("glueType", "");

		job.setExecutorParam(jo.toJSONString());

	}

	private void fillJobParamForSqlHandler(SchedulerJob job) {

	}

	/**
	 * 数据集成参数填充
	 * @param job
	 */
	private void fillJobParamForDIHandler(SchedulerJob job) {
		JSONObject jo = JSONObject.parseObject(job.getExecutorParam());

		//根据元数据Id获取元数据数据库信息
		Config configParam = new Config();
		configParam.setId(jo.get("db_id").toString());
		Config config = configDao.getById(configParam);
		if(null != config){
			JSONObject dbJson = JSONObject.parseObject(config.getConfigValue());
			String dbtype = dbJson.get("dbtype").toString();
			//dbType
			jo.put("dbType", dbtype);
			//jdbcurl
			jo.put("jdbcUrl", Constant.dbUrlMap.get(dbtype)
					.replace("url",dbJson.get("url").toString()).replace("dbname",dbJson.get("db").toString()));
			//username
			jo.put("username", dbJson.get("user"));
			//password
			jo.put("password", dbJson.get("password"));
		}
		//根据目标表ID获取表名
		MetaTable metaTableParam = new MetaTable();
		metaTableParam.setId(jo.get("target_tableId").toString());
		MetaTable metaTable = metaTableDao.getById(metaTableParam);
		if(null != metaTable){
			jo.put("tableName", metaTable.getType()+"."+metaTable.getName());
		}

		job.setExecutorParam(jo.toJSONString());
	}

	@Override
	public void save(SchedulerJob job) {
		job.setAddTime(new Date());
		job.setAlarmEmail("wangjunping@qding.me");
		job.setJobGroup(1);
		job.setExecutorRouteStrategy("ROUND");
		job.setGlueType("BEAN");
		job.setExecutorBlockStrategy("SERIAL_EXECUTION");
		job.setExecutorFailStrategy("FAIL_ALARM");
		super.save(job);

	}

	@Override
	public void update(SchedulerJob job) {
		SchedulerJob jobInDB = this.getOne(job);
		if (jobInDB == null) {
			return;
		}
		job.setAlarmEmail("wangjunping@qding.me");
		job.setJobGroup(1);
		job.setExecutorRouteStrategy("ROUND");
		job.setGlueType("BEAN");
		job.setExecutorBlockStrategy("SERIAL_EXECUTION");
		job.setExecutorFailStrategy("FAIL_ALARM");
		job.setGlueUpdatetime(job.getUpdateTime());
		super.update(job);
		try {
			XxlJobDynamicScheduler.rescheduleJob(String.valueOf(job.getJobId()), String.valueOf(job.getJobGroup()),
					job.getJobCron());
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Result deleteSchedulerJob(SchedulerJob jobParam) {
		SchedulerJob thisJob = this.getOne(jobParam);
		if (thisJob != null) {
			try {
				XxlJobDynamicScheduler.removeJob(String.valueOf(thisJob.getJobId()),
						String.valueOf(thisJob.getJobGroup()));
				this.delete(jobParam);
			} catch (SchedulerException e) {
				e.printStackTrace();
				return Result.failed(-1, "操作失败！");
			}
		}
		return Result.success();

	}

	@Override
	public void fillLatestExecuteLog(SchedulerJob jobParam, int size) {
		// TODO Auto-generated method stub

	}

	@Override
	public Graph<SchedulerJob> getGraph(SchedulerJob job) {
		Graph<SchedulerJob> graph = new Graph<SchedulerJob>();
		Map<Integer, GraphNode<SchedulerJob>> memory = new HashMap<Integer, GraphNode<SchedulerJob>>();
		List<GraphNode<SchedulerJob>> headers = new ArrayList<GraphNode<SchedulerJob>>();
		job = schedulerDao.getById(job);
		job.setStatus(getStatus(job.getJobGroup(), job.getJobId()));
		job.setKeyword("current");
		dfsParentGraphNode(job, memory, headers);
		graph.setHeaders(headers);
		setGraphNodePos(graph);
		return graph;
	}

	/**
	 * 设置各个节点的x,y坐标
	 * @param graph
	 */
	private void setGraphNodePos(Graph<SchedulerJob> graph) {
		List<GraphNode<SchedulerJob>> headers = graph.getHeaders();
		if(CollectionUtils.isEmpty(headers)){
			return;
		}
		graph.getxNums().put(1, headers.size());
		for (GraphNode<SchedulerJob> node : headers) {
			node.setY(1);
		}
		Queue<GraphNode> queue = new LinkedList<GraphNode>(headers);
		while (!queue.isEmpty()){
			GraphNode top = queue.poll();
			if(!CollectionUtils.isEmpty(top.getChildren())){
				for (Object o : top.getChildren()) {
					GraphNode t = (GraphNode) o;
					if(t.getY() < top.getY() + 1){
						if(t.getY() != 1) {
							graph.changeXNums(t.getY(), -1);
						}
						t.setY(top.getY() + 1);
						graph.changeXNums(t.getY(), 1);
					}
					queue.add(t);
					graph.setyMax(Math.max(graph.getyMax(), t.getY()));
				}
			}
		}
		//初始时候x坐标为0
		Map<Integer, Integer> offset = new HashMap<Integer, Integer>(graph.getxNums());
		for (Map.Entry<Integer, Integer> entry : offset.entrySet()) {
			entry.setValue(0);
		}

		queue.addAll(headers);
		List<GraphNode> visited = new ArrayList<GraphNode>();
		while (!queue.isEmpty()){
			GraphNode top = queue.poll();
			if(visited.contains(top)){
				continue;
			}
			visited.add(top);
			if(!CollectionUtils.isEmpty(top.getChildren())){
				queue.addAll(top.getChildren());
				for (Object o : top.getChildren()) {
					GraphNode child = (GraphNode) o;
					Edge e = new Edge(top.getId(), child.getId());
					graph.getEdgeList().add(e);
				}
			}
			SchedulerJob data = (SchedulerJob) top.getData();
			top.setId(data.getJobId().toString());
			top.setName(data.getJobName());
			if("current".equals(data.getKeyword())){
				top.setLabel("current");
			}else{
				top.setLabel(data.getJobName());
			}
			top.setStatus(data.getStatus());
			top.setData(null);
			top.setChildren(null);
			graph.getNodeList().add(top);
			Integer val = offset.get(top.getY()) + 1;
			offset.put(top.getY(), val);
			top.setX(val);
		}

	}

	/**
	 * 获取我依赖的树
	 * @param job
	 * @return
	 */
	private GraphNode<SchedulerJob> dfsParentGraphNode(SchedulerJob job, Map<Integer, GraphNode<SchedulerJob>> memory, List<GraphNode<SchedulerJob>> headers){
		if(memory.containsKey(job.getJobId())){
			return memory.get(job.getJobId());
		}
		if(job.getStatus() == null){
			job.setStatus(getStatus(job.getJobGroup(), job.getJobId()));
		}
		GraphNode node = new GraphNode(job);
		node.setId(job.getJobId().toString());
		node.setName(job.getJobName());
		memory.put(job.getJobId(), node);
		String parentJobKeys = job.getParentJobKey();
		if(StringUtils.isBlank(parentJobKeys)){
			dfsChildGraphNode(node, memory, headers);
			return node;
		}

		String[] split = parentJobKeys.split(",");
		SchedulerJob param = new SchedulerJob();
		for (String jobGroup : split) {
			String[] items = jobGroup.split("_");
			Integer parentId = Integer.valueOf(items[1]);
			param.setJobId(parentId);
			SchedulerJob parent = schedulerDao.getById(param);
			parent.setStatus(getStatus(parent.getJobGroup(), parentId));
			GraphNode<SchedulerJob> childrenNode = dfsParentGraphNode(parent, memory, headers);
			//dfsChildGraphNode(childrenNode, memory, headers);
		}
		dfsChildGraphNode(node, memory, headers);
		return node;
	}

	/**
	 * 获取依赖我的树
	 * @param node
	 * @return
	 */
	private GraphNode<SchedulerJob> dfsChildGraphNode(GraphNode<SchedulerJob> node, Map<Integer, GraphNode<SchedulerJob>> memory, List<GraphNode<SchedulerJob>> headers){
		List<SchedulerJob> childrenJobs = schedulerDao.getchildrenJobs(node.getData());
		//被我依赖的树为空，表示我就是那个root
		if(CollectionUtils.isEmpty(childrenJobs)){
			if(!headers.contains(node)){
				headers.add(node);
			}
			return node;
		}
		for (SchedulerJob child : childrenJobs) {
			GraphNode<SchedulerJob> childNode = dfsParentGraphNode(child, memory, headers);
			if(!childNode.getChildren().contains(node)) {
				childNode.getChildren().add(node);
				childNode.getChildrenIdList().add(node.getId());
			}
		}

		return null;
	}

	private int getStatus(int jobGroup, int jobId){
		XxlJobLog jobStatus = xxlJobLogDao.findLatestJobStatus(jobGroup, jobId);
		if(jobStatus == null){
			return SchedulerJobStatusEnum.UNSTARTED.getCode();
		}
		if(jobStatus.getHandleCode() == 200 && jobStatus.getTriggerCode() == 200){
			return SchedulerJobStatusEnum.SUCCESS.getCode();
		}else if(jobStatus.getTriggerCode() == 200 && jobStatus.getHandleCode() == 0){
			return SchedulerJobStatusEnum.RUNNING.getCode();
		}else if(jobStatus.getHandleCode() != 200 || jobStatus.getTriggerCode() != 0){
			return SchedulerJobStatusEnum.FAILED.getCode();
		}else if(jobStatus.getHandleCode() != 0 && jobStatus.getTriggerCode() == 0){
			return SchedulerJobStatusEnum.WAITTING.getCode();
		}
		return SchedulerJobStatusEnum.UNKONW.getCode();
	}

}