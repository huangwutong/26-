package com.xdf.exams.bean;

import java.util.HashSet;
import java.util.Set;


/**
 * Subject generated by MyEclipse - Hibernate Tools
 */

public class Subject  implements java.io.Serializable {


    // Fields    

     private Long subjectid;
     private String name;
     private Long time;
     private int state;
     private String intro;
     private String sdate;
     private Set results = new HashSet(0);
     private Set questions = new HashSet(0);
     private Integer totalnum = 0;
     private Integer totalscore = 0;


    // Constructors

    public Integer getTotalnum() {
		return totalnum;
	}

	public void setTotalnum(Integer totalnum) {
		this.totalnum = totalnum;
	}

	public Integer getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(Integer totalscore) {
		this.totalscore = totalscore;
	}

	/** default constructor */
    public Subject() {
    }

	/** minimal constructor */
    public Subject(String name, Long time, int state, String intro, String sdate) {
        this.name = name;
        this.time = time;
        this.state = state;
        this.intro = intro;
        this.sdate = sdate;
    }
    
    /** full constructor */
    public Subject(String name, Long time, int state, String intro, String sdate, Set results, Set questions) {
        this.name = name;
        this.time = time;
        this.state = state;
        this.intro = intro;
        this.sdate = sdate;
        this.results = results;
        this.questions = questions;
    }

   
    // Property accessors

    public Long getSubjectid() {
        return this.subjectid;
    }
    
    public void setSubjectid(Long subjectid) {
        this.subjectid = subjectid;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Long getTime() {
        return this.time;
    }
    
    public void setTime(Long time) {
        this.time = time;
    }

    public int getState() {
        return this.state;
    }
    
    public void setState(int state) {
        this.state = state;
    }

    public String getIntro() {
        return this.intro;
    }
    
    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getSdate() {
        return this.sdate;
    }
    
    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public Set getResults() {
        return this.results;
    }
    
    public void setResults(Set results) {
        this.results = results;
    }

    public Set getQuestions() {
        return this.questions;
    }
    
    public void setQuestions(Set questions) {
        this.questions = questions;
    }
   








}