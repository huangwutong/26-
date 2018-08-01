package test.service;

import java.util.List;

import test.vo.Order;

public interface IOrderService {

	//保存订单信息
	public Order SaveObject(Order o);  				
	//删除订单信息
	public boolean DeleteObject(int orderno);		
	//更新订单信息
	public boolean UpdateObject(int orderno);		
	//得到某一用户所有的订单
	public List getAllOrdersByuserID(int userno);	
	//根据订单号得到某一订单信息
	public Order getOneOrderByorderID(int orderno);
	//得到所有的订单信息
	public List getAllOrders();						
		


}
