package com.lhq.prj.bms.service;

import java.util.List;

import com.lhq.prj.bms.po.Duty;

/**
 * IDutyService.java Create on 2008-9-18 ����08:11:19
 * 
 * ְ�����ҵ���ӿ�
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
public interface IDutyService {

	/**
	 * ���ְ��
	 * 
	 * @param duty
	 * @return
	 */
	Object saveDuty(Duty duty);

	/**
	 * ��������ְ��
	 * 
	 * @return
	 */
	List findAll();

	/**
	 * �޸�ְ����Ϣ
	 * 
	 * @param duty
	 * @return
	 * @throws Exception
	 */
	boolean updateDuty(Duty duty) throws Exception;

	/**
	 * ɾ��ְ��
	 * 
	 * @param dutyId
	 * @return
	 */
	boolean deleteDuty(Integer dutyId);
}
