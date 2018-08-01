
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.UserDao;
import com.accp.myoa.entity.User;

@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseHibernateDao implements UserDao {

	@Override
	public void add(User user) {
		super.getHibernateTemplate().save(user);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public User load(int id) {
		return (User)getHibernateTemplate().load(User.class, id);
	}
	
	public User get(int id) {
		return (User)getHibernateTemplate().get(User.class, id);
	}

	@Override
	public List<User> loadList(User user) {
		if (user!=null) {
			return getHibernateTemplate().findByExample(user);
		}
		return getHibernateTemplate().loadAll(User.class);
	}	

	@Override
	public void update(User user) {
		getHibernateTemplate().update(user);

	}

	
	//下面是新加的内容
	
	@Override
	public User getByNameAndPwd(User user) {
		String hql="from User u where u.loginName=? and u.password=?";
		String [] params=new String []{user.getLoginName(),user.getPassword()};
		List<User> userList = super.getHibernateTemplate().find(hql,params);
		
		if(userList.size()==0){
			return null;
		}else{
			User one=userList.get(0);
			return one;
		}
	}
	
	@Override
	public boolean modifyPwd(User user) {
		boolean flag=true;
		try{
			User one=(User)super.getHibernateTemplate().get(User.class, user.getUserId());
			one.setPassword(user.getPassword());
			super.getHibernateTemplate().update(one);
		}catch(Exception e){
			e.printStackTrace();
			flag= false;
		}
		return flag;
	}
	
	/**
	 * 
	 */
	public String getUser(String str){
		System.out.println(str);
		return str+"aa";
	}
	
}






