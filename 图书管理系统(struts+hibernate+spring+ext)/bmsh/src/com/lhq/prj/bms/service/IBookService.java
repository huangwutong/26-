package com.lhq.prj.bms.service;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;

/**    
 * IDeptService.java Create on 2008-9-16 ����10:38:57   
 *
 * ͼ��ҵ���ӿ�
 *
 * Copyright (c) 2008 by MTA.
 *
 * @author �����
 * @version 1.0  
 */
public interface IBookService {
	/**
	 * ���ͼ��
	 * @param book
	 * @return
	 */
	Object saveBook(Book book);

	/**
	 * ��ҳ����
	 * @param page ��ҳ����
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * �޸�ͼ����Ϣ
	 * @param book
	 * @return
	 * @throws Exception 
	 */
	boolean updateBook(Book book) throws Exception;

	/**
	 * ɾ��ͼ��
	 * 
	 * @param rootPath ������·��
	 * @param bookId
	 * @return
	 */
	boolean deleteBook(String rootPath,Integer bookId);

	/**
	 * ����
	 *
	 * @param book
	 * @return
	 * @throws Exception 
	 */
	boolean returnBook(Book book) throws Exception;

}
 