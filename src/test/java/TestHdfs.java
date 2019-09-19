import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.*;

import java.io.IOException;
import java.net.URISyntaxException;

/**
 * Created by lzs on 2018/6/6.
 */
public class TestHdfs {
    public static void main(String[] args) throws IOException, URISyntaxException, InterruptedException {
     /*   Configuration conf = new Configuration();
        *//*conf.set("fs.defaultFS","hdfs://10.37.5.142:9000");
        FileSystem fs = FileSystem.newInstance(conf);*//*
        FileSystem fs = FileSystem.get(new URI("hdfs://10.37.5.142:9000"), conf, "bigdata");

        FileStatus[] files = null;
        try {
            files = fs.listStatus(new Path("\\"));
            for (FileStatus file:files) {
                System.out.print(file.getPath().getName());
                System.out.print("\t"+ file.isDirectory());
                System.out.print("\t"+ file.getOwner());
                System.out.print("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        Configuration conf = new Configuration();
        conf.set("fs.defaultFS","hdfs://10.37.251.86:8020");
        FileSystem fs = FileSystem.newInstance(conf);
        // true 表示递归查找  false 不进行递归查找
        RemoteIterator<LocatedFileStatus> iterator = fs.listFiles(new Path("/"), true);
        while (iterator.hasNext()){
            LocatedFileStatus next = iterator.next();
        System.out.println(next.getPath());
    }
        System.out.println("----------------------------------------------------------");
        FileStatus[] fileStatuses = fs.listStatus(new Path("/"));
        for (int i = 0; i < fileStatuses.length; i++) {
            FileStatus fileStatus = fileStatuses[i];
            System.out.println(fileStatus.getPath());
        }


    }
}

