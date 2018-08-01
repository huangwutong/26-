package com.xh369.dto;

import java.util.*;

public class SmallClass implements java.io.Serializable{

    private Integer id;
    private String smallclassname;
    private BigClass bigclass;
    private Set article = new HashSet();

    public SmallClass(){
    }

    public BigClass getBigclass() {
        return bigclass;
    }

    public Integer getId() {
        return id;
    }

    public String getSmallclassname() {
        return smallclassname;
    }

    public Set getArticle() {
        return article;
    }

    public void setBigclass(BigClass bigclass) {
        this.bigclass = bigclass;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSmallclassname(String smallclassname) {
        this.smallclassname = smallclassname;
    }

    public void setArticle(Set article) {
        this.article = article;
    }
}
