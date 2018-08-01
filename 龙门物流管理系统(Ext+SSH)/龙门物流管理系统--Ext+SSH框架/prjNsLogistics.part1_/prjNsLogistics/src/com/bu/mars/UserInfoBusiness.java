package com.bu.mars;

import java.util.*;
import com.struts.form.*;
import com.po.*;
import com.service.DAOService;
public class UserInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector uservc=new Vector();
		List ls=daos.getUserinfodao().findAll();
		for (Object object : ls) {
			UserInfo users=(UserInfo)object;
			MarsUserInfoForm userf=new MarsUserInfoForm();
			userf.setUserid(users.getUserId().toString());
			userf.setUsername(users.getUserName());
			userf.setUserrname(users.getUserRname());
			userf.setUserpassword(users.getUserPassword());
			userf.setUsersex(users.getUserSex());
			userf.setDepartmendid(users.getDepartmentInfo().getDepartmentId().toString());
			userf.setDepartmentname(users.getDepartmentInfo().getDepartmentName());
			userf.setUserphone(users.getUserPhone());
			userf.setUsercardid(users.getUserCardId());
			userf.setRoleid(users.getRoleInfo().getRoleId().toString());
			userf.setUserrolename(users.getRoleInfo().getRoleName());
			userf.setUserloginnum(users.getUserLoginNum());
			userf.setUserlogindata(users.getUserLoginData());
			userf.setUserregdata(users.getUserRegData());
			userf.setBranchid(users.getBranchInfo().getBranchName());
			uservc.add(userf);
		}
		return uservc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		UserInfo users=daos.getUserinfodao().findById(new Integer(id));
		MarsUserInfoForm userf=new MarsUserInfoForm();
		userf.setUserid(users.getUserId().toString());
		userf.setUsername(users.getUserName());
		userf.setUserrname(users.getUserRname());
		userf.setUserpassword(users.getUserPassword());
		userf.setUsersex(users.getUserSex());
		userf.setDepartmendid(users.getDepartmentInfo().getDepartmentId().toString());
		userf.setDepartmentname(users.getDepartmentInfo().getDepartmentName());
		userf.setUserphone(users.getUserPhone());
		userf.setUsercardid(users.getUserCardId());
		userf.setRoleid(users.getRoleInfo().getRoleId().toString());
		userf.setUserrolename(users.getRoleInfo().getRoleName());
		userf.setUserloginnum(users.getUserLoginNum());
		userf.setUserlogindata(users.getUserLoginData());
		userf.setUserregdata(users.getUserRegData());
		return userf;
	}
	public Vector findByBranchID(String id){
		Vector uservc=new Vector();
		List ls=daos.getUserinfodao().findByBranchID(new Integer(id));
		for (Object object : ls) {
			UserInfo users=(UserInfo)object;
			MarsUserInfoForm userf=new MarsUserInfoForm();
			userf.setUserid(users.getUserId().toString());
			userf.setUsername(users.getUserName());
			userf.setUserrname(users.getUserRname());
			userf.setUserpassword(users.getUserPassword());
			userf.setUsersex(users.getUserSex());
			userf.setDepartmendid(users.getDepartmentInfo().getDepartmentId().toString());
			userf.setDepartmentname(users.getDepartmentInfo().getDepartmentName());
			userf.setUserphone(users.getUserPhone());
			userf.setUsercardid(users.getUserCardId());
			userf.setRoleid(users.getRoleInfo().getRoleId().toString());
			userf.setUserrolename(users.getRoleInfo().getRoleName());
			userf.setUserloginnum(users.getUserLoginNum());
			userf.setUserlogindata(users.getUserLoginData());
			userf.setUserregdata(users.getUserRegData());
			userf.setBranchid(users.getBranchInfo().getBranchName());
			uservc.add(userf);
		}
		return uservc;
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
