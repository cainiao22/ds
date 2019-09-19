import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.db.DBConfiguration;
import org.apache.hadoop.mapreduce.lib.db.DBInputFormat;
import org.apache.hadoop.mapreduce.lib.db.DBWritable;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
/**
 * 从mysql中读数据(结果存放在HDFS中)然后经mapreduce处理
 * @author asheng
 */
public class ReadDataFromMysql {
    /**
     * 重写DBWritable 
     * @author asheng
     * TblsRecord需要从mysql读取数据 
     */
    public static class TblsRecord implements Writable, DBWritable
    {
        String tbl_name;
        String tbl_type;
        public TblsRecord()
        {


        }
        @Override
        public void write(PreparedStatement statement) throws SQLException
        {
            statement.setString(1, this.tbl_name);
            statement.setString(2, this.tbl_type);
        }
        @Override
        public void readFields(ResultSet resultSet) throws SQLException
        {
            this.tbl_name = resultSet.getString(1);
            this.tbl_type = resultSet.getString(2);
        }
        @Override
        public void write(DataOutput out) throws IOException
        {
            Text.writeString(out, this.tbl_name);
            Text.writeString(out, this.tbl_type);
        }
        @Override
        public void readFields(DataInput in) throws IOException
        {
            this.tbl_name = Text.readString(in);
            this.tbl_type = Text.readString(in);
        }
        public String toString()
        {
            return new String(this.tbl_name + " " + this.tbl_type);
        }
    }
    /**
     * Mapper 
     * @author asheng
     * 下面的类中的Mapper一定是包org.apache.hadoop.mapreduce.Mapper;下的 
     */
    public static class ConnMysqlMapper extends Mapper<LongWritable,TblsRecord,Text,Text>
            //TblsRecord是自定义的类型，也就是上面重写的DBWritable类
    {
        public void map(LongWritable key,TblsRecord values,Context context)throws IOException,
                InterruptedException
        {
            //只是将从数据库读取进来数据转换成Text类型然后输出给reduce
            context.write(new Text(values.tbl_name), new Text(values.tbl_type));
        }
    }
    /**
     * Reducer
     * @author asheng
     * 下面的类中的Reducer一定是包org.apache.hadoop.mapreduce.Reducer;下的
     */
    public static class ConnMysqlReducer extends Reducer<Text,Text,Text,Text> {
        public void reduce(Text key,Iterable<Text> values,Context context)throws IOException,
                InterruptedException
        {
            //循环遍历并写入相应的指定文件中
            for(Iterator<Text> itr = values.iterator();itr.hasNext();)
            {
                context.write(key, itr.next());
            }
        }
    }
    public static void main(String[] args) throws Exception
    {
        Configuration conf = new Configuration();

        DBConfiguration.configureDB(conf, "com.mysql.jdbc.Driver","jdbc:mysql://127.0.0.1:3306/mapreduce_test","root", "root");
        Job job = new Job(conf,"test mysql connection");
        job.setJarByClass(ReadDataFromMysql.class);
        job.setMapperClass(ConnMysqlMapper.class);
        job.setReducerClass(ConnMysqlReducer.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);

        job.setInputFormatClass(DBInputFormat.class);
        FileOutputFormat.setOutputPath(job, new Path("hdfs://127.0.0.1:9000/user/lxw/output/"));

        //对应数据库中的列名    
        String[] fields = { "TBL_NAME", "TBL_TYPE" };
        //setInput方法六个参数分别的含义：    
        //1.Job;2.Class<? extends DBWritable>按照什么类型读取的    
        //3.表名;4.where条件    
        //5.order by语句;6.列名所组成的数组   
        DBInputFormat.setInput(job, TblsRecord.class,"lxw_tabls", "TBL_NAME like 'lxy%'", "TBL_NAME", fields);
        System.exit(job.waitForCompletion(true) ? 0 : 1);
        //本程序表示从mysql数据库mapreduce_test的表lxw_tabls中查询处列TAB_NAME为lxy开头的数据并放入hdfs中  
        //执行完后的查看bin/hadoop fs -cat /user/lxw/output/part-r-00000  
/*结果 
lxyae 
lxyaccg 
lxybf 
         */
    }
}  