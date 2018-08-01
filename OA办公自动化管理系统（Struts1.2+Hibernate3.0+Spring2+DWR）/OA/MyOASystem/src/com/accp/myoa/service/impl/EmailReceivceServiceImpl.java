
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.EmailReceivceDao;
import com.accp.myoa.entity.EmailReceivce;
import com.accp.myoa.service.EmailReceivceService;

public class EmailReceivceServiceImpl implements EmailReceivceService {
	private EmailReceivceDao emailReceivceDao;
	
	
	
	public void setEmailReceivceDao(EmailReceivceDao emailReceivceDao) {
		this.emailReceivceDao = emailReceivceDao;
	}

	public void add(EmailReceivce emailReceivce) {
		emailReceivceDao.add(emailReceivce);

	}

	public void del(int id) {
		emailReceivceDao.del(id);

	}

	public EmailReceivce load(int id) {
		return emailReceivceDao.load(id);
	}

	public List<EmailReceivce> loadList(EmailReceivce emailReceivce) {
		return emailReceivceDao.loadList(emailReceivce);
	}

	public void update(EmailReceivce emailReceivce) {
		emailReceivceDao.update(emailReceivce);

	}

}

