package com.xh369.actions;

import javax.servlet.http.*;
import com.xh369.dao.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.util.List;
import com.xh369.dto.ProductSmallClass_ActionForm;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public class ProductSmallClass_Action extends DispatchAction{

    private ProductSmallClassDAO productSmallClassDAO;

    public ProductSmallClassDAO getProductSmallClassDAO(){
        return productSmallClassDAO;
    }

    public void setProductSmallClassDAO(ProductSmallClassDAO productSmallClassDAO){
        this.productSmallClassDAO = productSmallClassDAO;
    }

    //查询产品大类,并导航到添加产品小类页面
    public ActionForward searchProductBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        List aList = productSmallClassDAO.getProductBigClass();
        if(aList.size() > 0){
            request.setAttribute("aList", aList);
            return mapping.findForward("searchProductBigClass");
        }else{
            return mapping.findForward("error");
        }
    }

    //添加产品小类
    public ActionForward productSmallClass_Add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        ProductSmallClass_ActionForm productSmallClass_ActionForm = (ProductSmallClass_ActionForm) form;
        Integer bigclassid = Integer.valueOf(request.getParameter("bigclassid"));
        ProductBigClass productBigClass = productSmallClassDAO.getProductBigClassByID(bigclassid);
        ProductSmallClass productSmallClass = new ProductSmallClass();
        String smallclassname = productSmallClass_ActionForm.getSmallclassname();
        productSmallClass.setSmallclassname(smallclassname);
        productSmallClass.setProductbigclass(productBigClass);
        if(productSmallClassDAO.insertProductSmallClass(productSmallClass)){
            return mapping.findForward("productSmallClass_Add");
        }else{
            return mapping.findForward("error");
        }
    }

    //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
    void currency(HttpServletRequest request){

        List aList = productSmallClassDAO.getProductBigClass();
        if(aList.size()>0){
            request.setAttribute("aList", aList);
        }
    }

    //删除产品小类
    public ActionForward delProductSmallClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("id"));
        if(productSmallClassDAO.delProductSmallClass(id)){
            currency(request);
            return mapping.findForward("delProductSmallClass");
        }else{
            return mapping.findForward("error");
        }
    }
}
