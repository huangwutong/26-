package com.xh369.dto;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import javax.servlet.http.HttpServletRequest;

public class Admin_ActionForm extends ActionForm {

    private Integer id;
    private String[] level = {};
    private String pwd;
    private String username;
    private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setLevel(String[] level) {
        this.level = level;
    }

    public String[] getLevel() {
        return level;
    }

    public String getPwd() {
        return pwd;
    }

    public String getUsername() {
        return username;
    }

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request){
        return null;
    }

    public void reset(ActionMapping mapping, HttpServletRequest request){
    }
}
