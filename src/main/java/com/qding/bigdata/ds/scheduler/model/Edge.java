package com.qding.bigdata.ds.scheduler.model;

/**
 * @author yanpf
 * @date 2018/3/15 14:02
 * @description
 */
public class Edge {

    private String source;
    private String target;
    private Integer value;

    public Edge(String source, String target) {
       this(source, target, null);
    }

    public Edge(String source, String target, Integer value) {
        this.source = source;
        this.target = target;
        this.value = value;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
