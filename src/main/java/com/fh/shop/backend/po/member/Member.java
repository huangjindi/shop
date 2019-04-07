package com.fh.shop.backend.po.member;

import com.fh.shop.backend.po.Page;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Member extends Page implements Serializable {
    private static final long serialVersionUID = -3467111090071390443L;
    private int id;
    //会员名
    private String userName;
    //会员密码
    private String password;
    //手机号
    private String phone;
    //邮件
    private String email;
    //生日
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    //注册时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regTime;
    //上次登录时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastLoginTime;
    //省
    private int shengid;
    //市
    private int shiid;
    //县
    private int xianid;

    private String shengName;
    private String shiName;
    private String xianName;
    private String areaName;
    private String areaIds;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minBirthday;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxBirthday;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getShengName() {
        return shengName;
    }

    public void setShengName(String shengName) {
        this.shengName = shengName;
    }

    public String getShiName() {
        return shiName;
    }

    public void setShiName(String shiName) {
        this.shiName = shiName;
    }

    public String getXianName() {
        return xianName;
    }

    public void setXianName(String xianName) {
        this.xianName = xianName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getShengid() {
        return shengid;
    }

    public void setShengid(int shengid) {
        this.shengid = shengid;
    }

    public int getShiid() {
        return shiid;
    }

    public void setShiid(int shiid) {
        this.shiid = shiid;
    }

    public int getXianid() {
        return xianid;
    }

    public void setXianid(int xianid) {
        this.xianid = xianid;
    }

    public String getAreaIds() {
        return areaIds;
    }

    public void setAreaIds(String areaIds) {
        this.areaIds = areaIds;
    }

    public Date getMinBirthday() {
        return minBirthday;
    }

    public void setMinBirthday(Date minBirthday) {
        this.minBirthday = minBirthday;
    }

    public Date getMaxBirthday() {
        return maxBirthday;
    }

    public void setMaxBirthday(Date maxBirthday) {
        this.maxBirthday = maxBirthday;
    }
}
