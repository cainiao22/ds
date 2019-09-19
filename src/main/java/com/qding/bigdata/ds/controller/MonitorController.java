package com.qding.bigdata.ds.controller;

import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qding.bigdata.ds.monitor.KAWeixinTextReportMonitor;
import com.qding.bigdata.ds.monitor.WeixinTextReportMonitor;
import com.qding.bigdata.ds.monitor.WeixinXiaokongReportMonitor;

@Controller
public class MonitorController {
	@Autowired
	private WeixinTextReportMonitor weixinTextReportMonitor;
	@Autowired
	private WeixinXiaokongReportMonitor weixinXiaokongReportMonitor;
	@Autowired
	private KAWeixinTextReportMonitor kAWeixinTextReportMonitor;
	

	@ResponseBody
	@RequestMapping(value = "/datamonitor", method = RequestMethod.GET)
	private void monitor(HttpServletRequest request) {
		final String job = request.getParameter("job");
		final String day = request.getParameter("day");
		final String delayStr = request.getParameter("delay");
		final int delay=Integer.parseInt(delayStr);
		Timer timer = new Timer();
		timer.schedule(new TimerTask() {
			public void run() {
				try {
					if (job.equals("weixinTextReport")) {
						weixinTextReportMonitor.run(day,delay);
					} else if (job.equals("weixinXiaokongReport")) {
						weixinXiaokongReportMonitor.run(day,delay);
					}else if (job.equals("KAweixinTextReport")) {
						kAWeixinTextReportMonitor.run(day,delay);
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}, 2000);
	}
}
