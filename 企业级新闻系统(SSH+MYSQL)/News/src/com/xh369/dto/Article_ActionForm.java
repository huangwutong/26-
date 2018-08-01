package com.xh369.dto;

import java.sql.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public class Article_ActionForm extends ActionForm {

    private Integer id;
    private int bigclassid;
    private String content;
    private Integer smallclassid;
    private String title;
    private Timestamp deploytime;
    private String picpath;

    public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }

    public int getBigclassid() {
        return bigclassid;
    }

    public void setBigclassid(int bigclassid) {
        this.bigclassid = bigclassid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSmallclassid(Integer smallclassid) {
        this.smallclassid = smallclassid;
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

    public Integer getSmallclassid() {
        return smallclassid;
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

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request) {
    }
}
