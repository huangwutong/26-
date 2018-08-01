package business;
//业务层操作员（管理员）管理系统接口文件
import po.*;

public interface IAdminOperator {
	/*增加操作员
	 *参数:操作员PO对象
	 *返回值:操作成功与否信息*/
	public String addOperator(Toperator operator);
	/*增加号段
	 *参数:号码类型,号码开始段,号码结束段
	 *返回值:操作成功与否信息*/
	public String addNumber(String nbtype,String StartMobile,String endMobile);
	/*设置细项费用
	 *参数:细项费用PO对象
	 *返回值:操作成功与否信息*/
	public String setMoney(Tcharge charge);
	/*业务收费设置
	 *参数:业务类别,收费项目数组
	 *返回值:操作成功与否信息*/
	public String editChargeRule(String rule,String[] charge);
}
