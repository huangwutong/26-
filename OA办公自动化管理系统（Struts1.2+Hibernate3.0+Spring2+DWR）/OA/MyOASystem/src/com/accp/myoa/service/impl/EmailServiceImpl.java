
package com.accp.myoa.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.accp.myoa.dao.EmailDao;
import com.accp.myoa.entity.Dept;
import com.accp.myoa.entity.Email;
import com.accp.myoa.entity.EmailReceivce;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.EmailService;

public class EmailServiceImpl implements EmailService {
	private EmailDao emailDao;
	private int pageSize;
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setEmailDao(EmailDao emailDao) {
		this.emailDao = emailDao;
		
	}

	@Override
	public List<EmailReceivce> getEmailByUser(int id,
			int page) {
		int firstResult=0;
		if(page>1){
			firstResult=pageSize*(page-1);
		}
		return 	emailDao.getEmailByUser(id, firstResult, pageSize);
	}

	@Override
	public int getCount(int id) {
		return emailDao.getCount(id);
		
	}

	public List<Integer> getCountAndMaxPage(int id){
		int count=this.getCount(id);
		int maxPage = 0;
		if(count==0){
			 
		}
		if(count % pageSize == 0) {
			maxPage =  count / pageSize;
		} else {
			maxPage = count / pageSize + 1;
		}
		List<Integer> list=new ArrayList<Integer>();
		if(count==0){
			list.add(0);
			list.add(1);
		}else{
			list.add(count);
			list.add(maxPage);
		}
		
		return list;
	}

	@Override
	public int getCountUnRead(int id) {
		
		return emailDao.getCountUnRead(id);
	}

	@Override
	public String getLastWeekFirstDay() {

		Calendar c = Calendar.getInstance(); 
		 
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
		
		String sunday=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		String str=	null;
		if(today.equals(sunday)){
			Calendar ca = Calendar.getInstance(); 
			ca.add(Calendar.WEEK_OF_YEAR, -2);
			ca.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
			
			str= new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			
		}else{
			Calendar cal = Calendar.getInstance(); 
			cal.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY); 
			cal.add(Calendar.WEEK_OF_YEAR, -1);
			str=	 new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			
		}
		return str;
	}

	@Override
	public String getWeekFirstDay() {

		
		Calendar c = Calendar.getInstance(); 
		 
		
		String today=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
		
		String sunday=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		String str=	null;
		if(today.equals(sunday)){
			Calendar ca = Calendar.getInstance(); 
			ca.add(Calendar.WEEK_OF_YEAR, -1);
			ca.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
			
			str= new SimpleDateFormat("yyyy-MM-dd").format(ca.getTime());
			
		}else{
			Calendar cal = Calendar.getInstance(); 
			cal.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY); 
			str=	 new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		}
		return str;
	}

	@Override
	public boolean emailFalseDelete(String[] str) {
		return emailDao.emailFalseDelete(str);
	}

	@Override
	public boolean emailTrueDelete(String[] str) {
		return emailDao.emailTrueDelete(str);
		
	}

	@Override
	public List<EmailReceivce> getDeleteEmailByUser(int id, int page) {
		int firstResult=0;
		if(page>1){
			firstResult=pageSize*(page-1);
		}
		return 	emailDao.getDeleteEmailByUser(id, firstResult, pageSize);
	}

	@Override
	public List<Integer> getDeleteEmailCountAndMaxPage(int id) {
		int count=this.getDeleteEmailCount(id);
		int maxPage = 0;
		if(count==0){
			 
		}
		if(count % pageSize == 0) {
			maxPage =  count / pageSize;
		} else {
			maxPage = count / pageSize + 1;
		}
		List<Integer> list=new ArrayList<Integer>();
		if(count==0){
			list.add(0);
			list.add(1);
		}else{
			list.add(count);
			list.add(maxPage);
		}
		
		return list;
	}

	@Override
	public int getDeleteEmailCount(int id) {
		return emailDao.getDeleteEmailCount(id);
	}

	@Override
	public Email getEmailById(int id) {
		return  emailDao.getEmailById(id);
		
	}

	@Override
	public List<String> getSendEmailUserByEmailId(int id,int uid) {
		return emailDao.getSendEmailUserByEmailId(id,uid);
	}

	@Override
	public List<Dept> getDept() {
		
		return emailDao.getDept();
	}

	@Override
	public List<User> getUserByDeptId(int id) {
	return	emailDao.getUserByDeptId(id);
	}

	@Override
	public boolean addEmail(Email email, String str) {
		return emailDao.addEmail(email, str);
	}

	/***
	 * 改变邮件的浏览状态
	 */
	@Override
	public void changeEmailReceivceState(User user, int emailId) {
		emailDao.changeEmailReceivceState(user, emailId);
		
	}


	@Override
	public void update(Email email) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void add(Email email) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void del(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Email load(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}

