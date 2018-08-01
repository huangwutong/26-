package com.xh369.dto;

public class ProductsviewsId implements java.io.Serializable{

    private Integer id;
    private String productname;
    private String bigclassname;
    private String smallclassname;
    private String productmodel;
    private Integer marketprice;
    private Integer preferentialprice;
    private String vouch;
    private String newproduct;
    private String introduct;

    public ProductsviewsId(){
    }

    public ProductsviewsId(Integer id, String productname, String bigclassname, String smallclassname, String productmodel, Integer marketprice, Integer preferentialprice, String vouch, String newproduct, String introduct){
        this.id = id;
        this.productname = productname;
        this.bigclassname = bigclassname;
        this.smallclassname = smallclassname;
        this.productmodel = productmodel;
        this.marketprice = marketprice;
        this.preferentialprice = preferentialprice;
        this.vouch = vouch;
        this.newproduct = newproduct;
        this.introduct = introduct;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductname() {
        return this.productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getBigclassname() {
        return this.bigclassname;
    }

    public void setBigclassname(String bigclassname) {
        this.bigclassname = bigclassname;
    }

    public String getSmallclassname() {
        return this.smallclassname;
    }

    public void setSmallclassname(String smallclassname) {
        this.smallclassname = smallclassname;
    }

    public String getProductmodel() {
        return this.productmodel;
    }

    public void setProductmodel(String productmodel) {
        this.productmodel = productmodel;
    }

    public Integer getMarketprice() {
        return this.marketprice;
    }

    public void setMarketprice(Integer marketprice) {
        this.marketprice = marketprice;
    }

    public Integer getPreferentialprice() {
        return this.preferentialprice;
    }

    public void setPreferentialprice(Integer preferentialprice) {
        this.preferentialprice = preferentialprice;
    }

    public String getVouch() {
        return this.vouch;
    }

    public void setVouch(String vouch) {
        this.vouch = vouch;
    }

    public String getNewproduct() {
        return this.newproduct;
    }

    public void setNewproduct(String newproduct) {
        this.newproduct = newproduct;
    }

    public String getIntroduct() {
        return this.introduct;
    }

    public void setIntroduct(String introduct) {
        this.introduct = introduct;
    }

    public boolean equals(Object other){

         if ( (this == other ) ) return true;
         if ( (other == null ) ) return false;
         if ( !(other instanceof ProductsviewsId) ) return false;
         ProductsviewsId castOther = ( ProductsviewsId ) other;
         return ( (this.getId()==castOther.getId()) || ( this.getId()!=null && castOther.getId()!=null && this.getId().equals(castOther.getId()) ) )
         && ( (this.getProductname()==castOther.getProductname()) || ( this.getProductname()!=null
         && castOther.getProductname()!=null && this.getProductname().equals(castOther.getProductname()) ) )
         && ( (this.getBigclassname()==castOther.getBigclassname()) || ( this.getBigclassname()!=null
         && castOther.getBigclassname()!=null && this.getBigclassname().equals(castOther.getBigclassname()) ) )
         && ( (this.getSmallclassname()==castOther.getSmallclassname()) || ( this.getSmallclassname()!=null
         && castOther.getSmallclassname()!=null && this.getSmallclassname().equals(castOther.getSmallclassname()) ) )
         && ( (this.getProductmodel()==castOther.getProductmodel()) || ( this.getProductmodel()!=null
         && castOther.getProductmodel()!=null && this.getProductmodel().equals(castOther.getProductmodel()) ) )
         && ( (this.getMarketprice()==castOther.getMarketprice()) || ( this.getMarketprice()!=null
         && castOther.getMarketprice()!=null && this.getMarketprice().equals(castOther.getMarketprice()) ) )
         && ( (this.getPreferentialprice()==castOther.getPreferentialprice()) || ( this.getPreferentialprice()!=null
         && castOther.getPreferentialprice()!=null && this.getPreferentialprice().equals(castOther.getPreferentialprice()) ) )
         && ( (this.getVouch()==castOther.getVouch()) || ( this.getVouch()!=null && castOther.getVouch()!=null
         && this.getVouch().equals(castOther.getVouch()) ) )
         && ( (this.getNewproduct()==castOther.getNewproduct()) || ( this.getNewproduct()!=null
         && castOther.getNewproduct()!=null && this.getNewproduct().equals(castOther.getNewproduct()) ) )
         && ( (this.getIntroduct()==castOther.getIntroduct()) || ( this.getIntroduct()!=null
         && castOther.getIntroduct()!=null && this.getIntroduct().equals(castOther.getIntroduct()) ) );
   }

   public int hashCode(){

         int result = 17;
         result = 37 * result + ( getId() == null ? 0 : this.getId().hashCode() );
         result = 37 * result + ( getProductname() == null ? 0 : this.getProductname().hashCode() );
         result = 37 * result + ( getBigclassname() == null ? 0 : this.getBigclassname().hashCode() );
         result = 37 * result + ( getSmallclassname() == null ? 0 : this.getSmallclassname().hashCode() );
         result = 37 * result + ( getProductmodel() == null ? 0 : this.getProductmodel().hashCode() );
         result = 37 * result + ( getMarketprice() == null ? 0 : this.getMarketprice().hashCode() );
         result = 37 * result + ( getPreferentialprice() == null ? 0 : this.getPreferentialprice().hashCode() );
         result = 37 * result + ( getVouch() == null ? 0 : this.getVouch().hashCode() );
         result = 37 * result + ( getNewproduct() == null ? 0 : this.getNewproduct().hashCode() );
         result = 37 * result + ( getIntroduct() == null ? 0 : this.getIntroduct().hashCode() );
         return result;
   }
}
