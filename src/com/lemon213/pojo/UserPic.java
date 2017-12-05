package com.lemon213.pojo;

import java.io.Serializable;

public class UserPic implements Serializable{
    private Integer id;

    private String filename;

    public UserPic(Integer id, String path) {
        this.id = id;
        this.filename = path;
    }

    public UserPic() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }
}