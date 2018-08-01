/*
 * ��Ȩ����: ���ݵ�Ѷ����Ƽ����޹�˾ 2003-2004
 * ��Ŀ��DLOG4J
 * ���ڰ���dlog4j.util.mail
 * �ļ�����Mailer.java
 * ����ʱ�䣺2004-11-26
 * �����ߣ�Winter Lau
 */
package dlog4j.util.mail;

/**
 * �ʼ����͵ĳ�����
 * @author Winter Lau
 */
public abstract class Mailer {

	protected static Mailer mailer;
	
	/**
	 * �ʼ�����
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
	 * ��ȡ�ʼ����͵�ʵ��
	 * @return
	 */
	public static Mailer getMailer(){
		return mailer;
	}
}
