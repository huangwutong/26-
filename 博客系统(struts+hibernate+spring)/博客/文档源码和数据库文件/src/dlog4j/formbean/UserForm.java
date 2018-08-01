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
package dlog4j.formbean;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Session;

import dlog4j.SiteManager;
import dlog4j.UserManager;
import dlog4j.security.DlogRole;
import dlog4j.util.StringUtils;

/** 
 * UserForm.java created by EasyStruts - XsltGen.
 * http://easystruts.sf.net
 * created on 02-02-2004
 * 
 * XDoclet definition:
 * @struts:form name="userForm"
 */
public class UserForm extends DlogActionForm implements Cloneable{

	public final static String KEY = "dlog4j.loginUser";
	public final static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	public final static int MODE_LOGIN = 0;
	public final static int MODE_REG   = 1;
	public final static int MODE_EDIT  = 2;
	public final static int MODE_CREATE  = 4; //������վ��Ĺ���Ա
	public final static int MODE_DELETE = 8;
	
	// --------------------------------------------------------- Instance Variables

	/** age property */
	private int id;

	/** email property */
	private String email;

	/** name property */
	private String loginName;
	
	private String password;
	private String displayName;
	private String homePage;
	private String resume;
	private String portrait;
	private int loginCount;
	private Date regTime;
	private Date lastTime;
	private int userRole = DlogRole.ROLE_GUEST;
	private int mode = MODE_LOGIN;
	
	private List logs;
	private int logCount;
	private List replies;
	private int replyCount;
	private int bookMarkCount; //���ֶβ���Ӧ���ݿ⣬������getLoginUser��ǩ���ø��ֶε�ֵ
	
	SiteForm site;
	
	DlogRole role;
	
	/**
	 * ����û��������������Ϊӵ����Ȩ(�鿴�����)�ķ���
	 * ����û��Ǻ�������������û�������ռǵķ���
	 * �������ʹ�ö��Ÿ񿪣����� 1,4,5
	 */
	private String cats; 
	
	public static UserForm getLoginUser(HttpServletRequest request){
		SiteForm sf = SiteManager.getCurrentSite(request);
		if(sf!=null)
			return (UserForm) request.getSession().getAttribute(sf.getName()+'_'+UserForm.KEY);
		return null;
	}
	
	public void saveLoginUser(HttpServletRequest request){
		SiteForm sf = SiteManager.getCurrentSite(request);
		if(sf!=null)
			request.getSession().setAttribute(sf.getName()+'_'+UserForm.KEY, this);
	}
	
	public static void removeFromSession(HttpServletRequest request){
		SiteForm sf = SiteManager.getCurrentSite(request);
		if(sf!=null)
			request.getSession().removeAttribute(sf.getName()+'_'+UserForm.KEY);
	}
	
	public boolean isLogin(){
		return regTime!=null;
	}
	
	public boolean isAdmin(){
		return userRole == DlogRole.ROLE_MANAGER;
	}
	
	public boolean isFriend(){
		return userRole == DlogRole.ROLE_FRIEND;
	}

	// --------------------------------------------------------- Methods

	public String toString(){
		StringBuffer user = new StringBuffer(100);
		user.append("Name:");
		user.append(loginName);
		user.append(",displayName:");
		user.append(displayName);
		user.append(",email:");
		user.append(email);
		user.append(",password:");
		user.append(password);
		return user.toString();
	}
	/**
	 * ����¼�ʺ��Ƿ��Ѵ���
	 * @param name
	 * @return
	 */
	protected UserForm checkLoginName(SiteForm site, String name){
		Session ssn = null;
		UserForm user = null;
		try{
			ssn = getSession();
			user = UserManager.getUser(ssn,site,name);
		}catch(HibernateException e){		
		}catch(SQLException e){
		}finally{
			try{
				closeSession(ssn);
			}catch(Exception e){}
		}
		return user;
	}

	/**
	 * @return
	 */
	public String getDisplayName() {
		return displayName;
	}

	/**
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return
	 */
	public String getHomePage() {
		return homePage;
	}

	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return
	 */
	public Date getLastTime() {
		return lastTime;
	}

	/**
	 * @return
	 */
	public int getLoginCount() {
		return loginCount;
	}

	/**
	 * @return
	 */
	public String getPassword() {
		return password;
	}
	
	public String getCryptPassword() {
	    return StringUtils.encrypt(password);
	}
	
	public void setCryptPassword(String pwd) {
	    password = StringUtils.decrypt(pwd);
	}

