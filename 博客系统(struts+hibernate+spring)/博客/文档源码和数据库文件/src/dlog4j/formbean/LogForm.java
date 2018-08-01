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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

/**
 * 日志
 * @auhor Liudong
 */
public class LogForm extends LogBaseForm {
	
	public final static int STATUS_NORMAL = 0x00;
	public final static int STATUS_HIDDEN = 0x02;
	public final static int STATUS_DELETED= 0x04;
	
	CategoryForm category;
	String searchKey;
	int viewCount;
	int replyCount;
	List replies;
	List trackBacks;
	Date deleteTime;
	int replyNotify = 0;
	int status = STATUS_NORMAL;

	/* 用户输入的验证
	 * @see org.apache.struts.action.ActionForm#validate(org.apache.struts.action.ActionMapping, javax.servlet.ServletRequest)
	 */
	public ActionErrors validate(ActionMapping arg0, HttpServletRequest arg1) {
		ActionErrors errors = new ActionErrors();
		if(getCategoryId()==-1)
			errors.add("categoryId",new ActionError("log_category_not_assign"));		
		if(title==null||title.length()==0)
			errors.add("title",new ActionError("log_title_not_assign"));
		if(content==null||content.length()==0)
			errors.add("content",new ActionError("log_content_not_assign"));
		if(author==null||author.length()==0)
			errors.add("author",new ActionError("not_empty_allow"));
		if(authorUrl==null||authorUrl.length()==0)
			errors.add("authorUrl",new ActionError("not_empty_allow"));
		return errors;
	}

	public String getSearchKey() {
		return searchKey;
	}
	public String[] getSearchKeys(){
		if(searchKey==null)
			return null;
		ArrayList keys = new ArrayList();
		StringTokenizer st = new StringTokenizer(searchKey);
		while(st.hasMoreElements()){
			keys.add(st.nextToken());
		}
		return (String[])keys.toArray(new String[keys.size()]);
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	
	public int getCategoryId(){
		return (category!=null)?category.getId():-1;
	}
	
	public void setCategoryId(int catId){
		if(category==null)
			category = new CategoryForm();
		category.setId(catId);
	}

	/**
	 * @return
	 */
	public CategoryForm getCategory() {
		return category;
	}


	/**
	 * @return
	 */
	public List getReplies() {
		return replies;
	}

	/**
	 * @return
	 */
	public int getReplyCount() {
		return replyCount;
	}

	/**
	 * @return
	 */
	public int getViewCount() {
		return viewCount;
	}

	/**
	 * @param form
	 */
	public void setCategory(CategoryForm form) {
		category = form;
	}

	/**
	 * @param list
	 */
	public void setReplies(List list) {
		replies = list;
	}

	/**
	 * @param i
	 */
	public void setReplyCount(int i) {
		replyCount = i;
	}

	/**
	 * @param i
	 */
	public void setViewCount(int i) {
		viewCount = i;
	}

	/**
	 * @return
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param i
	 */
	public void setStatus(int i) {
		status = i;
	}
    public List getTrackBacks() {
        return trackBacks;
    }
    public void setTrackBacks(List trackBacks) {
        this.trackBacks = trackBacks;
    }
    public Date getDeleteTime() {
        return deleteTime;
    }
    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }
	public int getReplyNotify() {
		return replyNotify;
	}
	public void setReplyNotify(int replyNotify) {
		this.replyNotify = replyNotify;
	}
}
