package com.bu.carmack;

import java.util.*;

import javax.xml.registry.infomodel.User;

import com.po.*;
import com.service.*;
import com.struts.form.*;

public class UserInfoBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos()
	{
		return daos;
	}
	public void setDaos(DAOService daos)
	{
		this.daos=daos;
	}
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		UserInfo ui=daos.getUserinfodao().findById(new Integer(id));
		try {
			daos.getUserinfodao().delete(ui);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 查询指定公司的所有员工
	 * @param int 公司编号
	 * @return List 员工集合
	 * */
	public Vector findByBranchID(int branchID){
		Vector vcUserInfo=new Vector();
		List ls=daos.getUserinfodao().findByBranchID(branchID);
		for(Object object:ls)
		{
			UserInfo ui=(UserInfo) object;
			OptUserInfoForm uiform=new OptUserInfoForm();
			uiform.setUserid(ui.getUserId().toString());
			uiform.setUsername(ui.getUserName());
			uiform.setUserpassword(ui.getUserPassword());
			uiform.setBranchid(ui.getBranchInfo().getBranchId().toString());
			uiform.setBranchname(ui.getBranchInfo().getBranchName());
			uiform.setUserrname(ui.getUserRname());
			uiform.setUsersex(ui.getUserSex());
			uiform.setDepartmentid(ui.getDepartmentInfo().getDepartmentId().toString());
			uiform.setDepartmentname(ui.getDepartmentInfo().getDepartmentName());
			uiform.setUserphone(ui.getUserPhone());
			uiform.setUsercardid(ui.getUserCardId());
			uiform.setRoleid(ui.getRoleInfo().getRoleId().toString());
			uiform.setRolename(ui.getRoleInfo().getRoleName());
			uiform.setUserloginnum(ui.getUserLoginNum());
			uiform.setUserlogindata(ui.getUserLoginData());
			uiform.setUserregdata(ui.getUserRegData());
			vcUserInfo.add(uiform);
		}
		return vcUserInfo;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcUserInfo=new Vector();
		List ls=daos.getUserinfodao().findAll();
		for(Object object:ls)
		{
			UserInfo ui=(UserInfo) object;
			OptUserInfoForm uiform=new OptUserInfoForm();
			uiform.setUserid(ui.getUserId().toString());
			uiform.setUsername(ui.getUserName());
			uiform.setUserpassword(ui.getUserPassword());
			uiform.setBranchid(ui.getBranchInfo().getBranchId().toString());
			uiform.setBranchname(ui.getBranchInfo().getBranchName());
			uiform.setUserrname(ui.getUserRname());
			uiform.setUsersex(ui.getUserSex());
			uiform.setDepartmentid(ui.getDepartmentInfo().getDepartmentId().toString());
			uiform.setDepartmentname(ui.getDepartmentInfo().getDepartmentName());
			uiform.setUserphone(ui.getUserPhone());
			uiform.setUsercardid(ui.getUserCardId());
			uiform.setRoleid(ui.getRoleInfo().getRoleId().toString());
			uiform.setRolename(ui.getRoleInfo().getRoleName());
			uiform.setUserloginnum(ui.getUserLoginNum());
			uiform.setUserlogindata(ui.getUserLoginData());
			uiform.setUserregdata(ui.getUserRegData());
			vcUserInfo.add(uiform);
		}
		return vcUserInfo;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		UserInfo ui=daos.getUserinfodao().findById(new Integer(id));
		OptUserInfoForm uiform=new OptUserInfoForm();
		uiform.setUserid(ui.getUserId().toString());
		uiform.setUsername(ui.getUserName());
		uiform.setUserpassword(ui.getUserPassword());
		uiform.setBranchid(ui.getBranchInfo().getBranchId().toString());
		uiform.setBranchname(ui.getBranchInfo().getBranchName());
		uiform.setUserrname(ui.getUserRname());
		uiform.setUsersex(ui.getUserSex());
		uiform.setDepartmentid(ui.getDepartmentInfo().getDepartmentId().toString());
		uiform.setDepartmentname(ui.getDepartmentInfo().getDepartmentName());
		uiform.setUserphone(ui.getUserPhone());
		uiform.setUsercardid(ui.getUserCardId());
		uiform.setRoleid(ui.getRoleInfo().getRoleId().toString());
		uiform.setRolename(ui.getRoleInfo().getRoleName());
		uiform.setUserloginnum(ui.getUserLoginNum());
		uiform.setUserlogindata(ui.getUserLoginData());
		uiform.setUserregdata(ui.getUserRegData());
		return uiform;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		CarmackUserInfoForm cuif=(CarmackUserInfoForm) ob;
		UserInfo ui=new UserInfo();
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(cuif.getBranchID()));
		ui.setBranchInfo(bi);
		ui.setUserName(cuif.getUserName());
		ui.setUserRname(cuif.getUserRName());
		ui.setUserPassword(cuif.getUserPassword());
		ui.setUserSex(cuif.getUserSex());
		DepartmentInfo di=daos.getDepinfodao().findById(new Integer(cuif.getDepartmentID()));
		ui.setDepartmentInfo(di);
		ui.setUserPhone(cuif.getUserPhone());
		ui.setUserCardId(cuif.getUserCardID());
		RoleInfo ri=daos.getRoleinfodao().findById(new Integer(cuif.getRoleID()));
		ui.setRoleInfo(ri);
		ui.setUserLoginNum(cuif.getUserLoginNum());
		ui.setUserLoginData(cuif.getUserLoginData());
		ui.setUserRegData(cuif.getUserLoginData());
		try {
			daos.getUserinfodao().save(ui);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		CarmackUserInfoForm cuif=(CarmackUserInfoForm) ob;
		UserInfo ui=daos.getUserinfodao().findById(new Integer(cuif.getUserID()));
		
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(cuif.getBranchID()));
		ui.setBranchInfo(bi);
		ui.setUserName(cuif.getUserName());
		ui.setUserRname(cuif.getUserRName());
		ui.setUserPassword(cuif.getUserPassword());
		ui.setUserSex(cuif.getUserSex());
		DepartmentInfo di=daos.getDepinfodao().findById(new Integer(cuif.getDepartmentID()));
		ui.setDepartmentInfo(di);
		ui.setUserPhone(cuif.getUserPhone());
		ui.setUserCardId(cuif.getUserCardID());
		RoleInfo ri=daos.getRoleinfodao().findById(new Integer(cuif.getRoleID()));
		ui.setRoleInfo(ri);
		ui.setUserLoginNum(cuif.getUserLoginNum());
		ui.setUserLoginData(cuif.getUserLoginData());
		ui.setUserRegData(cuif.getUserLoginData());
		try {
			daos.getUserinfodao().attachDirty(ui);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
