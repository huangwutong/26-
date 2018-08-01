package com.jeecms.download.dao;

import java.util.List;

import com.jeecms.download.entity.DownLanguage;
import com.jeecms.core.JeeCoreDao;

public interface DownLanguageDao extends JeeCoreDao<DownLanguage> {
	/**
	 * 根据站点查找软件语言列表，按priority升序
	 * 
	 * @param webId
	 *            站点ID
	 * @param all
	 *            true：所有软件语言，false：未禁用软件语言
	 * @return
	 */
	public List<DownLanguage> getList(Long webId, boolean all);
}