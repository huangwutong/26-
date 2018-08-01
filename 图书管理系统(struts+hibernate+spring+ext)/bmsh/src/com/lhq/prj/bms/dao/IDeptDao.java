package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;
import com.lhq.prj.bms.po.Dept;

/**
 * IDeptDao.java Create on 2008-9-16 ����10:41:23
 * 
 * ���Ź���־ò�ӿ�
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface IDeptDao {
	/**
	 * ����һ������ʵ�嵽���ݿ�
	 * 
	 * @param dept
	 *            ����ʵ��
	 * @return ����id
	 */
	public Object saveDept(Dept dept);

	/**
	 * �������в���
	 * 
	 * @return
	 */
	public List findAll();

	/**
	 * ��ҳ����
	 * 
	 * @param page
	 *            ����
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * ��ҳ���ҵ��ܼ�¼
	 * 
	 * @param page
	 *            ����
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * �޸Ĳ�����Ϣ
	 * 
	 * @param dept
	 * @return
	 * @throws Exception
	 */
	public Integer update(Dept dept) throws Exception;

	/**
	 * ����idɾ������
	 * 
	 * @param deptId
	 * @return
	 */
	public Integer deleteById(Integer deptId);

	/**
	 * ���ݷֹ�˾�Ҳ���
	 *
	 * @param company
	 * @return
	 */
	public List findDeptByCompany(Company company);
}
