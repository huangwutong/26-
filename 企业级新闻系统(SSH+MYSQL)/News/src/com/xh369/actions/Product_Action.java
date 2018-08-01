package com.xh369.actions;

import javax.servlet.ServletContext;
import javax.servlet.http.*;
import com.xh369.dao.*;
import com.xh369.dto.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import book.upload.UtilMethod;
import org.apache.commons.fileupload.*;

public class Product_Action extends DispatchAction{
	
	//每页页大小
    int pageSize = 10;
    private ProductDAO productDAO;
    private ProductsviewsDAO productsviewsDAO;

    public ProductDAO getProductDAO() {
        return productDAO;
    }

    public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
    
    public ProductsviewsDAO getProductsviewsDAO() {
		return productsviewsDAO;
	}

	public void setProductsviewsDAO(ProductsviewsDAO productsviewsDAO) {
		this.productsviewsDAO = productsviewsDAO;
	}
    
    //加载产品添加页面及填充一级分类与二级分类下拉列表(通过一级分类导航到二级分类)
    public ActionForward show(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
      
        currency(request);
        return mapping.findForward("show");
    }

    //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
    void currency(HttpServletRequest request){

        List aList = productDAO.getProductBigClass();
        if(aList.size()>0){
            request.setAttribute("aList", aList);
        }
    }

