package com.xh369.dto;

public class Product implements java.io.Serializable{

    private Integer id;
    private String productname;
    private ProductBigClass productBigClass;
    private ProductSmallClass productSmallClass;
    private String productpic;
    private String producefactory;
    private String productmodel;
    private int marketprice;
    private int preferentialprice;
    private String vouch;
    private String newproduct;
    private String introduct;

    public ProductBigClass getProductBigClass() {
        return productBigClass;
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

    public ProductSmallClass getProductSmallClass() {
        return productSmallClass;
    }

    public String getVouch() {
        return vouch;
    }

    public void setProductBigClass(ProductBigClass productBigClass) {
        this.productBigClass = productBigClass;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct;
    }

    public void setMarketprice(int marketprice) {
        this.marketprice = marketprice;
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

    public void setProductSmallClass(ProductSmallClass productSmallClass) {
        this.productSmallClass = productSmallClass;
    }

    public void setVouch(String vouch) {
        this.vouch = vouch;
    }
}
