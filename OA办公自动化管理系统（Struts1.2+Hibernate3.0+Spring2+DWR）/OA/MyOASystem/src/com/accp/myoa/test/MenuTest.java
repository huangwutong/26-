package com.accp.myoa.test;

import java.util.List;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.accp.myoa.entity.Dept;
import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.entity.Menu;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.EmailService;
import com.accp.myoa.service.MenuService;

public class MenuTest extends TestCase {
	ApplicationContext ac = new FileSystemXmlApplicationContext(new String[] {
			"/WebRoot/WEB-INF/applicationContext.xml",
			"/WebRoot/WEB-INF/applicationContext_dao.xml"
			 ,"/WebRoot/WEB-INF/applicationContext_service.xml",
			"/WebRoot/WEB-INF/applicationContext_action.xml" 
			});
	MenuService menuService = (MenuService) ac.getBean("menuService");
	public void testMenu(){
		User user = new User();
		user.setUserId(3);
		
		DeptPosition dp=new DeptPosition();
		dp.setDeptPositionId(1);
		user.setDeptPosition(dp);		
		List<Menu> menus = menuService.getMainMenu(user);
		for(int i=0;i<menus.size();i++){
			System.out.println(menus.get(i).getMenuName());
		}
	}
	
	public void testEmail(){
		EmailService emailService= (EmailService) ac.getBean("emailService");
		List<Dept> list=emailService.getDept();
		for(Dept de:list){
			System.out.println(de.getDeptName());
		}
		
	}
}
