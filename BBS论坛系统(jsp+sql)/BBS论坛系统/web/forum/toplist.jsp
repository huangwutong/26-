<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.acai.forum.*,
		 java.util.*"%>

<%@ include file="INC/const.jsp" %>
<%@ include file="INC/theme.jsp"%>

<%
	try{
		Vector users=SkinUtil.getTopList(request);
		int usersNum=users.size();
	String orderName;
	int orders=ParamUtil.getInt(request,"orders");
	switch(orders){
	case 1:
		orders=1;
		orderName="��������Top10";
		break;
	case 2:
		orders=2;
		orderName="�����û�ע��";
		break;
	case 7:
		orders=7;
		orderName="�����û��б�";
		break;
	default:
		orders=1;
		orderName="��������Top10";
		break;
	}
	
	int Page;
	Page=ParamUtil.getInt(request,"Page",1);
	stats=orderName;
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
%>
    <table width=95% bgcolor=<%=tableBackColor%>  cellspacing=0 border=0 bordercolor=<%=tableBackColor%> align=center>
    	<tr>
	        <td>
        	
<table cellpadding=6 cellspacing=1 border=0 width=100%>
<form method="POST" action="toplist.jsp"> 
<tr bgColor="<%=aTableBodyColor%>"> 
<td colspan=5 valign=top width=350>&nbsp;>> <B><%=orderName%></B> <<<BR>
<BR>
<font face=����>&nbsp;��ע���û����� <%=userNum%> �� &nbsp; ���������� <%=bbsNum%> ƪ</font></td>
<td colspan=6 align=right> 
<select name=orders onchange='javascript:submit()'>
<option value=1 <%if (orders==1) {%>selected<%}%>>��������Top10</option>
<option value=2 <%if (orders==2) {%>selected<%}%>>����ע���û�</option>
<option value=7 <%if (orders==7) {%>selected<%}%>>�����û��б�</option>
</select>
</td>
</tr></form>
<tr bgcolor=<%=tableTitleColor%> style=color:<%=tableFontColor%>> 
<td align=center><b>�û���</b></td>
<td align=center><b>Email</b></td>
<td align=center><b>OICQ</b></td>
<td align=center><b>��ҳ</b></td>
<td align=center><b>����Ϣ</td>
<td align=center><b>ע��ʱ��</b></td>
<td align=center><b>�ȼ�״̬</b></td>
<td align=center><b>��������</b></td>
<td align=center><b>
<% if (orders==4)
out.println("���");
else if (orders==5)
out.println("�����̱��µ÷�");
else if (orders==6)
out.println("������ͨ�ش���");
else
out.println("�Ʋ�");

%>
</b></td>
</tr>


<%
	

		for (i=(Page-1)*20;i<Page*20;i++){
			if (i>=usersNum) break;
			User theUser=(User)users.get(i);
%>
<tr bgcolor=<%=tableBodyColor%>> 
<td>&nbsp;<a href="javascript:openScript('dispuser.jsp?name=<%=response.encodeURL(theUser.getUserName())%>',350,300)"><%=response.encodeURL(theUser.getUserName())%></a></td>
<td align=center><a href=mailto:<%=theUser.getUserEmail()%>><img border=0 src=<%=picURL%>email.gif></a></td>
<td align=center> 
<%if ("".equals(theUser.getOicq())|| theUser.getOicq()==null) {%>
û�� 
<% }else{%>
<a href=http://search.tencent.com/cgi-bin/friend/user_show_info?ln=<%=theUser.getOicq()%> target=_blank><img src="<%=picURL%>oicq.gif" alt="�鿴 OICQ:<%=theUser.getOicq()%> ������" border=0 width=16 height=16></a> 
<%}%>
</td>
<td align=center> 
<%if (theUser.getHomePage()==null|| "".equals(theUser.getHomePage().trim())) {%>
û�� 
<%}else{%>
<a href=<%=theUser.getHomePage()%> target=_blank><img border=0 src=<%=picURL%>homePage.gif></a> 
<%}%>
</td>
<td align=center><a href=javascript:openScript('usersms.jsp?action=new&touser=<%=response.encodeURL(theUser.getUserName())%>',600,400)><img src=<%=picURL%>message.gif border=0></a></td>
<td align=center><%=theUser.getAddDate()%></td>
<td align=center> <%=theUser.getUserClassStr()%><br>
</td>
<td align=center><%=theUser.getArticle()%></td>
<td align=center><%=theUser.getUserWealth()%></td>
</tr>
<%
		}
%>
</table>
</td></tr>
</table>
<table width=95% align="center" >
<tr><td align=right>
<%
	int totalPages=usersNum/20+1; 
if (Page==0)  Page=1;
out.println("�� "+totalPages+" ҳ �� "+Page+" ҳ��");
if (Page==1|| totalPages==1 )
			out.println("<font color=gray>��ҳ��ǰҳ</font>");
else
	out.println("<a href=?Page=1&orders="+orders+">��ҳ</a>��<a href=?Page="+(Page-1)+"&orders="+orders+">ǰҳ</a>");
		
		
		if (Page==totalPages|| totalPages==1)
			out.println("��<font color=gray>��ҳ��βҳ</font>");
		else
			out.println("��<a href=?Page="+(Page+1)+"&orders="+orders+">��ҳ</a>��<a href=?Page="+totalPages+"&orders="+orders+">βҳ</a>");
		
%>
</td></tr>
<%	}
	catch(Exception e){
%>	
		<tr bgcolor=<%=tableBodyColor%>> 
<td colspan=9>������û���κ��û����ݡ�</td>
</tr>
<%}	
%></table>

<%@ include file="foot.jsp"%>
<jsp:include page="INC/js.jsp"/>
