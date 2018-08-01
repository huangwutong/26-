/*
 * 版权所有: 广州点讯网络科技有限公司 2003-2004
 * 项目：DLOG4J
 * 所在包：dlog4j.util.mail
 * 文件名：Mailer.java
 * 创建时间：2004-11-26
 * 创建者：Winter Lau
 */
package dlog4j.util.mail;

/**
 * 邮件发送的抽象类
 * @author Winter Lau
 */
public abstract class Mailer {

	protected static Mailer mailer;
	
	/**
	 * 邮件发送
	 * @param sendername
	 * @param mails
	 * @param title
	 * @param content
	 */
	public abstract void send(final String sendername, 
					 		  final String[] mails, 
							  final String title, 
							  final String content);
	
	/**
	 * 获取邮件发送的实例
	 * @return
	 */
	public static Mailer getMailer(){
		return mailer;
	}
}
