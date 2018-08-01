package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.DeptPositionDao;
import com.accp.myoa.entity.DeptPosition;

@SuppressWarnings("unchecked")
public class DeptPositionDaoImpl extends BaseHibernateDao implements
		DeptPositionDao {

	@Override
	public void add(DeptPosition deptPosition) {
		super.getHibernateTemplate().save(deptPosition);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	@Override
	public DeptPosition load(int id) {
		return (DeptPosition) getHibernateTemplate().load(DeptPosition.class,
				id);
	}

	@Override
	public List<DeptPosition> loadList(DeptPosition deptPosition) {
		if (deptPosition != null) {
			return getHibernateTemplate().findByExample(deptPosition);
		}
		return getHibernateTemplate().loadAll(DeptPosition.class);
	}

	@Override
	public void update(DeptPosition deptPosition) {
		getHibernateTemplate().update(deptPosition);

	}

	@Override
	public List<DeptPosition> loadList(int deptId) {
		String hql = "from DeptPosition d where d.dept.deptId=?";
		return getHibernateTemplate().find(hql, deptId);
	}

	@Override
	public DeptPosition getDeptPosition(int deptId, int positionId) {
		String hql = "from DeptPosition d where d.dept.deptId=? and d.position.positionId=?";
		return (DeptPosition) getHibernateTemplate().find(hql,
				new Object[] { deptId, positionId }).get(0);
	}
	
	//查看部门职位（角色）信息 LEO
	@Override
	public List<DeptPosition> loatAll(){
		return this.getHibernateTemplate().loadAll(DeptPosition.class);
	}
	
	public List<DeptPosition> findByPage(int firstResult, int pageSize){
		return super.findByPage("from DeptPosition", firstResult, pageSize);
	}
	
	public int getCount(){
		return super.getCount("from DeptPosition");
	}
	
	public DeptPosition get(int id){
		return (DeptPosition)getHibernateTemplate().get(DeptPosition.class, id);
	}
}
