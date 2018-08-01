package com.jeecms.download.manager;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.download.entity.Download;
import com.ponyjava.common.page.Pagination;

public interface DownloadMng extends JeeCoreManager<Download> {
	public Pagination getPage(Long chnlId, int pageNo, int pageSize);

	public Pagination getRightDownload(Long webId, Long chnlId, Long adminId,
			boolean isMy, int status, String title, int order, int pageNo,
			int pageSize);
}