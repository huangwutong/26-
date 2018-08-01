package com.accp.myoa.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.accp.myoa.dao.CarDao;
import com.accp.myoa.entity.Car;

import junit.framework.TestCase;

public class CarDaoTest extends TestCase {

	ApplicationContext ac = new FileSystemXmlApplicationContext(new String[] {
			"/WebRoot/WEB-INF/applicationContext.xml",
			"/WebRoot/WEB-INF/applicationContext_dao.xml"
			/* ,"/WebRoot/WEB-INF/applicationContext_service.xml",
			"/WebRoot/WEB-INF/applicationContext_action.xml" */
			});
	CarDao cd = (CarDao) ac.getBean("carDao");

	public void testLoadList() {
		Car curcar = new Car();
		// curcar.setCarState(1);
		List<Car> list = cd.loadList(curcar);
		for (Car car : list) {
			System.out.println(car.getCarId() + " " + car.getCarNo() + " "
					+ car.getCarState());
		}
	}

	public void testLoad() {
		Car car = cd.load(2);
		//System.out.println(car.getCarNo() + " " + car.getCarState());
	}

	public void add() {
		Car car = new Car();
		car.setCarNo("1123123");
		car.setCarState(1);
		cd.add(car);
	}

	public void update() {
		Car car = cd.load(2);

		car.setCarState(1);
		cd.update(car);
		testLoadList();
	}
}
