package com.jeecms.core.manager;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.core.entity.Attachment;
import com.ponyjava.common.page.Pagination;

public interface AttachmentMng extends JeeCoreManager<Attachment> {

	public Pagination getPage(Long webId, int pageNo, int pageSize);
}