package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;

public interface ICompanyService {
	
	/**
	 * ��ӷֹ�˾
	 * @param company
	 * @return
	 */
	Object saveCompany(Company company);

	/**
	 * �������зֹ�˾
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
	 * �޸Ĺ�˾��Ϣ
	 * @param c
	 * @return
	 * @throws Exception 
	 */
	boolean updateCompany(Company c) throws Exception;

	/**
	 * ɾ���ֹ�˾
	 * 
	 * @param companyId
	 * @return
	 */
	boolean deleteCompany(Integer companyId);
	

}
