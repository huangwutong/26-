package com.bu.opt;

import java.util.Vector;

/**
 * 业务访问层接口
 * */
public interface IBusiness {
	/**
	 * 保存数据
	 * @param Object,通常为实体对象
	 * @return boolean
	 * */
	public boolean save(Object ob);
	
	/**
	 * 删除数据
	 * @param String,通常为数据表主键值
	 * @return boolean
	 * */
	public boolean delete(String pkid);
	
	/**
	 * 更新数据
	 * @param Object,通常为实体对象
	 * @return boolean
	 * */
	public boolean update(Object ob);
	
	/**
	 * 无条件查找所有信息
	 * @return Vector,通常为信息对象的集合
	 * */
	public Vector findAll();
	
	/**
	 * 根据条件查询指定信息
	 * @param String,通常为数据表主键值
	 * @return Object,通常为实体对象
	 * */
	public Object findByID(String pkid);
}
