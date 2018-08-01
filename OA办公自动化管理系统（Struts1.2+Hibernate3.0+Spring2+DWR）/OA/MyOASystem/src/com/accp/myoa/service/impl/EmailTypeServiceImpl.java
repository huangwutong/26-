
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.EmailTypeDao;
import com.accp.myoa.entity.EmailType;
import com.accp.myoa.service.EmailTypeService;

public class EmailTypeServiceImpl implements EmailTypeService {
	private EmailTypeDao emailTypeDao;
	
	
	
	public void setEmailTypeDao(EmailTypeDao emailTypeDao) {
		this.emailTypeDao = emailTypeDao;
	}

	public void add(EmailType emailType) {
		emailTypeDao.add(emailType);

	}

	public void del(int id) {
		emailTypeDao.del(id);

	}

	public EmailType load(int id) {
		return emailTypeDao.load(id);
	}

	public List<EmailType> loadList(EmailType emailType) {
		return emailTypeDao.loadList(emailType);
	}

	public void update(EmailType emailType) {
		emailTypeDao.update(emailType);

	}

}

