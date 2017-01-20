package net.iotek.entity;

import java.sql.Timestamp;

public class Orders {

  private String id;
  private String ordersn;
  private Double amount;
  private Timestamp createtime;
  private Timestamp paytime;
  private Integer orderstatus;
  private String postscript;
  private Integer goodId;
  private String goodName;
  private Integer goodnum;
  private Double price;
  private Integer goodstatus;
  private Timestamp receivetime;
  private Long userId;
  private String username;
  private String phone;
  private String address;


  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }

  public String getOrdersn() {
    return ordersn;
  }
  public void setOrdersn(String ordersn) {
    this.ordersn = ordersn;
  }

  public Double getAmount() {
    return amount;
  }
  public void setAmount(Double amount) {
    this.amount = amount;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }
  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }

  public Timestamp getPaytime() {
    return paytime;
  }
  public void setPaytime(Timestamp paytime) {
    this.paytime = paytime;
  }

  public Integer getOrderstatus() {
    return orderstatus;
  }
  public void setOrderstatus(Integer orderstatus) {
    this.orderstatus = orderstatus;
  }

  public String getPostscript() {
    return postscript;
  }
  public void setPostscript(String postscript) {
    this.postscript = postscript;
  }

  public Integer getGoodId() {
    return goodId;
  }
  public void setGoodId(Integer goodId) {
    this.goodId = goodId;
  }

  public String getGoodName() {
    return goodName;
  }
  public void setGoodName(String goodName) {
    this.goodName = goodName;
  }

  public Integer getGoodnum() {
    return goodnum;
  }
  public void setGoodnum(Integer goodnum) {
    this.goodnum = goodnum;
  }

  public Double getPrice() {
    return price;
  }
  public void setPrice(Double price) {
    this.price = price;
  }

  public Integer getGoodstatus() {
    return goodstatus;
  }
  public void setGoodstatus(Integer goodstatus) {
    this.goodstatus = goodstatus;
  }

  public Timestamp getReceivetime() {
    return receivetime;
  }
  public void setReceivetime(Timestamp receivetime) {
    this.receivetime = receivetime;
  }

  public Long getUserId() {
    return userId;
  }
  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }

  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }

}
