package com.xdf.exams.bean;



/**
 * Teacher generated by MyEclipse - Hibernate Tools
 */

public class Teacher  implements java.io.Serializable {


    // Fields    

     private Long teacherid;
     private String username;
     private String password;


    // Constructors

    /** default constructor */
    public Teacher() {
    }

    
    /** full constructor */
    public Teacher(String username, String password) {
        this.username = username;
        this.password = password;
    }

   
    // Property accessors

    public Long getTeacherid() {
        return this.teacherid;
    }
    
    public void setTeacherid(Long teacherid) {
        this.teacherid = teacherid;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
   








}