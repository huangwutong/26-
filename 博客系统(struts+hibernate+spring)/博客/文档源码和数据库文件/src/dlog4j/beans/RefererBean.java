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
package dlog4j.beans;

import java.io.Serializable;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

/**
 * 外部网站引用记录,对应表dlog_site_referer的一条记录
 * 建表语句：
 * create table dlog_visit (
visitID              INTEGER              not null,
remoteAddr           CHAR(15)             not null,
requestURL           VARCHAR(100)         not null,
userAgent            VARCHAR(100)         null,
visitDate            CHAR(8)              not null,
visitTime            CHAR(6)              not null,
refererURL           VARCHAR(200)         null,
constraint PK_DLOG_VISIT primary key  (visitID)
)
 * @author Winter Lau
 */
public class RefererBean implements Serializable {

	public final static String DATE_FORMAT = "yyyyMMdd";
	public final static String TIME_FORMAT = "HHmmss";
	
	public final static DateFormat DATE = new SimpleDateFormat(DATE_FORMAT);
	public final static DateFormat TIME = new SimpleDateFormat(TIME_FORMAT);
	
	protected int id;
	protected String remoteAddr;
	protected String refererURL;
	protected String requestURL;
	protected String userAgent;
	protected String visitDate;
	protected String visitTime;
	
	/**
	 * 该构造函数是提供给Hibernate初始化Bean时用
	 */
	public RefererBean() {
	}
	
	/**
	 * 从反问请求实例中初始化外部引用记录
	 * @param request
	 */
	public RefererBean(HttpServletRequest request) {
		refererURL = request.getHeader("referer");
		remoteAddr = request.getRemoteAddr();
		userAgent = request.getHeader("user-agent");
		StringBuffer ru = request.getRequestURL();
		if(request.getQueryString()!=null){
			ru.append('?');
			ru.append(request.getQueryString());
		}
		setRequestURL(ru.toString());
		Date curTime = new Date();
		visitDate = DATE.format(curTime);
		visitTime = TIME.format(curTime);
		curTime = null;
	}
	
	/**
	 * 判断该外部引用是否来自于自身站点
	 * @param request
	 * @return
	 */
	public boolean isFromOutsite() {
		if(refererURL!=null)
		try{
			URL req_url = new URL(requestURL);
			URL ref_url = new URL(refererURL);
			return !req_url.getHost().equalsIgnoreCase(ref_url.getHost());
		}catch(Exception e){}
		return false;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRequestURL() {
		return requestURL;
	}
	public void setRequestURL(String reqUrl) {
		this.requestURL = reqUrl;
		trimReqUrl();
	}
	
	protected void trimReqUrl(){
		if(requestURL==null)
			return;
		String url = "";
		int mainParamIdx = requestURL.indexOf("main=");
		if(mainParamIdx!=-1){
			int splitIdx = requestURL.indexOf("&",mainParamIdx);
			if(splitIdx!=-1){
				url = requestURL.substring(0,mainParamIdx);
				if((splitIdx+1)<requestURL.length()){
					url += requestURL.substring(splitIdx+1);
				}
			}else{
				url = requestURL.substring(0,mainParamIdx-1);
			}
			requestURL = url;
		}
	}

	public String getRefererURL() {
		return refererURL;
	}
	public void setRefererURL(String refererURL) {
		this.refererURL = refererURL;
	}
	public String getRemoteAddr() {
		return remoteAddr;
	}
	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}
	public static void main(String[] args){
		Date curTime = new Date();
		String visitDate = DATE.format(curTime);
		String visitTime = TIME.format(curTime);
		System.out.println("visitDate="+visitDate);
		System.out.println("visitTime="+visitTime);
	}
}
