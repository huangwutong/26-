<%@ page contentType="text/html;charset=gb2312"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector,
					net.acai.forum.admin.*"%>
<%
System.out.println(forumName);
%>
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
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr>
                <td>1��ע����� �����棬��������Ŀǰ���е���̳���ࡣ�����Ա༭��̳��������������һ���µ���̳����������С� Ҳ���Ա༭��ɾ��Ŀǰ���ڵ���̳�������Զ�Ŀǰ�ķ������½������С� 
                   <p><font color=<%=alertFontColor%>>2.�ر�ע��</font>��ɾ����̳ͬʱ��ɾ������̳���������ӣ�ɾ������ͬʱɾ��������̳���������ӣ� ����ʱ��������д����Ϣ��
                </td>
              </tr>
              <tr>
              <td>
              <p align=cetner><b><a href=admin_board.jsp>��̳����</a> | <a href="admin_board.jsp?action=addclass">�½���̳����</a></p>
              </td>
              <tr>
            </table>
<%
			  String action=ParamUtil.getString(request,"action");
		if(action==null||action.equals("")){
			  response.sendRedirect("admin_board.jsp?action=boardinfo");
		  }
		  

		else if(action.equals("add")){

%>
 <form action ="admin_board.jsp?action=savenew" method=post>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr bgcolor=<%=aTableTitleColor%>> 
<td width="52%" height=22><b>�ֶ����ƣ�</b> </td>
<td width="48%"><b>����ֵ��</b> </td>
</tr>
<tr> 
<td width="52%">��̳��ţ�ע�ⲻ�ܺͱ����̳�����ͬ��</td>
<td width="48%"> 

</td>
</tr>
<tr> 
<td width="52%">��̳��</td>
<td width="48%"> 
<input type="text" name="boardtype" size="24">
</td>
</tr>
<tr> 
<td width="52%">�������</td>
<td width="48%"> 
<select name=class>
<%
		Vector gateWayVector=GateWayFactory.getGateWays();
		for( i=0;i<gateWayVector.size();i++){
			GateWay gateWay=(GateWay)gateWayVector.get(i);
    			int gateWayID=gateWay.getGateWayID();
    			String gateWayName=gateWay.getGateWayName();
			
		
%>
<option value=<%=gateWayID%> <%if(gateWayID==ParamUtil.getInt(request,"gateWayID",0)){out.println("selected");}%>><%=gateWayName%> 
<%
		}
%>
</select>
</td>
</tr>
<tr> 
<td width="52%">����˵��</td>
<td width="48%"> 
<input type="text" name="readme" size="24">
</td>
</tr>
<tr> 
<td width="52%">����(������������|�ָ����磺ɳ̲С��|wodeail)��</td>
<td width="48%"> 
<input type="text" name="boardmaster" size="24">
</td>
</tr>
<tr> 
<td width="52%">��������(0���ţ�1������2�ض��û�����)</td>
<td width="48%"> 
<select name="lockboard">
<option value="0" selected>0 
<option value="1">1 
<option value="2">2 
</select>
</td>
</tr>
<tr> 
<td width="52%">������߿���ɫ</td>
<td width="48%"> 
<input type="text" name="Tableback" size="24" value="<%=tableBackColor%>">
</td>
</tr>
<tr> 
<td width="52%">�����������ɫ</td>
<td width="48%"> 
<input type="text" name="Tabletitle" size="24" value="<%=tableTitleColor%>">
</td>
</tr>
<tr> 
<td width="52%">�������ݱ����ɫ1</td>
<td width="48%"> 
<input type="text" name="Tablebody" size="24" value="<%=tableBodyColor%>">
</td>
</tr>
<tr> 
<td width="52%">�������ݱ����ɫ2����ɫ1����ɫ2��bbs����л��ഩ������</td>
<td width="48%"> 
<input type="text" name="aTablebody" size="24" value="#FFFFFF">
</td>
</tr>
<tr> 
<td width="52%">���������������ɫ</td>
<td width="48%"> 
<input type="text" name="TableFont" size="24" value="<%=tableFontColor%>">
</td>
</tr>
<tr> 
<td width="52%">�������ݱ��������ɫ</td>
<td width="48%"> 
<input type="text" name="TableContent" size="24" value="<%=tableContentColor%>">
</td>
</tr>
<tr> 
<td width="52%">���������ɫ</td>
<td width="48%"> 
<input type="text" name="AlertFont" size="24" value="<%=alertFontColor%>">
</td>
</tr>
<tr> 
<td width="52%">��̳Logo��ַ</td>
<td width="48%"> 
<input type="text" name="Logo" size="35" value="<%=forumLogo%>">
</td>
</tr>
<tr> 
<td width="52%">��ҳ��ʾ��̳ͼƬ</td>
<td width="48%"> 
<input type="text" name="indexIMG" size="35" value="">
</td>
</tr>
<tr> 
<td width="52%">UBB��ǩ</td>
<td width="48%"> 
<select name="strAllowForumCode">
<option value="0">��ʹ�� 
<option value="1" selected>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">HTML��ǩ</td>
<td width="48%"> 
<select name="strAllowHTML">
<option value="0" selected>��ʹ�� 
<option value="1">ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">��ͼ��ǩ</td>
<td width="48%"> 
<select name="strIMGInPosts">
<option value="0">��ʹ�� 
<option value="1" selected>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">Flash��ǩ</td>
<td width="48%"> 
<select name="strflash">
<option value="0">��ʹ�� 
<option value="1" selected>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">�����ǩ</td>
<td width="48%"> 
<select name="strIcons">
<option value="0">��ʹ�� 
<option value="1" selected>ʹ�� 
</select>
</td>
</tr>
<tr bgcolor="<%=aTableTitleColor%>"> 
<td width="52%">&nbsp;</td>
<td width="48%"> 
<input type="submit" name="Submit" value="�����̳">
</td>
</tr>
</table>
</form>
<%
}

