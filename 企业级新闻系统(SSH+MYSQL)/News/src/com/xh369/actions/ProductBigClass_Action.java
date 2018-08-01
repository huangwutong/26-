package com.xh369.actions;

import javax.servlet.http.*;
import com.xh369.dao.*;
import com.xh369.dto.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.util.*;

public class ProductBigClass_Action extends DispatchAction{

    private ProductBigClassDAO productBigClassDAO;

    public ProductBigClassDAO getProductBigClassDAO(){
        return productBigClassDAO;
    }

    public void setProductBigClassDAO(ProductBigClassDAO productBigClassDAO){
        this.productBigClassDAO = productBigClassDAO;
    }

    //添加产品大类,且给其添加初始小类(即不指定小类)
    public ActionForward productBigClass_Add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        ProductBigClass_ActionForm productBigClass_ActionForm = (ProductBigClass_ActionForm) form;
        ProductBigClass productBigClass = new ProductBigClass();
        productBigClass.setBigclassname(productBigClass_ActionForm.getBigclassname());
        if(productBigClassDAO.insertProductBigClass(productBigClass)){
            return mapping.findForward("productBigClass_Add");
        }else{
            return mapping.findForward("error");
        }
    }

    //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
    void currency(HttpServletRequest request){

        List aList = productBigClassDAO.getAllProductBigClass();
        if(aList.size() > 0){
            request.setAttribute("aList", aList);
        }
    }

    //查询出一级产品分类与二级产品分类,通过一级产品分类导航到二级产品分类
    public ActionForward searchAllProductBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        currency(request);
        return mapping.findForward("searchAllProductBigClass");
    }

    //删除产品大类,且级联删除其小类
    public ActionForward delProductBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("id"));
        if(productBigClassDAO.delProductBigClass(id)){
            currency(request);
            return mapping.findForward("searchAllProductBigClass");
        }else{
            return mapping.findForward("error");
        }
    }
}
