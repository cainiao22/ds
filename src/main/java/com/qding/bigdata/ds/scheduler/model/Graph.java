package com.qding.bigdata.ds.scheduler.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author yanpf
 * @date 2018/3/12 12:00
 * @description
 */
public class Graph<T> {

    private List<GraphNode<T>> headers;

    private List<GraphNode<T>> nodeList = new ArrayList<GraphNode<T>>();
    private List<Edge> edgeList = new ArrayList<Edge>();

    private String name;

    private Map<Integer, Integer> xNums = new HashMap<Integer, Integer>();
    private int yMax = 1;

    public List<GraphNode<T>> getHeaders() {
        return headers;
    }

    public void setHeaders(List<GraphNode<T>> headers) {
        this.headers = headers;
    }

    public List<GraphNode<T>> getNodeList() {
        return nodeList;
    }

    public void setNodeList(List<GraphNode<T>> nodeList) {
        this.nodeList = nodeList;
    }

    public List<Edge> getEdgeList() {
        return edgeList;
    }

    public void setEdgeList(List<Edge> edgeList) {
        this.edgeList = edgeList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<Integer, Integer> getxNums() {
        return xNums;
    }

    public void setxNums(Map<Integer, Integer> xNums) {
        this.xNums = xNums;
    }

    public int getyMax() {
        return yMax;
    }

    public void setyMax(int yMax) {
        this.yMax = yMax;
    }

    public void changeXNums(int y, int offset){
        Integer value = xNums.get(y);
        if(value == null){
            value = 0;
        }
        xNums.put(y, value + offset);
    }
}
