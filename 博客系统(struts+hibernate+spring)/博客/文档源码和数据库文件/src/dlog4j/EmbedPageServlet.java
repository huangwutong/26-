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
package dlog4j;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Vector;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.digester.Digester;
import org.apache.commons.lang.StringUtils;
import org.xml.sax.SAXException;

/**
 * @author Liudong
 * 用来处理.jspe的请求
 * show_log.jspe=>index.jsp?main=show_log.jspe
 */
public class EmbedPageServlet extends HttpServlet {

	public final static String URL_SEPARATOR = "/";
	protected MessageFormat mappingFormat;
	protected String paramName = "main";
	protected String baseDir = "/WEB-INF/jsp/";
	
	private String prefix ;
	
	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		
		initServlet();
		if(mappingFormat==null){
			//servletMapping = "*.jspe";
			mappingFormat = new MessageFormat("{0}.jspe");
		}
		String bd = getInitParameter("baseDir");
		if(bd!=null && bd.trim().length()>0){
			baseDir = bd;
			if(!baseDir.startsWith(URL_SEPARATOR))
				baseDir = URL_SEPARATOR + baseDir;
			if(!baseDir.endsWith(URL_SEPARATOR))
				baseDir += URL_SEPARATOR;
		}

		String cp = getInitParameter("container");
		if(cp!=null&&cp.trim().length()>0){
			if(!cp.startsWith(URL_SEPARATOR))
				cp = baseDir + URL_SEPARATOR + cp;
		}
		else
			log("FATAL: cannot read parameter container's value, must assign a valid jsp");
		
		String pn = getInitParameter("paramName");
		if(pn!=null&&pn.trim().length()>0)
			paramName = pn;
		
		StringBuffer newPage = new StringBuffer(64);
		newPage.append(cp);		
		newPage.append('?');
		newPage.append(paramName);
		newPage.append('=');
		
		prefix = newPage.toString();
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException 
	{
		res.setLocale(req.getLocale());
		String jspPage = null;
		try{
			jspPage = getForwardPage(req.getServletPath());
		}catch(ParseException e){
			String sPath = (String)req.getAttribute(Globals.ACTION_PATH_KEY);
			if(sPath!=null){
				int param_idx = sPath.indexOf('?');
				if(param_idx!=-1)
					sPath = sPath.substring(0, param_idx);
				try{
					jspPage = getForwardPage(sPath);
				}catch(ParseException ee){
					log("parse forward path from action failed.",ee);
				}
			}
		}
		//检查JSP文件是否存在
		if(jspPage.startsWith(URL_SEPARATOR))
			jspPage = jspPage.substring(URL_SEPARATOR.length());
		StringBuffer jspPath = new StringBuffer(baseDir);
		jspPath.append(jspPage);
		if(!isJspExists(jspPath.toString())){
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		jspPath = null;
		//跳到新的界面
		StringBuffer newPage = new StringBuffer(prefix);
		newPage.append(jspPage);
		
		String url = newPage.toString();
		getServletContext().getRequestDispatcher(url).include(req,res);
		newPage = null;
	}
	
	protected String getForwardPage(String path) throws ParseException {
		Object[] ps = mappingFormat.parse(path);
		return ps[0] + ".jsp";
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException {
		this.doGet(req, res);
	}
	
	/**
	 * 判断某个JSP文件是否存在
	 * @param jsp
	 * @return
	 */
	protected boolean isJspExists(String jsp){
		String webpath = getServletContext().getRealPath(jsp);
		if(!pages.contains(webpath)){
			boolean exists = new File(webpath).exists();
			if(exists)
				pages.add(webpath);
			return exists;
		}
		return true;
	}

	private List pages = new Vector();

	public void destroy() {
		if(pages!=null){
			pages.clear();
			pages = null;
		}
	}
    /**
     * <p>Initialize the servlet mapping under which our controller servlet
     * is being accessed.  This will be used in the <code>&html:form&gt;</code>
     * tag to generate correct destination URLs for form submissions.</p>
     *
     * @throws ServletException if error happens while scanning web.xml
     */
    protected void initServlet() throws ServletException {
        // Prepare a Digester to scan the web application deployment descriptor
        Digester digester = new Digester();
        digester.push(this);
        //digester.
        digester.setNamespaceAware(true);
        digester.setValidating(false);

        // Register our local copy of the DTDs that we can find
        for (int i = 0; i < registrations.length; i += 2) {
            URL url = this.getClass().getResource(registrations[i+1]);
            if (url != null) {
                digester.register(registrations[i], url.toString());
            }
        }

        // Configure the processing rules that we need
        digester.addCallMethod("web-app/servlet-mapping",
                               "addServletMapping", 2);
        digester.addCallParam("web-app/servlet-mapping/servlet-name", 0);
        digester.addCallParam("web-app/servlet-mapping/url-pattern", 1);

        InputStream input = getServletContext().getResourceAsStream("/WEB-INF/web.xml");

        if(input==null)
        	throw new ServletException("Cannot read web.xml");

        try {
            digester.parse(input);
        } catch (IOException e) {
            throw new ServletException(e);
        } catch (SAXException e) {
            throw new ServletException(e);
        } finally {
            try {
                input.close();
            } catch (IOException e) {
                throw new ServletException(e);
            }
        }
    }
    /**
     * <p>Remember a servlet mapping from our web application deployment
     * descriptor, if it is for this servlet.</p>
     *
     * @param servletName The name of the servlet being mapped
     * @param urlPattern The URL pattern to which this servlet is mapped
     */
    public void addServletMapping(String servletName, String urlPattern) {
        if (servletName == null)
            return;        
        if (servletName.equals(getServletConfig().getServletName())) {
            String servletMapping = StringUtils.replace(urlPattern, "*", "{0}");
            mappingFormat = new MessageFormat(servletMapping);
        }
    }

    /**
     * <p>The set of public identifiers, and corresponding resource names, for
     * the versions of the configuration file DTDs that we know about.  There
     * <strong>MUST</strong> be an even number of Strings in this list!</p>
     */
    protected String registrations[] = {
        "-//Apache Software Foundation//DTD Struts Configuration 1.0//EN",
        "/org/apache/struts/resources/struts-config_1_0.dtd",
        "-//Apache Software Foundation//DTD Struts Configuration 1.1//EN",
        "/org/apache/struts/resources/struts-config_1_1.dtd",
        "-//Apache Software Foundation//DTD Struts Configuration 1.2//EN",
        "/org/apache/struts/resources/struts-config_1_2.dtd",
        "-//Sun Microsystems, Inc.//DTD Web Application 2.2//EN",
        "/org/apache/struts/resources/web-app_2_2.dtd",
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN",
        "/org/apache/struts/resources/web-app_2_3.dtd"
    };

}
