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
package dlog4j.tags;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.MessageFormat;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;
import dlog4j.util.mail.Mailer;

/**
 * 用于发送密码到用户邮箱的标签
 * @author liudong
 */
public class SendPasswordTag extends TagSupport {
	
	String resultId = "result";
	String user;
	String title = "DLOG4j密码提示";

	public int doStartTag() throws JspException {
		UserForm userForm = (UserForm)pageContext.findAttribute(user);
		if(userForm==null)
			throw new JspException("cannot find user attribute.");
		
		try {
			SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
			String[] args = new String[]{userForm.getLoginName(), 
										 userForm.getPassword(), 
										 site.getUrl(), 
										 site.getDisplayName()};
			String template = getContentTemplate();
			String content = MessageFormat.format(template, args);
			Mailer mailer = Mailer.getMailer();
			mailer.send(site.getDisplayName(),
						new String[]{userForm.getEmail()},
						title,
						content);
			pageContext.setAttribute(resultId,"SENT");
		} catch (Exception e) {
			pageContext.getServletContext().log("发送密码提示失败",e);
			pageContext.setAttribute(resultId,e);
		}
		return SKIP_BODY;
	}
	
	/**
	 * 获得忘记密码提示内容的模板
	 * @return
	 * @throws IOException
	 */
	protected String getContentTemplate() throws IOException{
		ServletContext sc = pageContext.getServletContext();
		InputStream in = sc.getResourceAsStream("/WEB-INF/template/password_tip.html");
		StringBuffer template = new StringBuffer(512);
		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new InputStreamReader(in));
			do{
				String line = reader.readLine();
				if(line==null)
					break;
				template.append(line);
				template.append("\r\n");
			}while(true);
		}finally{
			in.close();
		}
		return template.toString();
	}
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getResultId() {
		return resultId;
	}
	public void setResultId(String resultId) {
		this.resultId = resultId;
	}
}
