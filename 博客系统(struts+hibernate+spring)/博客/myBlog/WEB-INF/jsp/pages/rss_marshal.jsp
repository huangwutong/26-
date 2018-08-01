<%
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
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>
<%@ page import="web.rss.*" %>

<%@ page import="java.util.*"%>
<%@ page import="dlog4j.ManagerBase"%>
<%@ page import="net.sf.hibernate.*"%>
<%@ page import="net.sf.hibernate.expression.*"%>
<%@ page import="dlog4j.formbean.*"%>

<%
	List sites = listLinks();
	pageContext.setAttribute("sites",sites);
%>

<%!
	List listLinks() throws HibernateException, java.sql.SQLException{
		Session ssn = null;
		List sites = null;
		try{
			ssn = ManagerBase.getSession();
			Criteria crit = ssn.createCriteria(FavoriteForm.class);
			crit.addOrder(Order.asc("order"));
			sites = crit.list();
		}finally{
			ManagerBase.closeSession(ssn);
		}
		return sites;
	}
%>