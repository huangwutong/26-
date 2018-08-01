package com.bu.mars;

import java.util.*;

import com.po.AfficheInfo;
import com.po.BranchInfo;
import com.service.DAOService;
import com.struts.form.MarsAfficheInfoForm;
import com.struts.form.MarsBranchInfoForm;

public class AfficheInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector Affichevc=new Vector();
		List ls=daos.getAfficheinfodao().findAll();
		for(Object object:ls)
		{
			AfficheInfo affiche=(AfficheInfo)object;
			MarsAfficheInfoForm affichef=new MarsAfficheInfoForm();
			affichef.setAfficheid(affiche.getAffichelD().toString());
			affichef.setUserid(affiche.getUserInfo().getUserName());
			affichef.setAffichetitle(affiche.getAfficheTitle());
			affichef.setAffichecontent(affiche.getAfficheContent());
			affichef.setAffichedata(affiche.getAfficheData());
			affichef.setBranchid(affiche.getBranchInfo().getBranchName());
			Affichevc.add(affichef);
		}
		return Affichevc;
	}
	public Vector findByBranchID(String id)
	{
		Vector Affichevc=new Vector();
		List ls=daos.getAfficheinfodao().findByBranchID(new Integer(id));
		for(int i=ls.size()-1;i>=0;i--)
		{
			AfficheInfo affiche=(AfficheInfo)ls.get(i);
			MarsAfficheInfoForm affichef=new MarsAfficheInfoForm();
			affichef.setAfficheid(affiche.getAffichelD().toString());
			affichef.setUserid(affiche.getUserInfo().getUserName());
			affichef.setAffichetitle(affiche.getAfficheTitle());
			affichef.setAffichecontent(affiche.getAfficheContent());
			affichef.setAffichedata(affiche.getAfficheData());
			affichef.setBranchid(affiche.getBranchInfo().getBranchName());
			Affichevc.add(affichef);
		}
		return Affichevc;
	}
	public Object findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
