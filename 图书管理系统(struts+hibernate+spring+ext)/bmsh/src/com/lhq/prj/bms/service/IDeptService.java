package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Dept;

/**    
 * IDeptService.java Create on 2008-9-16 ����10:38:57   
 *
 * 
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author �����
 * @version 1.0  
 */
public interface IDeptService {
	/**
	 * ��Ӳ���
	 * @param dept
	 * @return
	 */
	Object saveDept(Dept dept);

	/**
	 * �������в���
	 * @return
	 */
	List findAll();

	/**
	 * ��ҳ����
	 * @param page ��ҳ����
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * �޸Ĳ�����Ϣ
	 * @param dept
	 * @return
	 * @throws Exception 
	 */
	boolean updateDept(Dept dept) throws Exception;

	/**
	 * ɾ������
	 * 
	 * @param deptId
	 * @return
	 */
	boolean deleteDept(Integer deptId);

	/**
	 * ���ݹ�˾�������в���
	 *
	 * @param page
	 * @return
	 */
	Page findDeptByCompany(Page page);
}
 