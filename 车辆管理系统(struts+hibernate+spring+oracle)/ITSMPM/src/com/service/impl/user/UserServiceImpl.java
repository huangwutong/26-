package com.service.impl.user;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.dao.CompsDAO;
import com.dao.RPDAO;
import com.dao.ResPDAO;
import com.dao.ResfunDAO;
import com.dao.RoletbDAO;
import com.dao.URDAO;
import com.dao.XxuserDAO;
import com.java.Comps;
import com.java.RP;
import com.java.ResP;
import com.java.Resfun;
import com.java.Roletb;
import com.java.UR;
import com.java.Xxuser;
import com.service.intface.user.UserService;

public class UserServiceImpl implements UserService {

	private XxuserDAO xxuserDAO;
	private RoletbDAO roletbDAO;
	private URDAO urDAO;
	private RPDAO rpDAO;
	private CompsDAO compsDAO;
	private ResPDAO respDAO;
	private ResfunDAO resfunDAO;
	
	public RPDAO getRpDAO() {
		return rpDAO;
	}

	public ResfunDAO getResfunDAO() {
		return resfunDAO;
	}

	public void setResfunDAO(ResfunDAO resfunDAO) {
		this.resfunDAO = resfunDAO;
	}

	public ResPDAO getRespDAO() {
		return respDAO;
	}

	public void setRespDAO(ResPDAO respDAO) {
		this.respDAO = respDAO;
	}

	public void setRpDAO(RPDAO rpDAO) {
		this.rpDAO = rpDAO;
	}

	public CompsDAO getCompsDAO() {
		return compsDAO;
	}

	public void setCompsDAO(CompsDAO compsDAO) {
		this.compsDAO = compsDAO;
	}

	
	public List getUserAll() {
		// TODO Auto-generated method stub
		return xxuserDAO.findAll();
	}
	
	public URDAO getUrDAO() {
		return urDAO;
	}

	public void setUrDAO(URDAO urDAO) {
		this.urDAO = urDAO;
	}

	public XxuserDAO getXxuserDAO() {
		return xxuserDAO;
	}
	public void setXxuserDAO(XxuserDAO xxuserDAO) {
		this.xxuserDAO = xxuserDAO;
	}

	public RoletbDAO getRoletbDAO() {
		return roletbDAO;
	}

	public void setRoletbDAO(RoletbDAO roletbDAO) {
		this.roletbDAO = roletbDAO;
	}

	public void saveUser(Xxuser xxuser) {
		// TODO Auto-generated method stub
		xxuserDAO.save(xxuser);
	}

	public Xxuser QueryXxuserById(Long id) {
		// TODO Auto-generated method stub
		return xxuserDAO.findById(id);
	}

	public void deleXxuser(Xxuser xxuser) {
		// TODO Auto-generated method stub
		xxuserDAO.delete(xxuser);
	}

	public List getRoleAll() {
		// TODO Auto-generated method stub
		List  temp = new ArrayList ();
		temp = roletbDAO.findAll();
		return temp;
	}

	public Roletb QueryRoletbById(Long id) {
		// TODO Auto-generated method stub
		return roletbDAO.findById(id);
	}

	public void SaveUR(UR ur) {
		// TODO Auto-generated method stub
		urDAO.save(ur);
	}

	public List getURAll() {
		// TODO Auto-generated method stub
		return urDAO.findAll();
	}

	public UR QueryURById(Long id) {
		// TODO Auto-generated method stub
		return urDAO.findById(id);
	}

	public void deleUR(UR ur) {
		// TODO Auto-generated method stub
		urDAO.delete(ur);
	}

	public void SaveRoletb(Roletb rol) {
		// TODO Auto-generated method stub
		roletbDAO.save(rol);
	}

	public void deleRoletb(Roletb rol) {
		// TODO Auto-generated method stub
		roletbDAO.delete(rol);
	}

	public RP QueryRPById(Long id) {
		// TODO Auto-generated method stub
		return rpDAO.findById(id);
	}

