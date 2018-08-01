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

/**
 * ��ҳ�ղؼ�,Ҳ������������,��Ӧdlog_favorite���е�һ����¼
 * @author Liudong
 */
public class FavoriteForm extends DlogActionForm {
    
    SiteForm site; 
    int id ;
    String title;
    String detail;
    String url;
    
    /**
     * �������ӵ���ʽ��ֵ������HTML,RDF,RSS,ATOM
     */
    String mode = "HTML";
    
    /**
     * �Ƿ����´��ڴ򿪣�1,���´��ڴ�; 0,�ڱ����ڴ�
     */
    int openInNewWindow;
    Date createTime;
    int order;

	public SiteForm getSite() {
		return site;
	}
	public void setSite(SiteForm site) {
		this.site = site;
	}
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public String getDetail() {
        return detail;
    }
    public void setDetail(String detail) {
        this.detail = detail;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getOpenInNewWindow() {
        return openInNewWindow;
    }
    public void setOpenInNewWindow(int openInNewWindow) {
        this.openInNewWindow = openInNewWindow;
    }
    public int getOrder() {
        return order;
    }
    public void setOrder(int order) {
        this.order = order;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
}
