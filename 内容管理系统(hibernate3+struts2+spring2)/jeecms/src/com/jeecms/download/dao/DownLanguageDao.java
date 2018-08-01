package com.jeecms.download.dao;

import java.util.List;

import com.jeecms.download.entity.DownLanguage;
import com.jeecms.core.JeeCoreDao;

public interface DownLanguageDao extends JeeCoreDao<DownLanguage> {
	/**
	 * ����վ�������������б���priority����
	 * 
	 * @param webId
	 *            վ��ID
	 * @param all
	 *            true������������ԣ�false��δ�����������
	 * @return
	 */
	public List<DownLanguage> getList(Long webId, boolean all);
}