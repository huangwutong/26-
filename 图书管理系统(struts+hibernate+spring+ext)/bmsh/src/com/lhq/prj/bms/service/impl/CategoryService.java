package com.lhq.prj.bms.service.impl;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ICategoryDao;
import com.lhq.prj.bms.po.Category;
import com.lhq.prj.bms.po.Subject;
import com.lhq.prj.bms.service.ICategoryService;

/**
 * DeptService.java Create on 2008-9-16 ����10:40:48
 * 
 * ����ҵ��ʵ��
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public class CategoryService implements ICategoryService {

	private ICategoryDao categoryDao;

	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public boolean deleteCategory(Integer deptId) {
		Integer flag = categoryDao.deleteById(deptId);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public List findAll() {
		return categoryDao.findAll();
	}

	public Page findByPage(Page page) {
		page.setRoot(categoryDao.findByPage(page));
		page.setTotalProperty(categoryDao.findByCount(page));
		return page;
	}

	public Object saveCategory(Category dept) {
		return categoryDao.saveCategory(dept);
	}

	public boolean updateCategory(Category dept) throws Exception {
		Integer flag = categoryDao.update(dept);
		if (flag != null) {
			return true;
		}
		return false;
	}

	public Page findCategoryBySubject(Page page) {
		page.setRoot(categoryDao.findCategoryBySubject((Subject) page.getConditions().get(0)));
		return page;
	}

}
