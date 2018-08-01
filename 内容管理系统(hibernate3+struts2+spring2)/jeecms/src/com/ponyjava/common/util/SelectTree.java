package com.ponyjava.common.util;

import java.util.Set;

/**
 * �����б����
 * 
 * @author liufang
 * 
 */
public interface SelectTree {
	/**
	 * �����ID
	 * 
	 * @return
	 */
	public Long getId();

	/**
	 * ��ø��ڵ�
	 * 
	 * @return
	 */
	public SelectTree getTreeParent();

	/**
	 * ���ԭ�ڵ�����
	 * 
	 * @return
	 */
	public String getTreeName();

	/**
	 * ��������б�������
	 * 
	 * @return
	 */
	public String getSelectTree();

	/**
	 * ���������б�������
	 * 
	 * @param selectTree
	 */
	public void setSelectTree(String selectTree);

	/**
	 * ��������ӽڵ�
	 * 
	 * @return
	 */
	public Set<? extends SelectTree> getTreeChild();

	/**
	 * ���������ӽڵ�
	 * 
	 * @param treeChild
	 */
	@SuppressWarnings("unchecked")
	public void setTreeChild(Set treeChild);
}
