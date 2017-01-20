package net.iotek.entity;

import java.sql.Timestamp;

public class Storage {

  private Integer id;
  private Integer goodId;
  private Integer goodnum;
  private Long userId;
  private Timestamp createtime;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getGoodId() {
    return goodId;
  }

  public void setGoodId(Integer goodId) {
    this.goodId = goodId;
  }

  public Integer getGoodnum() {
    return goodnum;
  }

  public void setGoodnum(Integer goodnum) {
    this.goodnum = goodnum;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }
}
