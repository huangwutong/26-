package net.acai.forum;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import net.acai.forum.*;
import net.acai.database.*;
import javax.servlet.http.*;
import java.sql.*;
import net.acai.util.*;
import java.util.Vector;
import net.acai.database.*;


public class BookMark
{
	int ID;
	String userName,url,topic,addTime;
	public BookMark(){}
	
	public void setID(int ID){
		this.ID=ID;
	}
	public int getID(){
		return this.ID;
	}
	public void setUserName(String userName){
		this.userName=userName;
	}
	public String getUserName(){
		return this.userName;
	}
	public void setURL(String url){
		this.url=url;
	}
	public String getURL(){
		return this.url;
	}
	public void setTopic(String topic){
		this.topic=topic;
	}
	public String getTopic(){
		return this.topic;
	}
	public void setAddTime(String addTime){
		this.addTime=addTime;
	}
	public String getAddTime(){
		return addTime;
	}


}