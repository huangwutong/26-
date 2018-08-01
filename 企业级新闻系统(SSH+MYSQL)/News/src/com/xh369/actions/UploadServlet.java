package com.xh369.actions;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import com.xh369.dao.ProductDAO;
import com.xh369.dto.Product;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;
import com.xh369.dto.Product_ActionForm;
import book.upload.UtilMethod;

public class UploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//创建HttpSession对象
		HttpSession session = request.getSession();
		ServletContext servletcontext = this.getServletContext();
		String url = servletcontext.getRealPath("/images");
		session.setAttribute("url",url);
		if ("status".equals(request.getParameter("c"))) {//如果请求中c的值为status
			UtilMethod.doStatus(session, response);//调用doStatus方法(说明是上传文件的过程当中通过Ajax再次请求服务器端进行处理,即将上传状态返回客户端)
		} else {//否则,调用doFileUpload方法(说明该次提交是首次上传文件执行的请求动作)
			List items = UtilMethod.doFileUpload(session, request, response);
			String productname = "";
			String bigclassid = "";
			String smallclassid = "";
			String productpic = "";
			String producefactory = "";
			String productmodel = "";
			String marketprice = "";
			String preferentialprice = "";
			String vouch = "";
			String newproduct = "";
			String introduct = "";
			try {
				//循环items中的对象
				if(items != null){
					for (Iterator i = items.iterator(); i.hasNext();) {
						//(主要是涉及到上传文件中有可能同时上传多个文件,但最终服务器只会将其看作一个数据流,并不能区分开来,故要将数据转化成单个条目(即FileItem))
						//其中FileItem是org.apache.commons.fileupload包中的一个接口
						FileItem fileItem = (FileItem) i.next();
						if (!fileItem.isFormField()) {//如果该FileItem不是表单域
							 productpic = session.getAttribute("url").toString() + "\\"+fileItem.getName().substring(fileItem.getName().lastIndexOf("\\") + 1);
						}else{
							if(fileItem.getFieldName().equals("productname")){
								productname = fileItem.getString();
							}else if(fileItem.getFieldName().equals("bigclassid")){
								bigclassid = fileItem.getString();
							}else if(fileItem.getFieldName().equals("smallclassid")){
								smallclassid = fileItem.getString();
							}else if(fileItem.getFieldName().equals("producefactory")){
								producefactory = fileItem.getString();
							}else if(fileItem.getFieldName().equals("productmodel")){
								productmodel = fileItem.getString();
							}else if(fileItem.getFieldName().equals("marketprice")){
								marketprice = fileItem.getString();		
							}else if(fileItem.getFieldName().equals("preferentialprice")){
								preferentialprice = fileItem.getString();
							}else if(fileItem.getFieldName().equals("vouch")){
								vouch = fileItem.getString();
							}else if(fileItem.getFieldName().equals("newproduct")){
								newproduct = fileItem.getString();
							}else{
								introduct = fileItem.getString();
							}		
						}
						fileItem.delete();
					}
				}
				//将表单数据组装到ActionForm中,并调用业务逻辑层方法进行持久化
				Product_ActionForm product_ActionForm = new Product_ActionForm();
				product_ActionForm.setProductname(productname);
				product_ActionForm.setBigclassid(Integer.parseInt(bigclassid));
				product_ActionForm.setSmallclassid(Integer.parseInt(smallclassid));
				product_ActionForm.setProductpic(productpic);
				product_ActionForm.setProducefactory(producefactory);
				product_ActionForm.setProductmodel(productmodel);
				product_ActionForm.setMarketprice(Integer.parseInt(marketprice));
				product_ActionForm.setPreferentialprice(Integer.parseInt(preferentialprice));
				product_ActionForm.setVouch(vouch);
				product_ActionForm.setNewproduct(newproduct);
				product_ActionForm.setIntroduct(introduct);
		    	Product product = new Product();
		        product.setProductname(product_ActionForm.getProductname());
		        Integer big = new Integer(product_ActionForm.getBigclassid());
		        Integer small = new Integer(product_ActionForm.getSmallclassid());
		        ApplicationContext ac = new FileSystemXmlApplicationContext(servletcontext.getRealPath("/WEB-INF") + "\\spring-config.xml");
		        ProductDAO productDAO = (ProductDAO) ac.getBean("Product_ActionDAO");
		        //该方法可以用相对路径去获得配置文件的信息(但是只能访问根下面的路径,而不能访问WEB-INF路径)
		        //ApplicationContext appc = new ClassPathXmlApplicationContext("/WEB-INF/spring-config.xml");
		        ProductBigClass productBigClass = productDAO.getProductBigClassByID(big);
		        product.setProductBigClass(productBigClass);
		        ProductSmallClass productSmallClass = productDAO.getProductSmallClassByID(small);
		        product.setProductSmallClass(productSmallClass);
		        product.setProductpic(product_ActionForm.getProductpic());
		        product.setProducefactory(product_ActionForm.getProducefactory());
		        product.setProductmodel(product_ActionForm.getProductmodel());
		        product.setMarketprice(product_ActionForm.getMarketprice());
		        product.setPreferentialprice(product_ActionForm.getPreferentialprice());
		        vouch = product_ActionForm.getVouch() != null ? product_ActionForm.getVouch() : "";
		        if(vouch.equals("true")){
		            product.setVouch(vouch);
		        }else{
		        	product.setVouch("false");
		        }
		        String newProduct = product_ActionForm.getNewproduct() != null ? product_ActionForm.getNewproduct() : "";
		        if(newProduct.equals("true")){
		            product.setNewproduct(newProduct);
		        }else{
		        	product.setNewproduct("false");
		        }
		        product.setIntroduct(product_ActionForm.getIntroduct());
		        productDAO.insertProduct(product);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		//request.getRequestDispatcher("/view_admin/product_oper.jsp").forward(request, response);
	}
}
