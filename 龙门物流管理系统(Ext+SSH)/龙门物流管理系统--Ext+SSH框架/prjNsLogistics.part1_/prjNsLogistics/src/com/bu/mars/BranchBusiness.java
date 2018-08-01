package com.bu.mars;
import java.text.ParseException;
import java.util.*;
import com.service.DAOService;
import com.po.*;
import com.struts.form.*;
public class BranchBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		BranchInfo bri=daos.getBranchinfodao().findById(new Integer(id));
		try {
			daos.getBranchinfodao().delete(bri);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcbranch=new Vector();
		List ls=daos.getBranchinfodao().findAll();
		for(Object object:ls)
		{
			BranchInfo bran=(BranchInfo)object;
			MarsBranchInfoForm branf=new MarsBranchInfoForm();
			branf.setBranchid(bran.getBranchId().toString());
			branf.setBranchname(bran.getBranchName());
			branf.setBranchlinkman(bran.getBranchLinkMan());
			branf.setBranchphone(bran.getBranchPhone());
			branf.setBranchaddress(bran.getBranchAddress());
			branf.setBranchemail(bran.getBranchEmail());
			vcbranch.add(branf);
		}
		return vcbranch;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		BranchInfo bran=daos.getBranchinfodao().findById(new Integer(id));
		MarsBranchInfoForm branf=new MarsBranchInfoForm();
		branf.setBranchid(bran.getBranchId().toString());
		branf.setBranchname(bran.getBranchName());
		branf.setBranchlinkman(bran.getBranchLinkMan());
		branf.setBranchphone(bran.getBranchLinkMan());
		branf.setBranchaddress(bran.getBranchAddress());
		branf.setBranchemail(bran.getBranchEmail());
		return branf;
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
