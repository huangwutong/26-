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
package dlog4j.blog;

import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.xml.sax.SAXException;

/**
 * TrackBack客户端，该类在DlogLogAction的doAddLog中使用
 * 用于引用其他网站的文章时调用
 * @author Winter Lau
 */
public class BlogTrackBack {

	/**
	 * 引用别的网站的文章
	 * @param refurl
	 * @param log_url
	 * @param blog_name
	 * @param title
	 * @param excerpt
	 * @return
	 * @throws IOException
	 * @throws SAXException
	 */
	public static TrackBackResp track(String refurl, 
									  String log_url, 
									  String blog_name, 
									  String title, 
									  String excerpt) throws IOException, SAXException{
		HttpClient client = new HttpClient();
		StringBuffer sURL = new StringBuffer(refurl);
		if(sURL.indexOf("?")==-1)
			sURL.append('?');
		else
			sURL.append('&');
		sURL.append("excerpt=");
		sURL.append(URLEncoder.encode(excerpt,"UTF-8"));
		sURL.append("&title=");
		sURL.append(URLEncoder.encode(title,"UTF-8"));
		sURL.append("&url=");
		sURL.append(URLEncoder.encode(log_url,"UTF-8"));
		sURL.append("&blog_name=");
		sURL.append(URLEncoder.encode(blog_name,"UTF-8"));
		GetMethod get = new GetMethod(sURL.toString());
		client.executeMethod(get);
		try{
			return TrackBackResp.parse(get.getResponseBodyAsStream());
		}finally{
			get.releaseConnection();
		}
	}
		
	public static void main(String[] args) throws IOException, SAXException {
		TrackBackResp resp = track("http://localhost:8080/dlog/trackback.do?log_id=458",
				"http://www.javayou.com","Java自由人","测试标题","测试概要");
		System.out.println(resp);				
	}
}
