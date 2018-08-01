package com.xdf.exams.dao;

import java.io.Serializable;

public interface IDAO {
	public void add(Object pojo);
	public void update(Object pojo);	
	public void delete(Object pojo);	
	public Object load(Class cls,Serializable id);
}
