package com.bu.yasak;

import java.util.Vector;

import com.po.AfficheInfo;
import com.po.BranchInfo;
import com.po.UserInfo;
import com.service.DAOService;
import com.struts.form.Yasak_AfficheInfoForm;

public class AfficheInfoBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Vector findByBillAll(String str) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		Yasak_AfficheInfoForm yaf = (Yasak_AfficheInfoForm) ob;
		AfficheInfo ai = new AfficheInfo();
		
		UserInfo ui = daos.getUserinfodao().findById(new Integer(yaf.getUserId()));
		ai.setUserInfo(ui);
		
		ai.setAfficheTitle(yaf.getAfficheTitle());
		ai.setAfficheContent(yaf.getAfficheContent());
		
		ai.setAfficheData(yaf.getAfficheData());
		
		BranchInfo bi = daos.getBranchinfodao().findById(new Integer(yaf.getBranchId()));
		ai.setBranchInfo(bi);
		try {
			daos.getAfficheinfodao().save(ai);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

}
