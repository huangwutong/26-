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
		String action=ParamUtil.getString(request,"action");

	
%>
<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=<%=aTableBackColor%> align=center>
  <tr>
    <td>
      <table cellpadding=3 cellspacing=1 border=0 width=100%>
        <tr bgcolor='<%=aTableTitleColor%>'>
        <td align=center colspan="2">��ӭ<b><%=session.getAttribute("adminFlag")%></b>�������ҳ��
        </td>
        </tr>
            <tr bgcolor=<%=tableBodyColor%>>
              <td width="20%" valign=top>
<%@include file="admin_left.jsp"%>
	      </td>
              <td width="80%" valign=top><p>
<%
		if(action!=null&&"update".equals(action)){
			ForumAdmin forumAdmin=new ForumAdmin();
			out.println(forumAdmin.update()+"<br>�����ɹ���");
		  }
		else{
%>
              <table width="100%" border="0" cellspacing="3" cellpadding="0">
                <tr> 
                  <td bgcolor=<%=aTableTitleColor%>> 
                    <p><b>������̳����</b>��<br>
                      ע�⣺���ｫ����ͳ��������̳���������ӡ����·���ʱ�䡢��������������Ϣ��</p>
                  </td>
                </tr>
                <tr> 
                  <td> 
            <form action="admin_updateboard.jsp?action=update" method=post>
<input type="submit" name="Submit" value="����">
	    </form>
                  </td>
                </tr>
<%
	}
%>
</p></td>
            </tr>
        </table>
        </td>
    </tr>
</table>

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