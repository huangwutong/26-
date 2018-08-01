/*
 * @(#)ILoanLogService.java 2008-10-11
 *
 * Copyright LHQ. All rights reserved.
 */

package com.lhq.prj.bms.service;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.LoanLog;

/**    
 * Create on 2008-10-11 ����07:08:18
 *
 * ͼ���������¼ҵ���ӿ�
 *
 * @author �����
 * @version  
 */
public interface ILoanLogService {
	/**
	 * ��Ӽ�¼
	 * 
	 * @param loanlog
	 * @return
	 * @throws Exception 
	 */
	Object saveLoanLog(LoanLog loanlog) throws Exception;
	
	/**
	 * ��ҳ����
	 * @param page ��ҳ����
	 * @return
	 */
	Page findByPage(Page page);

	/**
	 * �޸ļ�¼��Ϣ
	 * 
	 * @param loanlog
	 * @return
	 * @throws Exception
	 */
	boolean updateLoanLog(LoanLog loanlog) throws Exception;

	/**
	 * ɾ����¼
	 * 
	 * @param logId
	 * @return
	 */
	boolean deleteLoanLog(Integer logId);

}
 