<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector"%>
<%
	stats=forumName+"��̳�ղؼ�.";
	forumID=ParamUtil.getInt(request,"forumID",0);
	
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>
<%
	try{
		if(!foundUser)
			throw new Exception("����û��<a href=login.jsp>��½��̳</a>�����ܲ鿴�ղء��������û��<a href=reg.jsp>ע��</a>������<a href=reg.jsp>ע��</a>��");
		String action=ParamUtil.getString(request,"action");
%>

		
	        

	
				
<%
	if(action==null||"".equals(action.trim())){
	Vector bookMarkList=ForumBookMark.getBookMarkList(request);
	if(bookMarkList.size()==0)
		throw new Exception("�����ղؼл�û���ղأ��������ղ���ָ̳�����ӣ����ղ��������ݺ󣬱���Ϣ���Զ�ɾ����");
	
%>
	<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor="<%=tableBackColor%>" align=center>
	                <tr>
	                    <td>
	                    <table cellpadding=3 cellspacing=1 border=0 width=100%>                        <tr>
	                        <td bgcolor="<%=tableTitleColor%>" align=center valign=top colspan="3"><b><font color=<%=tableFontColor%>>>> �����ղؼ� <<</font></b></td></tr>
  <tr bgcolor="<%=tableBodyColor%>">
    <td width="70%"><font color="<%=tableContentColor%>">����</font></td>
    <td width="20%"><font color="<%=tableContentColor%>">ʱ��</font></td>
    <td width="10%"><font color="<%=tableContentColor%>">����</font></td>
  </tr>
<%
		for(i=0;i<bookMarkList.size();i++){
			BookMark bookMark=(BookMark)bookMarkList.get(i);
%>
  <tr bgcolor="<%=tableBodyColor%>">
    <td width="70%"><a href="<%=bookMark.getURL()%>"><%=response.encodeURL(bookMark.getTopic())%></a></td>
    <td width="20%"><font color="<%=tableContentColor%>"><%=bookMark.getAddTime()%></font></td>
    <td width="10%"><a href="favlist.jsp?action=delete&id=<%=bookMark.getID()%>"><img src="pic/a_delete.gif" border=0></a></td>
  </tr>
  </table>
			</td></tr>
</table>
<%
		}
	}
	

	else if(action.equals("delete")){
	ForumBookMark.delBookMark(request);
%>
<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor="<%=tableBackColor%>" align=center>
	                <tr>
	                    <td>
	                    <table cellpadding=3 cellspacing=1 border=0 width=100%>
	                        <tr>
	                        <td bgcolor="<%=tableTitleColor%>" align=center valign=top><b><font color=<%=tableFontColor%>>> �����ɹ� <<</font></b></td></tr>
	                        <tr>
	                            <td bgcolor="<%=tableBodyColor%>" valign=top style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word"><br><font color="<%=tableContentColor%>">
	                        <p><blockquote>��ɾ�������ղؼ�����Ӧ��¼��<a href="javascript:history.go(-1)">�����ղ�</a>��
</blockquote></p></font>
	                        </td>
	                        </tr>
							</table>
			</td></tr>
</table>
<%
	}
	else
		throw new Exception("�Ƿ�����");

%>

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
