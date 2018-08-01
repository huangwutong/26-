package com.xh369.dto;

import java.util.*;

public class BigClass implements java.io.Serializable{

    private Integer id;
    private String bigclassname;
    private Set article = new HashSet();
    private Set smallclass = new HashSet();

    public BigClass(){
    }

    public String getBigclassname() {
        return bigclassname;
    }

    public Integer getId() {
        return id;
    }

    public Set getSmallclass() {
        return smallclass;
    }

    public Set getArticle() {
        return article;
    }

    public void setBigclassname(String bigclassname) {
        this.bigclassname = bigclassname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSmallclass(Set smallclass) {
        this.smallclass = smallclass;
    }

    public void setArticle(Set article) {
        this.article = article;
    }
}
