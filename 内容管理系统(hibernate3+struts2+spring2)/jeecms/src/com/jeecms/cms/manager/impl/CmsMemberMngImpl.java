package com.jeecms.cms.manager.impl;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.jeecms.cms.dao.CmsMemberDao;
import com.jeecms.cms.entity.CmsMember;
import com.jeecms.cms.entity.CmsMemberGroup;
import com.jeecms.cms.manager.CmsMemberMng;
import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.entity.Member;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.exception.UserRegisterException;
import com.jeecms.core.manager.MemberMng;
import com.ponyjava.common.hibernate3.Updater;
import com.ponyjava.common.util.ComUtils;

@Service
@Transactional
public class CmsMemberMngImpl extends JeeCoreManagerImpl<CmsMember> implements
		CmsMemberMng {
	public CmsMember register(CmsMember cmsMember, boolean isExist)
			throws UserRegisterException {
		Assert.notNull(cmsMember);
		Assert.notNull(cmsMember.getWebsite());

		cmsMember.getMember().setWebsite(cmsMember.getWebsite());
		Member member = memberMng.register(cmsMember.getMember(), isExist);
		// 如果CMS会员已经存在，则返回CMS会员对象。
		CmsMember ocmember = findById(member.getId());
		if (ocmember != null) {
			return ocmember;
		} else {
			cmsMember.setMember(member);
			if (cmsMember.getDisabled() == null) {
				cmsMember.setDisabled(false);
			}
			cmsMember.setUploadSize(0);
			cmsMember.setUploadStatDate(ComUtils.now());
			cmsMember.setUploadTotalSize(0L);
			return save(cmsMember);
		}
	}

	public CmsMember register(Long webId, Long groupId, User user,
			boolean isExist) {
		Assert.notNull(webId);
		Assert.notNull(groupId);
		Assert.notNull(user);

		CmsMember cmsMember = new CmsMember();
		cmsMember.setWebsite(new Website(webId));
		cmsMember.setGroup(new CmsMemberGroup(groupId));
		Member member = new Member();
		member.setUser(user);
		cmsMember.setMember(member);
		return register(cmsMember, isExist);
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		CmsMember member = (CmsMember) super.updateByUpdater(updater);
		return member;
	}

	@Override
	public CmsMember save(CmsMember member) {
		super.save(member);
		return member;
	}

	@Override
	public CmsMember findById(Serializable id) {
		CmsMember member = super.findById(id);
		return member;
	}

	@Override
	public CmsMember deleteById(Serializable id) {
		CmsMember member = super.deleteById(id);
		return member;
	}

	@Autowired
	private MemberMng memberMng;

	@Autowired
	public void setCmsMemberDao(CmsMemberDao dao) {
		super.setDao(dao);
	}

	public CmsMemberDao getCmsMemberDao() {
		return (CmsMemberDao) super.getDao();
	}

}
