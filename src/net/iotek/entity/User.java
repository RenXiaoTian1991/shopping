package net.iotek.entity;

import java.sql.Timestamp;

public class User{

  private Long id;
  private String name;
  private String password;
  private Long age;
  private String logo;
  private String phone;
  private String address;
  private Double money;
  private Long role;
  private Timestamp createtime;

  public Long getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getPassword() {
    return password;
  }

  public Long getAge() {
    return age;
  }

  public String getLogo() {
    return logo;
  }

  public String getPhone() {
    return phone;
  }

  public String getAddress() {
    return address;
  }

  public Double getMoney() {
    return money;
  }

  public Long getRole() {
    return role;
  }

  public Timestamp getCreatetime() {
    return createtime;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public void setAge(Long age) {
    this.age = age;
  }

  public void setLogo(String logo) {
    this.logo = logo;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public void setMoney(Double money) {
    this.money = money;
  }

  public void setRole(Long role) {
    this.role = role;
  }

  public void setCreatetime(Timestamp createtime) {
    this.createtime = createtime;
  }

}
