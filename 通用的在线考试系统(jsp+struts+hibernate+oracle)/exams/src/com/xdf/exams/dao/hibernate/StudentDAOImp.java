package com.xdf.exams.dao.hibernate;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.xdf.exams.bean.Student;
import com.xdf.exams.dao.IStudentDAO;

public class StudentDAOImp extends BaseDAO implements IStudentDAO{

	public List findAllStudent() {
		return getSession()
		.createQuery("from Student order by id")
		.list();
	}

	public List findAllStudent(int pageno, int pagesize) {
		return getSession()
		.createQuery("from Student order by id")
		.setFirstResult((pageno-1)*pagesize)
		.setMaxResults(pagesize)
		.list();
	}

	public List findStudentByName(String name, int pageno, int pagesize) {
		Criteria c = getSession().createCriteria(Student.class);
		if (name!=null&&!name.equals("")) {
			c.add(Restrictions.like("name","%"+name+"%"));
		}
		c.addOrder(Order.asc("studentid"));
		c.setFirstResult((pageno-1)*pagesize);
		c.setMaxResults(pagesize);
		return c.list();
	}

	public int findStudentnum() {
		Query q = getSession().createQuery("select count(*) from Student");
		List list = q.list();
		Integer a = (Integer)list.get(0);
		return a.intValue();
	}

	public int findStudentnumByName(String name) {
		Criteria c = getSession().createCriteria(Student.class);
		if (name!=null&&!name.equals("")) {
			c.add(Restrictions.like("name","%"+name+"%"));
		}
		c.setProjection(Projections.rowCount());
		List list =c.list();
		Integer a = (Integer)list.get(0);
		return a.intValue();
	}

	public Student studentlogin(String username, String password) {
		Query q = getSession().createQuery("from Student t where t.username=? and t.password=?");
		q.setString(0,username);
		q.setString(1,password);
		List list = q.list();
		if(list.size()==0)
			return null;
		else			
			return (Student)list.get(0);
	}
	public boolean checkStudentNameExists(String name,Long id) {
		Criteria c = getSession().createCriteria(Student.class);
		c.add(Restrictions.eq("username",name));
		if(id!=null) {
			c.add(Restrictions.ne("studentid",id));
		}
		List list = c.list();
		if(list.size()==0) {
			return false;
		}else {
			return true;
		}
	}
}
