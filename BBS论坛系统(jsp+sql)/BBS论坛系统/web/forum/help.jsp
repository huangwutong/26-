<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector"%>
<%
	stats=forumName+"��̳����";
	forumID=ParamUtil.getInt(request,"forumID",0);
	
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>



 <table cellpadding=0 cellspacing=0 border=0 width="<%=tableWidth%>" bgcolor="<%=tableBackColor%>" align=center>
    <tr><td>
    <table cellpadding=5 cellspacing=1 border=0 width=100%>
    
						<tr>
						<td bgcolor="<%=tableTitleColor%>" valign=middle colspan=2 align="center">
						<p><form action="queryresult.jsp" method="post">
						<font color="<%=tableFontColor%>"><b>��̳˵��</b></font></td></tr>
						<tr>
						<td bgcolor="<%=tableBodyColor%>" colspan=2 align="left" valign="middle"><font  color="<%=tableContentColor%>">
						 1. �û�ע�᣺ֻ���ڽ�����̳�����дע����Ϣ���û�������̳�з������ӣ����û�ע��ϵͳ���Զ����û�һ����ʾ��Ϣ���û��������ɶ����Լ���ͷ����Ϣ��ǩ��(֧��ubb��ǩ)��

<br><br>2. �û���½������ѡ���ڵ�½ҳ���½����ֱ���ڷ������Ӵ���½��ϵͳ�Զ���¼�û���½��Ϣ��ֻ�е�½�û����ܷ������ӡ�

<br><br>3. �޸����ϣ���½�û����Զ��Լ���ԭʼע����Ϣ�����޸ġ�

<br><br>4. ����Ϣ����½�û����Զ��κ�����̳��ע����û����Ͷ���Ϣ���û����Զ���Ϣ�����Ķ���ɾ���Ȳ��������յ�����Ϣ��ʱ��ϵͳ���Զ����ѡ�

<br><br>5. ��̳���У�Ŀǰ֧�ֶ���̳��ע���û����շ���������ע��ʱ���������

<br><br>6. ��̳������֧�ֶ���̳�ı��⡢���ݡ������ˡ�����id���������ӡ����������ӵȶ��ֲ�ѯ.

<br><br>7. �������ӣ���½(ע��)�û�����������û����������̳�ڷ������ӣ���̳Ŀǰ֧�ֶ���UBB�﷨����ͼ�����ӣ�����Flash�ȣ����ҿ��Խ��е���html�Ĳ���������ѡ�����ûظ���ֱ�ӻظ�������uubʹ����鿴��̳������ubb��ء�

<br><br>8. �ظ����ӣ���½(ע��)�û����Զ�û��������������лظ������Ը�ʽͬ�ϡ�

<br><br>9. �༭���ӣ������û����Զ��Լ���������½����޸ģ������͹���Ա��Ȩ�޶��������ӽ��б༭��ͬ�ȼ��û����ܻ���༭��

<br><br>10.�����û�����ϸ׼ȷͳ���û�������Ϣ�������г��û����������ϵͳ����Դ���ʱ�����Ϣ��

<br><br>11.�����ղأ���½�û�����ѡ���Լ�ϲ���������ղص���̳���ղؼУ�������ʱ���ĺͽ���ɾ���Ĳ�����

<br><br>12.�ı���Ϣ����һ����������ݰ��մ�ӡ�ĸ�ʽ�����������������û�ֱ�Ӵ�ӡ���ӡ�

<br><br>13.������ʾ�����԰����û�������ĳ��������������ʾ(ǰһ�졢һ�ܵ�)

<br><br>14.�û��ȼ����û����շ������¶��ٷ�Ϊ�����ȼ��������뿴����


<br><br>15.������Ϣ�뿴��̳�����ļ���
						
						
						</font></td>
						</tr>
						<tr>
						<td bgcolor="<%=tableTitleColor%>" valign=middle colspan=2 align=center>&nbsp;
						</td></form></tr></table></td></tr></table>

<%@include file="foot.jsp"%>
