<%@ page contentType="text/html;charset=GBK"%>
<%@include file="INC/const.jsp"%>
<%
	stats="�鿴����";
 %>
 <%@ include file="INC/theme.jsp"%>
 <%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
 %>
 
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title><%=forumName%>--��ѯ��������</title>
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="forum.css">
</head>
<body >
<%
	try{
			String searchUserName=ParamUtil.getString(request,"name");
			User user=UserManager.findUser(searchUserName);
%>
<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                
<table cellpadding=3 cellspacing=1 border=0 width=100%>
  <tr>
    <td width="100%" colspan="5" bgcolor=<%=tableTitleColor%>>
      <p align="center"><font color="<%=tableFontColor%>"><b><%=net.ds.toGBK(response.encodeURL(searchUserName))%>�ĸ�������</b></font></td>
  </tr>
  <tr>
    <td width="48%" colspan="2" bgcolor=<%=tableBodyColor%>>
      <p align="center"><font color="<%=tableContentColor%>"><b>��������</b></font></td>
    <td width="4%" bgcolor=<%=tableBodyColor%>>��</td>
    <td width="48%" colspan="2" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
      <p align="center"><b>����ͷ��</b></font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>�û�����</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=net.ds.toGBK(response.encodeURL(searchUserName))%></font></td>
    <td width="4%" rowspan="14" bgcolor=<%=tableBodyColor%>>��</td>
    <td width="48%" colspan="2" rowspan="4" valign="top" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<% 
	if ("1".equals(titleFlag)&&user.getTitle()!=null) {
%>
<B>ͷ �Σ�</B> <%= user.getTitle() %> <BR>
<% } %></font>
	��</td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>�Ա�</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<%if ("0".equals(user.getSex()))   
    out.println("����");  
else   
    out.println("���");   

%></font>
	��</td>
  </tr>
  
 
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>������ҳ��</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<%if (user.getHomePage()!=null){%>
<a href="<%=response.encodeURL(user.getHomePage())%>"
    target="_blank"><%=response.encodeURL(user.getHomePage())%></a> 
<%}%></font>
	</td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>�������£�</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getArticle()%></font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>�Ʋ���</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getUserWealth() %></font></td>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>OICQ��</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<%if (user.getOicq()!=null){%>
<%=response.encodeURL(user.getOicq())%> 
<%}%></font>
	</td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>���飺</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%= user.getUserEP() %>��</font></td>
    <td width="48%" colspan="2" bgcolor=<%=tableBodyColor%>>
      <p align="center"><font color="<%=tableContentColor%>"><b>��ϵ����</b></font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>������</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getUserCP()%></font></td>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>Email��</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<%if (user.getUserEmail()!=null) {%>
<a href="mailto:<%=response.encodeURL(user.getUserEmail())%>"><%=response.encodeURL(user.getUserEmail())%></a> 
<%}%></font>
	��</td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>��̳�ȼ���</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getUserClass()%>��</font></td>
    <td width="48%" colspan="2" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
      <p align="center"><b>����˵��</b></font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>���ɣ�</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getUserGroup()%></font></td>
    <td width="16%" rowspan="4" valign="top" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
      <p align="center"><b>����ǩ����</b></font></td>
    <td width="32%" rowspan="4" valign="top" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>">
<%if (user.getSign()!=null){%>
<%=new MyFilter(user.getSign()).getFilterString()%> 
<%}%>��</font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>��½������</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=alertFontColor%>"><%=user.getLogins()%></font>��</td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=aTableBodyColor%>><font color="<%=tableContentColor%>"><b>����½��</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getLastLogin()%>��</font></td>
  </tr>
  <tr>
    <td width="16%" align="right" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>ע��ʱ�䣺</b></font></td>
    <td width="32%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=user.getAddDate()%></font></td>
  </tr>
  <tr>
    <td width="100%" colspan="5" bgcolor=<%=tableTitleColor%>><font color="<%=tableFontColor%>">
      <p align="center"><b><a href="usersms.jsp?action=new&touser=<%=response.encodeURL(searchUserName)%>"><font color="<%=tableFontColor%>">��������</font></a> | <a href=friendlist.jsp?action=addF&myFriend=<%=response.encodeURL(searchUserName)%> target=_blank><font color="<%=tableFontColor%>">��Ϊ����</font></a></b></font></td>
  </tr>
</table>
</td></tr></table>
<%
	}
	catch(UserNotFoundException e){
		String errMsg=e.getMessage();
		e.printStackTrace();
%>
<%@include file="INC/error.jsp"%>
<%
	}

		%></body>
</html>
<%@ include file="foot.jsp"%>