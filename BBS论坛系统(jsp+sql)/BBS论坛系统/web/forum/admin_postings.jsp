<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector,
					net.acai.forum.admin.*"%>
<%
	stats=forumName+"��̳���ӹ���";
	forumID=ParamUtil.getInt(request,"forumID",0);
	String errMsg=""; 
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>
<%
	if(foundUser){
		try{
			ForumMSGAdmin forumMSGAdmin=new ForumMSGAdmin(request,response);
			
			int rootID=ParamUtil.getInt(request,"rootID");
			int announceID=ParamUtil.getInt(request,"announceID");
			String action=ParamUtil.getString(request,"action");
			String tempString=ParamUtil.getString(request,"checked");
			
			if(action.equals("move")&&tempString==null)
			{
			
		%>
		<table cellpadding=0 cellspacing=0 border=0 width="<%=tableWidth%>" bgcolor=<%=tableBackColor%> align=center>
                <tr>
                    <td>
                    <table cellpadding=6 cellspacing=1 border=0 width=100%>
                        <tr>
                        <td bgcolor=<%=tableTitleColor%> valign=middle align=center colspan=2>
                        <form action="admin_postings.jsp" method="post">
                        <input type=hidden name="action" value="move">
                        <input type=hidden name="checked" value="yes">
                        <input type=hidden name="forumID" value="<%=forumID%>">
                        <input type=hidden name="rootID" value="<%=rootID%>">
                        <input type=hidden name="announceID" value="<%=announceID%>">
                        <b>�ƶ�����</b></td></tr>

                                    <tr>
                                    <td bgcolor=<%=tableBodyColor%> valign=middle>
                                    <b>�ƶ�ѡ��</td>
                                    <td bgcolor=<%=tableBodyColor%> valign=middle>
                                    <!--<input name="leavemessage" type="radio" value="yes"> �ƶ�������һ���Ѿ�������������ԭ��̳<br>--><input name="leavemessage" type="radio" value="no" checked> �ƶ������������ԭ��̳��ɾ��
                                    </td>
                                    </tr>

                            <tr>
                        <td bgcolor=<%=tableBodyColor%> valign=top><b>�ƶ�����</b></td>
                        <td bgcolor=<%=tableBodyColor%> valign=top>

<select name="newForumID" size="1">
<option value="">ѡ��һ����̳</option>
<%@include file="INC/forumList.jsp"%>
          </select>
			</td>
                        </tr>
                    <tr>
                <td bgcolor=<%=tableTitleColor%> valign=middle colspan=2 align=center><input type=submit name="submit" value="�� ��"></td></tr></form></table></td></tr></table>
            </table>
            </td></tr>
            </table>
<%
			}
			else if(action.equals("copy")&&tempString==null){
				%>
				            <table cellpadding=0 cellspacing=0 border=0 width="<%=tableWidth%>" bgcolor=<%=tableBackColor%> align=center>
                <tr>
                    <td>
                    <table cellpadding=6 cellspacing=1 border=0 width=100%>
                        <tr>
                        <td bgcolor=<%=tableTitleColor%> valign=middle align=center colspan=2>
                        <form action="admin_postings.jsp" method="post">
                        <input type=hidden name="action" value="copy">
                        <input type=hidden name="checked" value="yes">
                        <input type=hidden name="forumID" value="<%=forumID%>">
                        <input type=hidden name="rootID" value="<%=rootID%>">
                        <input type=hidden name="announceID" value="<%=announceID%>">
                        <b>��������</b></td></tr>

                                    <tr>
                                    <td bgcolor=<%=tableBodyColor%> valign=middle>
                                    <b>����˵��</td>
                                    <td bgcolor=<%=tableBodyColor%> valign=middle>
���ӽ����Ƶ������̳����Ϊ�µ����ӣ���������ԭ����̳
                                    </td>
                                    </tr>
                            <tr>
                        <td bgcolor=<%=tableBodyColor%> valign=top><b>�ƶ�����</b></td>
                        <td bgcolor=<%=tableBodyColor%> valign=top>

<select name="newForumID" size="1">
<option value="">ѡ��һ����̳</option>
<%@include file="INC/forumList.jsp"%>      
          </select>
			</td>
                        </tr>
                    <tr>
                <td bgcolor=<%=tableTitleColor%> valign=middle colspan=2 align=center><input type=submit name="submit" value="�� ��"></td></tr></form></table></td></tr></table>
            </table>
            </td></tr>
            </table>
				<%
		}
		else{
				%>

    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>>�ɹ������Ӳ���</td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=<%=tableBodyColor%>><li>���Ӳ����ɹ���<li>���Ĳ�����Ϣ�Ѿ���¼�ڰ���<br>
      </td>
    </tr>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>>
<a href="list.jsp?forumID=<%=forumID%>"> << ������̳</a>
      </td>
    </tr>  
    </table>   </td></tr></table>
<%

	}
}

catch(Exception e){
	e.printStackTrace();
	 errMsg=e.getMessage();
	%>
	<%@include file="INC/error.jsp"%>
	<%
	}
}
else{
 errMsg="������½��";
	%>
	<%@include file="INC/error.jsp"%>
<%}%>
<%@include file="foot.jsp"%>