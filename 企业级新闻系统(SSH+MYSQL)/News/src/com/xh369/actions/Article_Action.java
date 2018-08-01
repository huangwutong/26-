package com.xh369.actions;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForward;
import com.xh369.dto.Article_ActionForm;
import com.xh369.dto.Article;
import com.xh369.dto.Articlesviews;
import org.apache.struts.actions.DispatchAction;
import com.xh369.service.ManagerFactory;
import com.xh369.dao.ArticleDAO;
import java.util.*;
import com.xh369.dao.ArticlesviewsDAO;
import com.xh369.dao.BigClassDAO;
import com.xh369.dto.BigClass;
import com.xh369.dao.SmallClassDAO;
import com.xh369.dto.SmallClass;
import com.xh369.service.UtilForm;
import com.xh369.daoimpl.ArticlesviewsDAOimpl;
import java.io.*;

public class Article_Action extends DispatchAction {

    ArticleDAO articleDAO = ManagerFactory.createArticleDAO();
    BigClassDAO bigclassDAO = ManagerFactory.createBigClassDAO();
    SmallClassDAO smallclassDAO = ManagerFactory.createSmallClassDAO();
    ArticlesviewsDAO articlesviewsDAO = new ArticlesviewsDAOimpl();
    //每页页大小
    int pageSize = 20;

