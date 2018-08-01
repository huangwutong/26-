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

    //��ѯ��Ʒ����,����������Ӳ�ƷС��ҳ��
    public ActionForward searchProductBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        List aList = productSmallClassDAO.getProductBigClass();
        if(aList.size() > 0){
            request.setAttribute("aList", aList);
            return mapping.findForward("searchProductBigClass");
        }else{
            return mapping.findForward("error");
        }
    }

    //��Ӳ�ƷС��
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

    //�����һ��ͨ�÷���,���ദ��������(����ѯ��һ���������������,ͨ��һ�����ർ������������)
    void currency(HttpServletRequest request){

        List aList = productSmallClassDAO.getProductBigClass();
        if(aList.size()>0){
            request.setAttribute("aList", aList);
        }
    }

    //ɾ����ƷС��
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
