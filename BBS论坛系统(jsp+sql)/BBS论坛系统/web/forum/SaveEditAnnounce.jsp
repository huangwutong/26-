<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="INC/const.jsp" %>
<%@ include file="INC/theme.jsp"%>


<%
	//if(foundUser)
	try{
		Forum theForum=new Forum(forumID);
		String char_changed="";
		String url="";
		if (theForum.getForumMaster().indexOf(userName)>-1||master ){ 
			url=theForum.masterSaveMSG(request,response);
		}
		else{
			url=theForum.authorSaveMSG(request,response);
			
		}
		
		String forumType=theForum.getForumType();
		stats=forumType + "�޸����ӳɹ�";
		out.println(headLine(forumID,forumName,forumLogo,forumType,2,stats));
		

%>
<meta http-equiv=refresh content="4;URL=<%=url%>">

	<br><table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=<%=tableBackColor%> align=center>
		<tr><td><table cellpadding=3 cellspacing=1 border=0 width="100%">
		<tr align=center><td width="100%" bgcolor=<%=tableTitleColor%>><b><FONT COLOR=<%=tableFontColor%>>״̬�����������ӳɹ�</font></b></td>
		</tr><tr><td width="100%" bgcolor=<%=tableBodyColor%>>
		<FONT COLOR="<%=tableContentColor%>">��ҳ�潫��3����Զ������������������ҳ�棬<b>������ѡ�����²�����</b><br><ul>
		<li><a href="index.jsp"><font color="<%=tableContentColor%>">������ҳ</font></a></li>
		<li><a href="list.jsp?forumID=<%=forumID%>"><font color="<%=tableContentColor%>"><%=forumType%></font></a></li>
		<li><a href="<%=url%>"><font color=<%=tableContentColor%>>���������</font></a></li>
		</ul></td></tr></table></td></tr></table>
<%
	}
	catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
	}
%>
<%@ include file="foot.jsp"%>