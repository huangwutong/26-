

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.EmailReceivce;

public interface EmailReceivceDao {
	public void add(EmailReceivce emailReceivce);
	public void del(int id);
	public void update(EmailReceivce emailReceivce);
	public EmailReceivce load(int id);
	public List<EmailReceivce> loadList(EmailReceivce emailReceivce);
}



