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
						<font color="<%=tableFontColor%>"><b>������Ҫ�����Ĺؼ���</b></font></td></tr>
						<tr>
						<td bgcolor="<%=tableBodyColor%>" colspan=2 align="center" valign="middle"><font  color="<%=tableContentColor%>">
						(ͬʱ��ѯ�������ʹ��'<font  color="<%=alertFontColor%>">or</font>' �ָ��ؼ��֣���ѯͬʱ����ĳ����ʹ��'<font  color="<%=alertFontColor%>">and</font>'�ָ��ؼ���)</font><br><br><input type=text size=40 name="keyword"></td></tr>
                        <tr>
						<td bgcolor="<%=aTableBodyColor%>" valign=middle colspan=2 align=center><font  color="<%=tableContentColor%>"><b>����ѡ��</b></font></td></tr>

                        <tr>
						<td bgcolor="<%=tableBodyColor%>" align="right" valign="middle"><font color="<%=tableContentColor%>">
                        <b>��������</b></font>&nbsp;<input name="sType" type="radio" value="1">
                        </td>
                        <td bgcolor="<%=tableBodyColor%>" align="left" valign="middle">
                        <select name="nSearch">
						                  <option value=1>������������
						                  <option value=2>�����ظ�����
						                  <option value=3>���߶�����
						                  </select>
						                  
                        </td>
                        </tr>
                        <tr>
                        <td bgcolor="<%=tableBodyColor%>" align="right" valign="middle"><font color="<%=tableContentColor%>">
                        <b>�ؼ�������</b></font>&nbsp;<input name="sType" type="radio" value="2" checked>
                        </td>
                        <td bgcolor="<%=tableBodyColor%>" align="left" valign="middle">
                        <select name="pSearch">
						                  <option value=1>�������������ؼ���
						                  
						                  </select>
						                  
                        </td>
                        </tr>
                        <tr>
                        <td bgcolor="<%=tableBodyColor%>" align="right" valign="middle"><font color="<%=tableContentColor%>">
                        <b>���ڷ�Χ</b></font>
                        </td>
                        <td bgcolor="<%=tableBodyColor%>" align="left" valign="middle">
<select name=SearchDate class=smallsel> <option value=ALL>��������<option value=1>��������<option  selected value=5>5������<option value=10>10������<option value=30>30������</option></select> 
						                  
                        </td>
                        </tr>
                        <tr>
						<td bgcolor="<%=aTableBodyColor%>" valign="middle" colspan=2 align=center><font color="<%=tableContentColor%>"><b>��ѡ��Ҫ��������̳ (��Ҫѡ��Щ�� >> �� << �������ģ���ֻ���������������̳)</b></font></td></tr>
						<tr>
						<td bgcolor="<%=tableBodyColor%>" colspan="2" valign="middle" align="center"><font color="<%=tableContentColor%>">
                        <b>������̳�� &nbsp; 
<select name=forumID size=1>
<option value=0 <%if(forumID==0){out.println("selected");}%>>������̳</option>
<%
	try{
		Vector gateWayVector=GateWayFactory.getGateWays();
		for( i=0;i<gateWayVector.size();i++)
		{
    			GateWay gateWay=(GateWay)gateWayVector.get(i);
    			int gateWayID=gateWay.getGateWayID();
    			String gateWayName=gateWay.getGateWayName();
				out.println("<option style=BACKGROUND-COLOR:#99ccff>�� "+gateWayName+"</option>");
				try{
					Vector forumVector=ForumFactory.getForums(gateWayID);
					for(int j=0;j<forumVector.size();j++){
						Forum theListForum=(Forum)forumVector.get(j);
						
						out.println("<option");
						if(forumID==theListForum.getForumID())
							out.println("selected");
							out.println("value=\""+theListForum.getForumID()+"\">����"+theListForum.getForumType()+"</option>");
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
</select>
						</b></td>
						</tr>
						<tr>
						<td bgcolor="<%=tableTitleColor%>" valign=middle colspan=2 align=center>
						<input type=submit value="��ʼ����">
						</td></form></tr></table></td></tr></table>

<%@include file="foot.jsp"%>
