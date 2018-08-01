package com.jeecms.download.manager.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecms.article.entity.Article;
import com.jeecms.cms.entity.CmsAdmin;
import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.util.UploadRule;
import com.jeecms.download.dao.DownloadDao;
import com.jeecms.download.entity.Download;
import com.jeecms.download.manager.DownloadMng;
import com.ponyjava.common.hibernate3.Updater;
import com.ponyjava.common.page.Pagination;

@Service
@Transactional
public class DownloadMngImpl extends JeeCoreManagerImpl<Download> implements
		DownloadMng {
	public Pagination getPage(Long chnlId, int pageNo, int pageSize) {
		return null;
	}

	public Pagination getRightDownload(Long webId, Long chnlId, Long adminId,
			boolean isMy, int status, String title, int order, int pageNo,
			int pageSize) {
		return getDao().getRightDownload(webId, chnlId, adminId, isMy, status,
				title, order, pageNo, pageSize);
	}

	public Article saveArticle(Article arti, CmsAdmin admin, UploadRule rule,
			String resUrl, int checkCount, long topTime) {
		return null;
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		Download download = (Download) super.updateByUpdater(updater);
		return download;
	}

	@Override
	public Download save(Download download) {
		super.save(download);
		return download;
	}

	@Override
	public Download findById(Serializable id) {
		Download download = super.findById(id);
		return download;
	}

	@Override
	public Download deleteById(Serializable id) {
		Download download = super.deleteById(id);
		return download;
	}

	@Autowired
	public void setDao(DownloadDao dao) {
		super.setDao(dao);
	}

	public DownloadDao getDao() {
		return (DownloadDao) super.getDao();
	}

}
