package com.fh.shop.backend.po.log;

import com.fh.shop.backend.po.Page;
import org.springframework.format.annotation.DateTimeFormat;


import java.io.Serializable;
import java.util.Date;

public class Log extends Page implements Serializable {
    private static final long serialVersionUID = 2332900587815556337L;
    private Integer id;
    private String userName;
    private String info;
    private String content;
    private Integer status;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private Integer useTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date minCreateTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date maxCreateTime;
    private Integer minUserTime;
    private Integer maxUserTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUseTime() {
        return useTime;
    }

    public void setUseTime(Integer useTime) {
        this.useTime = useTime;
    }

    public Date getMinCreateTime() {
        return minCreateTime;
    }

    public void setMinCreateTime(Date minCreateTime) {
        this.minCreateTime = minCreateTime;
    }

    public Date getMaxCreateTime() {
        return maxCreateTime;
    }

    public void setMaxCreateTime(Date maxCreateTime) {
        this.maxCreateTime = maxCreateTime;
    }

    public Integer getMinUserTime() {
        return minUserTime;
    }

    public void setMinUserTime(Integer minUserTime) {
        this.minUserTime = minUserTime;
    }

    public Integer getMaxUserTime() {
        return maxUserTime;
    }

    public void setMaxUserTime(Integer maxUserTime) {
        this.maxUserTime = maxUserTime;
    }
}
