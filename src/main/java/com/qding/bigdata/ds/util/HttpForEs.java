package com.qding.bigdata.ds.util;

import org.apache.commons.io.IOUtils;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;


/**
 * Created by Administrator on 2019/7/19 0019.
 */
public class HttpForEs {

    private static String POST = "POST";
    private static String GET = "GET";
    private static String CONTENT_TYPE_URLENCODED = "application/x-www-form-urlencoded";
    private static String CONTENT_TYPE_JSON = "application/json";


    private final static String CONFIG_FILE="config.properties";

    public static String httpRequest(String method, String contentType, String urlStr,String paras)
            throws IOException {
        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setConnectTimeout(300000);
        con.setReadTimeout(300000);
        con.setRequestMethod(method);
        con.setRequestProperty("Content-Type", contentType);

        if(paras != null && !paras.isEmpty()){
            con.setDoOutput(true);
            DataOutputStream out = new DataOutputStream(con.getOutputStream());
            System.out.println(paras.toString());
            out.writeChars(paras.toString());
            out.flush();
            out.close();
        }


        InputStream inStream = con.getInputStream();
        String result = IOUtils.toString(inStream,"utf-8");
//        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
//        String inputLine;
//        StringBuffer content = new StringBuffer();
//        while ((inputLine = in.readLine()) != null) {
//            content.append(inputLine);
//        }
//        in.close();
        con.disconnect();
//        return content.toString();
        return result.toString();
    }

    public static class ParameterStringBuilder {
        public static String getParamsString(Map<String, String> params)
                throws UnsupportedEncodingException {
            StringBuilder result = new StringBuilder();

            for (Map.Entry<String, String> entry : params.entrySet()) {
                result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
                result.append("=");
                result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
                result.append("&");
            }

            String resultString = result.toString();
            return resultString.length() > 0
                    ? resultString.substring(0, resultString.length() - 1)
                    : resultString;
        }
    }

    /**
     * ES接口调用 _xpack/sql
     * @return
     */
    public static String getEsDate(String sql){

        String APIurl = PropertiesUtil.getPropertiesByKey(CONFIG_FILE, "es.xpack.url");
//        HashMap<String, String> parameters = new HashMap<String, String>();
//        parameters.put("query", "SELECT count(name),city_maping_id FROM qding_shequ_label group by city_maping_id");
//        String sql= "SELECT count(name),city_maping_id FROM qding_shequ_label group by city_maping_id";
        String paras = "{\"query\":\""+ sql +"\"}";
        String result = null;
        try {
            result = httpRequest(POST, CONTENT_TYPE_JSON, APIurl, paras);
//            System.out.println(result);
//            Map ma = JSON.parseObject(result, Map.class);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return  result;
    }

}
