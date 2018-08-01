package com.service.intface.user;

import java.util.LinkedList;
import java.util.List;

import com.java.Comps;
import com.java.RP;
import com.java.ResP;
import com.java.Resfun;
import com.java.Roletb;
import com.java.UR;
import com.java.Xxuser;

public interface UserService {
	//根据表名、字段名查询List
	public List QueryByTab(String tab ,String tabstr,String str);
	public List QueryByTabId(String tab ,String tabstr,Long id);
	public List QueryByother(String tab,String tabstr1,Long str1,String tabstr2,Long str2);
	public List QueryByPcac(String tab,String tabstr1,String str1,String tabstr2,String str2,String tabstr3,String str3);
	
	//根据用户名拿出权限id
	public Long getCompsIdBynm(String name);
	public LinkedList<ResP> getRespBycompid(Long id); 
	//
   public List getUserAll();
   public void saveUser(Xxuser xxuser);
   public Xxuser QueryXxuserById(Long id);
   public Roletb QueryRoletbById(Long id);
   public void deleXxuser(Xxuser xxuser);
   //roleselect
   public List getRoleAll();
   //ur
   public List getURAll();
   public void SaveUR(UR ur);
   public UR QueryURById(Long id);
   public void deleUR(UR ur);
   //roletb
   public void SaveRoletb(Roletb rol);
   public void deleRoletb(Roletb rol);
   //rp
   public List getRPAll();
   public void SaveRP(RP rp);
   public RP QueryRPById(Long id);
   public void deleRP(RP rp);
   //comps
   public List getCompsAll();
   public Comps QueryCompsById(Long id);
   public void SaveComps(Comps cm);
   public void deleComps(Comps cm);
   //resp
   public List getRespAll();
   public ResP QueryResPById(Long id);
   public void SaveResP(ResP cm);
   public void deleResP(ResP cm);
   //resfun
   public List getResfunAll();
   public Resfun QueryResfunById(Long id);
   public void SaveResfun(Resfun cm);
   public void deleResfun(Resfun cm);
   //
   public void upUser(Xxuser xxuser);
   public void upRoletb(Roletb xxuser);
   public void upComps(Comps xxuser);
   public void upResfun(Resfun xxuser);
   //
   public List getXxuserBynmpass(String username,Long password);

}
