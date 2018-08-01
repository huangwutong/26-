package com.xh369.dto;

import java.io.*;
import java.util.*;

public class ProductSmallClass implements Serializable{

    private Integer id;
    private String smallclassname;
    private ProductBigClass productbigclass;
    private Set product = new HashSet();

    public ProductSmallClass(){
    }

    public Integer getId() {
        return id;
    }

    public String getSmallclassname() {
        return smallclassname;
    }

    public ProductBigClass getProductbigclass() {
        return productbigclass;
    }

    public Set getProduct() {
        return product;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSmallclassname(String smallclassname) {
        this.smallclassname = smallclassname;
    }

    public void setProductbigclass(ProductBigClass productbigclass) {
        this.productbigclass = productbigclass;
    }

    public void setProduct(Set product) {
        this.product = product;
    }
}
