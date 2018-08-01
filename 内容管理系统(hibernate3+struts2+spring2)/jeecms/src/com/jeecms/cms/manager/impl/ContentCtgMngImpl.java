package com.jeecms.cms.manager.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.cms.dao.ContentCtgDao;
import com.jeecms.cms.entity.ContentCtg;
import com.jeecms.cms.manager.ContentCtgMng;
import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.entity.Website;
import com.ponyjava.common.hibernate3.Condition;
import com.ponyjava.common.hibernate3.OrderBy;
import com.ponyjava.common.hibernate3.Updater;

@Service
@Transactional
public class ContentCtgMngImpl extends JeeCoreManagerImpl<ContentCtg> implements
		ContentCtgMng {
	public ContentCtg getContentCtg(Long webId, String label) {
		return getDao().getContentCtg(webId, label);
	}

	public List<ContentCtg> getList(Long webId, Boolean disabled) {
		ContentCtg eg = new ContentCtg();
		eg.setWebsite(new Website(webId));
		eg.setDisabled(disabled);
		return findByEgList(eg, new Condition[] { OrderBy
				.asc(ContentCtg.PROP_LABEL) });
	}

	public ContentCtg getFirstCtg(Long webId) {
		List<ContentCtg> list = getList(webId, null);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		ContentCtg ctg = (ContentCtg) super.updateByUpdater(updater);
		return ctg;
	}

	@Override
	public ContentCtg save(ContentCtg ctg) {
		super.save(ctg);
		return ctg;
	}

	@Override
	public ContentCtg findById(Serializable id) {
		ContentCtg ctg = super.findById(id);
		return ctg;
	}

	@Override
	public ContentCtg deleteById(Serializable id) {
		ContentCtg ctg = super.deleteById(id);
		return ctg;
	}

	@Autowired
	public void setDao(ContentCtgDao dao) {
		super.setDao(dao);
	}

	public ContentCtgDao getDao() {
		return (ContentCtgDao) super.getDao();
	}

}
