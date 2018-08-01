package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Category;
import com.lhq.prj.bms.po.Subject;

/**
 * IDeptDao.java Create on 2008-9-16 ����10:41:23
 * 
 * �������־ò�ӿ�
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface ICategoryDao {
	/**
	 * ����һ������ʵ�嵽���ݿ�
	 * 
	 * @param category
	 *            ����ʵ��
	 * @return ����id
	 */
	public Object saveCategory(Category category);

	/**
	 * �������з���
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
	 * �޸ķ�����Ϣ
	 * 
	 * @param category
	 * @return
	 * @throws Exception
	 */
	public Integer update(Category category) throws Exception;

	/**
	 * ����idɾ������
	 * 
	 * @param categoryId
	 * @return
	 */
	public Integer deleteById(Integer categoryId);

	/**
	 * ���ݷֿ�Ŀ�ҷ���
	 *
	 * @param subject
	 * @return
	 */
	public List findCategoryBySubject(Subject subject);
}
