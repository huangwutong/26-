<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import="java.util.Vector"%>
<%
	stats="��̳����";
	int perPage=ParamUtil.getInt(request,"perPage",10);
	int Page=ParamUtil.getInt(request,"Page",1);
	int startPage=((Page-1)/10)*10+1;
	int start=(Page-1)*perPage+1;
	int totalPage=0;

	forumID=ParamUtil.getInt(request,"forumID",0);
	String forumType="";
	Forum theForum=null;
	if (forumID>0){
		theForum=ForumFactory.getForum(forumID);
		forumType=theForum.getForumType();
	}
	stats=forumType+stats;
	SkinUtil.checkUserStats(request,response,stats);
%>
	<%@ include file="INC/theme.jsp"%>
	<style>
	TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }
	TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px; color: #000000; }
</style>
	<%
	stats="��̳����";
	if(theForum!=null)
	out.println(headLine(forumID,forumName,forumLogo,forumType,2,stats));
	else
	out.println(headLine(forumID,forumName,forumLogo,forumType,1,stats));
	%>

	<%
	OLUserManager olManager=new OLUserManager();
	Vector forumUsers=olManager.getOLUsers(forumType,start,perPage);
	totalPage=olManager.getOLUserNum()/10+1;	
	%>
    <table width="<%=tableWidth%>" bgcolor=<%=tableBackColor%>  cellspacing=0 border=0 bordercolor=<%=tableBackColor%> align=center>
    	<tr>
	        <td>
        	
<table cellpadding=6 cellspacing=1 border=0 width=100%>
<tr bgcolor=<%=aTableTitleColor%>> 
<td colspan=5 align=center><font color="<%=tableContentColor%>">
<%if (theForum!=null){%>Ŀǰ��̳������<b><%=ForumFactory.getOLUsersNum()%></b>�ˣ�����<%=theForum.getForumType()%>�Ϲ��� <b><%=theForum.getForumOLMemberUsersNum()%></b> λ��Ա�� <b><%=theForum.getForumOLGuestUsersNum()%></b> λ����<%
}else{%>��ǰ��̳����<B><%=olManager.getOLUserNum()%></B>λ�û�����<%}%></font>
</td>
</tr>
<tr bgcolor=<%=tableTitleColor%> style=color:<%=tableFontColor%>> 
<td align=center width="10%"><font color="<%=tableFontColor%>"><b>�û���</b></font></td>
<td align=center width="35%"><font color="<%=tableFontColor%>"><b>��ǰλ��</b></font></td>
<td align=center width="20%"><font color="<%=tableFontColor%>"><b>�û���Ϣ</b></font></td>
<td align=center width="18%"><font color="<%=tableFontColor%>"><b>��Դ����</b></font></td>
<td align=center width="22%"><font color="<%=tableFontColor%>"><b>��½ʱ��</b></font></td>
</tr>
<%
	if(forumUsers.size()==0){
%>
<tr bgcolor=<%=tableBodyColor%>> 
<td colspan=5>������û���κ��û����ݡ�</td>
</tr>
<%
	}
	else{
		for(i=0;i<forumUsers.size();i++){
			OLUser theUser=(OLUser)forumUsers.get(i);

%>
<tr bgcolor=<%=tableBodyColor%>> 
<td align=center><a href="javascript:openScript('dispuser.jsp?name=<%=response.encodeURL(theUser.getUserName())%>',350,300)"><%=response.encodeURL(theUser.getUserName())%></a></td>
<td align=center><font color="<%=tableContentColor%>"><%=theUser.getStats()%></font></td>
<td align=center><font color="<%=tableContentColor%>"><%=theUser.getUserSystem().replaceAll("����ϵͳ��","")%>��<%=theUser.getUserBrowser().replaceAll("� �� ����","").replaceAll("Internet Explorer","IE")%></font></td>
<td align=center><font color="<%=tableContentColor%>"><%if (fromFlag.equals("0")){ %><%if (forumMaster||master) 	{%><%=theUser.getComeFrom()%><%}else{%>�����ñ���<%}}else{%><%=theUser.getComeFrom()%><%}%></font></td>
<td align=center><font color="<%=tableContentColor%>"><%=theUser.getStartTime()%></font></td>
</td>
</tr>
<%}
	}
%>
</table>
</td></tr>
</table>
<table width="<%=tableWidth%>" align="center" >
<tr><td align=right><font color="<%=tableBodyColor%>">
<% if (Page==1)
out.println("�� "+(totalPage)+" ҳ �� "+Page+" ҳ��");
		if (Page==1||totalPage==0)
			out.println("<font color=gray>��ҳ��ǰҳ</font>");
		else
			out.println("<a href=?Page=1&forumID="+forumID+">��ҳ</a>��<a href=?Page="+(Page-1)+"&forumID="+forumID+">ǰҳ</a>");
		
		
		if (Page==totalPage||totalPage==0)
			out.println("��<font color=gray>��ҳ��βҳ</font>");
		else
			out.println("��<a href=?Page="+(Page+1)+"&forumID="+forumID+">��ҳ</a>��<a href=?Page="+totalPage+"&forumID="+(forumID)+">βҳ</a>");
		
%></font>
</td></tr></table>

<%@ include file="foot.jsp"%>
