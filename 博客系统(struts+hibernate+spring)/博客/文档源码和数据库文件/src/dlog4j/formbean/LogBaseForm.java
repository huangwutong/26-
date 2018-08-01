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

import java.util.Date;
import java.util.List;

/**
 * 日记信息的基类,有两个子类LogForm以及DraftForm
 * @author Liudong
 */
public class LogBaseForm extends ContentPreviewForm {
    
	public final static int LEVEL_1 = 1;
	public final static int LEVEL_2 = 2;
	public final static int LEVEL_3 = 3;
	public final static int LEVEL_4 = 4;
	public final static int LEVEL_5 = 5;
	
	int id;
	UserForm owner;
	String author;
	String authorUrl;
	String title;
	Date logTime;
	String refUrl;
	String weather;
	int useFace = 1;
	int useUbb = 1;
	int showFormerly = 0;
	int moodLevel = LEVEL_3;
	SiteForm site;
	List attachments;

    public List getAttachments() {
        return attachments;
    }
    public void setAttachments(List attachments) {
        this.attachments = attachments;
    }
    public String getAuthor() {
        if("".equals(author))
            return null;
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
	public int getOwnerId(){
		return (owner!=null)?owner.getId():-1;
	}
	public void setOwnerId(int userid){
		if(owner==null)
			owner = new UserForm();
		owner.setId(userid);
	}
	/**
	 * @return
	 */
	public String getOwnerName() {
		return owner.getDisplayName();
	}

    public String getAuthorUrl() {
        if("".equals(authorUrl))
            return null;
        return authorUrl;
    }
    public void setAuthorUrl(String authorUrl) {
        this.authorUrl = authorUrl;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Date getLogTime() {
        return logTime;
    }

    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }
    public int getMoodLevel() {
        return moodLevel;
    }
    public void setMoodLevel(int moodLevel) {
        this.moodLevel = moodLevel;
    }
    public UserForm getOwner() {
        return owner;
    }
    public void setOwner(UserForm owner) {
        this.owner = owner;
    }
    public String getRefUrl() {
        if("".equals(refUrl))
            return null;
        return refUrl;
    }
    public void setRefUrl(String refUrl) {
        this.refUrl = refUrl;
    }
    public int getShowFormerly() {
        return showFormerly;
    }
    public void setShowFormerly(int showFormerly) {
        this.showFormerly = showFormerly;
    }
    public SiteForm getSite() {
        return site;
    }
    public void setSite(SiteForm site) {
        this.site = site;
    }
    public String getTitleText(){
    	try{
    		return extractText(title);
    	}catch(Exception e){}
		return null;
    }	
    public String getTitle() {
        if("".equals(title))
            return null;
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public int getUseFace() {
        return useFace;
    }
    public void setUseFace(int useFace) {
        this.useFace = useFace;
    }
    public int getUseUbb() {
        return useUbb;
    }
    public void setUseUbb(int useUbb) {
        this.useUbb = useUbb;
    }
    public String getWeather() {
        if("".equals(weather))
            return null;
        return weather;
    }
    public void setWeather(String weather) {
        this.weather = weather;
    }
    
    public static void main(String[] args){
    	try{
    		System.out.print("RESULT:");
    		System.out.println(extractText("<font color=\"red\" size=4>大字体测试</font>"));
    	}catch(Exception e){}
    }
}
