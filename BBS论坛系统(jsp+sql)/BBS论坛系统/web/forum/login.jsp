<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%
	stats="��½";
%>
<%@ include file="INC/theme.jsp"%>
<%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
%>
<form action="chklogin.jsp" method="post"> 
<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=<%=aTableBackColor%> align=center>
    <tr>    
        <td>
        <table cellpadding=6 cellspacing=1 border=0 width=100%>

    <tr>
    <td bgcolor=<%=aTableTitleColor%> valign=middle colspan=2 align=center>
    <b>�����������û����������½</b></font></td></tr>
    <tr>
    <td bgcolor=<%=tableBodyColor%> valign=middle>�����������û���</td>
    <td bgcolor=<%=tableBodyColor%> valign=middle><INPUT name=userName type=text> &nbsp; <a href="reg.jsp">û��ע�᣿</a></td></tr>
    <tr>
    <td bgcolor=<%=tableBodyColor%> valign=middle>��������������</td>
    <td bgcolor=<%=tableBodyColor%> valign=middle><INPUT name=userPassword type=password> &nbsp; <a href="lostpass.jsp">�������룿</a></td></tr>
    <tr>
    <td bgcolor=<%=tableBodyColor%> valign=top width=30%><b>Cookie ѡ��</b><BR> ��ѡ����� Cookie ����ʱ�䣬�´η��ʿ��Է������롣</font></td>
    <td bgcolor=<%=tableBodyColor%> valign=middle>
                <input type="radio" name="cookieDate" value="0" checked>�����棬�ر��������ʧЧ<br>
                <input type="radio" name="cookieDate" value="1">����һ��<br>
                <input type="radio" name="cookieDate" value="2">����һ��<br>
                <input type="radio" name="cookieDate" value="3">����һ��<br>
                </td></tr>
	<input type=hidden name=comeURL value="<%=request.getHeader("REFERER")%>">
    <tr>
    <td bgcolor=<%=aTableTitleColor%> valign=middle colspan=2 align=center><input type=submit name="submit" value="�� ½"></td></tr></table></td></tr></table>
</form>

<%@ include  file="foot.jsp"%>

