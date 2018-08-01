package com.xh369.dto;

import javax.servlet.http.*;
import org.apache.struts.action.*;

public class Product_ActionForm extends ActionForm{

    private Integer id;
    private String productname;
    private int bigclassid;
    private int smallclassid;
    private String productpic;
    private String producefactory;
    private String productmodel;
    private int marketprice;
    private int preferentialprice;
    private String vouch;
    private String newproduct;
    private String introduct;

    public int getBigclassid() {
        return bigclassid;
    }

    public Integer getId() {
        return id;
    }

    public String getIntroduct() {
        return introduct;
    }

    public int getMarketprice() {
        return marketprice;
    }

    public String getNewproduct() {
        return newproduct;
    }

    public int getPreferentialprice() {
        return preferentialprice;
    }

    public String getProducefactory() {
        return producefactory;
    }

    public String getProductmodel() {
        return productmodel;
    }

    public String getProductname() {
        return productname;
    }

    public String getProductpic() {
        return productpic;
    }

    public int getSmallclassid() {
        return smallclassid;
    }

    public String getVouch() {
        return vouch;
    }

    public void setBigclassid(int bigclassid) {
        this.bigclassid = bigclassid;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setMarketprice(int marketprice) {
        this.marketprice = marketprice;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct;
    }

    public void setNewproduct(String newproduct) {
        this.newproduct = newproduct;
    }

    public void setPreferentialprice(int preferentialprice) {
        this.preferentialprice = preferentialprice;
    }

    public void setProducefactory(String producefactory) {
        this.producefactory = producefactory;
    }

    public void setProductmodel(String productmodel) {
        this.productmodel = productmodel;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public void setProductpic(String productpic) {
        this.productpic = productpic;
    }

    public void setSmallclassid(int smallclassid) {
        this.smallclassid = smallclassid;
    }

    public void setVouch(String vouch) {
        this.vouch = vouch;
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request){
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request){
    }
}
