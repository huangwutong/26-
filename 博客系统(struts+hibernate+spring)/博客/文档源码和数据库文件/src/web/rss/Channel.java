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
import java.util.ArrayList;
import java.util.List;

/**
 * 协议无关的网站摘要
 * @author Winter Lau
 */
public class Channel implements Serializable {
	
	protected String title;
	protected String link;
	protected String description;
	
	protected List items;

	public Channel() {
		items = new ArrayList();
	}
	
	public void addItem(Item item){
		items.add(item);
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List getItems() {
		return items;
	}
	public void setItems(List items) {
		this.items = items;
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
}
