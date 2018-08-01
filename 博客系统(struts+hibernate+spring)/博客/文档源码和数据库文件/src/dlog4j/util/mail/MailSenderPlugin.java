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
package dlog4j.util.mail;

import java.util.Date;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;

/**
 * �ʼ����͵Ĳ��
 * �ò����struts-config.xml�е���������
    <plug-in className="dlog4j.util.mail.MailSenderPlugin">
     	<!-- �������ʼ���ַ -->
    	<set-property property="mail" value="[email]"/>
    	<!-- SMTP��������ַ -->
    	<set-property property="host" value="[smtp_server_addr]"/>
    	<!-- SMTP�������˿ڣ������ָ����ʹ��Ĭ��25 -->
		<set-property property="port" value="25"/>
		<!-- �ʼ��ʺ� -->
		<set-property property="username" value="[account]"/>
		<!-- �ʼ����� -->
		<set-property property="password" value="[password]"/>
	</plug-in>	
 * @author Winter Lau
 */
public class MailSenderPlugin extends Mailer implements PlugIn {

	protected String mail;
	protected String host;
	protected int port = 25;
	protected String username;
	protected String password;
	
	private ActionServlet servlet;
	
	/* (non-Javadoc)
	 * @see org.apache.struts.action.PlugIn#init(org.apache.struts.action.ActionServlet, org.apache.struts.config.ModuleConfig)
	 */
	public void init(ActionServlet servlet, ModuleConfig config) throws ServletException {
		this.servlet = servlet;
		mailer = this;
	}

	/**
	 * �ʼ�����
	 * @param mails
	 * @param title
	 * @param content
	 * @param isHtml
	 */
	public void send(final String sendername, 
					 final String[] mails, 
					 final String title, 
					 final String content)
	{
		new Thread(){
			public void run(){
				MailSender sender = MailSender.getHtmlMailSender(host,port,username,password);
				try{
					sender.setSubject(title);
					sender.setSendDate(new Date());
					sender.setMailFrom(mail, sendername);
					sender.setMailContent(content);
					sender.setMailTo(mails, "to");
					sender.sendMail();
				}catch(Exception e){
					servlet.log("�����ʼ�ʧ��,title="+title+",content="+content,e);
				}
			}
		}.start();
	}
	
	/* (non-Javadoc)
	 * @see org.apache.struts.action.PlugIn#destroy()
	 */
	public void destroy() {
	}

	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
