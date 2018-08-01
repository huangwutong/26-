package com.xh369.actions;

import javax.servlet.http.*;
import com.xh369.dao.*;
import com.xh369.dto.*;
import com.xh369.service.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.util.*;

//����DispatchAction�ĺô��ǿ��Լ�������action�����������ǲ��ܽ��б����ύ
public class Admin_Action extends DispatchAction{

    private AdminDAO adminDAO;

    public AdminDAO getAdminDAO(){
        return adminDAO; 
    }

    public void setAdminDAO(AdminDAO adminDAO){
        this.adminDAO = adminDAO;
    }

    //��¼
    public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Admin_ActionForm admin_ActionForm = (Admin_ActionForm) form;
        //�����ǵ�Admin_ActionForm���г־û�
        Admin admin = (Admin) UtilForm.populate(admin_ActionForm, "com.xh369.dto.Admin", new String[] {"username", "pwd"});
        int count = adminDAO.getLogin(admin);
        if(count > 0){
            request.getSession().setAttribute("username", admin_ActionForm.getUsername());
            return mapping.findForward("success");
        }else{
            return mapping.findForward("faile");
        }
    }

    //��ѯ������Ա�б�
    public ActionForward searchAdminList(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        List aList = adminDAO.getAdminList();
        request.setAttribute("aList", aList);
        return mapping.findForward("searchAdminList");
    }

    //��ӹ�����Ա
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
    
    //��ѯ�û�Ȩ��
    public ActionForward searchPopedom(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	Integer id = Integer.valueOf(request.getParameter("id"));
    	Admin admin = adminDAO.getPopedom(id);
    	List aList = adminDAO.getAllPopedom();
    	request.setAttribute("admin", admin);
    	request.setAttribute("id", id + "");
    	request.setAttribute("aList", aList);
    	return mapping.findForward("searchPopedom");
    }
    
    //�޸��û�Ȩ��
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
    
    //ɾ���û�
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
    
    //����������û�ҳ��
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
