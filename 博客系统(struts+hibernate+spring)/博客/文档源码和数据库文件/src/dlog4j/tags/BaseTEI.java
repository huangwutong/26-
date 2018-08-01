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

import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.jsp.tagext.TagData;
import javax.servlet.jsp.tagext.TagExtraInfo;
import javax.servlet.jsp.tagext.VariableInfo;

/**
 * TEI类的基类
 * @author Winter Lau
 */
public abstract class BaseTEI extends TagExtraInfo {

    public VariableInfo[] getVariableInfo(TagData data) {
    	Properties p_vars = getExportVars(data);
    	VariableInfo[] vars = new VariableInfo[p_vars.size()];
    	Enumeration keys = p_vars.keys();
    	int v_idx = 0;
    	while(keys.hasMoreElements()){
    		String name = (String)keys.nextElement();
    		String className = p_vars.getProperty(name);
    		vars[v_idx++] = new VariableInfo(name,
    										 className,
											 true,
											 VariableInfo.AT_END);
    	}
    	
    	return vars;
    }
    
    /**
     * 返回变量名对应类名的集合
     * @param data
     * @return
     */
    protected abstract Properties getExportVars(TagData data);
}
