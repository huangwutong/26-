/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j;

import java.util.Date;
import java.util.List;

import dlog4j.formbean.BookMarkBean;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.ReplyForm;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

import net.sf.hibernate.Criteria;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.expression.Expression;
import net.sf.hibernate.expression.Order;

/**
 * @author Liudong
 * ��վע���û�������
 */
public class UserManager {

    public final static String PASSWORD_CRYPT_KEY = "_jdlog_des_key_";
    /**
     * �û������޸�
     * @param ssn
     * @param user
     * @return
     * @throws HibernateException
     */
    public static UserForm updateUser(Session ssn, UserForm user) throws HibernateException{
	    ssn.update(user);
	    return user;
    }
    /**
     * �����û�
     * @param ssn
     * @param user
     * @return
     * @throws HibernateException
     */
    public static UserForm createUser(Session ssn, UserForm user) throws HibernateException{
		if(user.getLogCount()<1)
		    user.setLoginCount(1);
		if(user.getRegTime()==null)
		    user.setRegTime(new Date());
		if(user.getLastTime()==null)
		    user.setLastTime(user.getRegTime());
		ssn.save(user);
		return user;
    }
    
    /**
     * ͨ���û�������ȡ�û����ϣ�����ע���û����ж��Ƿ�����
     * @param ssn
     * @param site
     * @param nickname
     * @return
     * @throws HibernateException
     */
    public static UserForm getUserByName(Session ssn, SiteForm site, String nickname) throws HibernateException
	{
        UserForm u = null;
		Criteria crit = ssn.createCriteria(UserForm.class);
		if(site!=null)
		    crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.add(Expression.eq("displayName",nickname));
		List users = crit.list();
		if(users.size()>0) 
		    return (UserForm)users.get(0);
		
		return null;        
	}
    
    /**
     * ��ȡ�û�����
     * @param ssn
     * @param site
     * @param loginName
     * @return
     * @throws HibernateException
     */
    public static UserForm getUser(Session ssn, SiteForm site, String loginName) throws HibernateException
    {
        UserForm u = null;
		Criteria crit = ssn.createCriteria(UserForm.class);
		if(site!=null)
		    crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		crit = crit.add(Expression.eq("loginName",loginName));
		List users = crit.list();
		if(users.size()>0) 
		    return (UserForm)users.get(0);
		
		return null;        
    }
	/**
	 * ����վע���û���Ϣ��ѯ(�÷�������members.jsp������ʾ���N��ע���û�)
	 * @param ssn
	 * @param site
	 * @param count
	 * @return
	 * @throws SQLException
	 */
	public static List listUsers(Session ssn, SiteForm site, int from, int count, String username)
		throws HibernateException {
		Criteria crit = ssn.createCriteria(UserForm.class);
		crit = crit.add(Expression.eq("site.id", new Integer(site.getId())));
		if(username!=null)
			crit = crit.add(Expression.like("displayName",'%'+username+'%'));
		crit = crit.addOrder(Order.desc("regTime"));
		if(from>0)
		    crit = crit.setFirstResult(from);
		if (count > 0)
			crit = crit.setMaxResults(count);
		return crit.list();
	}
	/**
	 * ����վע���û���Ϣ��ѯ(�÷�������members.jsp������ʾ���N��ע���û�)
	 * @param ssn
	 * @param site
	 * @param count
	 * @return
	 * @throws SQLException
	 */
	public static List listUsers(Session ssn, SiteForm site, int count, String username)
		throws HibernateException {
	    return listUsers(ssn,site,0,count,username);
	}
	/**
	 * ��ȡָ��վ��ĳ�������û�������(�÷��������ռǺ�̨�û�ά��user_list.jsp)
	 * @param ssn
	 * @param site
	 * @param role
	 * @return
	 * @throws HibernateException
	 */
	public static int getUserCount(Session ssn, SiteForm site, int role, String username) throws HibernateException
	{
	    Query query = null;
	    String hsql = " SELECT COUNT(user.id) FROM " + UserForm.class.getName() + " AS user WHERE user.site.id=?";
	    if(role!=-2)
	        hsql += " AND user.userRole=?";
	    if(username!=null)
	    	hsql += " AND user.displayName LIKE ?";
	    
	    query = ssn.createQuery(hsql);	        
		query.setInteger(0, site.getId());
	    if(role!=-2){
	        query.setInteger(1,role);
	        if(username!=null)
	        	query.setString(2, '%'+username+'%');
	    }
	    else if(username!=null)
	        query.setString(1, '%'+username+'%');
		List res = query.list();
		int uc = (res.size() > 0) ? ((Integer) res.get(0)).intValue() : 0;
	    return uc;
	}
	/**
	 * ��ȡĳ���û�����ϸ������Ϣ
	 * @param ssn
	 * @param userid
	 * @param withDetails
	 * @return
	 * @throws HibernateException
	 */
	public static UserForm getUser(Session ssn,int userid,boolean withDetails) throws HibernateException 
	{
		UserForm user =	(UserForm) ssn.load(UserForm.class, new Integer(userid));
		fillUserWithLogAndReplyCount(ssn, user, withDetails);
		return user;
	}
	
	/**
	 * ����û����ռǺ�������Ϣ��
	 * @param ssn
	 * @param user
	 * @param withLogsAndReplyies
	 * @throws HibernateException
	 */
	public static void fillUserWithLogAndReplyCount(Session ssn, UserForm user, boolean withLogsAndReplyies) throws HibernateException{
		if (user != null) {
			//����logs��replies����������lazy=true���Ա����ֹ�ȥ��ȡ����Ϣ
			//��ȡ��־��
			Query query = ssn.createQuery("SELECT COUNT(log.id) FROM "
						+ LogForm.class.getName()
						+ " AS log WHERE log.owner.id=? AND log.status<>?");
			query.setInteger(0, user.getId());
			query.setInteger(1, LogForm.STATUS_DELETED);
			List res = query.list();
			int logCount = (res.size()>0)?((Integer)res.get(0)).intValue():0;
			user.setLogCount(logCount);
			//��ȡ������
			Query query2 =ssn.createQuery("SELECT COUNT(reply.id) FROM "
						+ ReplyForm.class.getName()
						+ " AS reply WHERE reply.author.id=? AND reply.log.status<>?");
			query2.setInteger(0, user.getId());
			query2.setInteger(1, LogForm.STATUS_DELETED);
			List res2 = query2.list();
			int replyCount = (res2.size()>0)?((Integer)res2.get(0)).intValue():0;
			user.setReplyCount(replyCount);
			//��ȡ��ǩ��
			Query query3 =ssn.createQuery("SELECT COUNT(bm.id) FROM "
						+ BookMarkBean.class.getName()
						+ " AS bm WHERE bm.user.id=?");
			query2.setInteger(0, user.getId());
			res2 = query2.list();
			int bmCount = (res2.size()>0)?((Integer)res2.get(0)).intValue():0;
			user.setBookMarkCount(bmCount);

			if (withLogsAndReplyies) {
				user.setLogs(ssn.createCriteria(LogForm.class).add(
					Expression.eq("owner.id",new Integer(user.getId()))).addOrder(Order.desc("logTime")).list());
				user.setLogs(ssn.createCriteria(ReplyForm.class).add(
					Expression.eq("author.id",new Integer(user.getId()))).addOrder(Order.desc("writeTime")).list());
			}
		}
	}

}
