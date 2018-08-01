
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DeptDao;
import com.accp.myoa.entity.Dept;

@SuppressWarnings("unchecked")
public class DeptDaoImpl extends BaseHibernateDao implements DeptDao {

	@Override
	public void add(Dept dept) {
		super.getHibernateTemplate().save(dept);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public Dept load(int id) {
		return (Dept)getHibernateTemplate().load(Dept.class, id);
	}

	@Override
	public List<Dept> loadList(Dept dept) {
		if (dept!=null) {
			return getHibernateTemplate().findByExample(dept);
		}
		return getHibernateTemplate().loadAll(Dept.class);
	}	

	@Override
	public void update(Dept dept) {
		getHibernateTemplate().update(dept);

	}
	
	//查看部门信息 LEO
	@Override
	public List<Dept> loadAll(){
		return this.getHibernateTemplate().loadAll(Dept.class);
	}

}






