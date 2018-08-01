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
package dlog4j.util;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * 用于处理请求信息的工具类,例如参数的处理等
 * @author Liudong
 */
public class RequestUtils {

	public static String getBaseURL(HttpServletRequest req){
		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		int idx = url.indexOf(uri);
		return (idx==-1)?url:url.substring(0,idx) + context;
	}
    /**
     * 获取整型参数
     * @param req
     * @param param
     * @param defValue
     * @return
     */
    public static int getIntParameter(ServletRequest req, String param, int defValue) {
        int value = defValue;
        try {
            value = Integer.parseInt(req.getParameter(param));
        }catch(Exception e) {}
        return value;
    }
    
    public static void main(String[] args) {
    }
}
