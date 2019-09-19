package com.qding.bigdata.ds.aop.dynamicsource;

/**
 * @author yanpf
 * @date 2018/5/16 10:13
 * @description
 */
public class DataSourceContextHolder {

    private static final ThreadLocal<String> dataSourceHolder = new ThreadLocal<String>(){
        @Override
        protected String initialValue() {
            return null;
        }
    };

    public static void setDataSource(String dbType) {
        dataSourceHolder.set(dbType);
    }

    public static String getDataSource() {
        return  dataSourceHolder.get();
    }

    public static void clearDataSource() {
        dataSourceHolder.remove();
    }

}
