package com.qding.bigdata.ds.datatransform.model;

import java.util.HashMap;

/**
 * @author yanpf
 * @date 2018/5/14 15:05
 * @description
 */
public class JdbcConfig implements Cloneable {

    /**
     * 从本地类型转换到公共类型的映射关系
     */
    private HashMap<String, String> writerTypes = new HashMap  <String, String>();

    /**
     *  从公共类型映射到本地类型的映射关系
     */
    private HashMap<String, String> readerTypes = new HashMap<String, String>();


    public HashMap<String, String> getWriterTypes() {
        return writerTypes;
    }

    public void setWriterTypes(HashMap<String, String> writerTypes) {
        this.writerTypes = writerTypes;
    }

    public HashMap<String, String> getReaderTypes() {
        return readerTypes;
    }

    public void setReaderTypes(HashMap<String, String> readerTypes) {
        this.readerTypes = readerTypes;
    }

    @Override
    public JdbcConfig clone() throws CloneNotSupportedException {
         JdbcConfig clone = new JdbcConfig();
         clone.setReaderTypes((HashMap<String, String>) readerTypes.clone());
         clone.setWriterTypes((HashMap<String, String>) writerTypes.clone());
         return clone;
    }
}
