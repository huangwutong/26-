package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.common.TypeConverter;
import com.accp.myoa.dao.ScratchpadDao;
import com.accp.myoa.entity.Scratchpad;
import com.accp.myoa.entity.User;

@SuppressWarnings("unchecked")
public class ScratchpadDaoImpl extends BaseHibernateDao implements
		ScratchpadDao {

	@Override
	public void add(Scratchpad scratchpad) {
		super.getHibernateTemplate().save(scratchpad);
	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));
	}
	
	
	@Override
	public Scratchpad load(int id) {
		return (Scratchpad) getHibernateTemplate().load(Scratchpad.class, id);
	}

	@Override
	public List<Scratchpad> loadList(Scratchpad scratchpad) {
		if (scratchpad != null) {
			return getHibernateTemplate().findByExample(scratchpad);
		}
		return getHibernateTemplate().loadAll(Scratchpad.class);
	}

	@Override
	public void update(Scratchpad scratchpad) {
		getHibernateTemplate().update(scratchpad);

	}

	
	
	public List<Scratchpad> getScratchpadByDate(String year,String month,User user){
		String paramMonth=String.valueOf(Integer.parseInt(month)+1);
		String paramYear=year;
		if(month.equals("12")){
			paramYear=String.valueOf(Integer.parseInt(year)+1);
		}
		
		return super.getHibernateTemplate().
		find("from Scratchpad s where s.user.userId=? and s.scratchpadDate between ? and ?",
				new Object[]{user.getUserId(),TypeConverter.getStringDate(year+"-"+month+"-1"),TypeConverter.getStringDate(paramYear+"-"+paramMonth+"-1")}
				);
		
		}
	
	/**
	 * 管理日程里按日期获得那一天的日程
	 */
	@Override
	public List<Scratchpad> getScratchpadByDay(String year,String month, String day,String userId){
		return 	super.getHibernateTemplate().
			find("from Scratchpad s where year(s.scratchpadDate)=?"+
					" and month(s.scratchpadDate)=? and day(s.scratchpadDate)=? and s.user.userId=?",
					new Object[]{Integer.parseInt(year),Integer.parseInt(month),
					Integer.parseInt(day),Integer.parseInt(userId)});
		
	}

	//删除
	@Override
	public void delScratchpadByDate(int scratchpadId) {
		Scratchpad scratchpad=(Scratchpad)super.getHibernateTemplate().get(Scratchpad.class, scratchpadId);
		super.getHibernateTemplate().delete(scratchpad);
		
	}
	
	//添加
	@Override
	public boolean addScratchpad(Scratchpad scratchpad) {
		boolean flag=true;
		try{
			super.getHibernateTemplate().save(scratchpad);
			
		}catch(Exception e){
			flag=false;
		}
		return flag;
	}
	
	@Override
	public Scratchpad get(int id) {
		return (Scratchpad)super.getHibernateTemplate().get(Scratchpad.class, id);
	}
	
	//更新
	@Override
	public boolean updateScratchpad(Scratchpad scratchpad) {
		System.out.println(scratchpad.getScratchpadId());
		System.out.println(scratchpad.getScratchpadDate());
		System.out.println(scratchpad.getScratchpadTitle());
		boolean flag=true;
		try{
			super.getHibernateTemplate().update(scratchpad);
		}catch(Exception e){
			flag=false;
		}
		return flag;
	}

}
