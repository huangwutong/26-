package com.jeecms.cms.manager.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.jeecms.cms.dao.CmsAdminDao;
import com.jeecms.cms.entity.CmsAdmin;
import com.jeecms.cms.entity.CmsChannel;
import com.jeecms.cms.manager.CmsAdminMng;
import com.jeecms.cms.manager.CmsMemberMng;
import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.entity.Admin;
import com.jeecms.core.entity.Role;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.manager.AdminMng;
import com.jeecms.core.manager.UserMng;

@Service
@Transactional
public class CmsAdminMngImpl extends JeeCoreManagerImpl<CmsAdmin> implements
		CmsAdminMng {
	public List<CmsAdmin> getList(Long webId) {
		CmsAdmin eg = new CmsAdmin();
		eg.setWebsite(new Website(webId));
		return findByEgList(eg);
	}

	public CmsAdmin register(CmsAdmin cmsAdmin, boolean isExist) {
		Assert.notNull(cmsAdmin);
		Admin admin = cmsAdmin.getAdmin();
		Assert.notNull(admin);
		admin.setWebsite(cmsAdmin.getWebsite());
		Admin oadmin = adminMng.register(admin, isExist);
		// 如果该管理员已经存在，则返回管理员对象。
		CmsAdmin ocadmin = findById(oadmin.getId());
		if (ocadmin != null) {
			return ocadmin;
		} else {
			cmsAdmin.setAdmin(oadmin);
			return save(cmsAdmin);
		}
	}

	public CmsAdmin getAdminByLoginName(Long webId, String loginName) {
		Assert.notNull(webId);
		Assert.hasText(loginName);
		User user = userMng.getUserByLoginName(loginName);
		if (user == null) {
			return null;
		}
		Admin admin = adminMng.getAdminByUserId(webId, user.getId());
		if (admin == null) {
			return null;
		}
		return findById(admin.getId());
	}

	public CmsAdmin getAdminByUserId(Long webId, Long userId) {
		Admin admin = adminMng.getAdminByUserId(webId, userId);
		if (admin != null) {
			return findById(admin.getId());
		} else {
			return null;
		}
	}

	public CmsAdmin saveAdmin(CmsAdmin admin, Set<Role> roles,
			Set<CmsChannel> channels, Long unitedWebId, Long groupId,
			boolean createUser) {
		Assert.notNull(admin);
		CmsAdmin entity = register(admin, createUser);
		if (roles != null) {
			entity.getAdmin().setRoles(roles);
		}
		if (channels != null) {
			entity.setChannels(channels);
		}
		if (groupId != null) {
			Assert.notNull(unitedWebId);
			cmsMemberMng.register(unitedWebId, groupId, entity.getAdmin()
					.getUser(), true);
		}
		return entity;
	}

	public CmsAdmin updateAdmin(CmsAdmin cmsAdmin, Set<Role> roles,
			Set<CmsChannel> channels) {
		Assert.notNull(cmsAdmin);
		CmsAdmin padmin = findById(cmsAdmin.getId());
		if (roles != null) {
			padmin.getAdmin().setRoles(roles);
		}
		if (channels != null) {
			padmin.setChannels(channels);
		}
		cmsAdmin.setAdmin(null);
		return (CmsAdmin) super.updateDefault(cmsAdmin);
	}

	public CmsAdmin save(CmsAdmin admin) {
		super.save(admin);
		return admin;
	}

	public CmsAdmin findById(Serializable id) {
		CmsAdmin admin = super.findById(id);
		return admin;
	}

	public CmsAdmin deleteById(Serializable id) {
		CmsAdmin admin = super.deleteById(id);
		return admin;
	}

	@Autowired
	private AdminMng adminMng;
	@Autowired
	private UserMng userMng;
	@Autowired
	private CmsMemberMng cmsMemberMng;

	@Autowired
	public void setCmsAdminDao(CmsAdminDao dao) {
		super.setDao(dao);
	}

	public CmsAdminDao getDao() {
		return (CmsAdminDao) super.getDao();
	}
}
