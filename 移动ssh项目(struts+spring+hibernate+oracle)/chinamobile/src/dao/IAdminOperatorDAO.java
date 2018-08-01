package dao;
//底层（数据访问层）层操作员（管理员）管理系统接口文件
import po.Tcharge;
import po.TchargeRule;
import po.Tmobiles;
import po.Toperator;

public interface IAdminOperatorDAO {
	/*增加操作员
	 *参数:操作员PO对象
	 *返回值:boolean*/
	public boolean addOperator(Toperator operator);
	
	/*判断操作员是否存在
	 *参数:操作员PO对象
	 *返回值:boolean*/
	public boolean isOperatorExist(Toperator operator);
	
	/*增加手机号码
	 *参数:手机号PO对象
	 *返回值:boolean*/
	public boolean addNumber(Tmobiles mobile);
	
	/*判断手机号是否存在
	 *参数:手机号码
	 *返回值:boolean*/
	public boolean isMobileExist(String mobilenumber);
	
	/*判断手机卡号是否存在
	 *参数:手机卡号
	 *返回值:boolean*/
	public boolean isCardExist(String cardnumber);
	
	/*设置收费细项
	 *参数:收费细项PO对象
	 *返回值:boolean*/
	public boolean setMoney(Tcharge charge);
	
	/*增加业务收费
	 *参数:业务PO对象
	 *返回值:boolean*/
	public boolean addChargeRule(TchargeRule rule);
	
	/*删除原有业务收费
	 *参数:业务类型
	 *返回值:boolean*/
	public boolean delAllChargeRule(String business);
}