    //文章添加
    public ActionForward articleAdd(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Article_ActionForm article_ActionForm = (Article_ActionForm) form;
        try {
            article_ActionForm.setTitle(new String(article_ActionForm.getTitle()
                                                                      .getBytes("ISO-8859-1"), "GB2312"));
            article_ActionForm.setContent(new String(article_ActionForm.getContent().getBytes("ISO-8859-1"), "GB2312"));
        } catch (UnsupportedEncodingException ex){
            ex.printStackTrace();
        }
        //转换位article的对象
        Article article = (Article) UtilForm.populate(article_ActionForm,
                                                      "com.xh369.dto.Article",
                                                      new String[] {"title","content"});
//        BigClass bigclass =(BigClass) UtilForm.populate(article_ActionForm,
//                                                      "com.xh369.dto.BigClass",
//           new String[] {"id"});
        
        BigClass bigclass = bigclassDAO.loadBigClass(Integer.valueOf(String.valueOf(article_ActionForm.getBigclassid())));
        article.setBigclass(bigclass);
        SmallClass smallclass = smallclassDAO.loadSmallClass(article_ActionForm.getSmallclassid());
        article.setSmallclass(smallclass);
        //文章添加成功
        if (articleDAO.articleAdd(article)) {
            return mapping.findForward("ok");
        } else {
            return mapping.findForward("error");
        }
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
    
    //查询标题(通过Ajax)
    public ActionForward searchTitle(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	String title = request.getParameter("search");
    	List titleList = articleDAO.searchArticleTitle(title);
    	StringBuffer sb = new StringBuffer();
    	for(int i = 0 ; i < titleList.size() ; i ++){
    		sb.append(titleList.get(i).toString() + "\n");
    	}
    	try {
			response.getWriter().print(parasToXML(sb));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    //该方法将数据转化成XML格式输出
    public String parasToXML(StringBuffer sb) {
    	
		StringBuffer buf = new StringBuffer();
		buf.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		buf.append("<pictures>");
		String[] str = sb.toString().split("\n");
		for (int i = 0 ; i < str.length ; i++) {
			buf.append("<item>");
			buf.append("<title>" + str[i] + "</title>");
			buf.append("</item>");
		}
		buf.append("</pictures>");
		return buf.toString();
	}
    
    //文章浏览(分按id不为空与标题为空时,按id为空与标题不为空时,按id与标题均不为空时,按id与标题均为空时),或者按一级分类名与二级分类名查询
    public ActionForward search(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
		Articlesviews articlesviews = new Articlesviews();
		List articlesviewsList = articlesviewsDAO.findByExample(articlesviews);
		request.getSession().setAttribute("articles", articlesviewsList);
		request.setAttribute("articlesviewsList", articlesviewsList);
    	String strTitle = request.getParameter("title") == null ?"":request.getParameter("title");
        request.getSession().setAttribute("constForm", form);
        Article_ActionForm article_ActionForm = (Article_ActionForm) form;
        article_ActionForm.setTitle(strTitle);
        currency(request);
        int id = article_ActionForm.getId() == null ?0:Integer.parseInt(article_ActionForm.getId().toString());
        String title = article_ActionForm.getTitle() == null ?"":article_ActionForm.getTitle();
        String bigclassname = request.getParameter("bigclassname") == null ?"":request.getParameter("bigclassname");
        String smallclassname = request.getParameter("smallclassname") == null ?"":request.getParameter("smallclassname");
        String searchid = request.getParameter("searchid") == null ?"":request.getParameter("searchid");
        Object[][] val = new Object[][]{
                                          {"id.id", new Integer(id)},
                                          {"id.title", title},
                                          {"id.bigclassname", bigclassname},
                                          {"id.smallclassname", smallclassname}
                                        };
        List aList = articlesviewsDAO.findByProperty(val, 1, pageSize);
        if (aList.size()>0) {
            request.getSession().setAttribute("aList", aList);
            //总记录数
            int count = articlesviewsDAO.getCount(val);
            int t = count % pageSize == 0 ? count/pageSize : count/pageSize + 1;
            request.setAttribute("currpage", 1 + "");
            request.setAttribute("totalPage",t + "");
            request.setAttribute("count", count + "");
            List aryList = new ArrayList();
            for(int i = 1; i <= t; i++){
                aryList.add(i + "");
            }
            request.setAttribute("aryList", aryList);
            if(bigclassname.equals("") || searchid.equals("")){
                request.setAttribute("dis", "none");
            }
            if(!bigclassname.equals("") || !searchid.equals("")){
                request.setAttribute("searchid", searchid);
                request.setAttribute("dis", "");
            }
        } else {
            if(!searchid.equals("")){
                request.setAttribute("searchid", searchid);
                request.setAttribute("dis", "");
            }
            request.setAttribute("noRecords", "没有记录");
        }
        request.setAttribute("play", "");
        request.setAttribute("noplay", "none");
        request.setAttribute("divajax", "none");
        return mapping.findForward("success");
    }
    
    //文章浏览(通过Ajax)
    public ActionForward searchByAjax(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	response.setCharacterEncoding("UTF-8");
    	//设置返回数据为xml格式
		response.setContentType("text/xml");
		java.io.PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	currency(request);
    	int position_index = searchUtil(request);
        List aList = articlesviewsDAO.findByProperty(position_index, pageSize);
        if (aList.size()>0) {
        	out.print(parasToXML(aList, request));
        } 
    	return null;
    }
    
    //文章浏览中获得总记录数(通过Ajax)
    public ActionForward searchCountByAjax(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	response.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html");
		java.io.PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	currency(request);
    	int count = articlesviewsDAO.getCount();
    	if(count % pageSize != 0)
			count = count / pageSize + 1;
		else
			count = count / pageSize;
    	System.out.println("count=" + count + "=count");
		out.print(count);
    	return null;
    }
    
    public String parasToXML(List v, HttpServletRequest request) {
		
    	HttpSession session = request.getSession();
		StringBuffer buf = new StringBuffer();
		//将向量中的数据组织成XML数据
		buf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		buf.append("<articlesviews>");
		for (int i = 0; i < v.size() ; i ++) {
			Articlesviews articlesviews = (Articlesviews) v.get(i);
			buf.append("<articlesview>");
			buf.append("<id>" + articlesviews.getId().getId() + "</id>");
			buf.append("<title>" + articlesviews.getId().getTitle() + "</title>");
			buf.append("<deployer>" + session.getAttribute("username") + "</deployer>");
			buf.append("<bigclass>" + articlesviews.getId().getBigclassname() + "</bigclass>");
			buf.append("<smallclass>" + articlesviews.getId().getSmallclassname() + "</smallclass>");
			buf.append("<deploytime>" + articlesviews.getId().getDeploytime() + "</deploytime>");
			buf.append("</articlesview>");
		}
		buf.append("</articlesviews>");
		return buf.toString();
	}
    
    //文章浏览(分按id不为空与标题为空时,按id为空与标题不为空时,按id与标题均不为空时,按id与标题均为空时),用于超链接查询
    public ActionForward searchPage(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){
    	
    	if(request.getParameter("swi").equals("1")){
    		request.setAttribute("play", "");
            request.setAttribute("noplay", "none");
    	}else{
    		request.setAttribute("play", "none");
            request.setAttribute("noplay", "");
    	}
        currency(request);
        Object constForm = request.getSession().getAttribute("constForm");
        Article_ActionForm article_ActionForm = (Article_ActionForm) constForm;
        //click表示:当其不为空时,则是通过下拉列表提交过来的
        String click = request.getParameter("click") == null ?"":request.getParameter("click");
        int id = -1;
        String title = "";
        if(click.equals("")){
            id = article_ActionForm.getId() == null ?0:Integer.parseInt(article_ActionForm.getId().toString());
            title = article_ActionForm.getTitle() == null ?"":article_ActionForm.getTitle();
        }else{
            id = request.getParameter("id").equals("") ?0:Integer.parseInt(request.getParameter("id"));
            title = new String(request.getParameter("title")) == null ?"":request.getParameter("title");
        }
        Object[][] val = new Object[][]{
                                          {"id.id", new Integer(id)},
                                          {"id.title", title},
                                          {"id.bigclassname", ""},
                                          {"id.smallclassname", ""}
                                        };
        int position_index = searchUtil(request);
        List aList = articlesviewsDAO.findByProperty(val, position_index, pageSize);
        if (aList.size()>0) {
            request.getSession().setAttribute("aList", aList);
            //总记录数
            int count = articlesviewsDAO.getCount(val);
            int t = count % pageSize == 0 ? count/pageSize : count/pageSize + 1;
            request.setAttribute("currpage", position_index + "");
            request.setAttribute("totalPage",t + "");
            request.setAttribute("count", count + "");
            List aryList = new ArrayList();
            for(int i = 1; i <= t; i++){
                aryList.add(i + "");
            }
            request.setAttribute("aryList", aryList);
            request.setAttribute("dis", "none");
            return mapping.findForward("success");
        } else {
            return mapping.findForward("error");
        }
    }

    //加载文章添加页面及填充一级分类与二级分类下拉列表(通过一级分类导航到二级分类)
    public ActionForward show(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        currency(request);
        return mapping.findForward("show");
    }

    //抽象出一个通用方法,供多处方法调用(即查询出一级分类与二级分类,通过一级分类导航到二级分类)
    void currency(HttpServletRequest request){
    	//查找文章的一级分类
        List arrList = articleDAO.searchBigClass();
        if(arrList.size()>0){
            request.setAttribute("arrList", arrList);
        }
    }

    //查看文章详细内容
    public ActionForward searchDesc(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Integer id = Integer.valueOf(request.getParameter("id"));
        Article article = articleDAO.searchDesc(id);
        if(article != null){
            request.setAttribute("article", article);
            return mapping.findForward("showdesc");
        }else{
            return mapping.findForward("error");
        }
    }

    //修改发布的文章的信息(首先显示出原数据)
    public ActionForward updateArticle(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Article_ActionForm article_ActionForm = (Article_ActionForm) form;
        Integer id = Integer.valueOf(request.getParameter("id"));
        Article article = articleDAO.updateArticle(id);
        article_ActionForm.setBigclassid(article.getBigclass().getId().intValue());
        article_ActionForm.setSmallclassid(article.getSmallclass().getId());
        article_ActionForm.setContent(article.getContent());
        article_ActionForm.setTitle(article.getTitle());
        article_ActionForm.setPicpath(article.getPicpath());
        article_ActionForm.setDeploytime(article.getDeploytime());
        if(article != null){
            currency(request);
            request.setAttribute("article_ActionForm", article_ActionForm);
            return mapping.findForward("update");
        }else{
            return mapping.findForward("error");
        }
    }

    //修改发布的文章的信息
    public ActionForward updateOnlyArticle(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        Article_ActionForm article_ActionForm = (Article_ActionForm) form;
        Integer id = Integer.valueOf(request.getParameter("id"));
        Article article = articleDAO.updateArticle(id);
        article.setTitle(article_ActionForm.getTitle());
        article.setPicpath(article_ActionForm.getPicpath());
        Integer bid = Integer.valueOf(String.valueOf(article_ActionForm.getBigclassid()));
        BigClass bigclass = bigclassDAO.loadBigClass(bid);
        article.setBigclass(bigclass);
        Integer sid = article_ActionForm.getSmallclassid();
        SmallClass smallclass = smallclassDAO.loadSmallClass(sid);
        article.setSmallclass(smallclass);
        article.setContent(article_ActionForm.getContent());
        article.setDeploytime(article_ActionForm.getDeploytime());
        if(articleDAO.updateOnlyArticle(article)){
            return searchPage(mapping, form, request, response);//再次查询发布的文章的信息
        }else{
            return mapping.findForward("error");
        }
    }

    //删除发布的文章的信息
    public ActionForward deleteArticle(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        int ids = Integer.parseInt(request.getParameter("id"));
        Integer id = new Integer(ids);
        if(articleDAO.deleteArticle(id)){
            return searchPage(mapping, form, request, response);//再次查询发布的文章的信息
        }else{
            return mapping.findForward("error");
        }
    }

    //在栏目管理模块中显示一级分类与二级分类
    public ActionForward searchClass(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response){

        currency(request);
        return mapping.findForward("searchclass");
    }
}
