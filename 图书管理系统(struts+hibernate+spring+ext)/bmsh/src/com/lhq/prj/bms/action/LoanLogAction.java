/*
 * @(#)LoanLogAction.java 2008-10-11
 *
 * Copyright LHQ. All rights reserved.
 */

package com.lhq.prj.bms.action;

import java.util.Date;

import com.lhq.prj.bms.core.BaseAction;
import com.lhq.prj.bms.core.MyUtils;
import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Book;
import com.lhq.prj.bms.po.LoanLog;
import com.lhq.prj.bms.po.User;
import com.lhq.prj.bms.service.ILoanLogService;

/**
 * Create on 2008-10-11 ����07:16:21
 * 
 * ͼ��軹����
 * 
 * @author �����
 * @version
 */
@SuppressWarnings("serial")
public class LoanLogAction extends BaseAction {

	private ILoanLogService loanLogService;

	private boolean success;

	private Integer logId;

	private Page page;
	
	private LoanLog loanLog;
	
	/** �鱾id */
	private Integer bookId;

	/** ���� 50 */
	private String bookName;

	/** ���ʱ�� */
	private Date loanTime;

	/** ������� */
	private Integer loanDays;

	/** Ԥ�ƻ���ʱ�� */
	private Date preReturnTime;

	/** ʵ�ʻ���ʱ�� */
	private Date returnTime;

	/** ������id */
	private Integer readerId;

	/** ������ 50 */
	private String reader;

	/** ����Աid */
	private Integer loannerId;

	/** ����Ա���� 50 */
	private String loanner;


	/**
	 * ����һ���軹��¼
	 * 
	 * @return
	 * @throws Exception 
	 */
	public String saveLoanLog() throws Exception {
		User user = (User) getSession().getAttribute("user");
		loanLog.setLoanTime(new Date());
		loanLog.setLoannerId(user.getUserId());
		loanLog.setLoanner(user.getEmplName());
		logId = (Integer) loanLogService.saveLoanLog(loanLog);
		if (logId != null) {
			success = true;
		}
		return SUCCESS;
	}

	/**
	 * ����ͼ��軹��¼
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findLoanLogByBook() {
		String strBookId = getRequest().getParameter("bookId");
		Book book = new Book();
		if (strBookId != null && !"".equals(strBookId)) {
			book.setBookId(Integer.valueOf(strBookId));
		}
		page = new Page();
		page.setObjCondition(book);
		int start = Integer.valueOf(getRequest().getParameter("start"));
		int limit = Integer.valueOf(getRequest().getParameter("limit"));
		page.setStart(++start);
		page.setLimit(limit = limit == 0 ? 10 : limit);
		page = loanLogService.findByPage(page);
		return SUCCESS;
	}

	/**
	 * �޸Ľ軹��¼��Ϣ
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateLoanLog() throws Exception {
		String fieldName = getRequest().getParameter("fieldName");
		String fieldValue = getRequest().getParameter("fieldValue");
		String strLogId = getRequest().getParameter("logId");
		if (strLogId != null && !"".equals(strLogId)) {
			LoanLog loanLog = new LoanLog();
			loanLog.setLogId(Integer.valueOf(strLogId));
			MyUtils.invokeSetMethod(fieldName, loanLog, new Object[] { fieldValue });
			success = loanLogService.updateLoanLog(loanLog);
		}
		return SUCCESS;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public LoanLog getLoanLog() {
		return loanLog;
	}

	public void setLoanLog(LoanLog loanLog) {
		this.loanLog = loanLog;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public void setLoanLogService(ILoanLogService loanLogService) {
		this.loanLogService = loanLogService;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public Integer getLoanDays() {
		return loanDays;
	}

	public void setLoanDays(Integer loanDays) {
		this.loanDays = loanDays;
	}

	public String getLoanner() {
		return loanner;
	}

	public void setLoanner(String loanner) {
		this.loanner = loanner;
	}

	public Integer getLoannerId() {
		return loannerId;
	}

	public void setLoannerId(Integer loannerId) {
		this.loannerId = loannerId;
	}

	public Date getLoanTime() {
		return loanTime;
	}

	public void setLoanTime(Date loanTime) {
		this.loanTime = loanTime;
	}

	public Date getPreReturnTime() {
		return preReturnTime;
	}

	public void setPreReturnTime(Date preReturnTime) {
		this.preReturnTime = preReturnTime;
	}

	public String getReader() {
		return reader;
	}

	public void setReader(String reader) {
		this.reader = reader;
	}

	public Integer getReaderId() {
		return readerId;
	}

	public void setReaderId(Integer readerId) {
		this.readerId = readerId;
	}

	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

}
