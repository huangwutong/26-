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
package dlog4j.tags;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

import net.sf.hibernate.Session;

import org.apache.commons.lang.StringUtils;

import dlog4j.Globals;
import dlog4j.ParamManager;
import dlog4j.ReplyManager;
import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;

/**用于评论的显示
 * @author ZT
 *
 */
public class RepliesTag extends DlogBaseTag {
	
    public final static int PAGE_PER_SCREEN = 10;
    
	public final static DateFormat FMT_DATE = new SimpleDateFormat("yyyyMMdd");

	int catid = -1;			//评论所属日记分类编号
	String search = null;	//待查询的内容
	int year = -1;
	int month = -1;
	int date = -1;		//要查看某日的评论
	String sort = null;		//排序方式
	int userid = -1;
	int size = -1;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		//获取当前的SiteForm
		Session ssn = null;
		try{
			ssn = getSession();			
			SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
			if(catid==-1)
				try{
					catid = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_CATEGORYID));
				}catch(Exception e){}		
			if(year==-1)
				try{
					year = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_YEAR));
				}catch(Exception e){}			
			if(month==-1)
				try{
					month = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_MONTH));
				}catch(Exception e){}			
			if(date==-1)
				try{
					date = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_DATE));
				}catch(Exception e){}				
			if(userid==-1)
				try{
				    userid = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_USER));
				}catch(Exception e){}	
			String search = pageContext.getRequest().getParameter("query");
			
			UserForm loginUser = UserForm.getLoginUser((HttpServletRequest)pageContext.getRequest());	
			List searchReplies = null;
			int Replycount = 0;
			if(StringUtils.isEmpty(search))
			    Replycount = ReplyManager.getRepliesCount(ssn,site,loginUser,catid,userid,year,month,date);
			else {
			    searchReplies = ReplyManager.searchAllReplies(ssn,site,loginUser,catid,search,sort);
			    Replycount = searchReplies.size();
			    //Replycount = ReplyManager.getSearchReplyCount(ssn,site,loginUser,catid,userid,search);
			}
			//int logcount = LogManager.getLogCount(ssn,site,loginUser,catid,userid,year,month,date);
			pageContext.setAttribute(RepliesTei.REPLY_COUNT,new Integer(Replycount)) ;
			//pageContext.setAttribute(LogsTei.LOG_COUNT, new Integer(logcount));
			int perPage = size;
			if(perPage<1)
				perPage = ParamManager.getIntParam(ssn,site,"REPLIES_PER_PAGE",10);			
			pageContext.setAttribute(RepliesTei.PER_PAGE,new Integer(perPage)) ;
			//pageContext.setAttribute(LogsTei.PER_PAGE, new Integer(perPage));
			int pageCount = (Replycount / perPage) + (((Replycount%perPage)>0)?1:0);
			pageContext.setAttribute(RepliesTei.PAGE_COUNT,new Integer(pageCount)) ;
			//pageContext.setAttribute(LogsTei.PAGE_COUNT, new Integer(pageCount));
			int screenCount = (pageCount / PAGE_PER_SCREEN) + (((pageCount%PAGE_PER_SCREEN)>0)?1:0);
			pageContext.setAttribute(RepliesTei.SCREEN_COUNT,new Integer(screenCount));
			//pageContext.setAttribute(LogsTei.SCREEN_COUNT, new Integer(screenCount));
			int curPage = 1;
			try{
				curPage = Integer.parseInt(pageContext.getRequest().getParameter(Globals.PARAM_PAGE));
			}catch(Exception e){}
			pageContext.setAttribute(RepliesTei.CUR_PAGE, new Integer(curPage));	
			//pageContext.setAttribute(LogsTei.CUR_PAGE, new Integer(curPage));	
			if(sort==null)
				sort = pageContext.getRequest().getParameter("sort");
			int from = (curPage-1)*perPage;
			if(from<0)
				from = 0;	
			if(StringUtils.isEmpty(search)) {	
			    List replies = ReplyManager.listReplies(ssn,site,loginUser,catid,userid,from,perPage,sort,year,month,date);
			    pageContext.setAttribute(id,replies);
			    //组合时间条件字符串
			    String timestr = null;
			    if(year!=-1&&month!=-1&&date!=-1)
			        timestr = year+"年"+month+"月"+date+"日";
			    else
			    if(year!=-1&&month!=-1)
			        timestr = year+"年"+month+"月";
			    else
			    if(year!=-1)
			        timestr = year+"年";
			    if(timestr!=null)
			        pageContext.setAttribute(RepliesTei.TIME_STR,timestr);
			}
			else {
			    int to = from+perPage;
			    if(to>searchReplies.size())
			        to = searchReplies.size();

			    if(from>searchReplies.size())
			    	from = searchReplies.size();
			    //List replies = ReplyManager.searchReplies(ssn,site,loginUser,catid,userid,search,sort,from,perPage);
			    pageContext.setAttribute(id, searchReplies.subList(from,to));	
			}
		}catch(Exception e){
			throw new JspException(e);
		}finally{
			try{
				closeSession(ssn);
			}catch(Exception e){}
		}
		//读取指定分类指定日期的总日记数
		//读取日记信息
		userid = -1;
		size = -1;
		return EVAL_BODY_INCLUDE;
	}

	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#release()
	 */
	public void release() {
		catid = -1;
		search = null;
		date = -1;
		year = -1;
		month = -1;
		sort = null;
		userid = -1;
		size = -1;
	}

    /* (non-Javadoc)
     * @see javax.servlet.jsp.tagext.Tag#doEndTag()
     */
    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
	/**
	 * @return
	 */
	public int getCatid() {
		return catid;
	}

	/**
	 * @return
	 */
	public String getSearch() {
		return search;
	}

	/**
	 * @param i
	 */
	public void setCatid(int i) {
		catid = i;
	}

	/**
	 * @param i
	 */
	public void setCatid(String string) {
		try{
			catid = Integer.parseInt(string);
		}catch(Exception e){}
	}

	/**
	 * @param string
	 */
	public void setSearch(String string) {
		search = string;
	}

	/**
	 * @return
	 */
	public int getDate() {
		return date;
	}

	/**
	 * @param string
	 */
	public void setDate(int string) {
		date = string;
	}

	/**
	 * @return
	 */
	public String getSort() {
		return sort;
	}

	/**
	 * @param string
	 */
	public void setSort(String string) {
		sort = string;
	}

	/**
	 * @return
	 */
	public int getMonth() {
		return month;
	}

	/**
	 * @return
	 */
	public int getYear() {
		return year;
	}

	/**
	 * @param i
	 */
	public void setMonth(int i) {
		month = i;
	}

	/**
	 * @param i
	 */
	public void setYear(int i) {
		year = i;
	}

    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
}
