package dao;

import po.Tcustomer;
import po.Tmobiles;
import po.Tuser;
//底层（数据访问层）层操作员受理业务接口文件
public interface IOperatorDAO {
	/*判断客户是否存在
	 *参数:客户PO对象
	 *返回值:客户PO对象*/
	public Tcustomer isCustomerExist(Tcustomer customer);
	
	/*增加客户
	 *参数:客户PO对象
	 *返回值:客户PO对象*/
	public Tcustomer addCustomer(Tcustomer customer);
	
	/*判断手机号是否可用
	 *参数:手机号
	 *返回值:手机PO对象*/
	public Tmobiles isMobileCanUse(String mnb);
	
	/*增加手机用户
	 *参数:手机用户PO对象
	 *返回值:boolean*/
	public boolean addUser(Tuser user);
}
