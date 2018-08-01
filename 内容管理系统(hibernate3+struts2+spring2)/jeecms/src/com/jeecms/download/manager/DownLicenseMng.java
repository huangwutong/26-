package com.jeecms.download.manager;

import java.util.List;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.download.entity.DownLicense;

public interface DownLicenseMng extends JeeCoreManager<DownLicense> {

	/**
	 * 根据站点查找软件授权列表，按priority升序
	 * 
	 * @param webId
	 *            站点ID
	 * @param all
	 *            true：所有软件语言，false：未禁用软件语言
	 * @return
	 */
	public List<DownLicense> getList(Long webId, boolean all);

	public void updatePriority(Long[] wids, int[] prioritys);
}