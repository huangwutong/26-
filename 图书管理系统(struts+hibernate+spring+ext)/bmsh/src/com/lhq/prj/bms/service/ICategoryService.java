package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Category;

/**    
 * IDeptService.java Create on 2008-9-16 ����10:38:57   
 *
 * ����ҵ���ӿ�
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author �����
 * @version 1.0  
 */
public interface ICategoryService {
	/**
	 * ��ӷ���
	 * @param category
	 * @return
	 */
	Object saveCategory(Category category);

	/**
	 * �������з���
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
	 * �޸ķ�����Ϣ
	 * @param category
	 * @return
	 * @throws Exception 
	 */
	boolean updateCategory(Category category) throws Exception;

	/**
	 * ɾ������
	 * 
	 * @param categoryId
	 * @return
	 */
	boolean deleteCategory(Integer categoryId);

	/**
	 * ���ݿ�Ŀ�������з���
	 *
	 * @param page
	 * @return
	 */
	Page findCategoryBySubject(Page page);
}
 