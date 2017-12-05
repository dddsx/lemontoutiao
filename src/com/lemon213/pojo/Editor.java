package com.lemon213.pojo;

import java.io.Serializable;
import java.util.Date;

public class Editor implements Serializable{
    private Integer id;

    private String realName;

    private String idcard;

    private String phone;

    private String workspace;

    private Integer pubNum;

    private Date gmtCreate;

    private Date gmtModified;

    public Editor() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPubNum() {
        return pubNum;
    }

    public void setPubNum(Integer pubNum) {
        this.pubNum = pubNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getWorkspace() {
        return workspace;
    }

    public void setWorkspace(String workspace) {
        this.workspace = workspace;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return "Editor{" +
                "id=" + id +
                ", realName='" + realName + '\'' +
                ", idcard='" + idcard + '\'' +
                ", phone='" + phone + '\'' +
                ", workspace='" + workspace + '\'' +
                ", pubNum=" + pubNum +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}