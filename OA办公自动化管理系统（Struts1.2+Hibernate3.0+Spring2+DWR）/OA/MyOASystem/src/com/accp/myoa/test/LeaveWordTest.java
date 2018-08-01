package com.accp.myoa.test;

import java.util.Date;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.accp.myoa.entity.LeaveWord;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.LeaveWordService;

public class LeaveWordTest extends TestCase {
	ApplicationContext ac = new FileSystemXmlApplicationContext(new String[] {
			"/WebRoot/WEB-INF/applicationContext.xml",
			"/WebRoot/WEB-INF/applicationContext_dao.xml"
			 ,"/WebRoot/WEB-INF/applicationContext_service.xml",
			"/WebRoot/WEB-INF/applicationContext_action.xml" 
			});
	LeaveWordService leaveWordService = (LeaveWordService) ac.getBean("leaveWordService");
	public void testAdd(){
		LeaveWord leaveWord = new LeaveWord();
		leaveWord.setLeaveWordContent("fdsfsfdsfs");
		leaveWord.setLeaveWordDate(new Date());
		User user = new User();
		user.setUserId(3);
		leaveWord.setUser(user);
		leaveWordService.add(leaveWord);
		System.out.println("成功");
	}
}
