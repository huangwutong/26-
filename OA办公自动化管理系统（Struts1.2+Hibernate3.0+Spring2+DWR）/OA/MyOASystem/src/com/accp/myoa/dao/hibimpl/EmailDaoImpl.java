
package com.accp.myoa.dao.hibimpl;

import java.util.ArrayList;
import java.util.List;

import com.accp.myoa.dao.EmailDao;
import com.accp.myoa.entity.Dept;
import com.accp.myoa.entity.Email;
import com.accp.myoa.entity.EmailReceivce;
import com.accp.myoa.entity.User;

@SuppressWarnings("unchecked")
public class EmailDaoImpl extends BaseHibernateDao implements EmailDao {

	@Override
	public void add(Email email) {
		super.getHibernateTemplate().save(email);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Email load(int id) {
		return (Email)getHibernateTemplate().load(Email.class, id);
	}

	@Override
	public List<Email> loadList(Email email) {
		if (email!=null) {
			return getHibernateTemplate().findByExample(email);
		}
		return getHibernateTemplate().loadAll(Email.class);
	}	

	@Override
	public void update(Email email) {
		getHibernateTemplate().update(email);

	}
	
	/*
	 * (获得该用户id的未删除的邮件，已作排序处理)
	 * @see com.oa.dao.EmailDao#getEmailByUser(int, int, int)
	 */
	@Override
	public List<EmailReceivce> getEmailByUser(int id,int firstResult,int pageSize ) {
		return  super.findByPage("from EmailReceivce  e where e.user.userId=? and e.emailState<>2 order by e.email.emailDate desc,e.emailState asc",id, firstResult, pageSize);
	
	}
	
	/*
	 * (获得该用户id的未删除的总邮件数)
	 * @see com.oa.dao.EmailDao#getCount(int)
	 */
	@Override
	public  int getCount(int id) {
		List<EmailReceivce> list=  super.getHibernateTemplate().find("from EmailReceivce e where e.user.userId=? and e.emailState<>2", id);
		
		  return list.size();
	}
	
	/*
	 * (获得未读的邮件的总数)
	 * @see com.oa.dao.EmailDao#getCountUnRead(int)
	 */
	@Override
	public int getCountUnRead(int id) {
		List<EmailReceivce> list=  super.getHibernateTemplate().find("from EmailReceivce e where e.user.userId=? and e.emailState=0", id);
		
		  return list.size();
	}
	/*
	 * (删除)
	 * @see com.oa.dao.EmailDao#emailFalseDelete(java.lang.String[])
	 */
	@Override
 public  boolean emailFalseDelete(String[] str) {
		boolean flag=true;
		
		try{
			for(int i=0;i<str.length;i++){
				EmailReceivce email=new EmailReceivce();
			   email=(EmailReceivce)super.getHibernateTemplate().get(EmailReceivce.class,Integer.parseInt(str[i]));
			  
			   email.setEmailState(2);
			  
			   super.getHibernateTemplate().update(email);
			   
			  
			}
		}catch(Exception e){
			flag=false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	/*
	 * (彻底删除)
	 * @see com.oa.dao.EmailDao#emailTrueDelete(java.lang.String[])
	 */
	@Override
	public boolean emailTrueDelete(String[] str) {
		boolean flag=true;
		try{
			for(int i=0;i<str.length;i++){
				EmailReceivce email=new EmailReceivce();
			   email=(EmailReceivce)super.getHibernateTemplate().get(EmailReceivce.class,Integer.parseInt(str[i]));
			   int id=email.getEmail().getEmailId();//emailId
			   List<EmailReceivce> list=(List<EmailReceivce>)super.getHibernateTemplate().find("from EmailReceivce e where e.email.emailId=?",id);
			   if(list.size()==1){//如果是最后一个人有这封邮件，厕要清除Email表中的内容
				   super.getHibernateTemplate().delete(email);
				  Email em= (Email)super.getHibernateTemplate().get(Email.class, id);
				   super.getHibernateTemplate().delete(em);
			   }else{
				   super.getHibernateTemplate().delete(email);
			   }
			   
			}
		}catch(Exception e){
			flag=false;
			
		}
		
		return flag;
	}

	@Override
	public List<EmailReceivce> getDeleteEmailByUser(int id, int firstResult,
			int pageSize) {
		return  super.findByPage("from EmailReceivce  e where e.user.userId=? and e.emailState=2 order by e.email.emailDate desc,e.emailState asc",id, firstResult, pageSize);
		
	}

	@Override
	public int getDeleteEmailCount(int id) {
		List<EmailReceivce> list=  super.getHibernateTemplate().find("from EmailReceivce e where e.user.userId=? and e.emailState=2", id);
		
		  return list.size();
	}
	
	/**
	 * 通过emailId获得Email
	 */
	@Override
	public Email getEmailById(int id) {
		return (Email)super.getHibernateTemplate().get(Email.class, id);
	}
	
	/**
	 * 通过emailId
	 */
	@Override
	public List<String> getSendEmailUserByEmailId(int id,int uid) {
		List<EmailReceivce> er=super.getHibernateTemplate().find("from EmailReceivce e where e.email.emailId=? and e.user.userId<>?",new Integer []{id,uid});
		
		List<String> list=new ArrayList<String>();
		for(EmailReceivce email:er){
			list.add(email.getUser().getUserName()+"("+email.getUser().getDeptPosition().getDept().getDeptName()+")");
		}
		return list;
	}

	/**
	 * 获得全部部门
	 */
	public List<Dept> getDept() {
		//System.out.println("aaaa");
		return super.getHibernateTemplate().find("from Dept");
	}

	@Override
	public List<User> getUserByDeptId(int id) {
		return super.getHibernateTemplate().find("from User u where u.deptPosition.dept.deptId=?",id);
		
	}

	@Override
	public boolean addEmail(Email email,String str) {
		boolean flag=true;
		try{
			String []strs=str.split(";");
			int id=(Integer)super.getHibernateTemplate().save("Email", email);
			for(String userid:strs){
				EmailReceivce emailReceivce=new EmailReceivce();
				
				Email em=new Email();
				em.setEmailId(id);
				
				User user=new User();
				System.out.println(Integer.parseInt(userid));
				user.setUserId(Integer.parseInt(userid));
				
				
				emailReceivce.setEmail(em);
				emailReceivce.setUser(user);
				emailReceivce.setEmailState(0);
				
				super.getHibernateTemplate().save("EmailReceivce",emailReceivce);
			}
		}catch(Exception e){
			e.printStackTrace();
			flag=false;
		}
		return flag;
		
	}
	
	/***
	 * 改变邮件状态(改为已读)
	 */
	@Override
	public void changeEmailReceivceState(User user, int emailId) {
		
		List<EmailReceivce> list=super.getHibernateTemplate().find("from EmailReceivce e where email.emailId=? and user.userId=?",
				new Object[]{emailId,user.getUserId()}
		);
		EmailReceivce er=list.get(0);
		er.setEmailState(1);
		super.getHibernateTemplate().update(er);
		
	}

}






