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

import java.io.Reader;

import org.apache.commons.digester.Digester;

/**
 * ATOM½âÎöÆ÷
 * @author Winter Lau
 */
public class _AtomHunter extends RssHunter {

	/* (non-Javadoc)
	 * @see web.rss.RssHunter#parse(java.io.Reader)
	 */
	protected Channel parse(Reader content) throws Exception {	
		Digester dig = getDigester();
		dig.addBeanPropertySetter("feed/title","title");
		dig.addSetProperties("feed/link","href","link");
		dig.addBeanPropertySetter("feed/info","description");
		dig.addObjectCreate("feed/entry", Item.class);
		dig.addSetNext("feed/entry","addItem");     
		dig.addBeanPropertySetter("feed/entry/title","title");
		dig.addSetProperties("feed/entry/link","href","link");
		dig.addBeanPropertySetter("feed/entry/content","description");
		
		return (Channel)dig.parse(content);
	}

}
