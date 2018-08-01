package com.bu.opt;

import java.util.List;
import java.util.Vector;

import com.po.Operation;
import com.service.DAOService;
import com.struts.form.OptOperationForm;

public class OperationBusiness implements IBusiness {

	//声明一个私有的DAOService
	private DAOService daos;
	
	public boolean delete(String pkid) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findByID(String pkid) {
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
	
	/**
	 * 指定父权限查询所有符合条件的权限
	 * */
	public Vector findByFID(String fid){
		
		Vector opvc=new Vector();
		List li=daos.getOperationdao().findByOpFid(fid);
		
		for (Object ob : li) {
			Operation op=(Operation) ob;
			OptOperationForm opform = new OptOperationForm();
			opform.setOpid(op.getOpId().toString());
			opform.setOpfid(op.getOpFid().toString());
			opform.setOpname(op.getOpName());
			opform.setOpurl(op.getOpUrl());
			opvc.add(opform);
		}
		
		return opvc;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
