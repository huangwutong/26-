package dao;
//底层（数据访问层）层操作员登录系统接口文件
import po.Toperator;

public interface ILoginDAO {
	/*判断是操作员是否存在
	 *参数:用户名，密码
	 *返回值:操作号PO对象*/
	public Toperator isOperator(String operatorName,String operatorPwd);
}
