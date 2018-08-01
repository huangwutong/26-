package com.jeecms.cms.manager;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.core.entity.User;
import com.jeecms.core.exception.UserRegisterException;
import com.jeecms.cms.entity.CmsMember;

public interface CmsMemberMng extends JeeCoreManager<CmsMember> {
	/**
	 * ע���Ա
	 * 
	 * @param cmsMember
	 * @param isExist
	 * @return
	 * @throws UserRegisterException
	 */
	public CmsMember register(CmsMember cmsMember, boolean isExist)
			throws UserRegisterException;

	/**
	 * ע���Ա
	 * 
	 * @param webId
	 * @param groupId
	 * @param user
	 * @param isExist
	 * @return
	 */
	public CmsMember register(Long webId, Long groupId, User user,
			boolean isExist);
}