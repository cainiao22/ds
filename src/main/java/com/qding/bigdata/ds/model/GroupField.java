/**
 * 
 */
package com.qding.bigdata.ds.model;

/**
 * @author wangjunping
 *
 */
public class GroupField  extends AbstractField{
  private Integer id;
  private String displayName;

  private Dimension dimension;
  

  private String column;
  
  private String  segment;

  
  
  
  public String getSegment() {
    return segment;
  }

  public void setSegment(String segment) {
    this.segment = segment;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public Dimension getDimension() {
    return dimension;
  }

  public void setDimension(Dimension dimension) {
    this.dimension = dimension;
  }

  public String getColumn() {
    return column;
  }

  public void setColumn(String column) {
    this.column = column;
  }



}
