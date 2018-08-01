/*
 * @(#)LoanLogDao.java 2008-10-11
 *
 * Copyright LHQ. All rights reserved.
 */

package com.lhq.prj.bms.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.dao.ILoanLogDao;
import com.lhq.prj.bms.po.LoanLog;

/**
 * Create on 2008-10-11 ����06:58:31
 * 
 * �軹��־ò�ʵ����
 * 
 * @author �����
 * @version
 */
public class LoanLogDao extends SqlMapClientDaoSupport implements ILoanLogDao {

	public Integer deleteById(Integer logId) {
		return getSqlMapClientTemplate().delete("LoanLog.deleteById", logId);
	}

	public int findByCount(Page page) {
		return (Integer) getSqlMapClientTemplate().queryForObject("LoanLog.findByCount", page);
	}

	public List findByPage(Page page) {
		return getSqlMapClientTemplate().queryForList("LoanLog.findByPage", page);
	}

	public Object saveLoanLog(LoanLog loanlog) {
		return getSqlMapClientTemplate().insert("LoanLog.save", loanlog);
	}

	public Integer update(LoanLog loanlog) throws Exception {
		return getSqlMapClientTemplate().update("LoanLog.update", loanlog);
	}

}
