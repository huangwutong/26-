package com.action.print;

import java.lang.reflect.Field;
import java.util.Date;

import com.java.Carbstb;

public class MainmBean {

	//保养信息
	private String carnum;//车牌号
	private Date maindate;//保养日期
	private String mainkind;//保养类别
	private String mainemp;//经办人
	private String mloca;//保养点
	private Long mje;//金额
	private Long mamile;//保养里程
	private String maxm;//保养项目
	private String mades;//备注
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public Date getMaindate() {
		return maindate;
	}
	public void setMaindate(Date maindate) {
		this.maindate = maindate;
	}
	public String getMainkind() {
		return mainkind;
	}
	public void setMainkind(String mainkind) {
		this.mainkind = mainkind;
	}
	public String getMainemp() {
		return mainemp;
	}
	public void setMainemp(String mainemp) {
		this.mainemp = mainemp;
	}
	public String getMloca() {
		return mloca;
	}
	public void setMloca(String mloca) {
		this.mloca = mloca;
	}
	public Long getMje() {
		return mje;
	}
	public void setMje(Long mje) {
		this.mje = mje;
	}
	public Long getMamile() {
		return mamile;
	}
	public void setMamile(Long mamile) {
		this.mamile = mamile;
	}
	public String getMaxm() {
		return maxm;
	}
	public void setMaxm(String maxm) {
		this.maxm = maxm;
	}
	public String getMades() {
		return mades;
	}
	public void setMades(String mades) {
		this.mades = mades;
	}
	/*public static void main(String[] args) throws SecurityException, ClassNotFoundException, IllegalArgumentException, IllegalAccessException   
	 {   
	  MainmBean obj = new MainmBean();   
	  obj.setCarnum("123"); 
	  obj.setMades("456");  
	  Field[] fds = Class.forName   
	  ("com.action.print.MainmBean").getDeclaredFields();   
	     
	  System.out.println(fds.length);   
	  for(int i=0;i<fds.length;i++)   
	  {   
	   System.out.println(fds[i].getName());   
	      
	  }   
	 } */  
}
