package com.xh369.dto;

import java.sql.*;

public class Article implements java.io.Serializable{

    private Integer id;
    private BigClass bigclass;
    private String content;
    private SmallClass smallclass;
    private String title;
    private Timestamp deploytime;
    private String picpath;

    public Article() {
    }

    public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }

    public BigClass getBigclass() {
        return bigclass;
    }

    public void setBigclass(BigClass bigclass) {
        this.bigclass = bigclass;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSmallclass(SmallClass smallclass) {
        this.smallclass = smallclass;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDeploytime(Timestamp deploytime) {
        this.deploytime = deploytime;
    }

    public void setPicpath(String picpath) {
        this.picpath = picpath;
    }

    public String getContent() {
        return content;
    }

    public SmallClass getSmallclass() {
        return smallclass;
    }

    public String getTitle() {
        return title;
    }

    public Timestamp getDeploytime() {
        return deploytime;
    }

    public String getPicpath() {
        return picpath;
    }
}
