
<%@ page import="model.NewsModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageNews"%>
<jsp:useBean id="shownews" class="control.bean.ManageNews" scope="page"></jsp:useBean>
<jsp:useBean id="nmodel" class="model.NewsModel" scope="page"></jsp:useBean>
<%!
	Vector newsvector;
%>

<%
	newsvector = shownews.displayQuery(5,1,"* from NewsInfo order by NewsID","NewsID");
%>

	<% 
		for(int i=0;i<newsvector.size();i++){
		nmodel.setNewsID(((NewsModel)newsvector.get(i)).getNewsID());
		nmodel.setNewsTitle(((NewsModel)newsvector.get(i)).getNewsTitle());
	%>
	<TR>
	<td align="left" nowrap width="32%">
 	<a href="<%=request.getContextPath()%>/show/news.jsp?action=show&newsid=<%=nmodel.getNewsID()%>&position=<%=i%>">
	<%=nmodel.getNewsTitle()%></a>
	</td>
	</TR>
<%}%>

						
