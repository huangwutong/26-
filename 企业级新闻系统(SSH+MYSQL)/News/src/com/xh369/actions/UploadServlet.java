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
		//����HttpSession����
		HttpSession session = request.getSession();
		ServletContext servletcontext = this.getServletContext();
		String url = servletcontext.getRealPath("/images");
		session.setAttribute("url",url);
		if ("status".equals(request.getParameter("c"))) {//���������c��ֵΪstatus
			UtilMethod.doStatus(session, response);//����doStatus����(˵�����ϴ��ļ��Ĺ��̵���ͨ��Ajax�ٴ�����������˽��д���,�����ϴ�״̬���ؿͻ���)
		} else {//����,����doFileUpload����(˵���ô��ύ���״��ϴ��ļ�ִ�е�������)
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
				//ѭ��items�еĶ���
				if(items != null){
					for (Iterator i = items.iterator(); i.hasNext();) {
						//(��Ҫ���漰���ϴ��ļ����п���ͬʱ�ϴ�����ļ�,�����շ�����ֻ�Ὣ�俴��һ��������,���������ֿ���,��Ҫ������ת���ɵ�����Ŀ(��FileItem))
						//����FileItem��org.apache.commons.fileupload���е�һ���ӿ�
						FileItem fileItem = (FileItem) i.next();
						if (!fileItem.isFormField()) {//�����FileItem���Ǳ���
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
				//����������װ��ActionForm��,������ҵ���߼��㷽�����г־û�
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
		        //�÷������������·��ȥ��������ļ�����Ϣ(����ֻ�ܷ��ʸ������·��,�����ܷ���WEB-INF·��)
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
