package test.service;

import java.util.List;

import test.vo.Order;

public interface IOrderService {

	//���涩����Ϣ
	public Order SaveObject(Order o);  				
	//ɾ��������Ϣ
	public boolean DeleteObject(int orderno);		
	//���¶�����Ϣ
	public boolean UpdateObject(int orderno);		
	//�õ�ĳһ�û����еĶ���
	public List getAllOrdersByuserID(int userno);	
	//���ݶ����ŵõ�ĳһ������Ϣ
	public Order getOneOrderByorderID(int orderno);
	//�õ����еĶ�����Ϣ
	public List getAllOrders();						
		


}
