
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.Dept;
import com.accp.myoa.entity.Email;
import com.accp.myoa.entity.EmailReceivce;
import com.accp.myoa.entity.User;

public interface EmailService {
	public void add(Email email);
	public void del(int id);
	public void update(Email email);
	public Email load(int id);
	public List<EmailReceivce> getEmailByUser(int id,int page);
	public int getCount(int id);
	public List<Integer> getCountAndMaxPage(int id);
	public int getCountUnRead(int id);
	public String getWeekFirstDay();
	public String getLastWeekFirstDay();
	public boolean emailFalseDelete(String[] str);
	public boolean emailTrueDelete(String[] str);
	public List<EmailReceivce> getDeleteEmailByUser(int id, int page);
	public List<Integer> getDeleteEmailCountAndMaxPage(int id);
	public int getDeleteEmailCount(int id);
	public Email getEmailById(int id);
	public List<String> getSendEmailUserByEmailId(int id,int uid);
	public List<Dept> getDept();
	public List<User> getUserByDeptId(int id);
	public boolean addEmail(Email email,String str);
	public void changeEmailReceivceState(User user,int emailId);
}



