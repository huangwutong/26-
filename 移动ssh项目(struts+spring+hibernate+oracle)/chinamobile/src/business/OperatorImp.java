package business;
//实现业务层操作员受理业务接口
import dao.IOperatorDAO;
import po.Tcustomer;
import po.Tmobiles;
import po.Tuser;

public class OperatorImp implements IOperator{
	//数据访问层操作员受理业务对象,由spring注入(托管)
	private IOperatorDAO operator;

	//增加客户
	public Tcustomer addCustomer(Tcustomer customer) {
		Tcustomer mycustomer=null;
		if(operator.isCustomerExist(customer)==null){
			mycustomer=operator.addCustomer(customer);
		}
		return mycustomer;
	}

	//增加手机用户
	public String addUser(Tuser user) {
		String message="";
		//先判断用机号是否可用
		if(operator.isMobileCanUse(user.getTmobiles().getMobileNumber())!=null){
			if(operator.addUser(user)){//增加手机用户
				message="添加用户成功!";
			}else{
				message="添加用户失败!请您重新操作!";
			}
		}else{
			message="添加用户失败!该手机号已被占用!";
		}
		return message;
	}

	//判断客户是否存在
	public Tcustomer isCustomerExist(Tcustomer customer) {
		return operator.isCustomerExist(customer);
	}
	
	//判断手机号是否可用
	public Tmobiles isMobileCanUse(String mnb) {
		System.out.println(mnb);
		return operator.isMobileCanUse(mnb);
	}

	//get/set方法在spring注入时使用
	public IOperatorDAO getOperator() {
		return operator;
	}

	public void setOperator(IOperatorDAO operator) {
		this.operator = operator;
	}
}