    //添加产品
    public ActionForward productAdd(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
//    	Product_ActionForm product_ActionForm = (Product_ActionForm) form;
//    	Product product = new Product();
//        product.setProductname(product_ActionForm.getProductname());
//        Integer bigclassid = new Integer(product_ActionForm.getBigclassid());
//        Integer smallclassid = new Integer(product_ActionForm.getSmallclassid());
//        ProductBigClass productBigClass = productDAO.getProductBigClassByID(bigclassid);
//        product.setProductBigClass(productBigClass);
//        ProductSmallClass productSmallClass = productDAO.getProductSmallClassByID(smallclassid);
//        product.setProductSmallClass(productSmallClass);
//        product.setProductpic(product_ActionForm.getProductpic());
//        product.setProducefactory(product_ActionForm.getProducefactory());
//        product.setProductmodel(product_ActionForm.getProductmodel());
//        product.setMarketprice(product_ActionForm.getMarketprice());
//        product.setPreferentialprice(product_ActionForm.getPreferentialprice());
//        String vouch = product_ActionForm.getVouch() != null ? product_ActionForm.getVouch() : "";
//        if(vouch.equals("true")){
//            product.setVouch(vouch);
//        }else{
//        	product.setVouch("false");
//        }
//        String newProduct = product_ActionForm.getNewproduct() != null ? product_ActionForm.getNewproduct() : "";
//        if(newProduct.equals("true")){
//            product.setNewproduct(newProduct);
//        }else{
//        	product.setNewproduct("false");
//        }
//        product.setIntroduct(product_ActionForm.getIntroduct());
//        productDAO.insertProduct(product);
        
        
    	 //创建HttpSession对象
		HttpSession session = request.getSession();
		ServletContext servletcontext = this.getServlet().getServletContext();
		String url = servletcontext.getRealPath("/images");
		session.setAttribute("url",url);
		if ("status".equals(request.getParameter("c"))) {//如果请求中c的值为status
			try {
				UtilMethod.doStatus(session, response);
			} catch (IOException e) {
				e.printStackTrace();
			}//调用doStatus方法(说明是上传文件的过程当中通过Ajax再次请求服务器端进行处理,即将上传状态返回客户端)
		} else {//否则,调用doFileUpload方法(说明该次提交是首次上传文件执行的请求动作)
			try {
				UtilMethod.doFileUpload(session, request, response);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
        return mapping.getInputForward();
//        if(productDAO.insertProduct(product)){
//            return mapping.findForward("productAdd");
//        }else{
//            return mapping.findForward("error");
//        }
    }
    
    //得到页码,从而计算出索引位置
    public int searchUtil(HttpServletRequest request){

        //起始索引
        int position_index = - 1;
        String page = request.getParameter("page") != null ? request.getParameter("page") : "";
        if(!page.equals("")){
            position_index = Integer.parseInt(page);
        }else{
            position_index = 1;
        }
        return position_index;
    }
    
    //产品浏览
    public ActionForward searchPage(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	int position_index = searchUtil(request);
        List aList = productsviewsDAO.getByProperty(position_index, pageSize);
        if (aList.size()>0) {
            request.setAttribute("aList", aList);
            //总记录数
            int count = productsviewsDAO.getCount();
            int t = count % pageSize == 0 ? count/pageSize : count/pageSize + 1;
            request.setAttribute("currpage", position_index + "");
            request.setAttribute("totalPage",t + "");
            request.setAttribute("count", count + "");
            List aryList = new ArrayList();
            for(int i = 1; i <= t; i++){
                aryList.add(i + "");
            }
            request.setAttribute("aryList", aryList);
            return mapping.findForward("search");
        } else {
            return mapping.findForward("error");
        }
    }

    //产品修改(首先显示出原数据)
    public ActionForward showProduct(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Product_ActionForm product_ActionForm = (Product_ActionForm) form;
        Integer id = Integer.valueOf(request.getParameter("id"));
        Product product = productDAO.showProduct(id);
        product_ActionForm.setProductname(product.getProductname());
        product_ActionForm.setBigclassid(product.getProductBigClass().getId().intValue());
        product_ActionForm.setSmallclassid(product.getProductSmallClass().getId().intValue());
        product_ActionForm.setProductpic(product.getProductpic());
        product_ActionForm.setProducefactory(product.getProducefactory());
        product_ActionForm.setProductmodel(product.getProductmodel());
        product_ActionForm.setMarketprice(product.getMarketprice());
        product_ActionForm.setPreferentialprice(product.getPreferentialprice());
        product_ActionForm.setVouch(product.getVouch());
        product_ActionForm.setNewproduct(product.getNewproduct());
        product_ActionForm.setIntroduct(product.getIntroduct());
        if(product != null){
            request.setAttribute("product_ActionForm", product_ActionForm);
            return mapping.findForward("showProduct");
        }else{
            return mapping.findForward("error");
        }
    }

    //产品修改
    public ActionForward productUpdate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Product_ActionForm product_ActionForm = (Product_ActionForm) form;
        Integer id = Integer.valueOf(request.getParameter("id"));
        Product product = productDAO.showProduct(id);
        product.setProductname(product_ActionForm.getProductname());
        Integer bigclassid = new Integer(product_ActionForm.getBigclassid());
        Integer smallclassid = new Integer(product_ActionForm.getSmallclassid());
        ProductBigClass productBigClass = productDAO.getProductBigClassByID(bigclassid);
        product.setProductBigClass(productBigClass);
        ProductSmallClass productSmallClass = productDAO.getProductSmallClassByID(smallclassid);
        product.setProductSmallClass(productSmallClass);
        product.setProductpic(product_ActionForm.getProductpic());
        product.setProducefactory(product_ActionForm.getProducefactory());
        product.setProductmodel(product_ActionForm.getProductmodel());
        product.setMarketprice(product_ActionForm.getMarketprice());
        product.setPreferentialprice(product_ActionForm.getPreferentialprice());
        product.setVouch(product_ActionForm.getVouch());
        product.setNewproduct(product_ActionForm.getNewproduct());
        product.setIntroduct(product_ActionForm.getIntroduct());
        if(productDAO.updateProduct(product)){
            return mapping.findForward("productAdd");
        }else{
            return mapping.findForward("error");
        }
    }

    //产品删除
    public ActionForward delProduct(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("id"));
        if(productDAO.delProduct(id)){
            return mapping.findForward("productAdd");
        }else{
            return mapping.findForward("error");
        }
    }
}
