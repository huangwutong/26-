package business;
//实现业务层操作员（管理员）管理系统接口

import org.apache.commons.lang.RandomStringUtils;

import dao.IAdminOperatorDAO;
import po.*;

public class AdminOperatorImp implements IAdminOperator {
	//	数据访问层操作员（管理员）管理对象,由spring注入(托管)
	private IAdminOperatorDAO adminoperator;
	
	//增加号段
	public String addNumber(String nbtype,String StartMobile, String endMobile) {
		String message="";
		//先取出手机号段的前两个字符
		String before=StartMobile.substring(0,2);
		//将后9个字符转为数值型
		int a1=Integer.parseInt(StartMobile.substring(2,11));
		int a2=Integer.parseInt(endMobile.substring(2,11));
		int all=0;//用于统计生成号码个数
		for(int i=a1;i<=a2;i++){//循环增加手机号吗
			if(!adminoperator.isMobileExist(before+i)){
				//生成卡号
				String cardnumber=RandomStringUtils.randomNumeric(20);
				while(adminoperator.isCardExist(cardnumber)){//如果卡号已存在，重新生成
					cardnumber=RandomStringUtils.randomNumeric(20);
				}
				//构造手机号码对象
				Tmobiles mobile=new Tmobiles();
				mobile.setCardNumber(cardnumber);
				mobile.setMobileType(nbtype);
				mobile.setIsAvailable("Y");
				mobile.setMobileNumber(before+i);
				if(adminoperator.addNumber(mobile)){//调用底层方法增加手机号
					all++;//增加成功个数加1
				}
			}
		}
		message="共添加手机号"+all+"个!";
		return message;
	}

	//增加操作员
	public String addOperator(Toperator operator) {
		String message="";
		if(!adminoperator.isOperatorExist(operator)){//先判操作号是否存在
			if(adminoperator.addOperator(operator)){//增加操作员
				message="新增操作员成功!";
			}else{
				message="新增操作员失败!请检查后重新添加!";
			}
		}else{
			message="你所增加的操作员已存在!";
		}
		return message;
	}

	//业务收费设置
	public String editChargeRule(String rule,String[] chargestr) {
		String message="";
		if(adminoperator.delAllChargeRule(rule)){//变更业务前先删除原有业务
			
			for(int i=0;i<chargestr.length;i++){//循环配置业务收费细项
				TchargeRule myrule=new TchargeRule();
				TchargeRuleId id=new TchargeRuleId();
				Tcharge charge=new Tcharge();
				charge.setChargeCode(chargestr[i]);
				id.setFuncId(rule);
				id.setFuncName("开户");
				id.setTcharge(charge);
				myrule.setId(id);
				myrule.setTcharge(charge);
				//System.out.println(chargestr[i]);
				if(!adminoperator.addChargeRule(myrule)){//增加收费项目
					message="业务收费设置失败";
				}else{
					message="业务收费设置成功";
				}
			}
		}else{
			message="删除原记录过程中出现错误!";
		}
		return message;
	}

	//设置细项费用
	public String setMoney(Tcharge charge) {
		String message="";
		if(adminoperator.setMoney(charge)){//设置收费细项
			message="收费细项设置成功!";
		}else{
			message="收费细项设置失败!请重新设置!";
		}
		return message;
	}
	
	//	get/set方法在spring注入时使用
	public IAdminOperatorDAO getAdminoperator() {
		return adminoperator;
	}

	public void setAdminoperator(IAdminOperatorDAO adminoperator) {
		this.adminoperator = adminoperator;
	}

}
