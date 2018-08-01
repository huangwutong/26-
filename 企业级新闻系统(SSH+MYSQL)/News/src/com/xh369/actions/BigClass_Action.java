package com.xh369.actions;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.xh369.dto.BigClass_ActionForm;
import org.apache.struts.actions.DispatchAction;
import com.xh369.dto.BigClass;
import com.xh369.dao.BigClassDAO;
import com.xh369.service.ManagerFactory;
import java.io.*;
import java.util.List;
import com.xh369.dao.ArticleDAO;
import com.xh369.service.UtilForm;

public class BigClass_Action extends DispatchAction {

    BigClassDAO bigClassDAO = ManagerFactory.createBigClassDAO();
    ArticleDAO articleDAO = ManagerFactory.createArticleDAO();

    //一级分类添加
    public ActionForward articleBigClassAdd(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        BigClass_ActionForm bigClass_ActionForm = (BigClass_ActionForm) form;
        try {
            bigClass_ActionForm.setBigclassname(new String(bigClass_ActionForm.getBigclassname().getBytes("ISO-8859-1"), "GBK"));
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        BigClass bigClass = (BigClass) UtilForm.populate(bigClass_ActionForm, "com.xh369.dto.BigClass", new String[] {"bigclassname"});
        if(bigClassDAO.articleBigClassAdd(bigClass)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }

    //导航到修改一级分类页面
    public ActionForward updateBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("bigclassid"));
        BigClass bigClass = bigClassDAO.addSmallClass(id);
        try {
            bigClass.setBigclassname(new String(request.getParameter("bigname").getBytes("ISO-8859-1"), "GBK"));
        } catch (UnsupportedEncodingException ex){
            ex.printStackTrace();
        }
        BigClass_ActionForm bigClass_ActionForm = (BigClass_ActionForm) UtilForm.populate(bigClass, "com.xh369.dto.BigClass_ActionForm", new String[] {"bigclassname"});
        request.setAttribute("bigClass_ActionForm", bigClass_ActionForm);
        request.setAttribute("bid", id + "");
        return mapping.findForward("updateBigClass");
    }

   //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
   void currency(HttpServletRequest request){

       List arrList = articleDAO.searchBigClass();
       if(arrList.size()>0){
           request.setAttribute("arrList", arrList);
       }
   }

    //修改一级分类页面
    public ActionForward updateOnlyBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        BigClass_ActionForm bigClass_ActionForm = (BigClass_ActionForm) form;
        Integer id = bigClass_ActionForm.getId();
        try {
            bigClass_ActionForm.setBigclassname(new String(bigClass_ActionForm.getBigclassname()
                                                                               .getBytes("ISO-8859-1"), "GB2312"));
            bigClass_ActionForm.setId(id);
        } catch (UnsupportedEncodingException ex){
            ex.printStackTrace();
        }
        BigClass bigClass = (BigClass) UtilForm.populate(bigClass_ActionForm, "com.xh369.dto.BigClass", new String[] {"bigclassname"});
        //当转换为Integer包装类型时,
        //只能用Integer.valueOf(request.getParameter("id")),
        //而不能用Integer.getInteger(request.getParameter("id"))
        if(bigClassDAO.updateOnlyBigClass(bigClass)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }

    //删除一级分类
    public ActionForward deleteBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("bigclassid"));
        if(bigClassDAO.deleteBigClass(id)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }
}
