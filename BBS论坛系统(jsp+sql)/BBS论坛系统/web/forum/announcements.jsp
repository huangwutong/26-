<%@ page contentType="text/html;charset=GBK"%>
<%@include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector"%>
<%
	stats="�����̳����";
 %>
 <%@ include file="INC/theme.jsp"%>
 <%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
 %>
 
	        <table cellpadding=0 cellspacing=0 border=0 width="<%=tableWidth%>" bgcolor="<%=tableBackColor%>" align=center>
<%
	try{
		Vector forumNewsVector=ForumNewsManager.getForumNewsVector(forumID);
		for(i=0;i<forumNewsVector.size();i++){
		ForumNews forumNews=(ForumNews)forumNewsVector.get(i);

 %>
 	                        <tr>
	                        <td bgcolor="<%=tableTitleColor%>" align=center valign=top><font color="<%=tableFontColor%>"><b>>> <%=response.encodeURL(forumNews.getTitle())%> <<</b></font></td></tr>
	                        <tr>
	                            <td bgcolor="<%=tableBodyColor%>" valign=top style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word"><font color="<%=tableContentColor%>"><br>
	                        <p><blockquote><%=new MyFilter(forumNews.getContent()).getFilterString()%>
</blockquote></p></font>
	                        </td>
	                        </tr>
	                        <tr>
	                            <td bgcolor="<%=tableBodyColor%>" valign=middle>
	                        <table width=100% border="0" cellpadding="0" cellspacing="0">
	                        <tr><td align=left><font color="<%=tableContentColor%>">&nbsp;&nbsp;&nbsp;<b>������</b>�� <%=response.encodeURL(forumNews.getUserName())%></font>
	                        </td><td align=right><font color="<%=tableContentColor%>"><b>����ʱ��</b>�� <%=forumNews.getAddTime()%>&nbsp;&nbsp;&nbsp;</font>
	                        </tr>
	                        </table>
	                        </td>
	                        </tr>
<%
			}
		}

		catch(Exception e){
					e.printStackTrace();
									%>
	                <tr>
	                    <td>
	                    <table cellpadding=3 cellspacing=1 border=0 width=100%>

	                        <tr>
	                        <td bgcolor="<%=tableTitleColor%>" align=center valign=top><font color="<%=tableFontColor%>"><b>>> ��ǰû���κι��� <<</b></font></td></tr>
	                        <tr>
	                            <td bgcolor="<%=tableBodyColor%>" valign=top style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word"><font color="<%=tableContentColor%>"><br>
	                        <p><blockquote>�������̳����ҳ��������һ������(�����ǹ���Ա���߰���)�� <br>���㷢��һ�ι���󣬱�����ͻ��Զ���ʧ���������ֶ�ɾ����
</blockquote></p></font>
	                        </td>
	                        </tr>
	                        <tr>
	                            <td bgcolor="<%=tableBodyColor%>" valign=middle>
	                        <table width=100% border="0" cellpadding="0" cellspacing="0">
	                        <tr><td align=left><font color="<%=tableContentColor%>">&nbsp;&nbsp;&nbsp;<b>������</b>�� ��վ��Ĭ�Ϲ���</font>
	                        </td><td align=right><font color="<%=tableContentColor%>"><b>����ʱ��</b>�� <%=NDate%>&nbsp;&nbsp;&nbsp;</font>
	                        </tr>
	                        </table>
	                        </td>
	                        </tr>



<%
		}
	
%>
				</table>
			</td></tr></table>
<%@ include file="foot.jsp"%>
