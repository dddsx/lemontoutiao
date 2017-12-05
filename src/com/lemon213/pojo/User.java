package com.lemon213.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    private Integer id;

    @NotNull
    @Size(min = 5, max = 20)
    private String username;

    @NotNull
    @Size(min = 6, max = 16)
    private String password;

    private String nickname;

    private Integer picture;

    private String introduce;

    private String gender;

    private Integer editorId;

    private Date birthday;

    private String job;

    private String location;

    private String email;

    private Boolean isEditor;

    private Boolean isAuthori;

    private Integer money;

    private Integer commentNum;

    private Date gmtCreate;

    private Date gmtModified;

    //网页展示所需的额外属性
    private String showName;

    private String picName;

    //外键属性
    private Editor editor;

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getPicture() {
        return picture;
    }

    public void setPicture(Integer picture) {
        this.picture = picture;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Boolean getIsEditor() {
        return isEditor;
    }

    public void setIsEditor(Boolean isEditor) {
        this.isEditor = isEditor;
    }

    public Boolean getIsAuthori() {
        return isAuthori;
    }

    public void setIsAuthori(Boolean isAuthori) {
        this.isAuthori = isAuthori;
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public Boolean getAuthori() {
        return isAuthori;
    }

    public void setAuthori(Boolean authori) {
        isAuthori = authori;
    }

    public String getShowName() {
        return showName;
    }

    public void setShowName(){
        if(nickname.length() > 8) {
            showName = nickname.substring(0, 8) +"...";
        } else{
            showName = nickname;
        }
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Editor getEditor() {return editor;}

    public void setEditor(Editor editor) {
        this.editor = editor;
    }

    public Integer getEditorId() {
        return editorId;
    }

    public void setEditorId(Integer editorId) {
        this.editorId = editorId;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", picture=" + picture +
                ", introduce='" + introduce + '\'' +
                ", gender='" + gender + '\'' +
                ", editorId=" + editorId +
                ", birthday=" + birthday +
                ", job='" + job + '\'' +
                ", location='" + location + '\'' +
                ", email='" + email + '\'' +
                ", isEditor=" + isEditor +
                ", isAuthori=" + isAuthori +
                ", money=" + money +
                ", commentNum=" + commentNum +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", showName='" + showName + '\'' +
                ", picName='" + picName + '\'' +
                '}';
    }
}