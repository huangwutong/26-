package com.xh369.dto;

import java.io.*;
import java.util.*;

public class ProductBigClass implements Serializable{

    private Integer id;
    private String bigclassname;
    private Set product = new HashSet();
    private Set productsmallclass = new HashSet();

    public String getBigclassname() {
        return bigclassname;
    }

    public Integer getId() {
        return id;
    }

    public Set getProductsmallclass() {
        return productsmallclass;
    }

    public Set getProduct() {
        return product;
    }

    public void setBigclassname(String bigclassname) {
        this.bigclassname = bigclassname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setProductsmallclass(Set productsmallclass) {
        this.productsmallclass = productsmallclass;
    }

    public void setProduct(Set product) {
        this.product = product;
    }
}
