package com.lhq.prj.bms.dao;

import java.util.List;

import com.lhq.prj.bms.core.Page;
import com.lhq.prj.bms.po.Company;

public interface ICompanyDao {

	/**
	 * ����һ����˾ʵ�嵽���ݿ�
	 * 
	 * @param company
	 *            ��˾ʵ��
	 * @return ����id
	 */
	public Object saveCompany(Company company);

	/**
	 * �������зֹ�˾
	 * @return
	 */
	public List findAll();

	/**
	 * ��ҳ����
	 * @param page ����
	 * @return
	 */
	public List findByPage(Page page);

	/**
	 * ��ҳ���ҵ��ܼ�¼
	 * @param page ����
	 * @return
	 */
	public int findByCount(Page page);

	/**
	 * �޸Ĺ�˾��Ϣ
	 * @param c
	 * @return
	 * @throws Exception 
	 */
	public Integer update(Company c) throws Exception;

	/**
	 * ����idɾ���ֹ�˾
	 * 
	 * @param companyId
	 * @return
	 */
	public Integer deleteById(Integer companyId);
}
