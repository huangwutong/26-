package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.FoodBigTypeDAO;
import com.xaccp.dao.FoodInfoDAO;
import com.xaccp.dao.FoodSmallTypeDAO;
import com.xaccp.po.FoodBigType;
import com.xaccp.po.FoodSmallType;

public class FoodInfoService {

	private FoodBigTypeDAO bigTypeDao;
	private FoodSmallTypeDAO smallTypeDao;
	private FoodInfoDAO foodInfoDao;
	
	public FoodBigTypeDAO getBigTypeDao() {
		return bigTypeDao;
	}
	public void setBigTypeDao(FoodBigTypeDAO bigTypeDao) {
		this.bigTypeDao = bigTypeDao;
	}
	public FoodInfoDAO getFoodInfoDao() {
		return foodInfoDao;
	}
	public void setFoodInfoDao(FoodInfoDAO foodInfoDao) {
		this.foodInfoDao = foodInfoDao;
	}
	public FoodSmallTypeDAO getSmallTypeDao() {
		return smallTypeDao;
	}
	public void setSmallTypeDao(FoodSmallTypeDAO smallTypeDao) {
		this.smallTypeDao = smallTypeDao;
	}
	
	/**
	 * 查询所有餐饮
	 * @return
	 */
	public List findFoodInfo(){
		return foodInfoDao.findAllFoodInfo();
	}
	
	/**
	 * 按状态查询餐饮
	 * @param fstate
	 * @return
	 */
	public List findFoodByState(int fstate){
		return foodInfoDao.findFoodByState(fstate);
	}
	
	/**
	 * 按类型查询餐饮
	 * @param typeid
	 * @return
	 */
	public List findFoodByType(int typeid){
		return foodInfoDao.findFoodByType(typeid);
	}
	
	/**
	 * 按企业查询餐饮
	 * @param enterid
	 * @return
	 */
	public List findFoodByEnterpise(int enterid){
		return foodInfoDao.findFoodInfoByEnterprise(enterid);
	}
	
	public List findFoodByTerm(String hql,List args){
		return foodInfoDao.findFoodByTerm(hql, args);
	}
	
	/**
	 * 添加餐饮大分类
	 * @param fbt
	 */
	public void addFoodBigType(FoodBigType fbt){
		if(fbt!=null){
			bigTypeDao.save(fbt);
		}
	}
	
	/**
	 * 修改餐饮大分类
	 * @param fbt
	 */
	public void updateFoodBigType(FoodBigType fbt){
		bigTypeDao.merge(fbt);
	}
	
	/**
	 * 添加餐饮小分类
	 * @param fst
	 */
	public void addFoodSmalType(FoodSmallType fst){
		if(fst!=null){
			smallTypeDao.save(fst);
		}
	}
	
	/**
	 * 修改餐饮小分类
	 * @param fst
	 */
	public void updateFoodSmallType(FoodSmallType fst){
		smallTypeDao.merge(fst);
	}
	
	/**
	 * 查询餐饮前10个
	 * @return
	 */
	public List findFoodTop10(){
		List list=foodInfoDao.findAllFoodInfo();
		if(list.size()>0){
			return list;
		}
		return null;
	}
	
	/**
	 * 查询所有餐饮大分类
	 * @return
	 */
	public List findFoodBigType(){
		return bigTypeDao.findAllBigType();
	}
	
	/**
	 * 查询所有餐饮小分类
	 * @return
	 */
	public List findFoodSmallType(){
		return smallTypeDao.findAllSmallType();
	}
}