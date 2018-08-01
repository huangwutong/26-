

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.EmailType;

public interface EmailTypeDao {
	public void add(EmailType emailType);
	public void del(int id);
	public void update(EmailType emailType);
	public EmailType load(int id);
	public List<EmailType> loadList(EmailType emailType);
}



