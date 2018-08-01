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

import org.apache.commons.lang.StringUtils;

/**
 * @author Liudong
 * 用于格式化日志内容以及评论内容的工具类
 */
public class HtmlUtil {

	/**
	 * 转换日志或者评论内容成适合页面显示
	 * @param content
	 * @param useFaces
	 * @param useUbb
	 * @return
	 */
	public static String makeHtml(String content, boolean useFaces, boolean useUbb){
		if(useFaces){
		}
		if(useUbb){
			
		}		
		return convertToHtml(content);
	}
	
	public static String convertToHtml(String content){
		content = StringUtils.replace(content,"\t","&nbsp;&nbsp;&nbsp;&nbsp;");//替换跳格
		content = StringUtils.replace(content," ","&nbsp;");//替换空格
		content = StringUtils.replace(content,"\n","<br>");//替换换行
		return content;
	}

	public static void main(String[] args) {
		
		System.out.println(convertToHtml("测 试 空 格"));
		
	}
}
