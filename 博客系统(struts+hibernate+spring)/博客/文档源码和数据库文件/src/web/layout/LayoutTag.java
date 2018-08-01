/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package web.layout;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.xml.sax.SAXException;

import dlog4j.util.StringUtils;

/**
 * 用于处理页面排版文件中变量的替换
 * @author liudong
 */
public class LayoutTag extends BodyTagSupport {

	protected final static int BUFFER_SIZE = 512;
	protected final static String ROOT = "{ROOT}";
	
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}
	public int doEndTag() throws JspException {
		Reader reader = getBodyContent().getReader();
		char[] buf = new char[BUFFER_SIZE];
		try{
			HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
			HttpServletResponse res = (HttpServletResponse)pageContext.getResponse();
			StringBuffer content1 = new StringBuffer(BUFFER_SIZE);
			do{
				int  rc = reader.read(buf);
				if(rc>0)
					content1.append(buf,0,rc);
				if(rc<BUFFER_SIZE)
					break;
			}while(true);
			String html = StringUtils.replaceIgnoreCase(content1.toString(), ROOT, req.getContextPath());
			List tokens = listTokens(html);
			int curIdx = 0;
			for(int i=0;i<tokens.size();i++){
				Token token = (Token)tokens.get(i);
				pageContext.getOut().write(html.substring(curIdx,token.begin));				
				try{
					if(ROOT.equals(token.name)){
						pageContext.getOut().write(req.getContextPath());
					}
					else{
						String tokenPage = getTokenPage(token.name,token.page);
						pageContext.include(tokenPage);
					}
				}catch (Exception e0) {	
					pageContext.getServletContext().log("LayoutTag.doEndTag page="+token.page,e0);
					pageContext.setAttribute("excetion", e0, PageContext.REQUEST_SCOPE);
					if(!errorPage.startsWith("/"))
						pageContext.include(baseDir + errorPage);
					else
						pageContext.include(errorPage);
				}
				curIdx = token.begin + token.name.length();
			}
			pageContext.getOut().write(html.substring(curIdx));
		}catch(Exception e1){
			pageContext.getServletContext().log("LayoutTag.doEndTag",e1);
		}
		return EVAL_PAGE;
	}
	
	/**
	 * 根据参数来决定是否替换页面中的BODY部分
	 * @param token 变量名称
	 * @param page	变量对应的默认页面
	 * @return
	 */
	protected String getTokenPage(String token, String page){
		String sPage;
		if(mainPage==null || !"$BODY$".equals(token))
			sPage = page;
		else
			sPage = (String)pageContext.findAttribute(mainPage);
		return (sPage.startsWith("/"))?sPage:(baseDir + sPage);
	}
	
	/**
	 * 列出排版页面中存在的所有变量并进行位置的排续
	 * @param content
	 * @return
	 * @throws SAXException
	 * @throws IOException
	 */
	protected synchronized List listTokens(String content) throws Exception{
		int hashcode = content.toString().hashCode();
		Integer layout_hashcode = (Integer)ht_hashcodes.get(id);
		final int layout_hc = (layout_hashcode!=null)?layout_hashcode.intValue():-1;
		final List last_tokens = (List)ht_tokens.get(id);
		if(hashcode==layout_hc && last_tokens!=null)
			return last_tokens;
		List tokens = new ArrayList();
		LayoutConfig config = LayoutConfig.getConfig(pageContext.getServletContext());
		int pc = config.pageSize();
		for(int i=0;i<pc;i++){
			Page page = config.getPage(i);
			int begin = content.indexOf(page.getName());
			if(begin!=-1){
				Token token = new Token();
				token.begin = begin;
				token.name = page.getName();
				token.page = page.getUri();
				tokens.add(token);
			}
		}
		int begin = content.indexOf(ROOT);
		if(begin!=-1){
			Token token = new Token();
			token.begin = begin;
			token.name = ROOT;
			tokens.add(token);
		}
		Collections.sort(tokens);//按位置进行排序
		//缓冲信息
		ht_hashcodes.put(id, new Integer(hashcode));
		ht_tokens.put(id, tokens);
		return tokens;
	}
	
	private static Hashtable ht_tokens = new Hashtable();
	private static Hashtable ht_hashcodes = new Hashtable();
	
	/**
	 * 用于变量替换保存临时参数
	 */
	private class Token implements Comparable{
		public int ident;
		public String name;
		public int begin;
		public String page;
		
		public int compareTo(Object obj) {
			return begin - ((Token)obj).begin;
		}
		public int hashCode() {
			return begin;
		}
	};
	
	protected String mainPage;
	protected String baseDir = "/WEB-INF/jsp/";
	protected String errorPage = "error/error.jsp";
	
	public String getMainPage() {
		return mainPage;
	}
	public void setMainPage(String mainPage) {
		this.mainPage = mainPage;
	}
	public String getBaseDir() {
		return baseDir;
	}
	public void setBaseDir(String baseDir) {
		if(!baseDir.endsWith("/"))
			baseDir += "/";
		this.baseDir = baseDir;		
	}
	public String getErrorPage() {
		return errorPage;
	}
	public void setErrorPage(String errorPage) {
		this.errorPage = errorPage;
	}
}
