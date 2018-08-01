package com.xh369.daoimpl;

import com.xh369.dao.AdminDAO;
import com.xh369.dto.Admin;
import com.xh369.dto.Popedom;
import java.util.List;
import org.springframework.orm.hibernate3.support.*;

public class AdminDAOimpl extends HibernateDaoSupport implements AdminDAO{

    //登录
    public int getLogin(Admin admin){
    	
    	int count = -1;
        try {
            String hql = "select count(*) from Admin as admin where admin.username=? and admin.pwd=?";
            Object[] val = {admin.getUsername(), admin.getPwd()};
            int cou = Integer.parseInt(getHibernateTemplate().find(hql, val)
                           .get(0)
                           .toString()
                           );
            return count = cou > 0 ?cou:-1;
        } catch (Exception ex) {
            ex.printStackTrace();
            return count;
        }
    }

    //查询管理人员列表
    public List getAdminList(){

         try {
             return getHibernateTemplate().find("from Admin as admin");
         } catch (Exception ex) {
             ex.printStackTrace();
             return null;
         }
     }

    //添加管理人员
    public boolean insertAdmin(Admin admin){

        try{
            getHibernateTemplate().save(admin);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
    
    //查询用户已拥有的权限
	public Admin getPopedom(Integer id) {
		
		try {
			return  (Admin) getHibernateTemplate().load(Admin.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//查询权限
	public List getAllPopedom() {
		
		try {
			String hql = "from Popedom as popedom";
			return getHibernateTemplate().find(hql);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//修改用户权限
	public boolean updatePopedom(Integer id, StringBuffer sb) {
		
		try {
			Admin admin = (Admin) getHibernateTemplate().load(Admin.class, id);
			admin.setLevel(sb.toString());
			getHibernateTemplate().update(admin);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	//删除用户
	public boolean delAdmin(Integer id) {
		
		try {
			Admin admin = (Admin) getHibernateTemplate().load(Admin.class, id);
			getHibernateTemplate().delete(admin);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
