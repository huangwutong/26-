package com.xh369.actions;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import org.apache.struts.actions.DispatchAction;
import com.xh369.dao.BigClassDAO;
import com.xh369.service.*;
import com.xh369.dto.BigClass;
import com.xh369.dto.SmallClass_ActionForm;
import com.xh369.dto.SmallClass;
import com.xh369.dao.SmallClassDAO;
import com.xh369.dao.ArticleDAO;
import java.util.List;
import java.io.*;

public class SmallClass_Action extends DispatchAction {

    BigClassDAO bigClassDAO = ManagerFactory.createBigClassDAO();
    BigClass bigClass = null;
    SmallClassDAO smallClassDAO = ManagerFactory.createSmallClassDAO();
    ArticleDAO articleDAO = ManagerFactory.createArticleDAO();

    //添加二级分类(首先导航到添加二级分类的页面,并查询出其一级分类信息)
    public ActionForward addSmallClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer bigclassid = Integer.valueOf(request.getParameter("bigclassid"));
        bigClass = bigClassDAO.addSmallClass(bigclassid);
        if(bigClass != null){
            request.setAttribute("bigClass", bigClass);
            return mapping.findForward("addSmallClass");
        }else{
            return mapping.findForward("error");
        }
    }

    //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
    void currency(HttpServletRequest request){

        List arrList = articleDAO.searchBigClass();
        if(arrList.size()>0){
            request.setAttribute("arrList", arrList);
        }
    }

    //添加二级分类
    public ActionForward addSmall(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        SmallClass_ActionForm smallClass_ActionForm = (SmallClass_ActionForm) form;
        SmallClass smallClass = new SmallClass();
        smallClass.setSmallclassname(smallClass_ActionForm.getSmallclassname());
        smallClass.setBigclass(bigClass);
        if(smallClassDAO.addSmall(smallClass)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }

    //导航到修改二级分类页面
    public ActionForward updateSmallClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        SmallClass_ActionForm smallClass_ActionForm = (SmallClass_ActionForm) form;
        SmallClass smallClass = new SmallClass();
        String bigclassname = null;
        try {
            smallClass.setSmallclassname(new String(smallClass_ActionForm.getSmallclassname().getBytes("ISO-8859-1"), "GBK"));
            bigclassname = new String(request.getParameter("bigclassname").getBytes("ISO-8859-1"), "GBK");
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        Integer bid = Integer.valueOf(request.getParameter("bid"));
        smallClass.setId(smallClass_ActionForm.getId());
        request.setAttribute("smallClass_ActionForm", smallClass);
        request.setAttribute("bigclassname", bigclassname);
        request.setAttribute("bid", bid);
        return mapping.findForward("updateSmallClass");
    }

    //修改二级分类
    public ActionForward updateOnlySmallClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        SmallClass_ActionForm smallClass_ActionForm = (SmallClass_ActionForm) form;
        SmallClass smallClass = new SmallClass();
        try {
            smallClass.setSmallclassname(new String(smallClass_ActionForm.getSmallclassname().getBytes("ISO-8859-1"), "GBK"));
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        BigClass bigclass = bigClassDAO.loadBigClass(Integer.valueOf(request.getParameter("bid")));
        smallClass.setBigclass(bigclass);
        smallClass.setId(smallClass_ActionForm.getId());
        if(smallClassDAO.updateOnlySmallClass(smallClass)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }

    //删除二级分类
    public ActionForward deleteSmallClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        SmallClass_ActionForm smallClass_ActionForm = (SmallClass_ActionForm) form;
        Integer id = smallClass_ActionForm.getId();
        if(smallClassDAO.deleteSmallClass(id)){
            currency(request);
            return mapping.findForward("searchclass");
        }else{
            return mapping.findForward("error");
        }
    }
}
