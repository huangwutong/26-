package test.service;

import java.util.List;

import test.vo.Order;
import test.vo.Orderdetails;

public interface IOrderdetailsService {

	//���涩����ϸ�ķ���
	public boolean SaveObject(Orderdetails o);		
	//ɾ��������ϸ�ķ���
	public boolean DeleteObject(int odID);		
	//���¶�����ϸ�ķ���
	public boolean UpdateObject(Orderdetails o);	
	//�����û��ŵõ�ĳһ�û������еĶ�����ϸ
	public List getAllOrderdetailsByoID(int odID);	
	//���ݶ�����ϸ�ŵõ�ĳһ������ϸ��Ϣ
	public Order getOneOrderdetailByoID(int odID);
	//�õ����еĶ�����ϸ��Ϣ
	public List getAllOrderdetails();				



}
