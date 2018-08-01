package com.ponyjava.common.util;

import java.util.Set;

/**
 * 下拉列表框树
 * 
 * @author liufang
 * 
 */
public interface SelectTree {
	/**
	 * 获得树ID
	 * 
	 * @return
	 */
	public Long getId();

	/**
	 * 获得父节点
	 * 
	 * @return
	 */
	public SelectTree getTreeParent();

	/**
	 * 获得原节点名称
	 * 
	 * @return
	 */
	public String getTreeName();

	/**
	 * 获得下拉列表树名称
	 * 
	 * @return
	 */
	public String getSelectTree();

	/**
	 * 设置下拉列表树名称
	 * 
	 * @param selectTree
	 */
	public void setSelectTree(String selectTree);

	/**
	 * 获得树的子节点
	 * 
	 * @return
	 */
	public Set<? extends SelectTree> getTreeChild();

	/**
	 * 设置树的子节点
	 * 
	 * @param treeChild
	 */
	@SuppressWarnings("unchecked")
	public void setTreeChild(Set treeChild);
}
