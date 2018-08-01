package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.Subject;

/**
 * ISubjectService.java Create on 2008-9-21 ����03:57:53
 * 
 * ��Ŀ����ҵ���
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface ISubjectService {
	/**
	 * ��ӿ�Ŀ
	 * 
	 * @param subject
	 * @return
	 */
	Object saveSubject(Subject subject);

	/**
	 * �������п�Ŀ
	 * 
	 * @return
	 */
	List findAll();

	/**
	 * �޸Ŀ�Ŀ��Ϣ
	 * 
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	boolean updateSubject(Subject subject) throws Exception;

	/**
	 * ɾ����Ŀ
	 * 
	 * @param subjectId
	 * @return
	 */
	boolean deleteSubject(Integer subjectId);
}
