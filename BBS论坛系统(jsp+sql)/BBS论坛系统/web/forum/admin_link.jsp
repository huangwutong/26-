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
        <td align=center colspan="2">��ӭ<b><%=session.getAttribute("adminName")%></b>�������ҳ��
        </td>
        </tr>
            <tr bgcolor=<%=tableBodyColor%>>
              
          <td width="20%" valign=top> 
             <%@include file="admin_left.jsp"%>
            </td>
              
          <td width="80%" valign=top>
<%
	/*if request("action") = "add" then 
		call addlink()
	elseif request("action")="edit" then
		call editlink()
	elseif request("action")="savenew" then
		call savenew()
	elseif request("action")="savedit" then
		call savedit()
	elseif request("action")="del" then
		call del()
	elseif request("action")="orders" then
		call orders()
	elseif request("action")="updateorders" then
		call updateorders()
	else
		call linkinfo()
	}*/
%>     
   
<%
		if(action==null||"".equals(action)){
	%>
	 <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr>
                <td>ע����� <br>
                  �����棬��������Ŀǰ���е�������̳�������Ա༭������̳����������һ���µ�������̳�� Ҳ���Ա༭��ɾ��Ŀǰ���ڵ�������̳�������Զ�Ŀǰ���������½������С� 
                </td>
              </tr>
            </table>
<%
	Vector forumLinkVector=new Vector();
	forumLinkVector=ForumLinkFactory.getForumLinks();
%> 
<br>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr bgcolor="<%=aTableTitleColor%>"> 
                <td height="22"><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
            </table>
<%
	for(i=0;i<forumLinkVector.size();i++){
		ForumLink forumLink=(ForumLink)forumLinkVector.get(i);
%>
<hr width=60% align=left color=black height=1>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr> 
                <td>������̳���ƣ�<%=forumLink.getForumName()%></td>
              </tr>
              <tr> 
                <td>������̳ URL��<%=forumLink.getForumURL()%></td>
              </tr>
              <tr> 
                <td>������̳��飺<%=forumLink.getReadMe()%></td>
              </tr>
              <tr align="left" valign="bottom"> 
                <td height="27"><a href="admin_link.jsp?action=edit&id=<%=forumLink.getLinkID()%>">�༭��������̳</a> | <a href="admin_link.jsp?action=del&id=<%=forumLink.getLinkID()%>">ɾ����������̳</a> | <a href="admin_link.jsp?action=orders&id=<%=forumLink.getLinkID()%>">������̳��������</a></td>
              </tr>
            </table>

<%
}
%>
<hr width=60% align=left color=black height=1>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr bgcolor=<%=aTableTitleColor%>> 
                <td height="20"><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
            </table>
            <br>
            <br>
          </td>
            </tr>
        </table>
	<%
	}

		
	else if(action.equals("add")){
%>
<form action="admin_link.jsp?action=savenew" method = post>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="30%">��̳���ƣ� </td>
    <td width="70%"> 
      <input type="text" name="name" size=40>
    </td>
  </tr>
  <tr> 
    <td width="30%">����URL�� </td>
    <td width="70%"> 
      <input type="text" name="url" size=40>
    </td>
  </tr>
  <tr> 
    <td height="15" width="30%">��̳��飺 </td>
    <td height="15" width="70%"> 
      <input type="text" name="readme" size=40>
    </td>
  </tr>
  <tr> 
    <td height="15" colspan="2"> 
      <div align="center"> 
        <input type="submit" name="Submit" value="���">
      </div>
    </td>
  </tr>
</table>
</form>
<%
		}
		else if(action.equals("edit")){
	int forumLinkID=ParamUtil.getInt(request,"id",0);
	ForumLink forumLink=ForumLinkFactory.getForumLink(forumLinkID);
%>
<form action="admin_link.jsp?action=savedit" method=post>
<input type=hidden name=id value=<%=forumLinkID%>>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="30%">��̳���ƣ� </td>
    <td width="70%"> 
      <input type="text" name="name" size=40 value=<%=forumLink.getForumName()%>>
    </td>
  </tr>
  <tr> 
    <td width="30%">����URL�� </td>
    <td width="70%"> 
      <input type="text" name="url" size=40 value=<%=forumLink.getForumURL()%>>
    </td>
  </tr>
  <tr> 
    <td height="15" width="30%">��̳��飺 </td>
    <td height="15" width="70%"> 
      <input type="text" name="readme" size=40 value=<%=forumLink.getReadMe()%>>
    </td>
  </tr>
  <tr> 
    <td height="15" colspan="2"> 
      <div align="center"> 
        <input type="submit" name="Submit" value="�޸�">
      </div>
    </td>
  </tr>
</table>
</form>
<%
	
		}
		else if(action.equals("savenew")){


			ForumLinkAdmin.saveNew(request);
			out.println("�����ɹ���");
		}
		else if(action.equals("savedit")){
			ForumLinkAdmin.saveEdit(request);
			out.println("�����ɹ���");
		}
		else if(action.equals("del")){
			ForumLinkAdmin.del(request);
			out.println("�����ɹ���");
		}
		else if(action.equals("orders")){
			
%><br>
            <table width="95%" border="0" cellspacing="3" cellpadding="0" align=center>
              <tr> 
                <td height="22"><b>������̳��������</b><br>
ע�⣺������Ӧ��̳���������������Ӧ��������ţ�ע�ⲻ�ܺͱ��������̳����ͬ��������š�
		</td>
              </tr>
	      <tr>
              <tr bgcolor="<%=aTableTitleColor%>"> 
                <td height="22" align=center><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
	      <tr>
		<td>
<%
	int forumLinkID=ParamUtil.getInt(request,"id",0);
	ForumLink forumLink=ForumLinkFactory.getForumLink(forumLinkID);
	out.println( "<form action=admin_link.jsp?action=updateorders method=post>");
	out.println( forumLink.getForumName()+"  <input type=text name=newid size=2 value="+forumLink.getLinkID()+">");
	out.println( "<input type=hidden name=id value="+forumLink.getLinkID()+">");
	out.println( "<input type=submit name=Submit value=�޸�></form>");
%>
		</td>
	      </tr>
              <tr bgcolor="<%=aTableTitleColor%>"> 
                <td height="22" align=center><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
            </table>
<%
		}
		else if(action.equals("updateorders")){
			ForumLinkAdmin.updateOrders(request);
			out.println("�����ɹ���");
		}
		else{
%>		 <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr>
                <td>ע����� <br>
                  �����棬��������Ŀǰ���е�������̳�������Ա༭������̳����������һ���µ�������̳�� Ҳ���Ա༭��ɾ��Ŀǰ���ڵ�������̳�������Զ�Ŀǰ���������½������С� 
                </td>
              </tr>
            </table>
<%
	Vector forumLinkVector=new Vector();
	forumLinkVector=ForumLinkFactory.getForumLinks();
%> 
<br>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr bgcolor="<%=aTableTitleColor%>"> 
                <td height="22"><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
            </table>
<%
	for(i=0;i<forumLinkVector.size();i++){
		ForumLink forumLink=(ForumLink)forumLinkVector.get(i);
%>
<hr width=60% align=left color=black height=1>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr> 
                <td>������̳���ƣ�<%=forumLink.getForumName()%></td>
              </tr>
              <tr> 
                <td>������̳ URL��<%=forumLink.getForumURL()%></td>
              </tr>
              <tr> 
                <td>������̳��飺<%=forumLink.getReadMe()%></td>
              </tr>
              <tr align="left" valign="bottom"> 
                <td height="27"><a href="admin_link.jsp?action=edit&id=<%=forumLink.getLinkID()%>">�༭��������̳</a> | <a href="admin_link.jsp?action=del&id=<%=forumLink.getLinkID()%>">ɾ����������̳</a> | <a href="admin_link.jsp?action=orders&id=<%=forumLink.getLinkID()%>">������̳��������</a></td>
              </tr>
            </table>

<%
}
%>
<hr width=60% align=left color=black height=1>
            <table width="100%" border="0" cellspacing="3" cellpadding="0">
              <tr bgcolor=<%=aTableTitleColor%>> 
                <td height="20"><a href="admin_link.jsp?action=add">�����µ�������̳</a></td>
              </tr>
            </table>
            <br>
            <br>
          </td>
            </tr>
        </table>
	<%
	}

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
     </td>
    </tr>
</table>
<%@ include file="foot.jsp"%>