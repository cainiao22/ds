package com.qding.bigdata.ds.monitor;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.qding.bigdata.ds.common.WeixinReportResult;
import com.qding.bigdata.ds.util.HttpUtil;
import com.qding.bigdata.ds.util.RegexUtil;

@Service
public class KAWeixinTextReportMonitor {
	private int times = 1;
	private String report = "KA微信文字版日报";
	private String reportTag = "KAWeiXinWenZiBan";

	public void run(String day,int delay) throws InterruptedException {
		times=1;
		while (!verify(day)) {

			Thread.sleep(1000*60*delay);
			times++;
		}

	}

	private boolean verify(String day) {
		String str = null;
		try {
			str = HttpUtil.get("https://m2.iqdnet.com/mobile/kadaily?day=" + day);
			if (StringUtils.isEmpty(str) || !str.contains("北京")) {
				this.alarm(WeixinReportResult.DATA_NOT_READY, day);
				return false;
			}
			if (RegexUtil.getAllContent("<i class=\"text-orange\">([0-9]+\\.?[0-9]*)", str).size() < 10) {
				this.alarm(WeixinReportResult.DATA_NOT_VALID, day);
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		try {
			System.out.println(HttpUtil.get("http://bigdata.iqdnet.cn/jobNotify/notify/" + reportTag + "/" + day));
		} catch (Exception e) {
			e.printStackTrace();
		}
		alarm(WeixinReportResult.SUCCESS, day);
		return true;
	}

	private void alarm(WeixinReportResult weixinReportResult, String day) {
		String msg = "[" + day + "]第" + times + "次校验," + weixinReportResult.getMessage();
		System.out.println(msg);
		try {
			HttpUtil.get(
					"http://wukong.iqdnet.cn/wukongbg/admin/api/wx_msg_send_by_mobiles?mobiles=15801029684%7c13641064288%7c15110234502%7c15011233180%7c18600295448&title="
							+ report + "&content=" + msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
