package com.jeecms.download.manager;

import java.util.List;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.download.entity.DownLicense;

public interface DownLicenseMng extends JeeCoreManager<DownLicense> {

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

	public void updatePriority(Long[] wids, int[] prioritys);
}