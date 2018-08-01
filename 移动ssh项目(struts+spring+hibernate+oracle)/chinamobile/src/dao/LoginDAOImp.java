package dao;
//实现底层（数据访问层）层操作员登录系统接口
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import po.Toperator;

public class LoginDAOImp implements ILoginDAO{
	//	hibernate　SessionFactory对象，由spring注入．
	private SessionFactory factory;

	//	get/set方法在spring注入时使用
	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	//判断是操作员是否存在
	public Toperator isOperator(String operatorName, String operatorPwd) {
		Toperator operator=null;
		Session session=factory.openSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Toperator t where t.operatorName='"+operatorName+"' and t.operatorPwd='"+operatorPwd+"'");
		List list=query.list();
		Iterator it=list.iterator();
		if(it.hasNext()){
			operator=(Toperator)it.next();
		}
		ts.commit();
		session.close();
		return operator;
	}
}
