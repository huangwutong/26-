package com.service.impl.task;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.dao.DrivermDAO;
import com.dao.OutcmDAO;
import com.dao.UcapliDAO;
import com.java.Driverm;
import com.java.Outcm;
import com.java.Ucapli;
import com.service.intface.task.TaskService;

public class TaskServiceImpl implements TaskService {

	private UcapliDAO ucapliDAO;
	private DrivermDAO drivermDAO;
	private OutcmDAO outcmDAO;
	
	public OutcmDAO getOutcmDAO() {
		return outcmDAO;
	}
	public void setOutcmDAO(OutcmDAO outcmDAO) {
		this.outcmDAO = outcmDAO;
	}
	public DrivermDAO getDrivermDAO() {
		return drivermDAO;
	}
	public void setDrivermDAO(DrivermDAO drivermDAO) {
		this.drivermDAO = drivermDAO;
	}
	public List getUcapliAll() {
		// TODO Auto-generated method stub
		return ucapliDAO.findAll();
	}
	public UcapliDAO getUcapliDAO() {
		return ucapliDAO;
	}
	public void setUcapliDAO(UcapliDAO ucapliDAO) {
		this.ucapliDAO = ucapliDAO;
	}
	
	public void deleUca(Ucapli uca) {
		// TODO Auto-generated method stub
		ucapliDAO.delete(uca);
	}
	public Ucapli QueryUcapliById(Long id) {
		// TODO Auto-generated method stub
		return ucapliDAO.findById(id);
	}
	public void saveUca(Ucapli uca) {
		// TODO Auto-generated method stub
		ucapliDAO.save(uca);
	}
	public List getUcapliSp(String appstats,String whcar) {
		// TODO Auto-generated method stub
		return ucapliDAO.findAllBySp(appstats, whcar);
	}
	public void upUca(Ucapli uca) {
		// TODO Auto-generated method stub
		ucapliDAO.merge(uca);
	}
	public List CarSelect(String stats) {
		// TODO Auto-generated method stub
		return ucapliDAO.findCar(stats);
	}
	public List DriverSelect(String stats) {
		// TODO Auto-generated method stub
		return ucapliDAO.findDri(stats);
	}
	public Driverm QueryDrivermById(Long id) {
		// TODO Auto-generated method stub
		return drivermDAO.findById(id);
	}
	public String saveOutcm(Long carbstbid,Long drivermid,Long ucapliid) {
		// TODO Auto-generated method stub
		String s="";
		try {
			s = outcmDAO.saveOutcm(carbstbid,drivermid,ucapliid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
	public List getOutcmAll() {
		// TODO Auto-generated method stub
		return outcmDAO.findAll();
	}
	public void deleOutcm(Outcm uca) {
		// TODO Auto-generated method stub
		outcmDAO.delete(uca);
	}
	public Outcm QueryOutcmById(Long id) {
		// TODO Auto-generated method stub
		return outcmDAO.findById(id);
	}
	public List getOutcmAllBywhincom(String whcar) {
		// TODO Auto-generated method stub
		return outcmDAO.findAllBywhincom(whcar);
	}
	public List getOutcmByUcapliId(Long id) {
		// TODO Auto-generated method stub
		return outcmDAO.findByUcaId(id);
	}
	public List getOutcmBywhincom(String whincom) {
		// TODO Auto-generated method stub
		return outcmDAO.findByWhincom(whincom);
	}
	public String saveTaskincar(Long carbstbid, Long drivermid,
			Long outcmid, Date sjincomdate) {
		// TODO Auto-generated method stub
		try {
			return outcmDAO.saveTaskincar(carbstbid, drivermid,outcmid, sjincomdate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	

}
