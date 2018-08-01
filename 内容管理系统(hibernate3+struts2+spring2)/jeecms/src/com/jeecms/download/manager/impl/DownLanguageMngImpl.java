package com.jeecms.download.manager.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.download.dao.DownLanguageDao;
import com.jeecms.download.entity.DownLanguage;
import com.jeecms.download.manager.DownLanguageMng;
import com.ponyjava.common.hibernate3.Updater;

@Service
@Transactional
public class DownLanguageMngImpl extends JeeCoreManagerImpl<DownLanguage>
		implements DownLanguageMng {
	public List<DownLanguage> getList(Long webId, boolean all) {
		return getDao().getList(webId, all);
	}

	public void updatePriority(Long[] wids, int[] prioritys) {
		for (int i = 0; i < wids.length; i++) {
			DownLanguage entity = findById(wids[i]);
			entity.setPriority(prioritys[i]);
		}
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		DownLanguage language = (DownLanguage) super.updateByUpdater(updater);
		return language;
	}

	@Override
	public DownLanguage save(DownLanguage language) {
		super.save(language);
		return language;
	}

	@Override
	public DownLanguage findById(Serializable id) {
		DownLanguage language = super.findById(id);
		return language;
	}

	@Override
	public DownLanguage deleteById(Serializable id) {
		DownLanguage language = super.deleteById(id);
		return language;
	}

	@Autowired
	public void setDao(DownLanguageDao dao) {
		super.setDao(dao);
	}

	public DownLanguageDao getDao() {
		return (DownLanguageDao) super.getDao();
	}

}
