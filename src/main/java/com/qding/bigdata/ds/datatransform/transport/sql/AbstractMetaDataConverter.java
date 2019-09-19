package com.qding.bigdata.ds.datatransform.transport.sql;

import com.qding.bigdata.ds.datatransform.enums.SQLTypEnum;
import org.springframework.util.Assert;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @author yanpf
 * @date 2018/5/14 14:16
 * @description
 */
public class AbstractMetaDataConverter {

    /**
     * 正向映射关系
     */
    protected Map<String, String> positive;

    /**
     * 反向映射
     */
    protected Map<String, String> negative;


    public AbstractMetaDataConverter(SQLTypEnum typEnum) throws Exception {
        Assert.notNull(typEnum);
        Properties properties = new Properties();
        // 使用ClassLoader加载properties配置文件生成对应的输入流
        InputStream in = this.getClass().getClassLoader().getResourceAsStream("jdbc/jdbc-types-" + typEnum.name().toLowerCase() + ".properties");
        // 使用properties对象加载输入流
        properties.load(in);
        //获取key对应的value值
        Enumeration<?> names = properties.propertyNames();
        positive = new HashMap<String, String>();
        negative = new HashMap<String, String>();
        while(names.hasMoreElements()){
            String key = names.nextElement().toString();
            positive.put(key, properties.getProperty(key));
            negative.put(properties.getProperty(key), key);
        }
    }

    public Map<String, String> getPositive() {
        return positive;
    }

    public void setPositive(Map<String, String> positive) {
        this.positive = positive;
    }

    public Map<String, String> getNegative() {
        return negative;
    }

    public void setNegative(Map<String, String> negative) {
        this.negative = negative;
    }
}
