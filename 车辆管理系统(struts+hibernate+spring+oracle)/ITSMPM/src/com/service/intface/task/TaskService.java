package com.service.intface.task;

import java.sql.Date;
import java.util.List;

import com.java.Driverm;
import com.java.Outcm;
import com.java.Ucapli;

public interface TaskService {

	public List getUcapliAll();
	public List getOutcmAll();
	public List getOutcmByUcapliId(Long id);
	public List getOutcmAllBywhincom(String whcar);//是否派车
	public List getOutcmBywhincom(String whincom);//是否收车
	public void saveUca(Ucapli uca);
	public void upUca(Ucapli uca);
	public void deleUca(Ucapli uca);
	public Ucapli QueryUcapliById(Long id);
	public Outcm QueryOutcmById(Long id);
	public void deleOutcm(Outcm uca);
	
	public List getUcapliSp(String appstats,String whcar);
	
	public List DriverSelect(String stats);
	public List CarSelect(String stats);
	public String saveOutcm(Long carbstbid,Long drivermid,Long ucapliid);
	public String saveTaskincar(Long carbstbid,Long drivermid,Long outcmid,Date sjincomdate);
	//驾驶员
	public Driverm QueryDrivermById(Long id);
}
