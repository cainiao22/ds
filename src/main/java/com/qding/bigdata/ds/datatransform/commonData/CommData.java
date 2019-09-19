package com.qding.bigdata.ds.datatransform.commonData;

import com.mysql.jdbc.Driver;
import org.apache.hive.jdbc.HiveDriver;

/**
 * Created by lzs on 2018/5/17.
 */
public class CommData {
    /*private static String classDriver = "com.mysql.jdbc.Driver";*/
    public static final String MYSQL_CLASSDRIVER=Driver.class.getName();
    /*String driverName = "org.apache.hive.jdbc.HiveDriver";*/
    public static final String HIVE_CLASSDRIVER= HiveDriver.class.getName();
    /*org.postgresql.Driver*/
    public static final String POSTGRESQL_CLASSDRIVER=org.postgresql.Driver.class.getName();

}
