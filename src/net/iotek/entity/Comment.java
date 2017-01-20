package net.iotek.entity;

import java.sql.Timestamp;

public class Comment {

  private Long id;
  private Long userid;
  private Long goodid;
  private String content;
  private Timestamp createtime;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getUserid() {
    return userid;
  }

  public void setUserid(Long userid) {
    this.userid = userid;
  }

  public Long getGoodid() {
    return goodid;
  }

  public void setGoodid(Long goodid) {
    this.goodid = goodid;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }
}
