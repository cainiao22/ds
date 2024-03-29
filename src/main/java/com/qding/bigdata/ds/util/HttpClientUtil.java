package com.qding.bigdata.ds.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.config.RequestConfig.Builder;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpRequestRetryHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.qding.bigdata.ds.common.Constant;

/**
 * 封装了一些采用HttpClient发送HTTP请求的方法
 * 
 * 本工具所采用的是最新的HttpComponents-Client-4.3.1
 * @version v1.0
 */
public class HttpClientUtil {
    public static Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);
    private static final CloseableHttpClient httpClient;
    private static final String CHARSET = "UTF-8";
    private static final String APPLICATION_JSON = "application/json";
    private static final String APPLICATION_JSON_FORM = "application/x-www-form-urlencoded";
    static {

        PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        cm.setDefaultMaxPerRoute(Constant.DEFAULT_MAX_PER_ROUTE);
        cm.setMaxTotal(Constant.MAX_TOTAL);

        Builder builder = RequestConfig.custom();
        builder.setConnectTimeout(Constant.CONNECT_TIMEOUT);
        builder.setSocketTimeout(Constant.SOCKET_TIMEOUT);
        RequestConfig config = builder.build();
        DefaultHttpRequestRetryHandler dhr = new DefaultHttpRequestRetryHandler(Constant.HTTP_RETRY_NUM,true);
        httpClient = HttpClientBuilder.create().setConnectionManager(cm).setDefaultRequestConfig(config).setRetryHandler(dhr).build();
    }

    /**
     * HTTP Get 获取内容,默认编码UTF-8
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数
     * @return 页面内容
     */
    public static String doGet(String url, Map<String, String> params) {
        return doGet(url, params, CHARSET);
    }

    /**
     * HTTP Post 获取内容,默认编码UTF-8
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数
     * @return 页面内容
     */
    public static String doPost(String url, Map<String, String> params) throws Exception{
        return doPost(url, params, CHARSET);
    }

    /**
     * HTTP Get 获取内容
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数 categoryNO=A01,A02 转成 categoryNO=A01&categoryNo=A02
     * @param spiltChar
     *            参数值的分隔符
     * @param flag
     *            是否需要按照分隔符分割
     * @return
     */
    public static String doGet(String url, Map<String, String> params, String spiltChar, boolean flag) {
        if (StringUtils.isBlank(url)) {
            return null;
        }
        try {
            if (params != null && !params.isEmpty()) {
                List<NameValuePair> pairs = new ArrayList<NameValuePair>(params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (flag && spiltChar != null) {
                        String[] values = value.split(spiltChar);
                        for (String targetValue : values) {
                            pairs.add(new BasicNameValuePair(entry.getKey(), targetValue));
                        }
                    } else {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
                url += "?" + EntityUtils.toString(new UrlEncodedFormEntity(pairs, CHARSET));
            }
            return doGet(url);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    public static String doGet(String url) {
        if (StringUtils.isBlank(url)) {
            return null;
        }
        try {
            long start = System.currentTimeMillis();
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpClient.execute(httpGet);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpGet.abort();
                logger.error("HttpClientUtil,error status code:" + statusCode + "|request url:" + url);
                throw new RuntimeException("HttpClientUtil,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                long end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
        } catch (Exception e) {
            logger.error("HttpClientUtil,error request url:" + url);
            logger.error(e.getMessage(), e);
        }
        return null;

    }

    /**
     * HTTP Get 获取内容
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数
     * @param charset
     *            编码格式
     * @return 页面内容
     */
    public static String doGet(String url, Map<String, String> params, String charset) {
        if (StringUtils.isBlank(url)) {
            return null;
        }
        try {
            if (params != null && !params.isEmpty()) {
                List<NameValuePair> pairs = new ArrayList<NameValuePair>(params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (value != null) {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
                url += "?" + EntityUtils.toString(new UrlEncodedFormEntity(pairs, charset));
            }
            return doGet(url);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * HTTP Post 获取内容
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数
     * @param charset
     *            编码格式
     * @return 页面内容
     */
    public static String doPost(String url, Map<String, String> params, String charset) throws Exception {
        if (StringUtils.isBlank(url)) {
            return null;
        }
        // debug打印日志
        logger.debug("HttpClientUtil,request url:" + url + " and params:" + params.toString());
        try {
            long start = System.currentTimeMillis();
            List<NameValuePair> pairs = null;
            if (params != null && !params.isEmpty()) {
                pairs = new ArrayList<NameValuePair>(params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (value != null) {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
            }
            HttpPost httpPost = new HttpPost(url);
            if (pairs != null && pairs.size() > 0) {
                httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));
            }
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpPost.abort();
                logger.error("HttpClient,error status code:" + statusCode + "|request url:" + url + "|params:" + params.toString());
                throw new RuntimeException("HttpClient,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                long end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|params:" + params.toString() + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
        } catch (Exception e) {
            logger.error("HttpClientUtil,error request url:" + url + "|params:" + params.toString());
            logger.error(e.getMessage(), e);
            throw new RuntimeException(e);
        }
    }
    /**
     * HTTP Post 获取内容
     * 
     * @param url
     *            请求的url地址 ?之前的地址
     * @param params
     *            请求的参数
     * @param charset
     *            编码格式
     * @return 页面内容
     */
    public static String doPost(String url, Map<String, String> params, String charset,String referer) {
        if (StringUtils.isBlank(url)) {
            return null;
        }
        // debug打印日志
        logger.debug("HttpClientUtil,request url:" + url + " and params:" + params.toString());
        try {
            long start = System.currentTimeMillis();
            List<NameValuePair> pairs = null;
            if (params != null && !params.isEmpty()) {
                pairs = new ArrayList<NameValuePair>(params.size());
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String value = entry.getValue();
                    if (value != null) {
                        pairs.add(new BasicNameValuePair(entry.getKey(), value));
                    }
                }
            }
            HttpPost httpPost = new HttpPost(url);
            httpPost.addHeader("Referer", referer);
            if (pairs != null && pairs.size() > 0) {
                httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));
            }
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpPost.abort();
                logger.error("HttpClient,error status code:" + statusCode + "|request url:" + url + "|params:" + params.toString());
                throw new RuntimeException("HttpClient,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                long end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|params:" + params.toString() + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
        } catch (Exception e) {
            logger.error("HttpClientUtil,error request url:" + url + "|params:" + params.toString());
            logger.error(e.getMessage(), e);
        }
        return null;
    }
  

    
    /**
     * http post json 字符串请求
     * @param url
     * @param json
     * @return
     * @throws Exception
     */
    public static String doPostWithJSON(String url, String json) throws Exception {
    	return doPostWithJSON(url, json, CHARSET);
    }
    
    public static String doPostWithJSON(String url, String json, String charset) throws Exception {
        
    	if (StringUtils.isBlank(url)) {
            return null;
        }
    	
        logger.debug("HttpClientUtil,request url:" + url + " and params:" + json);
    	try{
    		long start = System.currentTimeMillis();
    		HttpPost httpPost = new HttpPost(url);
    		StringEntity stringEntity = new StringEntity(json, charset);
    		stringEntity.setContentType(APPLICATION_JSON);
    		stringEntity.setContentEncoding(charset);
    		httpPost.setEntity(stringEntity);
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpPost.abort();
                logger.error("HttpClient,error status code:" + statusCode + "|request url:" + url + "|json:" + json);
                throw new RuntimeException("HttpClient,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                long end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|json:" + json + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
    	}catch(Exception e){
    		 logger.error("HttpClientUtil,error request url:" + url + "|json:" + json);
             logger.error(e.getMessage(), e);
    	}
    	return null;
    }
    /**
     * http post json 字符串请求
     * @param url
     * @param json
     * @return
     * @throws Exception
     */
    public static String doPostWithJSON(String url, String json,int timeOut) throws Exception {
    	return doPostWithJSON(url, json, CHARSET,timeOut);
    }
    public static String doPostWithJSON(String url, String json, String charset,int timeOut) throws Exception {
        
    	if (StringUtils.isBlank(url)) {
            return null;
        }
    	long start = 0;
    	long end = 0 ;
        logger.debug("HttpClientUtil,request url:" + url + " and params:" + json);
    	try{
    		start = System.currentTimeMillis();
    		HttpPost httpPost = new HttpPost(url);
            RequestConfig requestConfig = RequestConfig.custom()
                    .setConnectionRequestTimeout(timeOut)
                    .setConnectTimeout(timeOut)
                    .setSocketTimeout(timeOut)
                    .setExpectContinueEnabled(false)
                    .build();
            httpPost.setConfig(requestConfig);
        	StringEntity stringEntity = new StringEntity(json, charset);
    		stringEntity.setContentType(APPLICATION_JSON);
    		stringEntity.setContentEncoding(charset);
    		httpPost.setEntity(stringEntity);
    		
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpPost.abort();
                logger.error("HttpClient,error status code:" + statusCode + "|request url:" + url + "|json:" + json);
                throw new RuntimeException("HttpClient,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|json:" + json + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
    	}catch(ConnectTimeoutException e){
    		end = System.currentTimeMillis();
    		logger.error("HttpClientUtil,error timeout request url:" + url + "|json:" + json+ "|time:" + (end - start) + "ms");
    		logger.error(e.getMessage(), e);
    	}catch(SocketTimeoutException e){
    		end = System.currentTimeMillis();
   		 	logger.error("HttpClientUtil,error timeout request url:" + url + "|json:" + json+ "|time:" + (end - start) + "ms");
   		 	logger.error(e.getMessage(), e);
    	}catch(Exception e){
    		 logger.error("HttpClientUtil,error request url:" + url + "|json:" + json);
             logger.error(e.getMessage(), e);
    	}
    	return null;
    }   
    /**
     * http post json 字符串请求
     * @param url
     * @param json
     * @return
     * @throws Exception
     */
    public static String doPostWithJSONFORM(String url, String json) throws Exception {
    	return doPostWithJSONFORM(url, json, CHARSET);
    }
    
    public static String doPostWithJSONFORM(String url, String json, String charset) throws Exception {
        
    	if (StringUtils.isBlank(url)) {
            return null;
        }
    	
        logger.debug("HttpClientUtil,request url:" + url + " and params:" + json);
    	try{
    		long start = System.currentTimeMillis();
    		HttpPost httpPost = new HttpPost(url);
    		StringEntity stringEntity = new StringEntity(json, charset);
    		stringEntity.setContentType(APPLICATION_JSON_FORM);
    		stringEntity.setContentEncoding(charset);
    		httpPost.setEntity(stringEntity);
            CloseableHttpResponse response = httpClient.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                httpPost.abort();
                logger.error("HttpClient,error status code:" + statusCode + "|request url:" + url + "|json:" + json);
                throw new RuntimeException("HttpClient,error status code :" + statusCode);
            }
            HttpEntity entity = response.getEntity();
            String result = null;
            if (entity != null) {
                result = EntityUtils.toString(entity, CHARSET);
                long end = System.currentTimeMillis();
                logger.info("HttpClientUtil,request url:" + url + "|json:" + json + "|time:" + (end - start) + "ms");
                logger.debug("HttpClientUtil,response result :" + result);
            }
            EntityUtils.consume(entity);
            response.close();
            return result;
    	}catch(Exception e){
    		 logger.error("HttpClientUtil,error request url:" + url + "|json:" + json);
             logger.error(e.getMessage(), e);
    	}
    	return null;
    }   

    /**
     * 获取IP地址
     * 
     * @param request
     * @return
     */
    public static final String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (StringUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (StringUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (StringUtils.isEmpty(ip) || StringUtils.equalsIgnoreCase("unknown", ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 下载文件
     * 
     * @param url
     *            http://www.xxx.com/img/111.jpg
     * @param destFileName
     *            xxx.jpg/xxx.png/xxx.txt
     * @throws ClientProtocolException
     * @throws IOException
     */
    public static void downloadFile(String url, String destFileName) throws ClientProtocolException, IOException {
        if (StringUtils.isBlank(url)) {
            return;
        }
        HttpGet httpGet = new HttpGet(url);
        HttpResponse response = httpClient.execute(httpGet);
        HttpEntity entity = response.getEntity();
        InputStream in = entity.getContent();
        File file = new File(destFileName);
        FileOutputStream fout = null;
        try {
            fout = new FileOutputStream(file);
            int len = -1;
            byte[] tmp = new byte[1024];
            while ((len = in.read(tmp)) != -1) {
                fout.write(tmp, 0, len);
            }
            fout.flush();

        } finally {
            // 关闭低层流。
            if(fout != null) {
                fout.close();
            }
            in.close();
        }
        httpClient.close();
    }
    
    @SuppressWarnings("unused")
	public static void main(String[] args) {
    	try {
    		System.out.println("time:"+System.currentTimeMillis());
    		String CREATE_CARD = "https://api.weixin.qq.com/card/create";
    		String accessToken = "8xoGVZPh3jzKu7mvw77ywG52HEE9-bnnKdd8zDfl86bMkYiu7RyJWEUNZic1ZOkupBKOiZFxv1tBvflwvUqYEtdzweT2poLckAOMXbEDq8M";
    		String url = CREATE_CARD + "?access_token=" + accessToken;
    		String json = "{\"card\":{\"card_type\":\"GROUPON\",\"groupon\":{\"base_info\":{\"logo_url\":\"http://mmbiz.qpic.cn/mmbiz/iaL1LJM1mF9aRKPZJkmG8xXhiaHqkKSVMMWeN3hLut7X7hicFNjakmxibMLGWpXrEXB33367o7zHN0CwngnQY7zb7g/0\",\"brand_name\":\"海底捞\",\"code_type\":\"CODE_TYPE_TEXT\",\"title\":\"132元双人火锅套餐\",\"sub_title\":\"周末狂欢必备\",\"color\":\"Color010\",\"notice\":\"使用时向服务员出示此券\",\"service_phone\":\"020-88888888\",\"description\":\"不可与其他优惠同享\\n如需团购券发票，请在消费时向商户提出\\n店内均可使用，仅限堂食\",\"date_info\":{\"type\":\"DATE_TYPE_FIX_TIME_RANGE\",\"begin_timestamp\":1441176591,\"end_timestamp\":1441186590},\"sku\":{\"quantity\":500000},\"get_limit\":3,\"use_custom_code\":false,\"bind_openid\":false,\"can_share\":true,\"can_give_friend\":true,\"location_id_list\":[123,12321,345345],\"custom_url_name\":\"立即使用\",\"custom_url\":\"http://www.qq.com\",\"custom_url_sub_title\":\"6个汉字tips\",\"promotion_url_name\":\"更多优惠\",\"promotion_url\":\"http://www.qq.com\",\"source\":\"大众点评\"},\"deal_detail\":\"以下锅底2选1（有菌王锅、麻辣锅、大骨锅、番茄锅、清补凉锅、酸菜鱼锅可选）：\\n大锅1份 12元\\n小锅2份 16元 \"}}}";
    		Map<String, String> params = new HashMap<String, String>();
    		params.put("orderNo", "201512140035720");
    		Gson gson = new GsonBuilder().enableComplexMapKeySerialization()
    				.create();
    		
    		 String jsonStr = gson.toJson(params);
    		String result = doPostWithJSONFORM("http://wmsinventory.liantiao.com/Api/Stock/ScmPurchaseAbnormalSyncZero","={'FormNo':'201512230038026','DetailDtos':[{'SkuNo':'30003153001','TargetQuantity':'1'}],'SupplierNo':'S0000628','OperateUser':'FF8AE58D741DDF413ADB20CF03306051','WarehouseNo':'Z'}");
    		//String result2 = doPost("http://wmsinventory.liantiao.com/Api/OrderStock/GetOrderLockSupplierSkuList",params);
			System.out.println(result);
		//	System.out.println(result2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}