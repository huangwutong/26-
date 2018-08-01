
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.EmailType;

public interface EmailTypeService {
	public void add(EmailType emailType);
	public void del(int id);
	public void update(EmailType emailType);
	public EmailType load(int id);
	public List<EmailType> loadList(EmailType emailType);
}



