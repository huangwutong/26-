<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector,
					net.acai.forum.admin.*"%>
<%
	stats=forumName+"�������ҳ��";
	forumID=ParamUtil.getInt(request,"forumID",0);
	String errMsg="";
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>
<%
	
		try{
			ForumNewsAdmin forumNewsAdmin=new ForumNewsAdmin(request,response);
			

%>
<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
  <tr>
    <td>
      <table cellpadding=3 cellspacing=1 border=0 width=100%>
        <tr bgcolor='<%=tableTitleColor%>'>
          <td align=center colspan="2"><font color="<%=tableFontColor%>">��ӭ<b> <%=response.encodeURL(userName)%></b>�����������ҳ��</font></td>
        </tr>
            <tr bgcolor=<%=tableBodyColor%>>
              <td width="30%" valign=top><font color="<%=tableContentColor%>">
&nbsp;&nbsp;ע�⣺������������������Լ��������ɷ�������Ͱ������ã�����Ա���������а��淢����������Ϣ���й��������
<br><BR>
��������ѡ�<BR>
����������ɾ��������<%if (bmFlag_1==1) {%>��<%}else{%>�ر�<%}%><BR>
���������޸���ɫ���ã�<%if (bmFlag_2==1) {%>��<%}else{%>�ر�<%}%><BR>
�������ɸ�����̳ʹ�����ã�<%if (bmFlag_3==1) {%>��<%}else{%>�ر�<%}%><BR>
���а��������޸���ɫ���ã�<%if (bmFlag_4==1){%>��<%}else{%>�ر�<%}%><BR>
���а������ɸ�����̳���ã�<%if (bmFlag_5==1) {%>��<%}else{%>�ر�<%}%><BR>
</font>
	      </td>
              <td width="70%" valign=top>
<font color="<%=tableContentColor%>">
      		<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
		  <tr>
			<td width="100%" height=24 bgcolor=<%=aTableTitleColor%>>
<font color="<%=tableContentColor%>">
<B>ע��</B>��<BR>��ҳ��Ϊ����ר�ã�ʹ��ǰ�뿴������Ӧ�Ĺ����Ƿ�򿪣��ڽ��й������õ�ʱ�򣬲�Ҫ����������ã�������ģ�������д����������ȷ����д��<BR>
        <b>����ѡ�<a href=admin_boardaset.jsp?forumID=<%=forumID%>><font color="<%=tableContentColor%>">��̳���淢��</font></a>
        <%if (master) {%>
        | <b><a href=admin_boardaset.jsp?action=manage&forumID=<%=forumID%>><font color="<%=tableContentColor%>">�������</font></a>
        <%}%> | 
		<a href=admin_boardaset.jsp?action=editbminfo&forumID=<%=forumID%>><font color="<%=tableContentColor%>">������Ϣ����</font></a> | 
		<a href=admin_boardaset.jsp?action=editbmset&forumID=<%=forumID%>><font color="<%=tableContentColor%>">�������ù���</font></a> | 
		<a href=admin_boardaset.jsp?action=editbmcolor&forumID=<%=forumID%>><font color="<%=tableContentColor%>">��ɫ���ù���</font></a></b></font>
		  </td></tr>
		</table>
<%
	String action=ParamUtil.getString(request,"action");
	
	
%></font>
	      </td>
            </tr>
        </table>
        </td>
    </tr>
</table>
<%
	if(action==null||action.equals("news")){
%>
<form action="admin_boardaset.jsp?action=new" method=post name=FORM>
      		
  <table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
    <tr> 
      <td width="20%" valign=top> 
        <div align="center"><font color="<%=tableContentColor%>">�������棺 </font></div>
      </td>
      <td width="80%"> 
        <%if (master) {%>
       
        <select name="forumID" size="1">
          <option value="0">��̳��ҳ</option>
          <%@include file="INC/forumList.jsp"%>
        </select>
        <%}else{%>
        <%
	Forum theForum=ForumFactory.getForum(forumID);
%>
        <select name="forumID" size="1">
          <option value="<%=forumID%>"><%=theForum.getForumType()%></option>
        </select>
        <%}%>
      </td>
    </tr>
    <tr> 
      <td width="20%" valign=top> 
        <div align="center"><font color="<%=tableContentColor%>">�����ˣ� </font></div>
      </td>
      <td width="80%">
        <input type=text name=username size=36 value="<%=userName%>" disabled>
        <input type=hidden name=username value="<%=userName%>">
      </td>
    </tr>
    <tr> 
      <td width="20%" valign=top> 
        <div align="center"><font color="<%=tableContentColor%>">���⣺ </font></div>
      </td>
      <td width="80%">
        <input type=text name=title size=36>
      </td>
    </tr>
    <tr> 
      <td width="20%" valign=top> 
        <div align="center"><font color="<%=tableContentColor%>">���ݣ� </font></div>
      </td>
      <td width="80%">
        <textarea cols=35 rows=6 name="content"></textarea>
      </td>
    </tr>
    <tr>
      <td width="100%" valign=top colspan="2" align=center> 
	    <input type=hidden name="checked" value="yes">
        <input type=Submit value="�� ��" name=Submit">
        &nbsp; 
        <input type="reset" name="Clear" value="�� ��">
      </td>
    </tr>
  </table>
</form>
<%
}
else if(action.equals("new")){
	out.println("�����ɹ�!");
}
else if(action.equals("del")){
	out.println("ɾ������ɹ�");
}
else if(action.equals("update")){
	out.println("�޸ĳɹ�!");
}
else if(action.equals("saveditbm")){
	out.println("�޸ĳɹ�");
}
else if(action.equals("manage")){
%>
      		<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
		  <tr><td width="80%" valign=top height=22>
<font color="<%=tableContentColor%>">����</font>
		  </td>
		  <td width="20%">
<font color="<%=tableContentColor%>">����</font>
		  </td></tr>
<%
	try{
		Vector forumNewsVector=ForumNewsManager.getForumNewsVector();
		for(i=0;i<forumNewsVector.size();i++){
			ForumNews forumNews=(ForumNews)forumNewsVector.get(i);
	
%>
		  <tr><td width="80%" valign=top height=22><a href=admin_boardaset.jsp?action=edit&newsID=<%=forumNews.getId()%>&forumID=<%=forumNews.getBoardid()%>><font color="<%=tableContentColor%>"><%=forumNews.getTitle()%></font></a>
		  </td>
		  <td width="20%"><a href=admin_boardaset.jsp?action=del&newsID=<%=forumNews.getId()%>&forumID=<%=forumNews.getBoardid()%>><font color="<%=tableContentColor%>">ɾ��</font></a>
		  </td></tr>
<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
%></table>
<%
}

else if(action.equals("edit")){
	int newsID=ParamUtil.getInt(request,"newsID");
%>
<form action="admin_boardaset.jsp?action=update&newsID=<%=newsID%>" method=post>
      		<table cellpadding=0 cellspacing=0 border=0 width=100% align=center>
		  <tr><td width="20%" valign=top>
<font color="<%=tableContentColor%>">�������棺</font>
		  </td>
		  <td width="80%">

<select name="forumID" size="1">
<option value="0" <%if (forumID==0) {%>selected<%}%>>��̳��ҳ</option>
<%@include file="INC/forumList.jsp"%> 
          </select>
		  </td></tr>
<%
	try{

		ForumNews forumNews=ForumNewsManager.getSignalForumNews(newsID);
		%>
		  <tr><td width="20%" valign=top>
<font color="<%=tableContentColor%>">�����ˣ�</font>
		  </td>
		  <td width="80%"><input type=text name=username size=36 value=<%=forumNews.getUserName()%>></td></tr>
		  <tr><td width="20%" valign=top>
<font color="<%=tableContentColor%>">���⣺</font>
		  </td>
		  <td width="80%"><input type=text name=title size=36 value=<%=forumNews.getTitle()%>></td></tr>
		  <tr><td width="20%" valign=top>
<font color="<%=tableContentColor%>">���ݣ�</font>
		  </td>
		  <td width="80%"><textarea cols=35 rows=6 name="content">
<%=forumNews.getContent()%>
		  </textarea></td>
		  </tr>
		  <tr><td width="100%" valign=top colspan="2" align=center>
<input type=Submit value="�� ��" name=Submit"> &nbsp; <input type="reset" name="Clear" value="�� ��">
		  </td></tr>
		</table>
</form>
<%
		 }
		catch(Exception e){
			e.printStackTrace();
			throw new Exception("û�з�������!");
		}
}

else if(action.equals("editbminfo")){
	if(bmFlag_1==0&&!master)
		throw new Exception("�������������δ���š�");


%>
 <form action ="admin_boardaset.jsp?action=saveditbm&forumID=<%=forumID%>" method=post>           
<%
	Forum theForum;
	if(forumID==0)
		throw new Exception("��û��ָ����Ӧ��̳ID�����ܽ��й���");
	else
		theForum=ForumFactory.getForum(forumID);

	
%>            
<input type='hidden' name=editid value='<%=forumID%>'>
            
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr bgcolor=<%=aTableTitleColor%>> 
      <td width="52%" height=22><font color="<%=tableContentColor%>"><b>�ֶ����ƣ�</b></font> </td>
      <td width="48%"> 
        <div align="center"><font color="<%=tableContentColor%>"><b>����ֵ��</b></font></div>
      </td>
    </tr>
    <tr> 
      <td width="52%"><font color="<%=tableContentColor%>">��̳��ţ�ע�ⲻ�ܺͱ����̳�����ͬ��</font></td>
      <td width="48%"> <font color="<%=tableContentColor%>"><%=forumID%> </font></td>
    </tr>
    <tr> 
      <td width="52%"><font color="<%=tableContentColor%>">��̳��</font></td>
      <td width="48%"> <font color="<%=tableContentColor%>"><%=theForum.getForumType()%></font> </td>
    </tr>
    <tr> 
      <td width="52%"><font color="<%=tableContentColor%>">����˵��</font></td>
      <td width="48%"> 
        <input type="text" name="readme" size="24" value='<%=theForum.getReadMe()%>'>
      </td>
    </tr>
    <tr> 
      <td width="52%"><font color="<%=tableContentColor%>">����(������������|�ָ����磺ɳ̲С��|wodeail)��</font></td>
      <td width="48%"> 
        <input type="text" name="boardmaster" size="24"  value='<%=theForum.getForumMaster()%>'>
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

else if(action.equals("editbmset")){


out.println("���ڽ�����");
}
else if(action.equals("editbmcolor")){
	out.println("���ڽ�����");
}
else 
	throw new Exception("�Ƿ�����");

}
catch(Exception e){
		e.printStackTrace();
		errMsg=e.getMessage();
	%>
	<%@include file="INC/error.jsp"%>
	<%
	}
%>
<%@include file="foot.jsp"%>
