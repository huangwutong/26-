package com.lhq.prj.bms.core;

import java.util.List;

public class Page {
	/** �ܼ�¼�� */
	private int totalProperty;

	/** ��ҳ��� */
	private List root;

	/** ��ʼҳ�� */
	private int start;

	/** ÿҳ���� */
	private int limit;

	/** �ɹ���� */
	private boolean success;
	
	/** ��ѯ���� */
	private List conditions;
	
	private Object objCondition;

	public Object getObjCondition() {
		return objCondition;
	}

	public void setObjCondition(Object objCondition) {
		this.objCondition = objCondition;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public List getRoot() {
		return root;
	}

	public void setRoot(List root) {
		this.root = root;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getTotalProperty() {
		return totalProperty;
	}

	public void setTotalProperty(int totalProperty) {
		this.totalProperty = totalProperty;
	}

	public List getConditions() {
		return conditions;
	}

	public void setConditions(List conditions) {
		this.conditions = conditions;
	}

}
