package com.xh369.actions;

import javax.servlet.http.*;
import com.xh369.dao.*;
import com.xh369.dto.*;
import com.xh369.service.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.util.*;

//采用DispatchAction的好处是可以减少我们action的数量，但是不能进行表单的提交
public class Admin_Action extends DispatchAction{

    private AdminDAO adminDAO;

    public AdminDAO getAdminDAO(){
        return adminDAO; 
    }

    public void setAdminDAO(AdminDAO adminDAO){
        this.adminDAO = adminDAO;
    }

    //登录
    public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Admin_ActionForm admin_ActionForm = (Admin_ActionForm) form;
        //让我们的Admin_ActionForm进行持久化
        Admin admin = (Admin) UtilForm.populate(admin_ActionForm, "com.xh369.dto.Admin", new String[] {"username", "pwd"});
        int count = adminDAO.getLogin(admin);
        if(count > 0){
            request.getSession().setAttribute("username", admin_ActionForm.getUsername());
            return mapping.findForward("success");
        }else{
            return mapping.findForward("faile");
        }
    }

    //查询管理人员列表
    public ActionForward searchAdminList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        List aList = adminDAO.getAdminList();
        request.setAttribute("aList", aList);
        return mapping.findForward("searchAdminList");
    }

    //添加管理人员
    public ActionForward addAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Admin_ActionForm admin_ActionForm = (Admin_ActionForm) form;
        System.out.println("username:" + admin_ActionForm.getUsername());
        System.out.println("pwd:" + admin_ActionForm.getPwd());
        System.out.println("email:" + admin_ActionForm.getEmail());
        String[] level = admin_ActionForm.getLevel();
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < level.length; i++){
        	sb.append(level[i] + ",");
        }
        sb = sb.deleteCharAt(sb.length() - 1);
        Admin admin = (Admin) UtilForm.populate(admin_ActionForm, "com.xh369.dto.Admin", new String[] {"username", "pwd", "email"});
        admin.setLevel(sb.toString());
        if(adminDAO.insertAdmin(admin)){
            return mapping.findForward("addAdmin");
        }else{
            return mapping.findForward("faile");
        }
    }
    
    //查询用户权限
    public ActionForward searchPopedom(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	Integer id = Integer.valueOf(request.getParameter("id"));
    	Admin admin = adminDAO.getPopedom(id);
    	List aList = adminDAO.getAllPopedom();
    	request.setAttribute("admin", admin);
    	request.setAttribute("id", id + "");
    	request.setAttribute("aList", aList);
    	return mapping.findForward("searchPopedom");
    }
    
    //修改用户权限
    public ActionForward updatePopedom(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	Integer id = Integer.valueOf(request.getParameter("id"));
    	StringBuffer sb = new StringBuffer();
    	for(int i = 0; i < adminDAO.getAllPopedom().size(); i++){
    		String level = request.getParameter("level"+i);
    		if(level != null){
    			int j = Integer.parseInt(level);
    			sb.append( (j + 1) + ",");
    		}
    	}
    	sb.deleteCharAt(sb.length() - 1);
    	if(adminDAO.updatePopedom(id, sb)){
    		return mapping.findForward("addAdmin");
    	}else{
    		return mapping.findForward("faile");
    	}
    }
    
    //删除用户
    public ActionForward delAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	Admin_ActionForm admin_ActionForm = (Admin_ActionForm) form;
    	String[] ids = request.getParameterValues("id");
    	boolean flag = false;
    	for(int i = 0; i < ids.length; i++){
    		flag = false;
    		Integer id = Integer.valueOf(ids[i]);
    		if(adminDAO.delAdmin(id)){
    			flag = true;
    		}
    	}
    	if(flag){
    		return mapping.findForward("addAdmin");
    	}else{
    		return mapping.findForward("faile");
    	}
    }
    
    //导航到添加用户页面
    public ActionForward toAdmin(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	Admin_ActionForm admin_ActionForm = (Admin_ActionForm) form;
    	List aList = adminDAO.getAllPopedom();
    	if(aList.size() > 0){
    		request.setAttribute("aList", aList);
    		return mapping.findForward("toAdmin");
    	}else{
    		return mapping.findForward("faile");
    	}
    }
}
