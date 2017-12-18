package com.lemon213.pojo;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable{
    private Integer id;

    private String headline;

    private Integer userId;

    private String picture;

    private Integer categoryId;

    private Integer commentNum;

    private Boolean isHot;

    private Boolean isRecom;

    private Boolean isCheck;

    private Integer clickNum;

    private Integer praiseNum;

    private Date gmtCreate;

    private Date gmtModified;

    //外键
    private String content;

    private User user;

    //页面展示用
    private String showTime;

    private String category;

    public Article() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline == null ? null : headline.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
    }

    public Boolean getIsRecom() {
        return isRecom;
    }

    public void setIsRecom(Boolean isRecom) {
        this.isRecom = isRecom;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public Integer getPraiseNum() {
        return praiseNum;
    }

    public void setPraiseNum(Integer praiseNum) {
        this.praiseNum = praiseNum;
    }

    public Boolean getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(Boolean isCheck) {
        this.isCheck = isCheck;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getShowTime() {
        return showTime;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", headline='" + headline + '\'' +
                ", userId=" + userId +
                ", picture='" + picture + '\'' +
                ", categoryId=" + categoryId +
                ", commentNum=" + commentNum +
                ", isHot=" + isHot +
                ", isRecom=" + isRecom +
                ", isCheck=" + isCheck +
                ", clickNum=" + clickNum +
                ", praiseNum=" + praiseNum +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", content='" + content + '\'' +
                ", user=" + user +
                ", showTime='" + showTime + '\'' +
                '}';
    }
}