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
package dlog4j.plugins;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.naming.*;
import javax.mail.internet.*;
import javax.naming.directory.*;
import javax.servlet.ServletException;

import org.apache.struts.action.*;
import org.apache.commons.logging.*;
import org.apache.struts.config.ModuleConfig;

import dlog4j.util.mail.Mailer;

/**
 * 直接连接邮件接收者的服务器进行邮件发送
 * 该插件在struts-config.xml中的配置如下
    <plug-in className="dlog4j.util.mail.MailPlugin">
		<!-- 发送者邮件地址 -->
		<set-property property="sender" value="dlog4j@gmail.com"/> 
	</plug-in>
 * @author Winter Lau
 */
public class MailPlugin extends Mailer implements PlugIn {

	private static Log log = LogFactory.getLog(MailPlugin.class);
	
	private String sender = "dlog4j@gmail.com";
	private DirContext context;
	
	/* (non-Javadoc)
	 * @see org.apache.struts.action.PlugIn#init(org.apache.struts.action.ActionServlet, org.apache.struts.config.ModuleConfig)
	 */
	public void init(ActionServlet servlet, ModuleConfig config)
		throws ServletException{
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY,"com.sun.jndi.dns.DnsContextFactory");
        env.put(Context.PROVIDER_URL, "dns://");        
        try{
        	context = new InitialDirContext(env);
		}catch(NamingException e){
			log.fatal("Mail Messenger start failed.", e);
		}        
		mailer = this;
	}

	/**
	 * 邮件发送
	 * @param sn	发送者名称
	 * @param mails
	 * @param title
	 * @param content
	 */
	public void send(final String sn, 
					 final String[] mails, 
					 final String title, 
					 final String content)
	{
		new Thread(){
			public void run(){
				for(int i=0;i<mails.length;i++){
					try {
						String domain = parseDomain(mails[i]);
						Attributes attr = context.getAttributes(domain, new String[]{"MX"});
						NamingEnumeration servers = attr.getAll();
						// 列出所有邮件服务器：
						while (servers.hasMore()) {
							Attribute hosts = (Attribute) servers.next();
							for (int j = 0; j < hosts.size(); j++) {
								String host = (String) hosts.get(j);
								host = host.substring(host.indexOf(' ') + 1);								
								sendMail(sn, mails[i], title, content, host);
								break;
							}
							break;
						}
					} catch (Exception e) {
						log.error("Send mail to "+mails[i],e);
					}
				}
			}
			
			/**
			 * 发送邮件
			 * @param sender
			 * @param mail
			 * @param title
			 * @param content
			 * @param host
			 * @throws MessagingException
			 * @throws UnsupportedEncodingException
			 */
			private void sendMail(String sn, String mail, String title, String content, String host) 
				throws UnsupportedEncodingException, MessagingException
			{
		        Properties props = System.getProperties();
		        props.put("mail.smtp.host", host);
		        props.put("mail.smtp.port", "25");
		        props.put("mail.smtp.auth", "false");
		        Session mailSession = Session.getInstance(props, null);

		        MimeMessage mailMessage = new MimeMessage(mailSession);
		        
		        MimeBodyPart bodyPart = new MimeBodyPart();
		        bodyPart.setContent(content, "text/html;charset=GB2312");
                Multipart multipart = new MimeMultipart("related");
                multipart.addBodyPart(bodyPart);
                mailMessage.setContent(multipart);
                
                mailMessage.setSentDate(new Date());
                mailMessage.setFrom(new InternetAddress(sender, sn));
                mailMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));
                mailMessage.setSubject(title);
                
                Transport.send(mailMessage);
			}
			/**
			 * 从邮件地址中解析出域名
			 * @param email
			 * @return
			 */
			private String parseDomain(String email){
				String domain = null;
				if(email!=null){
					int idx = email.indexOf('@');
					if(idx != -1){
						idx++;
						if(idx<email.length())
							domain = email.substring(idx);
					}
				}
				return domain;
			}
		}.start();
	}

	/*
	 * (non-Javadoc)
	 * @see org.apache.struts.action.PlugIn#destroy()
	 */
	public void destroy() {
		try{
			context.close();
		}catch(Exception e){
			log.error("Mail Messenger close context failed.", e);
		}
	}

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
}
