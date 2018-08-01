package test.vo;

import java.util.Date;

public class MessageInfo {

	 private int message_id;
	 private String message_title;
	 private Date message_date;
	 private String message_user;
	 private String message_content;
	 
	public MessageInfo() {
		// TODO Auto-generated constructor stub
	}
	
	 
	 
	 
	public MessageInfo(String message_title, String message_user,
			String message_content) {
		super();
		this.message_title = message_title;
		this.message_user = message_user;
		this.message_content = message_content;
	}




	public MessageInfo(int message_id, String message_title, Date message_date,
			String message_user, String message_content) {

		this.message_id = message_id;
		this.message_title = message_title;
		this.message_date = message_date;
		this.message_user = message_user;
		this.message_content = message_content;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public String getMessage_user() {
		return message_user;
	}
	public void setMessage_user(String message_user) {
		this.message_user = message_user;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	
	 
	 
	 
	 
	 
	 
	 
}
