import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.mapred.lib.db.DBConfiguration;
import org.apache.hadoop.mapred.lib.db.DBInputFormat;
import org.apache.hadoop.mapred.lib.db.DBOutputFormat;
import org.apache.hadoop.mapred.lib.db.DBWritable;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
  
  
  
public class MysqltoMr {  
      
    public static class StudentinfoRecord implements Writable, DBWritable {  
        int id;  
        String name;  
  
        public void readFields(DataInput in) throws IOException {  
            this.id = in.readInt();  
            this.name = Text.readString(in);  
        }  
  
        public String toString() {  
            return new String(this.id + " " + this.name);  
        }  
  
        @Override  
        public void write(PreparedStatement stmt) throws SQLException {  
            stmt.setInt(1, this.id);  
            stmt.setString(2, this.name);  
        }  
  
        @Override  
        public void readFields(ResultSet result) throws SQLException {  
            this.id = result.getInt(1);  
            this.name = result.getString(2);  
        }  
  
        @Override  
        public void write(DataOutput out) throws IOException {  
            out.writeInt(this.id);  
            Text.writeString(out, this.name);  
        }  
    }  
  
    public static class DBInputMapper extends MapReduceBase implements
            Mapper {
        @Override
        public void map(Object o, Object o2, OutputCollector outputCollector, Reporter reporter) throws IOException {

        }
        public void map(LongWritable key, StudentinfoRecord value,
                OutputCollector collector, Reporter reporter) throws IOException {  
            collector.collect(new LongWritable(value.id), new Text(value.toString()));  
        }

    }
  
    public static class MyReducer extends MapReduceBase implements  
            Reducer {  
        public void reduce(LongWritable key, Iterator values,
                OutputCollector output, Reporter reporter) throws IOException {  
            String[] splits = values.next().toString().split(" ");  
            StudentinfoRecord r = new StudentinfoRecord();  
            r.id = Integer.parseInt(splits[0]);  
            r.name = splits[1];  
            output.collect(r, new Text(r.name));  
        }

        @Override
        public void reduce(Object o, Iterator iterator, OutputCollector outputCollector, Reporter reporter) throws IOException {

        }
    }
  
    public static void main(String[] args) throws IOException {  
        JobConf conf = new JobConf(MysqltoMr.class);  
        conf.setMapOutputKeyClass(LongWritable.class);  
        conf.setMapOutputValueClass(Text.class);  
        conf.setOutputKeyClass(LongWritable.class);  
        conf.setOutputValueClass(Text.class);  
  
        conf.setOutputFormat(DBOutputFormat.class);  
        conf.setInputFormat(DBInputFormat.class);  
  
        DBConfiguration.configureDB(conf, "com.mysql.jdbc.Driver", "jdbc:mysql://192.168.0.117:3306/moviedata",  
                "root", "123");  
        String[] fields = { "id", "name" };  
        // 从 t 表读数据  
        DBInputFormat.setInput(conf, StudentinfoRecord.class, "t", null, "id", fields);  
        // mapreduce 将数据输出到 t2 表  
        DBOutputFormat.setOutput(conf, "t2", "id", "name");  
        // conf.setMapperClass(org.apache.hadoop.mapred.lib.IdentityMapper.class);  
        conf.setMapperClass(DBInputMapper.class);  
        conf.setReducerClass(MyReducer.class);  
  
        JobClient.runJob(conf);  
    }  
}  