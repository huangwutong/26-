package com.jeecms.auxiliary.dao;

import com.jeecms.auxiliary.entity.Msg;
import com.jeecms.core.JeeCoreDao;
import com.ponyjava.common.page.Pagination;

public interface MsgDao extends JeeCoreDao<Msg> {
	public Pagination getPage(Long webId, int pageNo, int pageSize);
}