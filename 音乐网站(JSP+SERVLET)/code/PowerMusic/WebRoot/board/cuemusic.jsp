<%@ page import="java.io.*"%>
<%@ page import="model.MusicModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageMusic"%>
<jsp:useBean id="showmusic" class="control.bean.ManageMusic" scope="page"></jsp:useBean>
<jsp:useBean id="mmodel" class="model.MusicModel" scope="page"></jsp:useBean>

<%!
    Vector musicvector;
%>

<%
	musicvector = showmusic.displayQuery(5,1,"* from MusicInfo order by MusicID","MusicID");
%>
<% 
	for(int i=0;i<musicvector.size();i++){
	mmodel.setMusicName(((MusicModel)musicvector.get(i)).getMusicName());
%><TR >
	<td align="left" nowrap width="32%">
	<a href="<%=request.getContextPath()%>/show/music.jsp"><%=mmodel.getMusicName()%></a>
	</td>
</TR>
<%}%>
				 


  