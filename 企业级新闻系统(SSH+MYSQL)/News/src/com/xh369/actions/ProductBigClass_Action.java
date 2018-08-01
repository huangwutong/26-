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

    //��Ӳ�Ʒ����,�Ҹ�����ӳ�ʼС��(����ָ��С��)
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

    //�����һ��ͨ�÷���,���ദ��������(����ѯ��һ���������������,ͨ��һ�����ർ������������)
    void currency(HttpServletRequest request){

        List aList = productBigClassDAO.getAllProductBigClass();
        if(aList.size() > 0){
            request.setAttribute("aList", aList);
        }
    }

    //��ѯ��һ����Ʒ�����������Ʒ����,ͨ��һ����Ʒ���ർ����������Ʒ����
    public ActionForward searchAllProductBigClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        currency(request);
        return mapping.findForward("searchAllProductBigClass");
    }

    //ɾ����Ʒ����,�Ҽ���ɾ����С��
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