else if(action.equals("edit")){

%>
 <form action ="admin_board.jsp?action=savedit" method=post>           
<%
	int editID;
	try{
		editID=ParamUtil.getInt(request,"editid");
	}
	catch(Exception e){
		throw new Exception("�Բ�����ûѡ�񣬱༭��̳��ID");
	}
	
	Forum theForum=ForumFactory.getForum(editID);
	if(theForum==null)
		throw new Exception("����İ���");
%>            
<input type='hidden' name=editid value='<%=editID%>'>
            
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr bgcolor=<%=aTableTitleColor%>> 
<td width="52%" height=22><b>�ֶ����ƣ�</b> </td>
<td width="48%"> 
<div align="center"><b>����ֵ��</b></div>
</td>
</tr>
<tr>
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>��̳ID</B></font></td>
<td width="48%"> 
<input type="text" name="newforumID" size="3"  value = '<%=theForum.getForumID()%>'>
</td>
</tr>
<tr> 
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>��̳����</B></font></td>
<td width="48%"> 
<input type="text" name="boardtype" size="24"  value = '<%=theForum.getForumType()%>'>
</td>
</tr>
<tr> 
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>�������</B></font></td>
<td width="48%"> 
<select name=class>
<%
		Vector gateWayVector=GateWayFactory.getGateWays();
		for( i=0;i<gateWayVector.size();i++){
			GateWay gateWay=(GateWay)gateWayVector.get(i);
    			int gateWayID=gateWay.getGateWayID();
    			String gateWayName=gateWay.getGateWayName();
			
		
%>
<option value=<%=gateWayID%> <%if(theForum.getForumClass()==gateWayID){ out.println("selected");}%>><%=gateWayName%> 
<%
		}
%>
</select>
</td>
</tr>
<tr> 
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>����˵��</B></font></td>
<td width="48%"> 
<input type="text" name="readme" size="24" value='<%=theForum.getReadMe()%>'>
</td>
</tr>
<tr> 
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>��̳����</B><BR>������������|�ָ����磺ɳ̲С��|wodeail</font></td>
<td width="48%"> 
<input type="text" name="boardmaster" size="24"  value='<%=theForum.getForumMaster()%>'>
</td>
</tr>
<tr> 
<td width="52%" height=24><font color="<%=tableContentColor%>"><B>�Ƿ�Ϊ��������</B><BR>0��ʾ���ţ�1��ʾ����</font></td>
<td width="48%"> 
<select name="lockboard">
<option value="0" <%if (theForum.getLockForum()==0) {%>selected<%}%>>0 
<option value="1" <%if (theForum.getLockForum()==1) {%>selected<%}%>>1 
</select>
</td>
</tr>
<tr> 
<td width="52%">������߿���ɫ</td>
<td width="48%"> 
<input type="text" name="Tableback" size="24"  value='<%=theForum.getTableBack()%>'>
</td>
</tr>
<tr> 
<td width="52%">�����������ɫ</td>
<td width="48%"> 
<input type="text" name="Tabletitle" size="24"  value='<%=theForum.getTableTitle()%>'>
</td>
</tr>
<tr> 
<td width="52%">�������ݱ����ɫ1</td>
<td width="48%"> 
<input type="text" name="Tablebody" size="24"  value='<%=theForum.getTableBody()%>'>
</td>
</tr>
<tr > 
<td width="52%">�������ݱ����ɫ2����ɫ1����ɫ2��bbs����л��ഩ������</td>
<td width="48%"> 
<input type="text" name="aTablebody" size="24"  value='<%=theForum.getATableBody()%>'>
</td>
</tr>
<tr> 
<td width="52%">���������������ɫ</td>
<td width="48%"> 
<input type="text" name="TableFont" size="24"  value='<%=theForum.getTableFont()%>'>
</td>
</tr>
<tr> 
<td width="52%">�������ݱ��������ɫ</td>
<td width="48%"> 
<input type="text" name="TableContent" size="24"  value='<%=theForum.getTableContent()%>'>
</td>
</tr>
<tr> 
<td width="52%">���������ɫ</td>
<td width="48%"> 
<input type="text" name="AlertFont" size="24"  value='<%=theForum.getAlertFont()%>'>
</td>
</tr>
<tr> 
<td width="52%">��̳Logo��ַ</td>
<td width="48%"> 
<input type="text" name="Logo" size="35" value="<%=theForum.getForumLogo()%>">
</td>
</tr>
<tr> 
<td width="52%">��ҳ��ʾ��̳ͼƬ</td>
<td width="48%">
<input type="text" name="indexIMG" size="35" value="<%=theForum.getIndexIMG()%>">
</td>
</tr>
<tr> 
<td width="52%">UBB��ǩ</td>
<td width="48%"> 
<select name="strAllowForumCode">
<option value="0" <%if (!theForum.getStrAllowForumCode()){%>selected<%}%>>��ʹ�� 
<option value="1" <%if (theForum.getStrAllowForumCode()){%>selected<%}%>>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">HTML��ǩ</td>
<td width="48%"> 
<select name="strAllowHTML">
<option value="0" <%if (!theForum.getStrAllowHTML()){%>selected<%}%>>��ʹ�� 
<option value="1" <%if (theForum.getStrAllowHTML()) {%>selected<%}%>>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">��ͼ��ǩ</td>
<td width="48%"> 
<select name="strIMGInPosts">
<option value="0" <%if (!theForum.getStrIMGInPosts()) {%>selected<%}%>>��ʹ�� 
<option value="1" <%if (theForum.getStrIMGInPosts()) {%>selected<%}%>>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">Flash��ǩ</td>
<td width="48%"> 
<select name="strflash">
<option value="0" <%if (!theForum.getStrFlash()) {%>selected<%}%>>��ʹ�� 
<option value="1" <%if (theForum.getStrFlash()) {%>selected<%}%>>ʹ�� 
</select>
</td>
</tr>
<tr> 
<td width="52%">�����ǩ</td>
<td width="48%"> 
<select name="strIcons">
<option value="0" <%if (!theForum.getStrIcons()){%>selected<%}%>>��ʹ�� 
<option value="1" <%if (theForum.getStrIcons()) {%>selected<%}%>>ʹ�� 
</select>
</td>
</tr>
<tr bgcolor=<%=aTableTitleColor%>> 
<td width="52%">&nbsp;</td>
<td width="48%"> 
<input type="submit" name="Submit" value="�ύ">
</td>
</tr>
</table>
</form>
<%

}
else if(action.equals("boardinfo")){

	    Vector gateWayVector=GateWayFactory.getGateWays();
		for( i=0;i<gateWayVector.size();i++){
			GateWay gateWay=(GateWay)gateWayVector.get(i);
    			int gateWayID=gateWay.getGateWayID();
    			String gateWayName=gateWay.getGateWayName();

	   
%>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr bgcolor="<%=aTableTitleColor%>">

                <td height="21"><font color="<%=tableContentColor%>"><B><%=gateWayID%>,��������<%=gateWayName%></b>    <a href="admin_board.jsp?action=add&gateWayID=<%=gateWayID%>"><font color="<%=tableContentColor%>">������̳</font></a> | <a href=admin_board.jsp?action=orders&id=<%=gateWayID%>><font color="<%=tableContentColor%>">���������޸�</font></a> | <a href=admin_board.jsp?action=del1&id=<%=gateWayID%> onclick="{if(confirm('ɾ���������÷�����������̳���������ӣ�ȷ��ɾ����?')){return true;}return false;}"><font color="<%=tableContentColor%>">ɾ������</font></a></font></td>
              </tr>
            </table>
<%
            try{
				Vector forumVector=ForumFactory.getForums(gateWayID);
				for(int j=0;j<forumVector.size();j++){
					Forum theForum=(Forum)forumVector.get(j);
            %>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr> 
                <td height="18"><%=theForum.getForumID()%>,��̳����<%=theForum.getForumType()%></td>
              </tr>
              <tr>
                <td height="18">��̳��飺<%=theForum.getReadMe()%></td>
              </tr>
              <tr>
                <td height="15"><a href="admin_board.jsp?action=edit&editid=<%=theForum.getForumID()%>">�༭����̳</a> | <a href="admin_board.jsp?action=del&boardid=<%=theForum.getForumID()%>">ɾ������̳</a></td>
              </tr>
            </table>
<hr color=black height=1 width="70%" align=left>
<%
				}
			}
			catch(Exception e){}
		}
%>
          </td>
            </tr>
        </table>      
        </td>
       </tr>
</table>
<%
}
else if(action.equals("savenew")){
	ForumAdmin.saveNew(request);
	
	
}
else if(action.equals("savedit")){

	ForumAdmin.saveEdit(request);
	
}
else if(action.equals("del")){

	ForumAdmin.del(request);
}
else if(action.equals("del1")){
	ForumAdmin.dell(request);
	
}
else if(action.equals("orders")){

%><br>
            <table width="95%" border="0" cellspacing="3" cellpadding="0" align=center>
              <tr> 
                <td height="22"><b>��̳�������������޸�</b><br>
ע�⣺������Ӧ��̳������������������Ӧ��������ţ�ע�ⲻ�ܺͱ����̳��������ͬ��������š�
		</td>
              </tr>
	      <tr>
		<td>
<%
	
	GateWay gateWay=GateWayFactory.getGateWay(request);
	out.println( "<form action=admin_board.jsp?action=updateorders method=post>");
	out.println( "<input type=text name=classname size=25 value="+gateWay.getGateWayName()+">");
	out.println( "  <input type=text name=newid size=2 value="+gateWay.getGateWayID()+">");
	out.println( "<input type=hidden name=id value="+gateWay.getGateWayID()+">");
	out.println( "<input type=submit name=Submit value=�޸�></form>");
	
	
%>
		</td>
	      </tr>
            </table>
<%
}
else if(action.equals("updateorders")){

	ForumAdmin.updateOrders(request);
	
}
else if(action.equals("addclass")){
	
%>
            <table width="95%" border="0" cellspacing="3" cellpadding="0" align=center>
              <tr> 
                <td height="22" bgcolor=<%=aTableTitleColor%>><b>����µ���̳����</b><br>
ע�⣺��������д���±���Ϣ��ע�ⲻ�ܺͱ����̳��������ͬ��������š�
		</td>
              </tr>
<form action=admin_board.jsp?action=saveclass method=post>
	      <tr>
		
��������<input name=classname type=text size=25>
<input type=submit name=Submit value=���>
		</td>
	      </tr>
</form>
	    </table>
<%
}
else if(action.equals("saveclass")){

	ForumAdmin.saveClass(request);
}

else
	throw new Exception("����Ƿ�����");


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