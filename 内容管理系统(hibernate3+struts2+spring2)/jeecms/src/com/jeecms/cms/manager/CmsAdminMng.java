package com.jeecms.cms.manager;

import java.util.List;
import java.util.Set;

import com.jeecms.cms.entity.CmsAdmin;
import com.jeecms.cms.entity.CmsChannel;
import com.jeecms.core.JeeCoreManager;
import com.jeecms.core.entity.Role;
import com.jeecms.core.exception.UserRegisterException;

public interface CmsAdminMng extends JeeCoreManager<CmsAdmin> {
	/**
	 * 管理员列表
	 * 
	 * @param webId
	 * @return
	 */
	public List<CmsAdmin> getList(Long webId);

	/**
	 * 注册cms会员
	 * 
	 * @param cmsAdmin
	 * @param isExist
	 * @return
	 * @throws UserRegisterException
	 */
	public CmsAdmin register(CmsAdmin cmsAdmin, boolean isExist)
			throws UserRegisterException;

	/**
	 * 查找CMS会员
	 * 
	 * @param webId
	 * @param loginName
	 * @return 不存在则返回null
	 */
	public CmsAdmin getAdminByLoginName(Long webId, String loginName);

	public CmsAdmin getAdminByUserId(Long webId, Long userId);

	/**
	 * 保存CMS管理员
	 * 
	 * @param admin
	 * @param roles
	 * @param channels
	 * @param unitedWebId
	 * @param groupId
	 * @param createUser
	 * @return
	 */
	public CmsAdmin saveAdmin(CmsAdmin admin, Set<Role> roles,
			Set<CmsChannel> channels, Long unitedWebId, Long groupId,
			boolean createUser);

	/**
	 * 修改CMS管理员。所属的admin不能修改。
	 * 
	 * @param cmsAdmin
	 * @param roles
	 * @param channels
	 * @return
	 */
	public CmsAdmin updateAdmin(CmsAdmin cmsAdmin, Set<Role> roles,
			Set<CmsChannel> channels);
}