package com.accp.myoa.test;

import java.util.List;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.accp.myoa.entity.Position;
import com.accp.myoa.service.PositionService;

public class PositionTest extends TestCase {
	ApplicationContext ac = new FileSystemXmlApplicationContext(new String[] {
			"/WebRoot/WEB-INF/applicationContext.xml",
			"/WebRoot/WEB-INF/applicationContext_dao.xml"
			 ,"/WebRoot/WEB-INF/applicationContext_service.xml",
			"/WebRoot/WEB-INF/applicationContext_action.xml" 
			});
	PositionService positionService = (PositionService) ac.getBean("positionService");
	public void testGetPositions(){
		List<Position> positions = positionService.loadPositions(4);
		for (int i = 0; i < positions.size(); i++) {
			System.out.println(positions.get(i).getPositionName());
		}
	}
}
