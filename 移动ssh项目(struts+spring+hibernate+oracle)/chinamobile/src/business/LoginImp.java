package business;
//实现业务层操作员登录系统接口
import dao.ILoginDAO;
import po.Toperator;

public class LoginImp implements ILogin{
	//数据访问层操作员登录对象,由spring注入(托管)
	private ILoginDAO login;
	
	//判断用户是否存在,如果用户存在,则返回用户
	public Toperator isOperator(String operatorName, String operatorPwd) {
		return login.isOperator(operatorName, operatorPwd);
	}
	
	//	get/set方法在spring注入时使用
	public ILoginDAO getLogin() {
		return login;
	}
	
	public void setLogin(ILoginDAO login) {
		this.login = login;
	}
}
