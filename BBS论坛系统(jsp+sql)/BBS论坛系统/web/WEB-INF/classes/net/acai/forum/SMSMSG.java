package net.acai.forum;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */

import net.acai.filter.*;
import net.acai.util.*;

public class SMSMSG
{
	private String sender,incept,title,content,sendtime;
	private int ID,flag,delR,delS,isSend;
	public SMSMSG() {
	}
	public void setID(int ID){
		this.ID=ID;
	}
	public int getID(){
		return this.ID;
	}
	public void setSender(String sender){
		this.sender=sender;
	}
	public String getSender(){
		return this.sender;
	}
	public void setIncept(String incept){
		this.incept=incept;
	}
	public String getIncept(){
		return incept;
	}
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return (new MyFilter(StringUtils.replace(StringUtils.convertNewlines(StringUtils.escapeHTMLTags(this.title))," ","&nbsp;"))).getFilterString();
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getContent(){
		return (new MyFilter(StringUtils.replace(StringUtils.convertNewlines(StringUtils.escapeHTMLTags(this.content))," ","&nbsp;"))).getFilterString();
	}
	public void setSendtime(String sendtime){
		this.sendtime=sendtime;
	}
	public String getSendtime(){
		return this.sendtime;
	}
	public void setFlag(int flag){
		this.flag=flag;
	}
	public int getFlag(){
		return this.flag;
	}
	public void setDelR(int delR){
		this.delR=delR;
	}
	public int getDelR(){
		return this.delR;
	}
	public void setDelS(int delS){
		this.delS=delS;
	}
	public int getDelS(){
		return this.delS;
	}
	public void setIsSend(int isSend){
		this.isSend=isSend;
	}
	public int getIsSend(){
		return this.isSend;
	}
}