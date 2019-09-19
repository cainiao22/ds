package com.qding.bigdata.ds.scheduler.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yanpf
 * @date 2018/3/12 11:59
 * @description
 */
public class GraphNode<T> {

    private String id;
    private String name;
    private String label;
    private String color;
    private Integer status;
    private int x = 1;
    private int y = 1;
    private T data;
    private List<GraphNode> children = new ArrayList<GraphNode>();
    private List<String> childrenIdList = new ArrayList<String>();

    public GraphNode(T data) {
        this.data = data;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<GraphNode> getChildren() {
        return children;
    }

    public void setChildren(List<GraphNode> children) {
        this.children = children;
    }

    public List<String> getChildrenIdList() {
        return childrenIdList;
    }

    public void setChildrenIdList(List<String> childrenIdList) {
        this.childrenIdList = childrenIdList;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
