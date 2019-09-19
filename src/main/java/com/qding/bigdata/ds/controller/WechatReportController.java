package com.qding.bigdata.ds.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qding.bigdata.ds.common.Constant;
import com.qding.bigdata.ds.common.SearchResult;
import com.qding.bigdata.ds.dao.ConfigDao;
import com.qding.bigdata.ds.dao.WechatReportDao;
import com.qding.bigdata.ds.enums.SideBarMenu;
import com.qding.bigdata.ds.model.Config;
import com.qding.bigdata.ds.model.WechatReport;
import com.qding.bigdata.ds.service.WechatReportService;
import com.qding.bigdata.ds.util.HttpClientUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by yanpf on 2017/9/11.
 */

@Controller
public class WechatReportController extends BasicController {

    private static final String WECHAT_REPORT_OPENID="wechat_report_openId";
    private DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

    private static final String notifyUrlQuery = "http://bigdata.iqdnet.cn/jobNotify/query/";
    private static final String notifyUrlAdd = "http://bigdata.iqdnet.cn/jobNotify/notify/";

    private static final String WEIXIN_TEMPLETE_URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=";

    @Autowired
    WechatReportService wechatReportService;

    @RequestMapping("wechatReport")
    public ModelAndView wechatReportManagement(){
        ModelAndView mv = initModelAndView();
        mv.addObject(Constant.SIDEBAR_MENU, SideBarMenu.业务库);
        mv.addObject("sendDate", dateFormat.format(new Date()));
        return mv;
    }

    @ResponseBody
    @RequestMapping("queryWechatReport")
    public SearchResult<WechatReport> queryWechatReport(WechatReport param){
        log.info("分页查询微信报表发送状态：{}", JSON.toJSONString(param));
        SearchResult<WechatReport> result = wechatReportService.query(param);
        log.info("分页查询微信报表发送状态返回:{}", JSON.toJSONString(result));
        return  result;
    }

    @ResponseBody
    @RequestMapping("sendWechatReport")
    public JSONObject sendWechatReport(String openId) throws Exception {
        Map<String, Object> templeteMsg = new HashMap<String, Object>();
        Date curDate = new Date();
        String yesterday = dateFormat.format(curDate.getTime() - 1000*60*60*24);
        String h5Url = "http://m2.iqdnet.com/mobile/statistic?day=" + yesterday;
        templeteMsg.put("template_id", "AKtt0PR8MQL1BQ4WpckPGavasAjmMu3nLJNRAHRu87w");
        templeteMsg.put("url", h5Url);
        templeteMsg.put("topcolor", "#FF0000");
        Map<String, Object> data = new HashMap<String, Object>();
        templeteMsg.put("data", data);
        Map<String, String> first = new HashMap<String, String>();
        first.put("value", "");
        data.put("first", first);
        Map<String, String> keyword1 = new HashMap<String, String>();
        keyword1.put("value", "database sync check");
        keyword1.put("color", "#173177");
        data.put("keyword1", keyword1);
        Map<String, String> keyword2 = new HashMap<String, String>();
        keyword2.put("value", yesterday);
        keyword2.put("color","#173177");
        data.put("keyword2", keyword2);

        String accessToken = HttpClientUtil.doGet("http://boss.qdingnet.com/weixin_admin/web/publics/getAccessToken?publicsId=241&appId=wxd23d0632ad28c805");
        String resp = HttpClientUtil.doPostWithJSON(WEIXIN_TEMPLETE_URL + accessToken, JSON.toJSONString(templeteMsg));
        JSONObject jsonObject = JSON.parseObject(resp);
        String today = dateFormat.format(new Date());
        if(jsonObject.getInteger("errcode") == 0){
            HttpClientUtil.doGet(notifyUrlAdd + "wechat_report_" + openId + "/" + today);
        }
        return jsonObject;
    }

    private String getSendStatus(String openId, String today){
        String url = notifyUrlQuery + "wechat_report_" + openId + "/" + today;
        return HttpClientUtil.doGet(url);
    }
}
