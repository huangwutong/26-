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
	 * ����Ա�б�
	 * 
	 * @param webId
	 * @return
	 */
	public List<CmsAdmin> getList(Long webId);

	/**
	 * ע��cms��Ա
	 * 
	 * @param cmsAdmin
	 * @param isExist
	 * @return
	 * @throws UserRegisterException
	 */
	public CmsAdmin register(CmsAdmin cmsAdmin, boolean isExist)
			throws UserRegisterException;

	/**
	 * ����CMS��Ա
	 * 
	 * @param webId
	 * @param loginName
	 * @return �������򷵻�null
	 */
	public CmsAdmin getAdminByLoginName(Long webId, String loginName);

	public CmsAdmin getAdminByUserId(Long webId, Long userId);

	/**
	 * ����CMS����Ա
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
	 * �޸�CMS����Ա��������admin�����޸ġ�
	 * 
	 * @param cmsAdmin
	 * @param roles
	 * @param channels
	 * @return
	 */
	public CmsAdmin updateAdmin(CmsAdmin cmsAdmin, Set<Role> roles,
			Set<CmsChannel> channels);
}