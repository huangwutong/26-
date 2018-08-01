package model;
/**
 * ÁôÑÔ±¾Ä£¿é
 */
import java.sql.Date;
import java.io.Serializable;
public class MessageModel implements Serializable{
	private String messagetitle;
	private String messagecontent;
	private String promulgator;
	private Date submitime;
	private int messageid;
	
	public void setMessageID(int messageid){
		this.messageid = messageid;
	}
	public int getMessageID(){
		return this.messageid;
	}
	public void setMessageTitle(String messagetitle){
		this.messagetitle = messagetitle;
	}
	public String getMessageTitle(){
		return this.messagetitle;
	}
	public void setMessageContent(String messagecontent){
		this.messagecontent = messagecontent;
	}
	public String getMessageContent(){
		return this.messagecontent;
	}
	public void setPromulgator(String promulgator){
		this.promulgator = promulgator;
	}
	public String getPromulgator(){
		return this.promulgator;
	}
	public void setSubmitime(Date submitime){
		this.submitime = submitime;
	}
	public Date getSubmitime(){
		return this.submitime;
	}
}

