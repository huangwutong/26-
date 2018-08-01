package test.service;

import java.util.List;

import test.vo.Order;
import test.vo.Orderdetails;

public interface IOrderdetailsService {

	//保存订单明细的方法
	public boolean SaveObject(Orderdetails o);		
	//删除订单明细的方法
	public boolean DeleteObject(int odID);		
	//更新订单明细的方法
	public boolean UpdateObject(Orderdetails o);	
	//根据用户号得到某一用户的所有的订单明细
	public List getAllOrderdetailsByoID(int odID);	
	//根据订单明细号得到某一订单明细信息
	public Order getOneOrderdetailByoID(int odID);
	//得到所有的订单明细信息
	public List getAllOrderdetails();				



}
