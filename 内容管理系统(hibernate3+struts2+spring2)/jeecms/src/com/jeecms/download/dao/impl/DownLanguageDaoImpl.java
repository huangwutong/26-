package com.jeecms.download.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jeecms.core.JeeCoreDaoImpl;
import com.jeecms.download.dao.DownLanguageDao;
import com.jeecms.download.entity.DownLanguage;

@Repository
public class DownLanguageDaoImpl extends JeeCoreDaoImpl<DownLanguage> implements
		DownLanguageDao {
	@SuppressWarnings("unchecked")
	public List<DownLanguage> getList(Long webId, boolean all) {
		String hql = "from DownLanguage l where l.website.id=?";
		if (!all) {
			hql += " l.disabled = false";
		}
		hql += " order by l.priority asc";
		List<DownLanguage> list = find(hql, webId);
		return list;
	}
}