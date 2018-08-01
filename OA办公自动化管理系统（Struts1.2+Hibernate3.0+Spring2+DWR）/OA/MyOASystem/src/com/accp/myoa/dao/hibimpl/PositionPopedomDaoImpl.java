
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.PositionPopedomDao;
import com.accp.myoa.entity.PositionPopedom;

@SuppressWarnings("unchecked")
public class PositionPopedomDaoImpl extends BaseHibernateDao implements PositionPopedomDao {

	@Override
	public void add(PositionPopedom positionPopedom) {
		super.getHibernateTemplate().save(positionPopedom);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public PositionPopedom load(int id) {
		return (PositionPopedom)getHibernateTemplate().load(PositionPopedom.class, id);
	}

	@Override
	public List<PositionPopedom> loadList(PositionPopedom positionPopedom) {
		if (positionPopedom!=null) {
			return getHibernateTemplate().findByExample(positionPopedom);
		}
		return getHibernateTemplate().loadAll(PositionPopedom.class);
	}	

	@Override
	public void update(PositionPopedom positionPopedom) {
		getHibernateTemplate().update(positionPopedom);

	}
	
	//查看权限信息 LEO
	public List<PositionPopedom> findByPage(int firstResult, int pageSize){
		return super.findByPage("from PositionPopedom", firstResult, pageSize);
	}
	
	public int getCount(){
		return super.getCount("from PositionPopedom");
	}
	
	public PositionPopedom get(int id){
		return (PositionPopedom)getHibernateTemplate().get(PositionPopedom.class, id);
	}
	
	public List<PositionPopedom> loadAll(){
		return this.getHibernateTemplate().loadAll(PositionPopedom.class);
	}
}






