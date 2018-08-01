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
package web.rss;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import dlog4j.util.StringUtils;

/**
 * 摘要信息
 * @author Winter Lau
 */
public class Item implements Serializable {

	protected String title;
	protected String link;
	protected String description;
	
	public Item() {
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String uuid()  {		
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			if(title!=null)
				md.update(title.getBytes());
			if(link!=null)
				md.update(link.getBytes());
			if(description!=null)
				md.update(description.getBytes());
			byte[] bs = md.digest();
			return StringUtils.byte2hex(bs);
		}catch(NoSuchAlgorithmException e){}
		return null;
	}
	
	public int hashCode() {
		return uuid().hashCode();
	}
	
	public static void main(String[] args){
		Item itm = new Item();
		itm.setTitle("Java自由人");
		itm.setLink("http://www.javayou.com/main.jspe");
		itm.setDescription("Java自由人 Bloging...");
		System.out.println(itm.uuid());
	}
}
