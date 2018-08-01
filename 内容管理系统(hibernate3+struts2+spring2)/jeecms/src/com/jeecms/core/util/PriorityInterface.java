package com.jeecms.core.util;

/**
 * 实体中有优先级排序类的接口。用于hibernate的sort排序
 * 
 * @author liufang
 * 
 */
public interface PriorityInterface {
	/**
	 * 获得优先级
	 * 
	 * @return
	 */
	public Integer getPriority();

	/**
	 * 获得ID
	 * 
	 * @return
	 */
	public Long getId();
}
