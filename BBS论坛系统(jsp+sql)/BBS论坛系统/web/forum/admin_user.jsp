<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector,
					net.acai.forum.admin.*"%>
<title><%=forumName%>--����ҳ��</title>
<link rel="stylesheet" type="text/css" href="forum.css">

<BODY bgcolor="#ffffff" alink="#333333" vlink="#333333" link="#333333" topmargin="20">
<%
	try{
		if(session.getAttribute("adminFlag")==null)
			throw new Exception("��ҳ��Ϊ����Աר�ã���<a href=elogin.jsp>��½����</a>����롣");
		

	
%>
<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=<%=aTableBackColor%> align=center>
  <tr>
    <td>
      <table cellpadding=3 cellspacing=1 border=0 width=100%>
        <tr bgcolor='<%=aTableTitleColor%>'>
        <td align=center colspan="2">��ӭ<b>
<%=session.getAttribute("adminName")%></b>�������ҳ��
        </td>
        </tr>
            <tr bgcolor=<%=tableBodyColor%>>
              <td width="20%" valign=top>
<%@include file="admin_left.jsp"%>
	      </td>
              <td width="80%" valign=top>
<%
		String userID=ParamUtil.getString(request,"userID");
		if(userID!=null&&!("".equals(userID))){
			//out.println(userID);

			UserManager.delUser(request);
			out.println("�����ɹ���");
		}
		else{
			String txtitle=ParamUtil.getString(request,"txtitle");
			Vector users;
			if(!(txtitle==null||"".equals(txtitle.trim())))
				users=UserManager.findUsers(txtitle);
			else
				users=SkinUtil.getTopList(request);
		int orders=ParamUtil.getInt(request,"orders",7);	
		
		int usersNum=users.size();
   	int Page;
	Page=ParamUtil.getInt(request,"Page",1);


	
%>

<div align="center"><center>

<form name="searchuser" method="POST" action="admin_user.jsp">
<font color=red>����û���������Ӧ����</font>��  �����û�:  <input type="text" name="txtitle" size="13"><input type="submit" value="��ѯ" name="title">
</form>
<form method=Post action="admin_user.jsp">
    <div align="center">



      <div align="center"><center>
<table border="0" cellspacing="0" width="100%"  cellpadding="0">
        <tr>
          <td width="46" align="center" bgcolor="<%=aTableTitleColor%>" height="20"><strong>ID��</strong></td>
          <td width="400" align="center" bgcolor="<%=aTableTitleColor%>"><strong>�û���</strong></td>
          <td width="68" align="center" bgcolor="<%=aTableTitleColor%>"><input type='submit'  value='ɾ��'></td>
        </tr>
<%
	

		for (i=(Page-1)*20;i<Page*20;i++){
			if (i>=usersNum) break;
			User theUser=(User)users.get(i);
%>
        <tr>
          <td height="23" width="46"><p align="center"><%=theUser.getUserID()%></td>
          <td width="400"><p align="center"><a href="dispuser.jsp?name=<%=java.net.URLEncoder.encode(theUser.getUserName())%>"><%=theUser.getUserName()%></a></td>
          <td width="68"><p align="center"><input type='checkbox' name='userID' value='<%=theUser.getUserID()%>'></td>
        </tr>
<% 
		}
%>
      </table>
      </center></div>

  <%
	int totalPages=usersNum/20+1; 
if (Page==0)  Page=1;
out.println("�� "+totalPages+" ҳ �� "+Page+" ҳ��");
if (Page==1|| totalPages==1 )
			out.println("<font color=gray>��ҳ��ǰҳ</font>");
else
	out.println("<a href=?Page=1&orders="+orders+"&txtitle="+ParamUtil.getString(request,"txtitle","")+">��ҳ</a>��<a href=?Page="+(Page-1)+"&orders="+orders+"&txtitle="+ParamUtil.getString(request,"txtitle","")+">ǰҳ</a>");
		
		
		if (Page==totalPages|| totalPages==1)
			out.println("��<font color=gray>��ҳ��βҳ</font>");
		else
			out.println("��<a href=?Page="+(Page+1)+"&orders="+orders+"&txtitle="+ParamUtil.getString(request,"txtitle","")+">��ҳ</a>��<a href=?Page="+totalPages+"&orders="+orders+"&txtitle="+ParamUtil.getString(request,"txtitle","")+">βҳ</a>");
		
%>

 
	      </td>
            </tr>
        </table>
        </td>
    </tr>
</table>
<%}%>
<%

}
catch(Exception e){
	e.printStackTrace();
	String errMsg=e.getMessage();
	%>
	<%@include file="INC/error.jsp"%>
	<%
}%>

<%@ include file="foot.jsp"%>
