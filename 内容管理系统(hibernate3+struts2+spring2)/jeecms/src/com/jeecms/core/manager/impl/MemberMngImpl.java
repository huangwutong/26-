package com.jeecms.core.manager.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.jeecms.core.JeeCoreManagerImpl;
import com.jeecms.core.dao.MemeberDao;
import com.jeecms.core.entity.Member;
import com.jeecms.core.entity.User;
import com.jeecms.core.entity.Website;
import com.jeecms.core.exception.UserRegisterException;
import com.jeecms.core.manager.MemberMng;
import com.jeecms.core.manager.UserMng;
import com.ponyjava.common.hibernate3.Updater;
import com.ponyjava.common.page.Pagination;
import com.ponyjava.common.struts2.ContextPvd;
import com.ponyjava.common.util.ComUtils;

@Service
@Transactional
public class MemberMngImpl extends JeeCoreManagerImpl<Member> implements
		MemberMng {

	public Pagination getAll(Long webId, int page, int countPerPage) {
		Member example = new Member();
		example.setWebsite(new Website(webId));
		return findByEg(example, page, countPerPage);
	}

	public List<Member> getAll(Long webId) {
		Member example = new Member();
		example.setWebsite(new Website(webId));
		return findByEgList(example);
	}

	public Member getMemberByUserId(Long webId, Long userId) {
		Member example = new Member();
		example.setWebsite(new Website(webId));
		example.setUser(new User(userId));
		List<Member> list = findByEgList(example);
		if (list.size() > 0) {
			Member guest = list.get(0);
			Hibernate.initialize(guest.getWebsite());
			return list.get(0);
		} else {
			return null;
		}
	}

	public Member register(Member member, boolean isExist)
			throws UserRegisterException {
		Assert.notNull(member);
		Assert.notNull(member.getWebsite());
		Assert.notNull(member.getWebsite().getId());
		User user = userMng.register(member.getUser(), isExist);
		// 原会员
		Member omember = getMemberByUserId(member.getWebsite().getId(), user
				.getId());
		if (omember != null) {
			return omember;
		} else {
			if (member.getDisabled() == null) {
				member.setDisabled(false);
			}
			member.setCreateTime(ComUtils.now());
			member.setUser(user);
			return save(member);
		}
	}

	public Member register(Long webId, User user, boolean isExist) {
		Assert.notNull(webId);
		Assert.notNull(user);
		Member member = new Member();
		member.setWebsite(new Website(webId));
		member.setUser(user);
		return register(member, isExist);
	}

	private Member getMember(Long webId, Long userId) {
		Member example = new Member();
		example.setWebsite(new Website(webId));
		example.setUser(new User(userId));
		List<Member> list = findByEgList(example);
		if (list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public Member getLoginMember(Long webId, Long userId, Long memberId) {
		// 用户未登录
		if (userId == null) {
			return null;
		}
		// 会员已登录
		if (memberId != null) {
			Member member = findById(memberId);
			// 会员与当前站点一致
			if (member.getWebsite().getId().equals(webId)) {
				return member;
			}
		}
		// 用户登录，会员未登录
		Member m = getMember(webId, userId);
		if (m != null) {
			// 保存登录信息
			contextPvd.setSessionAttr(Member.MEMBER_KEY, m.getId());
		}
		return m;
	}

	@Override
	public Object updateByUpdater(Updater updater) {
		Member guest = (Member) super.updateByUpdater(updater);
		return guest;
	}

	@Override
	public Member save(Member guest) {
		guest.setDisabled(false);
		guest.setCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		super.save(guest);
		return guest;
	}

	@Override
	public Member findById(Serializable id) {
		Member guest = super.findById(id);
		return guest;
	}

	@Override
	public Member deleteById(Serializable id) {
		Member guest = super.deleteById(id);
		return guest;
	}

	@Autowired
	private ContextPvd contextPvd;
	@Autowired
	private UserMng userMng;

	@Autowired
	public void setMemberDao(MemeberDao dao) {
		super.setDao(dao);
	}

	protected MemeberDao getMemberDao() {
		return (MemeberDao) super.getDao();
	}

}
