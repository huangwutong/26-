package com.action.car;

import java.util.Date;

import com.java.Carbstb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.car.CarService;

public class SaveCarAction extends ActionSupport {

	private String carnum;
	private String brand;
	private String cmode;
	private String carkind;
	private String fconsu;
	private String enginum;
	private String framenum;
	private String carload;
	private String seatnum;
	private String driver;
	private Date buydate;
	private String buyunit;
	private Long buyprice;
	private Long initmile;
	private Long mainmile;
	private Long maincycle;
	private String departm;
	private String carstats;
	private String cardes;
	private CarService carService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Carbstb car =new Carbstb();
		car.setBrand(brand.trim());
		car.setBuydate(buydate);
		car.setBuyprice(buyprice);
		car.setBuyunit(buyunit.trim());
		car.setCardes(cardes.trim());
		car.setCarkind(carkind.trim());
		car.setCarload(carload.trim());
		car.setCarnum(carnum.trim());
		car.setCarstats(carstats.trim());
		car.setCmode(cmode.trim());
		car.setDepartm(departm.trim());
		car.setDriver(driver.trim());
		car.setEnginum(enginum.trim());
		car.setFconsu(fconsu.trim());
		car.setFramenum(framenum.trim());
		car.setInitmile(initmile);
		car.setMaincycle(maincycle);
		car.setMainmile(mainmile);
		car.setSeatnum(seatnum.trim());
		addActionMessage("数据保存成功！");
		carService.saveCar(car);
		
		return SUCCESS;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCmode() {
		return cmode;
	}
	public void setCmode(String cmode) {
		this.cmode = cmode;
	}
	public String getCarkind() {
		return carkind;
	}
	public void setCarkind(String carkind) {
		this.carkind = carkind;
	}
	public String getFconsu() {
		return fconsu;
	}
	public void setFconsu(String fconsu) {
		this.fconsu = fconsu;
	}
	public String getEnginum() {
		return enginum;
	}
	public void setEnginum(String enginum) {
		this.enginum = enginum;
	}
	public String getFramenum() {
		return framenum;
	}
	public void setFramenum(String framenum) {
		this.framenum = framenum;
	}
	public String getCarload() {
		return carload;
	}
	public void setCarload(String carload) {
		this.carload = carload;
	}
	public String getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	public String getBuyunit() {
		return buyunit;
	}
	public void setBuyunit(String buyunit) {
		this.buyunit = buyunit;
	}
	public Long getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(Long buyprice) {
		this.buyprice = buyprice;
	}
	public Long getInitmile() {
		return initmile;
	}
	public void setInitmile(Long initmile) {
		this.initmile = initmile;
	}
	public Long getMainmile() {
		return mainmile;
	}
	public void setMainmile(Long mainmile) {
		this.mainmile = mainmile;
	}
	public Long getMaincycle() {
		return maincycle;
	}
	public void setMaincycle(Long maincycle) {
		this.maincycle = maincycle;
	}
	public String getDepartm() {
		return departm;
	}
	public void setDepartm(String departm) {
		this.departm = departm;
	}
	public String getCarstats() {
		return carstats;
	}
	public void setCarstats(String carstats) {
		this.carstats = carstats;
	}
	public String getCardes() {
		return cardes;
	}
	public void setCardes(String cardes) {
		this.cardes = cardes;
	}
	public CarService getCarService() {
		return carService;
	}
	public void setCarService(CarService carService) {
		this.carService = carService;
	}

}
