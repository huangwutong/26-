package com.jeecms.download.manager;

import java.util.List;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.download.entity.DownLanguage;

public interface DownLanguageMng extends JeeCoreManager<DownLanguage> {
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

	public void updatePriority(Long[] wids, int[] prioritys);
}