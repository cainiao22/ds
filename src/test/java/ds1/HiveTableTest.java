/*
package ds1;

import org.apache.hive.jdbc.JdbcColumn;
import org.apache.hive.service.cli.Type;
import org.junit.Test;

import java.io.*;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;

*/
/**
 * @author yanpf
 * @date 2018/4/25 15:08
 * @description
 *//*

public class HiveTableTest {



    @Test
    public void getHiveTableCreateSql() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/ds";
        String user = "root";
        String pass = "root123";
        Connection conn = DriverManager.getConnection(url,user,pass);
        PreparedStatement statement = conn.prepareStatement("select * from test into  outfile  '/test.txt'");
        statement.execute();
        ResultSetMetaData metaData = statement.getMetaData();
        int columnCount = metaData.getColumnCount();
        Method m = JdbcColumn.class.getDeclaredMethod("typeStringToHiveType", String.class);
        m.setAccessible(true);
        for(int i=1; i<=columnCount; i++){
            String column = metaData.getColumnName(i) + " " + metaData.getColumnTypeName(i) + " " + metaData.getColumnDisplaySize(i);
            System.out.println(column);
            Type t = (Type) m.invoke(null, metaData.getColumnTypeName(i));
            System.out.println("hive " + t.getName());
        }
        //JdbcColumn.hiveTypeToSqlType()


                System.out.println(conn);

    }


    @Test
    public void testSqoop(){
        String url = "http://localhost：12000/sqoop";
        SqoopClient client = new SqoopClient(url);

        //client.createLink().
    }

    @Test
    public void testJdbcTypes() throws Exception {
        FileReader file = new FileReader("D:\\work\\Project\\Qding\\ds\\branch-20180425-hivejdbc\\src\\main\\resources\\jdbc\\jdbc-types.properties");
        FileWriter fileWriter = new FileWriter("D:\\work\\Project\\Qding\\ds\\branch-20180425-hivejdbc\\src\\main\\resources\\jdbc\\jdbc-types-mysql.properties");
        BufferedReader bufferedReader = new BufferedReader(file);
        BufferedWriter writer = new BufferedWriter(fileWriter);
        String line = null;
        while ((line = bufferedReader.readLine()) != null){
            writer.newLine();
            writer.append(line).append("=").append(line);
        }
        bufferedReader.close();
        writer.close();
        file.close();
        fileWriter.close();

    }
}
*/
