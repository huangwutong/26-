package com.xh369.dto;

public class Admin implements java.io.Serializable{

    private Integer id;
    private String level;
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

    public String getPwd() {
        return pwd;
    }

    public String getLevel() {
        return level;
    }

    public String getUsername() {
        return username;
    }

    private void setId(Integer id) {
        this.id = id;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
