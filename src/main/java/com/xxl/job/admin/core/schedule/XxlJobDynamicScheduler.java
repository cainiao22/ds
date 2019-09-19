package com.xxl.job.admin.core.schedule;

import com.xxl.job.admin.core.jobbean.RemoteHttpJobBean;
import org.quartz.*;
import org.quartz.Trigger.TriggerState;
import org.quartz.impl.triggers.CronTriggerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.HashSet;
import java.util.concurrent.ConcurrentHashMap;

public final class XxlJobDynamicScheduler {

	private static final Logger logger = LoggerFactory.getLogger(XxlJobDynamicScheduler.class);

	// scheduler
	private static Scheduler scheduler;

	public void setScheduler(Scheduler scheduler) {
		XxlJobDynamicScheduler.scheduler = scheduler;
	}

	/**
	 * check if exists
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean checkExists(String jobName, String jobGroup) throws SchedulerException {
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
		return scheduler.checkExists(triggerKey);
	}

	/**
	 * addJob
	 *
	 * @param jobName
	 * @param jobGroup
	 * @param cronExpression
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean addJob(String jobName, String jobGroup, String cronExpression) throws SchedulerException {
		// TriggerKey : name + group
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
		JobKey jobKey = new JobKey(jobName, jobGroup);

		// TriggerKey valid if_exists
		if (checkExists(jobName, jobGroup)) {
			logger.info(">>>>>>>>> addJob fail, job already exist, jobGroup:{}, jobName:{}", jobGroup, jobName);
			return false;
		}

		// CronTrigger : TriggerKey + cronExpression //
		// withMisfireHandlingInstructionDoNothing 忽略掉调度终止过程中忽略的调度
		CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression)
				.withMisfireHandlingInstructionDoNothing();
		CronTrigger cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerKey).withSchedule(cronScheduleBuilder)
				.build();

		// JobDetail : jobClass
		Class<? extends Job> jobClass_ = RemoteHttpJobBean.class; // Class.forName(jobInfo.getJobClass());

		JobDetail jobDetail = JobBuilder.newJob(jobClass_).withIdentity(jobKey).build();
		/*
		 * if (jobInfo.getJobData()!=null) { JobDataMap jobDataMap =
		 * jobDetail.getJobDataMap();
		 * jobDataMap.putAll(JacksonUtil.readValue(jobInfo.getJobData(),
		 * Map.class)); // JobExecutionContext
		 * context.getMergedJobDataMap().get("mailGuid"); }
		 */

		// schedule : jobDetail + cronTrigger
		Date date = scheduler.scheduleJob(jobDetail, cronTrigger);

		return true;
	}

	/**
	 * rescheduleJob
	 *
	 * @param jobGroup
	 * @param jobName
	 * @param cronExpression
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean rescheduleJob(String jobGroup, String jobName, String cronExpression)
			throws SchedulerException {

		// TriggerKey valid if_exists
		if (!checkExists(jobName, jobGroup)) {
			logger.info(">>>>>>>>>>> rescheduleJob fail, job not exists, JobGroup:{}, JobName:{}", jobGroup, jobName);
			return false;
		}

		// TriggerKey : name + group
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
		CronTrigger oldTrigger = (CronTrigger) scheduler.getTrigger(triggerKey);

		if (oldTrigger != null) {
			// avoid repeat
			String oldCron = oldTrigger.getCronExpression();
			if (oldCron.equals(cronExpression)) {
				return true;
			}

			// CronTrigger : TriggerKey + cronExpression
			CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression)
					.withMisfireHandlingInstructionDoNothing();
			oldTrigger = oldTrigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(cronScheduleBuilder)
					.build();

			// rescheduleJob
			scheduler.rescheduleJob(triggerKey, oldTrigger);
		} else {
			// CronTrigger : TriggerKey + cronExpression
			CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression)
					.withMisfireHandlingInstructionDoNothing();
			CronTrigger cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerKey)
					.withSchedule(cronScheduleBuilder).build();

			// JobDetail-JobDataMap fresh
			JobKey jobKey = new JobKey(jobName, jobGroup);
			JobDetail jobDetail = scheduler.getJobDetail(jobKey);
			/*
			 * JobDataMap jobDataMap = jobDetail.getJobDataMap();
			 * jobDataMap.clear();
			 * jobDataMap.putAll(JacksonUtil.readValue(jobInfo.getJobData(),
			 * Map.class));
			 */

			// Trigger fresh
			HashSet<Trigger> triggerSet = new HashSet<Trigger>();
			triggerSet.add(cronTrigger);

			scheduler.scheduleJob(jobDetail, triggerSet, true);
		}

		logger.info(">>>>>>>>>>> resumeJob success, JobGroup:{}, JobName:{}", jobGroup, jobName);
		return true;
	}

	/**
	 * unscheduleJob
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean removeJob(String jobName, String jobGroup) throws SchedulerException {
		// TriggerKey : name + group
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);
		boolean result = false;
		if (checkExists(jobName, jobGroup)) {
			result = scheduler.unscheduleJob(triggerKey);
			logger.info(">>>>>>>>>>> removeJob, triggerKey:{}, result [{}]", triggerKey, result);
		}
		return true;
	}

	/**
	 * pause
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean pauseJob(String jobName, String jobGroup) throws SchedulerException {
		// TriggerKey : name + group
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);

		boolean result = false;
		if (checkExists(jobName, jobGroup)) {
			scheduler.pauseTrigger(triggerKey);
			result = true;
			logger.info(">>>>>>>>>>> pauseJob success, triggerKey:{}", triggerKey);
		} else {
			logger.info(">>>>>>>>>>> pauseJob fail, triggerKey:{}", triggerKey);
		}
		return result;
	}

	/**
	 * resume
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean resumeJob(String jobName, String jobGroup) throws SchedulerException {
		// TriggerKey : name + group
		TriggerKey triggerKey = TriggerKey.triggerKey(jobName, jobGroup);

		boolean result = false;
		if (checkExists(jobName, jobGroup)) {
			scheduler.resumeTrigger(triggerKey);
			result = true;
			logger.info(">>>>>>>>>>> resumeJob success, triggerKey:{}", triggerKey);
		} else {
			logger.info(">>>>>>>>>>> resumeJob fail, triggerKey:{}", triggerKey);
		}
		return result;
	}

	/**
	 * run
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean triggerJob(String jobName, String jobGroup) throws SchedulerException {
		// TriggerKey : name + group
		JobKey jobKey = new JobKey(jobName, jobGroup);

		boolean result = false;
		if (checkExists(jobName, jobGroup)) {
			scheduler.triggerJob(jobKey);
			result = true;
			logger.info(">>>>>>>>>>> runJob success, jobKey:{}", jobKey);
		} else {
			logger.info(">>>>>>>>>>> runJob fail, jobKey:{}", jobKey);
		}
		return result;
	}

	/**
	 * run
	 *
	 * @param jobName
	 * @param jobGroup
	 * @return
	 * @throws SchedulerException
	 */
	public static boolean triggerJob(String jobName, String jobGroup, JobDataMap dataMap) throws SchedulerException {
		// TriggerKey : name + group
		JobKey jobKey = new JobKey(jobName, jobGroup);

		boolean result = false;
		if (checkExists(jobName, jobGroup)) {
			scheduler.triggerJob(jobKey, dataMap);
			result = true;
			logger.info(">>>>>>>>>>> runJob success, jobKey:{}", jobKey);
		} else {
			logger.info(">>>>>>>>>>> runJob fail, jobKey:{}", jobKey);
		}
		return result;
	}

}