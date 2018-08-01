package com.accp.myoa.dao.hibimpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.accp.myoa.dao.MenuDao;
import com.accp.myoa.entity.Menu;
import com.accp.myoa.entity.PositionPopedom;
import com.accp.myoa.entity.User;

public class MenuDaoImpl extends BaseHibernateDao implements MenuDao {
	private List<Menu> menus=new ArrayList<Menu>();
	@Override
	public List<Menu> getMenu(int id,User user) {
		menus.clear();
		
		getLevelMenu(id);
		
		List<PositionPopedom> pp=super.getHibernateTemplate().find("from PositionPopedom p where p.deptPosition.deptPositionId=? and p.menuState=1",user.getDeptPosition().getDeptPositionId());
		
		for(Iterator iterator=menus.iterator();iterator.hasNext();){
			boolean flag=false;
			Menu mm=(Menu)iterator.next();
			
			for(PositionPopedom po:pp){
				if(po.getMenu().getMenuId().equals(mm.getMenuId())){
					flag=true;
				}
			}
			if(!flag){
				iterator.remove();
			}
		}
		
		return menus;
	}
	
	private void getLevelMenu(int id){
		List<Menu> first=super.getHibernateTemplate().find("from Menu m where m.menuId=? ",id);
		for(Menu second:first){
			menus.add(second);
			List<Menu> flag=super.getHibernateTemplate().find("from Menu m where m.menuParentId=? ",second.getMenuId());
			if(flag.size()>0){
				for(Menu third:flag){
					getLevelMenu(third.getMenuId());
				}
			}
		}
	}

	@Override
	public List<Menu> getMainMenu(User user) {
		//String str="from User";
		//Usuper.getHibernateTemplate().get(User.class, user.getUserId());
		List<Menu> menu=new ArrayList<Menu>();
		String hql="from PositionPopedom p where p.deptPosition.deptPositionId=? and p.menu.menuParentId=0 and p.menuState=1";
		List<PositionPopedom> pp= super.getHibernateTemplate().find(hql,user.getDeptPosition().getDeptPositionId());
		for(PositionPopedom p:pp){
			menu.add(p.getMenu());
		}
		return menu;
	}
	
	
	//获得父节点为0的第一个menu 的id
	@Override
	public int getMenuId(User user) {
		List<Integer> ids= (List<Integer>)super.getHibernateTemplate().find("select  p.menu.menuId from PositionPopedom p" +
				" where p.deptPosition.deptPositionId=? and p.menu.menuParentId=0",user.getDeptPosition().getDeptPositionId());
		if(ids.size()>0){
			return (int)ids.get(0);
		}else{
			return 0;
		}
		
	}

}
