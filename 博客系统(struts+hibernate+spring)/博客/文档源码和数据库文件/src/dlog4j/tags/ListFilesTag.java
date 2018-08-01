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

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;

/**
 * 罗列出指定目录的所有文件
 * @author liudong
 */
public class ListFilesTag extends TagSupport {
	
	public final static String WEB_PATH = "{webapp}";
	String path;
	String extend;
	boolean exclude = false;
	String pathId;

	public int doStartTag() throws JspException {
		String dir = StringUtils.replace(path,
										 WEB_PATH,
										 pageContext.getServletContext().getRealPath(""));
		pageContext.setAttribute(pathId, dir);
		File f = new File(dir);
		if(f.exists() && f.isDirectory()){
			String[] fns = f.list();
			List lfns = new ArrayList();
			for(int i=0;i<fns.length;i++){
				if(extend!=null){
					 if(exclude && fns[i].endsWith(extend))
					 	continue;
					 else
					 if(!exclude && !fns[i].endsWith(extend))
					 	continue;
				}
				lfns.add(fns[i]);
			}
			pageContext.setAttribute(id, lfns);
		}
		else
			pageContext.getServletContext().log("目录["+path+"]不存在");
		return SKIP_BODY;
	}
	
	public void release() {
		path = null;
		extend = null;
		exclude = false;
	}
	public boolean isExclude() {
		return exclude;
	}
	public void setExclude(boolean exclude) {
		this.exclude = exclude;
	}
	public String getExtend() {
		return extend;
	}
	public void setExtend(String extend) {
		this.extend = extend;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getPathId() {
		return pathId;
	}
	public void setPathId(String pathId) {
		this.pathId = pathId;
	}
}