	/**
	 * @return
	 */
	public Date getRegTime() {
		return regTime;
	}

	/**
	 * @return
	 */
	public String getResume() {
		return resume;
	}

	/**
	 * @return
	 */
	public int getUserRole() {
		return userRole;
	}

	public String getRoleDesc(){
		String desc = null;
		switch(userRole){
		case DlogRole.ROLE_MANAGER:
			desc = "����Ա";
			break;
		case DlogRole.ROLE_GUEST:
			desc = "����";
			break;
		case DlogRole.ROLE_COMMON:
			desc = "��ͨ�û�";
			break;
		case DlogRole.ROLE_FRIEND:
			desc = "�ҵĺ���";
			break;
		case DlogRole.ROLE_BUDDY:
			desc = "����";
			break;
		default:
			desc = "δ֪";
		}
		return desc;
	}

	/**
	 * @param string
	 */
	public void setDisplayName(String string) {
		displayName = string;
	}

	/**
	 * @param string
	 */
	public void setEmail(String string) {
		email = string;
	}

	/**
	 * @param string
	 */
	public void setHomePage(String string) {
		homePage = string;
	}

	/**
	 * @param i
	 */
	public void setId(int i) {
		id = i;
	}

	/**
	 * @param date
	 */
	public void setLastTime(Date date) {
		lastTime = date;
	}

	/**
	 * @param i
	 */
	public void setLoginCount(int i) {
		loginCount = i;
	}

	/**
	 * @param string
	 */
	public void setPassword(String string) {
		password = string;
	}

	/**
	 * @param date
	 */
	public void setRegTime(Date date) {
		regTime = date;
	}
	
	public String getRegDate(){
	    if(regTime==null)
	        return null;
		return DATE_FORMAT.format(regTime);
	}
	
	public String getLastDate(){
	    if(lastTime==null)
	        return null;
		return DATE_FORMAT.format(lastTime);
	}

	/**
	 * @param string
	 */
	public void setResume(String string) {
		resume = string;
	}

	/**
	 * @param i
	 */
	public void setUserRole(int i) {
		userRole = i;
	}

	/**
	 * @return
	 */
	public List getLogs() {
		return logs;
	}
	
	public int getLogCount(){
		return logCount;
	}

	/**
	 * @return
	 */
	public List getReplies() {
		return replies;
	}

	/**
	 * @param list
	 */
	public void setLogs(List list) {
		logs = list;
	}

	/**
	 * @param list
	 */
	public void setReplies(List list) {
		replies = list;
	}

	/**
	 * @return
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * @param string
	 */
	public void setLoginName(String string) {
		loginName = string;
	}

	/**
	 * @return
	 */
	public int getMode() {
		return mode;
	}

	/**
	 * @param i
	 */
	public void setMode(int i) {
		mode = i;
	}

	/**
	 * @return
	 */
	public int getReplyCount() {
		return replyCount;
	}

	/**
	 * @param i
	 */
	public void setLogCount(int i) {
		logCount = i;
	}

	/**
	 * @param i
	 */
	public void setReplyCount(int i) {
		replyCount = i;
	}

	/**
	 * @return
	 */
	public SiteForm getSite() {
		return site;
	}

	/**
	 * @param form
	 */
	public void setSite(SiteForm form) {
		site = form;
	}
	
    public String getPortrait() {
        return portrait;
    }
    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }
	public DlogRole getRole() {
		return role;
	}
	public void setRole(DlogRole role) {
		this.role = role;
	}
	public String getCats() {
		return cats;
	}
	public void setCats(String cats) {
		this.cats = cats;
	}

	public int getBookMarkCount() {
		return bookMarkCount;
	}
	public void setBookMarkCount(int bookMarkCount) {
		this.bookMarkCount = bookMarkCount;
	}
	/**
	 * �÷�����CategoryManager����
	 * @return
	 */
	public int[] getOwnerCatids(){		
		List ids = new ArrayList();
		if(cats!=null){
			StringTokenizer st = new StringTokenizer(cats,",");
			while(st.hasMoreElements()){
				String sId = st.nextToken();
				try{
					Integer IId = new Integer(Integer.parseInt(sId));
					if(!ids.contains(IId))
						ids.add(IId);
				}catch(Exception e){}
			}
		}
		int[] nIds = new int[ids.size()];
		for(int i=0;i<ids.size();i++)
			nIds[i] = ((Integer)ids.get(i)).intValue();
		return nIds;
	}
}
