package com.jeecms.core.manager;

import java.util.List;

import com.jeecms.core.JeeCoreManager;
import com.jeecms.core.entity.Member;
import com.jeecms.core.entity.User;
import com.jeecms.core.exception.UserRegisterException;
import com.ponyjava.common.page.Pagination;

public interface MemberMng extends JeeCoreManager<Member> {
	public Pagination getAll(Long webId, int page, int countPerPage);

	public List<Member> getAll(Long webId);

	/**
	 * ͨ��ͳһ�û�ID��ȡGUEST��ID
	 * 
	 * @param webId
	 * @param userID
	 * @return
	 */
	public Member getMemberByUserId(Long webId, Long userID);

	/**
	 * ע���û�
	 * 
	 * @param member
	 * @param isExist
	 *            �Ƿ���ͳһ�û�
	 * @return
	 * @throws UserRegisteredException
	 *             �û�ע���쳣
	 */
	public Member register(Member member, boolean isExist)
			throws UserRegisterException;

	/**
	 * ע���û�
	 * 
	 * @param webId
	 * @param user
	 * @param isExist
	 * @return
	 */
	public Member register(Long webId, User user, boolean isExist);

	/**
	 * ��õ�¼�Ļ�Ա
	 * <p>
	 * �������Ա��¼�ˣ��ɴ�ͨ��userId��û�Ա
	 * </p>
	 * 
	 * @param webId
	 * @param userId
	 * @return
	 */
	public Member getLoginMember(Long webId, Long userId, Long memberId);
}