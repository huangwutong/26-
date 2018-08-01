package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LoanLog;

/**
 * IDeptDao.java Create on 2008-9-16 ����10:41:23
 * 
 * ���黹���¼�־û��ӿ�
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface ILoanLogDao {
	/**
	 * ����һ���軹��ʵ�嵽���ݿ�
	 * 
	 * @param loanlog  �軹��ʵ��
	 * @return ����id
	 */
	public Object saveLoanLog(LoanLog loanlog);


	/**
	 * ��ҳ����
	 * 
	 * @param page ����
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * ��ҳ���ҵ��ܼ�¼
	 * 
	 * @param page ����
	 * @return �ܼ�¼
	 */
	public int findByCount(Page page);

	/**
	 * �޸Ľ軹��Ϣ
	 * 
	 * @param loanlog
	 * @return �޸ĵļ�¼��
	 * @throws Exception
	 */
	public Integer update(LoanLog loanlog) throws Exception;

	/**
	 * ����idɾ����¼
	 * 
	 * @param logId
	 * @return ɾ���ļ�¼��
	 */
	public Integer deleteById(Integer logId);

}
