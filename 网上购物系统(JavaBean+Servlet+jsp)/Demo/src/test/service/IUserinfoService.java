package test.service;

import java.util.List;

import test.vo.Userinfo;

public interface IUserinfoService {

	public Userinfo registUserinfo(Userinfo userinfo);
	public List<Userinfo> checkUname(String uname);
	public List<Userinfo> getUserinfo(String uname,String passwd);
	
}
