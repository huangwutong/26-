package com.jeecms.core.manager.impl;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.dao.AdminDao;
import com.jeecms.core.entity.Admin;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.exception.AdminDisabledException;
import com.jeecms.core.manager.AdminMng;
import com.jeecms.core.manager.FunctionMng;
import com.jeecms.core.manager.UserMng;
import com.jeecms.core.manager.WebsiteMng;
import com.ponyjava.common.hibernate3.Condition;
import com.ponyjava.common.hibernate3.OrderBy;
import com.ponyjava.common.hibernate3.Updater;
import com.ponyjava.common.page.Pagination;
import com.ponyjava.common.struts2.ContextPvd;

@Service
@Transactional
public class AdminMngImpl extends JeeCoreManagerImpl<Admin> implements AdminMng {

	public Pagination getAll(Long webId, int pageNo, int pageSize) {
		Admin admin = new Admin();
		if (webId != null) {
			admin.setWebsite(new Website(webId));
		}
		return findByEg(admin, new Condition[] { OrderBy.desc("id") }, pageNo,
				pageSize);
	}

	private Admin getLoginAdmin(Long webId, Long adminId, Long userId,
			HttpSession session) {
		if (adminId == null || userId == null) {
			return null;
		}
		Admin admin = findById(adminId);
		// 从其他站点跳转到当前站点
		if (!admin.getWebsite().getId().equals(webId)) {
			admin = getAdminByUserId(webId, userId);
			// 设置session
			if (session != null) {
				session.setAttribute(Admin.ADMIN_KEY, admin.getId());
			} else {
				contextPvd.setSessionAttr(Admin.ADMIN_KEY, admin.getId());
			}
			Set<String> fiSet = functionMng.getFunctionItems(admin.getId());
			if (session != null) {
				session.setAttribute(Admin.RIGHTS_KEY, fiSet);
			} else {
				contextPvd.setSessionAttr(Admin.RIGHTS_KEY, fiSet);
			}
		}
		if (admin != null && admin.getAdminDisabled()) {
			throw new AdminDisabledException("管理员'" + admin.getLoginName()
					+ "'已经被禁用！");
		}
		return admin;
	}

	public Admin getLoginAdmin(Long webId, Long adminId, Long userId) {
		return getLoginAdmin(webId, adminId, userId, null);
	}

	public Admin getLoginAdmin(String domain, Long adminId, Long userId,
			HttpSession session) {
		Website web = websiteMng.getWebsite(domain);
		if (web == null) {
			return null;
		} else {
			return getLoginAdmin(web.getId(), adminId, userId, session);
		}
	}

	public List<Admin> getListByUserId(Long userId) {
		Admin example = new Admin();
		example.setUser(new User(userId));
		return findByEgList(example);
	}

	public Admin getAdminByUserId(Long webId, Long userId) {
		Admin admin = null;
		admin = getDao().getAdminByUser(webId, userId);
		return admin;
	}

	public Admin register(Admin admin, boolean isExist) {
		Assert.notNull(admin);
		Assert.notNull(admin.getUser());
		Assert.notNull(admin.getWebsite());
		Assert.notNull(admin.getWebsite().getId());
		User user = userMng.register(admin.getUser(), isExist);
		Admin oadmin = getAdminByUserId(admin.getWebsite().getId(), user
				.getId());
		if (oadmin != null) {
			return oadmin;
		} else {
			if (admin.getDisabled() == null) {
				admin.setDisabled(false);
			}
			admin.setUser(user);
			return save(admin);
		}
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		Admin user = (Admin) super.updateByUpdater(updater);
		Admin.funcChange();
		return user;
	}

	@Override
	public Admin save(Admin admin) {
		admin.setCreateTime(new Timestamp(System.currentTimeMillis()));
		if (admin.getDisabled() == null) {
			admin.setDisabled(false);
		}
		super.save(admin);
		return admin;
	}

	@Override
	public Admin findById(Serializable id) {
		Admin user = super.findById(id);
		return user;
	}

	@Override
	public Admin deleteById(Serializable id) {
		Admin user = super.deleteById(id);
		return user;
	}

	@Autowired
	private ContextPvd contextPvd;
	@Autowired
	private WebsiteMng websiteMng;
	@Autowired
	private FunctionMng functionMng;
	@Autowired
	private UserMng userMng;

	@Autowired
	public void setAdminDao(AdminDao dao) {
		super.setDao(dao);
	}

	protected AdminDao getDao() {
		return (AdminDao) super.getDao();
	}
}
