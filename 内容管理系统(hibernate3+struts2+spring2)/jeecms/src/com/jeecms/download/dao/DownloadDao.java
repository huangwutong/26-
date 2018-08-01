package com.jeecms.download.dao;

import com.jeecms.download.entity.Download;
import com.jeecms.core.JeeCoreDao;
import com.ponyjava.common.page.Pagination;

public interface DownloadDao extends JeeCoreDao<Download> {
	public Pagination getRightDownload(Long webId, Long chnlId, Long adminId,
			boolean isMy, int status, String title, int order, int pageNo,
			int pageSize);
}