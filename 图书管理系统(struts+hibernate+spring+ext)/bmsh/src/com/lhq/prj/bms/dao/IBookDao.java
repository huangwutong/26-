package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;

/**
 * IBookDao.java Create on 2008-9-24 ����09:07:34
 * 
 * ͼ�鴦��
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface IBookDao {
	/**
	 * ����һ��ͼ��ʵ�嵽���ݿ�
	 * 
	 * @param book
	 *          ͼ��ʵ��
	 * @return ����id
	 */
	public Object saveBook(Book book);


	/**
	 * ��ҳ����
	 * 
	 * @param page
	 *          ����
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * ��ҳ���ҵ��ܼ�¼
	 * 
	 * @param page
	 *          ����
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * �޸�ͼ����Ϣ
	 * 
	 * @param book
	 * @return
	 * @throws Exception
	 */
	public Integer update(Book book) throws Exception;

	/**
	 * ����idɾ��ͼ��
	 * 
	 * @param bookId
	 * @return
	 */
	public Integer deleteById(Integer bookId);


	/***
	 * ����id��ü�¼
	 *
	 * @param bookId
	 * @return
	 */
	public Book findById(Integer bookId);

}
