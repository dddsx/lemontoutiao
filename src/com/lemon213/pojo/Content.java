package com.lemon213.pojo;

import java.io.Serializable;

public class Content implements Serializable{
    private Integer id;

    private String content;

    public Content() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Content{" +
                "id=" + id +
                ", content='" + content + '\'' +
                '}';
    }
}