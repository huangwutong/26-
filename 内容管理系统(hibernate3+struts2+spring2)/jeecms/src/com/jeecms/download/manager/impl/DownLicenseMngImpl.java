package com.jeecms.download.manager.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.download.dao.DownLicenseDao;
import com.jeecms.download.entity.DownLicense;
import com.jeecms.download.manager.DownLicenseMng;
import com.ponyjava.common.hibernate3.Updater;

@Service
@Transactional
public class DownLicenseMngImpl extends JeeCoreManagerImpl<DownLicense>
		implements DownLicenseMng {
	public List<DownLicense> getList(Long webId, boolean all) {
		return getDao().getList(webId, all);
	}

	public void updatePriority(Long[] wids, int[] prioritys) {
		for (int i = 0; i < wids.length; i++) {
			DownLicense entity = findById(wids[i]);
			entity.setPriority(prioritys[i]);
		}
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		DownLicense license = (DownLicense) super.updateByUpdater(updater);
		return license;
	}

	@Override
	public DownLicense save(DownLicense license) {
		super.save(license);
		return license;
	}

	@Override
	public DownLicense findById(Serializable id) {
		DownLicense license = super.findById(id);
		return license;
	}

	@Override
	public DownLicense deleteById(Serializable id) {
		DownLicense license = super.deleteById(id);
		return license;
	}

	@Autowired
	public void setDao(DownLicenseDao dao) {
		super.setDao(dao);
	}

	public DownLicenseDao getDao() {
		return (DownLicenseDao) super.getDao();
	}

}
