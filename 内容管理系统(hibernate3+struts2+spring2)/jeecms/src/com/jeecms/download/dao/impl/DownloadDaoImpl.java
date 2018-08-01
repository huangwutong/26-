package com.jeecms.download.dao.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jeecms.download.entity.Download;
import com.jeecms.download.dao.DownloadDao;
import com.jeecms.core.JeeCoreDaoImpl;
import com.ponyjava.common.hibernate3.Finder;
import com.ponyjava.common.page.Pagination;

@Repository
public class DownloadDaoImpl extends JeeCoreDaoImpl<Download> implements
		DownloadDao {

	public Pagination getRightDownload(Long webId, Long chnlId, Long adminId,
			boolean isMy, int status, String title, int order, int pageNo,
			int pageSize) {
		String hql = "select bean from Download bean inner join bean.channel node inner join node.admins admin,CmsChannel parent"
				+ " where node.lft between parent.lft and parent.rgt and parent.id=:chnlId and bean.website.id=:webId and admin.id=:adminId";
		Finder f = Finder.create(hql).setParam("webId", webId).setParam(
				"chnlId", chnlId).setParam("adminId", adminId);
		if (isMy) {
			f.append(" and bean.adminInput.id=:adminId");
		}
		switch (status) {
		case 4:
			// ÕÀ∏Â
			f.append(" and bean.reject=true");
			break;
		case 3:
			// “—…Û∫À
			f.append(" and bean.check=true");
			break;
		case 2:
			// ¥˝…Û∫À
			f.append(" and bean.check=false");
			break;
		case 1:
			// ≤›∏Â
			f.append(" and bean.draft=true");
			break;
		default:
			break;
		}
		if (!StringUtils.isBlank(title)) {
			f.append(" and bean.title like :title").setParam("title",
					"%" + title + "%");
		}
		switch (order) {
		case 13:
			f.append(" order by bean.visitTotal asc");
			break;
		case 12:
			f.append(" order by bean.visitTotal desc");
			break;
		case 11:
			f.append(" order by bean.visitYear asc");
			break;
		case 10:
			f.append(" order by bean.visitYear desc");
			break;
		case 9:
			f.append(" order by bean.visitQuarter asc");
			break;
		case 8:
			f.append(" order by bean.visitQuarter desc");
			break;
		case 7:
			f.append(" order by bean.visitMonth asc");
			break;
		case 6:
			f.append(" order by bean.visitMonth desc");
			break;
		case 5:
			f.append(" order by bean.visitWeek asc");
			break;
		case 4:
			f.append(" order by bean.visitWeek desc");
			break;
		case 3:
			f.append(" order by bean.visitToday asc");
			break;
		case 2:
			f.append(" order by bean.visitTotal desc");
			break;
		case 1:
			f.append(" order by bean.id asc");
			break;
		default:
			f.append(" order by bean.id desc");
			break;
		}
		return find(f, pageNo, pageSize);
	}
}