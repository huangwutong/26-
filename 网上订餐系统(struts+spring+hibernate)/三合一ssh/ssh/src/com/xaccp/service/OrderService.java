package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.OrderAccessorilyDAO;
import com.xaccp.dao.OrderInfoDAO;
import com.xaccp.po.OrderInfo;

public class OrderService {

	private OrderAccessorilyDAO orderAcessDao;
	private OrderInfoDAO orderInfoDao;
	
	public OrderAccessorilyDAO getOrderAcessDao() {
		return orderAcessDao;
	}
	public void setOrderAcessDao(OrderAccessorilyDAO orderAcessDao) {
		this.orderAcessDao = orderAcessDao;
	}
	public OrderInfoDAO getOrderInfoDao() {
		return orderInfoDao;
	}
	public void setOrderInfoDao(OrderInfoDAO orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	
	/**
	 * 查询所有定单主表
	 * @return
	 */
	public List findAllOrder(){
		return orderInfoDao.findAllOrder();
	}
	
	/**
	 * 查询所有定单附表
	 * @return
	 */
	public List findAllOrderAccessrily(){
		return orderAcessDao.findAllOrderAccessrily();
	}
	
	/**
	 * 按企业查询定单 
	 * @param enterid
	 * @return
	 */
	public List findOrderByEnter(int enterid){
		return orderInfoDao.findOrderByEnter(enterid);
	}
	
	/**
	 * 按用户查询定单
	 * @param uid
	 * @return
	 */
	public List findOrderByUser(int uid){
		return orderInfoDao.findOrderByUser(uid);
	}
	
	/**
	 * 添加定单
	 * @param oi
	 */
	public void addOrder(OrderInfo oi){
		orderInfoDao.save(oi);
	}
	
	/**
	 * 删除定单
	 * @param oid
	 */
	public void deleteOrder(int oid){
		//根据oid查询信息，然后进行删除
		OrderInfo oi=orderInfoDao.findById(oid);
		orderInfoDao.delete(oi);
	}
	
	/**
	 * 修改定单状态
	 * @param oid
	 */
	public void updateOrderState(int oid){
		OrderInfo oi=orderInfoDao.findById(oid);
		oi.setOState(2);
		orderInfoDao.merge(oi);
	}
}