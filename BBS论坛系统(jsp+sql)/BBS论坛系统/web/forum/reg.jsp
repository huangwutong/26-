<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>

<%@ include file="INC/theme.jsp"%>
<%
	stats="�û�ע��";

	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
	
%>
    <table cellpadding=6 cellspacing=1 border=0 width=95% align=center>
    
    <tr>
    <td bgcolor=<%=aTableTitleColor%> align=center>
    <form action="reg_1.jsp" method="post">
    <b>�������������</b>
    </td>
    </tr>
    <td bgcolor=<%=tableBodyColor%> align=left>
<font color=<%=tableContentColor%>>
     <b>����ע��ǰ�����Ķ���̳Э��</b><p>
��ӭ�����뱾վ��μӽ��������ۣ���վ��Ϊ������̳��Ϊά�����Ϲ������������ȶ��������Ծ������������<BR><BR>
һ���������ñ�վΣ�����Ұ�ȫ��й¶�������ܣ������ַ�������Ἧ��ĺ͹���ĺϷ�Ȩ�棬�������ñ�վ���������ƺʹ���������Ϣ�� <BR>
����һ��ɿ�����ܡ��ƻ��ܷ��ͷ��ɡ���������ʵʩ�ģ�<BR>
��������ɿ���߸�������Ȩ���Ʒ���������ƶȵģ�<BR>
��������ɿ�����ѹ��ҡ��ƻ�����ͳһ�ģ�<BR>
�����ģ�ɿ�������ޡ��������ӣ��ƻ������Ž�ģ�<BR>
�����壩�������������ʵ��ɢ��ҥ�ԣ������������ģ�<BR>
������������⽨���š����ࡢɫ�顢�Ĳ�����������ɱ���ֲ�����������ģ�<BR>
�����ߣ���Ȼ�������˻���������ʵ�̰����˵ģ����߽����������⹥���ģ�<BR>
�����ˣ��𺦹��һ��������ģ�<BR>
�����ţ�����Υ���ܷ��ͷ�����������ģ�<BR>
����ʮ��������ҵ�����Ϊ�ġ�<BR>
�����������أ����Լ������ۺ���Ϊ���� <BR>
<p>
    </td>
    </tr>
    <tr>
    <td bgcolor=<%=aTableTitleColor%> align=center>
    <center><input type="submit" value="��ͬ��"></center>
    </td></form></tr></table>
    </td></tr></table>

<%@ include file="foot.jsp"%>