	public void SaveRP(RP rp) {
		// TODO Auto-generated method stub
		rpDAO.save(rp);
	}

	public void deleRP(RP rp) {
		// TODO Auto-generated method stub
		rpDAO.delete(rp);
	}

	public List getRPAll() {
		// TODO Auto-generated method stub
		return rpDAO.findAll();
	}

	public List getCompsAll() {
		// TODO Auto-generated method stub
		return compsDAO.findAll();
	}

	public Comps QueryCompsById(Long id) {
		// TODO Auto-generated method stub
		return compsDAO.findById(id);
	}

	public void deleComps(Comps cm) {
		// TODO Auto-generated method stub
		compsDAO.delete(cm);
	}

	public void SaveComps(Comps cm) {
		// TODO Auto-generated method stub
		compsDAO.save(cm);
	}

	public List getRespAll() {
		// TODO Auto-generated method stub
		return respDAO.findAll();
	}

	public void deleResP(ResP cm) {
		// TODO Auto-generated method stub
		respDAO.delete(cm);
	}

	public ResP QueryResPById(Long id) {
		// TODO Auto-generated method stub
		return respDAO.findById(id);
	}

	public void SaveResP(ResP cm) {
		// TODO Auto-generated method stub
		respDAO.save(cm);
	}

	public Resfun QueryResfunById(Long id) {
		// TODO Auto-generated method stub
		return resfunDAO.findById(id);
	}

	public void SaveResfun(Resfun cm) {
		// TODO Auto-generated method stub
		resfunDAO.save(cm);
	}

	public void deleResfun(Resfun cm) {
		// TODO Auto-generated method stub
		resfunDAO.delete(cm);
	}

	public List getResfunAll() {
		// TODO Auto-generated method stub
		return resfunDAO.findAll();
	}

	public void upComps(Comps xxuser) {
		// TODO Auto-generated method stub
		compsDAO.merge(xxuser);
	}

	public void upResfun(Resfun xxuser) {
		// TODO Auto-generated method stub
		resfunDAO.merge(xxuser);
	}

	public void upRoletb(Roletb xxuser) {
		// TODO Auto-generated method stub
		roletbDAO.merge(xxuser);
	}

	public void upUser(Xxuser xxuser) {
		// TODO Auto-generated method stub
		xxuserDAO.merge(xxuser);
	}

	public List getXxuserBynmpass(String username, Long password) {
		// TODO Auto-generated method stub
		return xxuserDAO.findBynmpass(username, password);
	}

	public Long getCompsIdBynm(String name) {
		// TODO Auto-generated method stub
		try {
			return new Long(xxuserDAO.seleComid(name));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public LinkedList<ResP> getRespBycompid(Long id) {
		// TODO Auto-generated method stub
		List l=xxuserDAO.findBycompsid(id);
		LinkedList<ResP> lk=new LinkedList<ResP>();
		for(int i=0;i<l.size();i++){
			ResP rp=new ResP();
			rp=((ResP)l.get(i));
			lk.add(rp);
		}
		return lk;
	}
	
	public List QueryByTab(String tab, String tabstr, String str) {
		// TODO Auto-generated method stub
		return xxuserDAO.findByTab(tab, tabstr, str);
	}
	
	public List QueryByTabId(String tab, String tabstr, Long id) {
		// TODO Auto-generated method stub
		return xxuserDAO.findByTabId(tab, tabstr, id);
	}

	public List QueryByother(String tab, String tabstr1, Long str1,
			String tabstr2, Long str2) {
		// TODO Auto-generated method stub
		return xxuserDAO.findByTabother(tab, tabstr1, str1, tabstr2, str2);
	}

	public List QueryByPcac(String tab, String tabstr1, String str1,
			String tabstr2, String str2, String tabstr3, String str3) {
		// TODO Auto-generated method stub
		return xxuserDAO.findByTabPC(tab, tabstr1, str1, tabstr2, str2, tabstr3, str3);
	}

	
	 

}
