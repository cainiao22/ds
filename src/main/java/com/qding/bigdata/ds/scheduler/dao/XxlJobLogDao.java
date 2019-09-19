package com.qding.bigdata.ds.scheduler.dao;

import com.qding.bigdata.ds.model.scheduler.XxlJobLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * job log
 * @author xuxueli 2016-1-12 18:03:06
 */
public interface XxlJobLogDao {
	
	public List<XxlJobLog> pageList(@Param("offset") Integer offset,
									@Param("pagesize") Integer pagesize,
									@Param("jobGroup") Integer jobGroup,
									@Param("jobId") Integer jobId,
									@Param("triggerTimeStart") Date triggerTimeStart,
									@Param("triggerTimeEnd") Date triggerTimeEnd,
									@Param("logStatus") Integer logStatus);
	public int pageListCount(@Param("offset") Integer offset,
                             @Param("pagesize") Integer pagesize,
                             @Param("jobGroup") Integer jobGroup,
                             @Param("jobId") Integer jobId,
                             @Param("triggerTimeStart") Date triggerTimeStart,
                             @Param("triggerTimeEnd") Date triggerTimeEnd,
                             @Param("logStatus") Integer logStatus);

	public XxlJobLog load(@Param("id") int id);

	public int save(XxlJobLog xxlJobLog);

	public int updateTriggerInfo(XxlJobLog xxlJobLog);

	public int updateHandleInfo(XxlJobLog xxlJobLog);

	public int delete(@Param("jobId") int jobId);

	public int triggerCountByHandleCode(@Param("handleCode") int handleCode);

	public List<Map<String, Object>> triggerCountByDay(@Param("from") Date from,
                                                       @Param("to") Date to,
                                                       @Param("handleCode") int handleCode);

	public int clearLog(@Param("jobGroup") int jobGroup,
                        @Param("jobId") int jobId,
                        @Param("clearBeforeTime") Date clearBeforeTime,
                        @Param("clearBeforeNum") int clearBeforeNum);

	XxlJobLog findLatestJobStatus(@Param("groupId") int groupId, @Param("jobId") int jobId);
}
