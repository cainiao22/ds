import com.qding.bigdata.ds.datatransform.commonData.CommData;
import com.qding.bigdata.ds.datatransform.model.ConfigValueModel;
import com.qding.bigdata.ds.datatransform.model.RowColumnNamAndVal;
import com.qding.bigdata.ds.datatransform.utils.JdbcUtil;
import org.junit.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lzs on 2018/5/31.
 */
public class TestTableDao {
    @Test
    public static List<List<RowColumnNamAndVal>> queryTableInfo() {
        List<List<RowColumnNamAndVal>> tableInfo = new ArrayList<List<RowColumnNamAndVal>>();
        ConfigValueModel valueModel = new ConfigValueModel();
        valueModel.setDb("devds");
        valueModel.setUrl("10.37.5.111:3306");
        valueModel.setUser("ds");
        valueModel.setPassword("123456!");
        valueModel.setDbtype("mysql");
        String connType= CommData.MYSQL_CLASSDRIVER;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn = JdbcUtil.getConnection(valueModel,connType);
            String sql="select * from student";
            ps = conn.prepareStatement(sql);
            rs= ps.executeQuery();
            /*List<MetaColumn> sqlMetaColumns = queryColumnByTbName(tableName, metaConfigValueModel);*/
            while (rs.next()){
                ResultSetMetaData metaData = rs.getMetaData();
               /* metaData.getColumnName(i);*/
                int columnCount = metaData.getColumnCount();
                List<RowColumnNamAndVal> rows = new ArrayList<RowColumnNamAndVal>();
                for (int i = 1; i <= columnCount; i++) {
                        RowColumnNamAndVal namAndVal = new RowColumnNamAndVal();
                        namAndVal.setRowColumnNam(metaData.getColumnName(i));
                        namAndVal.setRowColumnVal(rs.getString(i));
                        rows.add(namAndVal);
                    /*tableInfo.add(rs.getString(i));*/
                    /*tableInfo.add(rows);*/
                }
                 tableInfo.add(rows);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.closeResouce(rs, ps, conn);
        }
        return tableInfo;
    }

    public static void main(String[] args){
        List<List<RowColumnNamAndVal>> lists = queryTableInfo();
       /* for (List<RowColumnNamAndVal> row : lists) {
            for (RowColumnNamAndVal ss:row) {
                System.out.println(ss.getRowColumnNam()+"  "+ss.getRowColumnVal());
            }
        }*/

        /*String sql="insert into student (id,name,age,tel) values('3','ss','12','55555')";*/
        for (List<RowColumnNamAndVal> row : lists) {
            StringBuffer sbf = new StringBuffer("insert into table student (");
            for (int i=0;i<row.size();i++) {
                if (i==row.size()-1){
                    sbf.append(row.get(i).getRowColumnNam());
                }else {
                    sbf.append(row.get(i).getRowColumnNam()+",");
                }
            }
            sbf.append(") values(");
            for (int i=0;i<row.size();i++) {
                if (i==row.size()-1){
                    sbf.append("'"+row.get(i).getRowColumnVal()+"'");
                }else {
                    sbf.append("'"+row.get(i).getRowColumnVal()+"',");
                }
            }
            sbf.append(")");
            String ss=sbf.toString();
            System.out.println(ss);
        }

    }

}
