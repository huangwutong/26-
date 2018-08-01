package com.jeecms.download.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jeecms.core.JeeCoreDaoImpl;
import com.jeecms.download.dao.DownLicenseDao;
import com.jeecms.download.entity.DownLicense;

@Repository
public class DownLicenseDaoImpl extends JeeCoreDaoImpl<DownLicense> implements
		DownLicenseDao {
	@SuppressWarnings("unchecked")
	public List<DownLicense> getList(Long webId, boolean all) {
		String hql = "from DownLicense l where l.website.id=?";
		if (!all) {
			hql += " l.disabled = false";
		}
		hql += " order by l.priority asc";
		List<DownLicense> list = find(hql, webId);
		return list;
	}
}