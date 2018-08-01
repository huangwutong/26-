package com.xh369.dto;

import java.sql.Timestamp;

public class ArticlesviewsId implements java.io.Serializable{

     private Integer id;
     private String title;
     private String bigclassname;
     private String smallclassname;
     private Timestamp deploytime;

     public ArticlesviewsId() {
     }

     public ArticlesviewsId(Integer id, String title, String bigclassname, String smallclassname){

        this.id = id;
        this.title = title;
        this.bigclassname = bigclassname;
        this.smallclassname = smallclassname;
     }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public void setDeploytime(Timestamp deploytime) {
        this.deploytime = deploytime;
    }

    public Timestamp getDeploytime() {
        return deploytime;
    }


    public boolean equals(Object other){

         if ( (this == other ) ) return true;
                 if ( (other == null ) ) return false;
                 if ( !(other instanceof ArticlesviewsId) ) return false;
                 ArticlesviewsId castOther = ( ArticlesviewsId ) other;
                 return ( (this.getId()==castOther.getId()) || ( this.getId()!=null && castOther.getId()!=null && this.getId().equals(castOther.getId()) ) )
                         && ( (this.getTitle()==castOther.getTitle()) || ( this.getTitle()!=null && castOther.getTitle()!=null && this.getTitle().equals(castOther.getTitle()) ) )
                         && ( (this.getBigclassname()==castOther.getBigclassname()) || ( this.getBigclassname()!=null && castOther.getBigclassname()!=null && this.getBigclassname().equals(castOther.getBigclassname()) ) )
                         && ( (this.getSmallclassname()==castOther.getSmallclassname()) || ( this.getSmallclassname()!=null && castOther.getSmallclassname()!=null && this.getSmallclassname().equals(castOther.getSmallclassname()) ) );
    }

    public int hashCode(){

         int result = 17;
         result = 37 * result + ( getId() == null ? 0 : this.getId().hashCode() );
         result = 37 * result + ( getTitle() == null ? 0 : this.getTitle().hashCode() );
         result = 37 * result + ( getBigclassname() == null ? 0 : this.getBigclassname().hashCode() );
         result = 37 * result + ( getSmallclassname() == null ? 0 : this.getSmallclassname().hashCode() );
         return result;
    }
}
