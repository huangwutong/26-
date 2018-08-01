package com.java;

import java.util.HashSet;
import java.util.Set;

/**
 * Xxuser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Xxuser implements java.io.Serializable {

	// Fields

	private Long id;
	private String name;
	private Long password;
	private String des;
	private String stats;
	
	private Set URs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Xxuser() {
	}

	/** full constructor */
	public Xxuser(String name, Long password, String des,String stats, Set URs) {
		this.name = name;
		this.password = password;
		this.des = des;
		this.stats = stats;
		this.URs = URs;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPassword() {
		return this.password;
	}

	public void setPassword(Long password) {
		this.password = password;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set getURs() {
		return this.URs;
	}

	public void setURs(Set URs) {
		this.URs = URs;
	}

	public String getStats() {
		return stats;
	}

	public void setStats(String stats) {
		this.stats = stats;
	}
	

}