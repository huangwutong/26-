package com.jeecms.download.dao;

import java.util.List;

import com.jeecms.core.JeeCoreDao;
import com.jeecms.download.entity.DownLicense;

public interface DownLicenseDao extends JeeCoreDao<DownLicense> {
	/**
	 * ����վ����������Ȩ�б���priority����
	 * 
	 * @param webId
	 *            վ��ID
	 * @param all
	 *            true������������ԣ�false��δ�����������
	 * @return
	 */
	public List<DownLicense> getList(Long webId, boolean all);
}