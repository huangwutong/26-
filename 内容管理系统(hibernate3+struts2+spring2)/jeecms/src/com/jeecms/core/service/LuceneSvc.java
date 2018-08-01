package com.jeecms.core.service;

import java.util.Date;

public interface LuceneSvc {
	public void addDoc(String indexPath, Long id, String url, String title,
			String summary, String content, Date date, String type, int right);
}
