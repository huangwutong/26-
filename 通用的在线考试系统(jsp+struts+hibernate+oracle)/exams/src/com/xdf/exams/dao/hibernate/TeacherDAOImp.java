package com.xdf.exams.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.xdf.exams.bean.Teacher;
import com.xdf.exams.dao.ITeacherDAO;

public class TeacherDAOImp extends BaseDAO implements ITeacherDAO{

	public List findAllTeacher() {
		return getSession().createQuery("from Teacher order by id").list();
	}

	public List findAllTeacher(int pageno,int pagesize) {
		return getSession()
			.createQuery("from Teacher order by id")
			.setFirstResult(pagesize*(pageno-1))
			.setMaxResults(pagesize)
			.list();
	}

	public int findTeachernum() {
		Query q = getSession().createQuery("select count(*) from Teacher");
		List list = q.list();
		Integer a = (Integer)list.get(0);
		return a.intValue();
	}

	public Teacher teacherlogin(String username, String password) {
		
		Query q = getSession().createQuery("from Teacher t where t.username=? and t.password=?");
		q.setString(0,username);
		q.setString(1,password);
		List list = q.list();
		if(list.size()==0)
			return null;
		else			
			return (Teacher)list.get(0);
	}

}
