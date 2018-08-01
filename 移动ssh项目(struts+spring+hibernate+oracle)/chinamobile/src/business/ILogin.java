package business;

//业务层操作员登录系统接口文件


import po.Toperator;

public interface ILogin {
	/*判断用户是否存在,如果用户存在,则返回用户
	 *参数:用户名,密码
	 *返回值:操作员PO对象*/
	public Toperator isOperator(String operatorName,String operatorPwd);	
}
