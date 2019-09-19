package com.qding.bigdata.ds.component;

import com.qding.bigdata.ds.model.scheduler.SchedulerJob;
import com.qding.bigdata.ds.scheduler.model.Graph;
import com.qding.bigdata.ds.scheduler.model.GraphNode;
import org.springframework.util.CollectionUtils;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * @author yanpf
 * @date 2018/3/14 14:34
 * @description
 */
public class GraphArborFormatHandler {

    public static Object format(Graph<SchedulerJob> graph){
        StringBuffer sb = new StringBuffer();
        if(graph == null || CollectionUtils.isEmpty(graph.getHeaders())){
            return sb.toString();
        }
        List<GraphNode<SchedulerJob>> headers = graph.getHeaders();
        Queue<GraphNode<SchedulerJob>> queue = new LinkedList<GraphNode<SchedulerJob>>();
        queue.addAll(headers);
        GraphNode<SchedulerJob> top = null;
        while(!queue.isEmpty()){
            top = queue.poll();
            sb.append(top.getData().getJobId())
                    .append(" {").append("color:green, shape:dot, link:www.baidu.com, label:")
                    .append(top.getData().getJobName())
                    .append("}\n");
            if(top.getChildren() != null){
                /*for (GraphNode<SchedulerJob> node : top.getChildren()) {
                    sb.append(top.getData().getJobId())
                            .append(" -> ").append(node.getData().getJobId())
                            .append("\n");
                    queue.add(node);
                }*/
            }
        }

        return sb.toString();
    }
}
