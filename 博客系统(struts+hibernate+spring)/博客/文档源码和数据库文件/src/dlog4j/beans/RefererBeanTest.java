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
package dlog4j.beans;

import junit.framework.TestCase;

/**
 * RefererBeanµƒ≤‚ ‘¿‡
 * @author Winter Lau
 */
public class RefererBeanTest extends TestCase {

	RefererBean bean;
	/*
	 * @see TestCase#setUp()
	 */
	protected void setUp() throws Exception {
		super.setUp();
		bean = new RefererBean();
	}

	/*
	 * @see TestCase#tearDown()
	 */
	protected void tearDown() throws Exception {
		super.tearDown();
		bean = null;
	}

	public void testGetReqUrl() {
		bean.setRequestURL("http://www.javayou.com/main.jspe?main=/main.jsp");
		assertEquals(bean.getRequestURL(),"http://www.javayou.com/main.jspe");
		bean.setRequestURL("http://www.javayou.com/comment_list.jspe?main=/comment_list.jsp&userid=9");
		assertEquals(bean.getRequestURL(),"http://www.javayou.com/comment_list.jspe?userid=9");
		bean.setRequestURL(null);
		assertNull(bean.getRequestURL());
	}

}
