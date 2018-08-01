package com.bu.opt;

import java.util.*;

import com.po.*;
import com.service.DAOService;
import com.struts.form.OptSystemLogForm;
import com.struts.form.OptUserInfoForm;

public class UserBusiness implements IBusiness {

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
		UserInfo ui=daos.getUserinfodao().findById(new Integer(pkid));
		OptUserInfoForm uiform=new OptUserInfoForm();
		uiform.setUserid(ui.getUserId().toString());
		uiform.setUsername(ui.getUserName());
		uiform.setUserpassword(ui.getUserPassword());
		uiform.setBranchid(ui.getBranchInfo().getBranchId().toString());
		uiform.setUserrname(ui.getUserRname());
		uiform.setUsersex(ui.getUserSex());
		uiform.setDepartmentid(ui.getDepartmentInfo().getDepartmentId().toString());
		uiform.setDepartmentname(ui.getDepartmentInfo().getDepartmentName());
		uiform.setUserphone(ui.getUserPhone());
		uiform.setUsercardid(ui.getUserCardId());
		uiform.setRoleid(ui.getRoleInfo().getRoleId().toString());
		uiform.setUserloginnum(ui.getUserLoginNum());
		uiform.setUserlogindata(ui.getUserLoginData());
		uiform.setUserregdata(ui.getUserRegData());
		return uiform;
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
	 * 验证登陆是否成功
	 * @param Object 登陆对象
	 * @return OptUserInfoForm 成功返回登陆对象，失败返回空
	 * */
	public OptUserInfoForm loginIsOK(Object ob){
		OptUserInfoForm uiform=(OptUserInfoForm) ob;
		
		//将ActionForm参数转化为持久化类以便于DAO使用
		UserInfo ui=new UserInfo();
		ui.setUserName(uiform.getUsername());
		ui.setUserPassword(uiform.getUserpassword());
		ui.setBranchInfo(daos.getBranchinfodao().findById(new Integer(uiform.getBranchid())));
		
		//调用Dao方法，验证登陆
		//如果返回结果不会空，将持久化类转化为ActionForm
		if (daos.getUserinfodao().loginIsOK(ui)!=null) {
			ui=daos.getUserinfodao().loginIsOK(ui);
			uiform.setUserid(ui.getUserId().toString());
			uiform.setUsername(ui.getUserName());
			uiform.setUserpassword(ui.getUserPassword());
			uiform.setBranchid(ui.getBranchInfo().getBranchId().toString());
			uiform.setUserrname(ui.getUserRname());
			uiform.setUsersex(ui.getUserSex());
			uiform.setDepartmentid(ui.getDepartmentInfo().getDepartmentId().toString());
			uiform.setDepartmentname(ui.getDepartmentInfo().getDepartmentName());
			uiform.setUserphone(ui.getUserPhone());
			uiform.setUsercardid(ui.getUserCardId());
			uiform.setRoleid(ui.getRoleInfo().getRoleId().toString());
			uiform.setUserloginnum(ui.getUserLoginNum());
			uiform.setUserlogindata(ui.getUserLoginData());
			uiform.setUserregdata(ui.getUserRegData());
			
			//执行UserInfoDAO更新方法，更新当前登陆用户的登陆次数和最后登录时间
			UserInfo newui = this.daos.getUserinfodao().findById(new Integer(uiform.getUserid()));
			int loginnum=Integer.parseInt(uiform.getUserloginnum())+1;
			String date=new java.util.Date().toString();
			newui.setUserLoginData(date);
			newui.setUserLoginNum(loginnum+"");
			
			//执行SystemLogDAO添加方法，添加系统日志
			SystemLog sl = new SystemLog();
			sl.setBranchInfo(ui.getBranchInfo());
			sl.setUserInfo(ui);
			sl.setSystemLogMemo("登陆信息:"+uiform.getUserid()+"("+uiform.getUsername()+"),"+date);
			this.daos.getSystemlogdao().save(sl);
			
			//调用Dao方法，更新当前登录用户信息
			this.daos.getUserinfodao().attachDirty(newui);

			
			//返回登陆对象
			return uiform;
		}
		return null;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
