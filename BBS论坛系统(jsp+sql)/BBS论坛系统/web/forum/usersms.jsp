<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector"%>
<%
	stats=forumName+"��̳����Ϣ����.";
	forumID=ParamUtil.getInt(request,"forumID",0);
	
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>

<script language="javascript">
function DoTitle(addTitle) { 
var revisedTitle; 
var currentTitle = document.messager.touser.value; 
revisedTitle = currentTitle+addTitle; 
document.messager.touser.value=revisedTitle; 
document.messager.touser.focus(); 
return; }
</script>
<%
try{
	if(foundUser){
		SMSManager smsManager=new SMSManager(request,response);
		String sender=ParamUtil.getString(request,"sender","");
		int id=ParamUtil.getInt(request,"id",0);
		String action=new String(ParamUtil.getString(request,"action").getBytes("ISO-8859-1"),"GBK");
		if(action==null||"".equals(action.trim()))
			throw new Exception("��������");
		action=action.trim();
		String msg="";
out.println( "<TABLE border=0 width="+tableWidth+" align=center><TBODY>"+
				"<TR><TD align=left></TD>"+
				"<TD Align=right>  <a href=usersms.jsp?action=inbox><img src=pic/m_inbox.gif border=0 alt=�ռ���></a> &nbsp; <a href=usersms.jsp?action=outbox><img src=pic/m_outbox.gif border=0 alt=������></a> &nbsp; <a href=usersms.jsp?action=issend><img src=pic/m_issend.gif border=0 alt=�ѷ����ʼ�></a>&nbsp; <a href=usersms.jsp?action=recycle><img src=pic/m_recycle.gif border=0 alt=�ϼ���></a>&nbsp; <a href=friendlist.jsp><img src=pic/m_address.gif border=0 alt=��ַ��></a>&nbsp;<a href=usersms.jsp?action=new&id=><img src=pic/m_write.gif border=0 alt=������Ϣ></a> &nbsp;<a href=usersms.jsp?action=new&touser="+response.encodeURL(sender)+"&id="+id+"><img src=pic/m_reply.gif border=0 alt=�ظ���Ϣ></a> &nbsp;<a href=usersms.jsp?action=fw&id="+id+"><img src=pic/m_fw.gif border=0 alt=ת����Ϣ></a>&nbsp;<a href=usersms.jsp?action=delete&id="+id+"><img src=pic/m_delete.gif border=0 alt=ɾ����Ϣ></a>"+
				"</TD></TR></TBODY></TABLE><br>");
/*if founderr=true then
	call error()
else
	select case request("action")
	case "inbox"
		call inbox()
	case "outbox"
		call outbox()
	case "issend"
		call issend()
	case "recycle"
		call recycle()
	case "new"
		call sendmsg()
	case "read"
		call read()
	case "outread"
		call read()
	case "delete"
		call delete()
	case "send"
		call savemsg()
	case "newmsg"
		call newmsg()
	case "fw"
		call fw()
	case "edit"
		call edit()
	case "savedit"
		call savedit()
	case "ɾ���ռ�"
		call delinbox()
			<b>��ϲ����ɾ������Ϣ�ɹ���</b><br>ɾ������Ϣ��ת�Ƶ����Ļ���վ��
	case "����ռ���"
		��ϲ����ɾ������Ϣ�ɹ���</b><br>ɾ������Ϣ��ת�Ƶ����Ļ���վ��
	case "ɾ������"
		call deloutbox()
	case "��շ�����"
		call AllDeloutbox()
	case "ɾ���ѷ���Ϣ"
		call delissend()
	case "����ѷ�����Ϣ"
		call AllDelissend()
	case "ɾ��ָ����Ϣ"
		call delrecycle()
	case "��ջ���վ"
		call AllDelrecycle()
	case else
		call inbox()
	end select
	if founderr then call error()
}*/
//�ռ���

		if(action.equals("inbox")){
%>
<form action="usersms.jsp" method=post name=inbox>
    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
            <tr bgcolor=<%=tableTitleColor%>>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>�Ѷ�</b></font></td>
                <td align=center valign=middle width=100><font color="<%=tableFontColor%>"><b>������</b></font></td>
                <td align=center valign=middle width=300><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=150><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=50><font color="<%=tableFontColor%>"><b>��С</b></font></td>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>����</b></font></td>
            </tr>
<%

	Vector smsVector=smsManager.getInBox();
	if(smsVector.size()==0){
%>
                <tr>
                <td bgcolor=<%=tableBodyColor%> align=center valign=middle colspan=6><font color="<%=tableContentColor%>">�����ռ�����û���κ����ݡ�</font></td>
                </tr>
<%}else{%>
<%
	for(i=0;i<smsVector.size();i++){
		SMSMSG sms=(SMSMSG)smsVector.get(i);
%>
                <tr bgcolor=<%if (sms.getFlag()==0){%>"<%=aTableBodyColor%>"<%}else{%>"<%=tableBodyColor%>"<%}%>>
                    <td align=center valign=middle><%if (sms.getFlag()==0) {%><img src="pic/m_news.gif"><%}else{%><img src="<%=picURL%>m_olds.gif"><%}%></td>
                    <td align=center valign=middle><%if (sms.getFlag()==0) {%><b><%}%><a href="dispuser.jsp?name=<%=response.encodeURL(sms.getSender())%>" target=_blank><%=response.encodeURL(sms.getSender())%></a></td>
                    <td align=left><a href="usersms.jsp?action=read&id=<%=sms.getID()%>&sender=<%=sms.getSender()%>"><%if (sms.getFlag()==0) {%><b><%}%><%=response.encodeURL(sms.getTitle())%></a>	</td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getSendtime()%></font></td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getContent().length()%>Byte</font></td>
                <td align=center valign=middle width=30><input type=checkbox name=id value=<%=sms.getID()%>></td>
                </tr>
<%
		}
}

%>
                
        <tr bgcolor="<%=tableTitleColor%>"> 
          <td align=right valign=middle colspan=6><font color="<%=tableFontColor%>">��ʡÿһ�ֿռ䣬�뼰ʱɾ��������Ϣ&nbsp;<input type=checkbox name=chkall value=on onclick="CheckAll(this.form)">ѡ��������ʾ��¼&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="ɾ���ռ�">&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ������ռ������еļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="����ռ���"></font></td>
                </tr>
                </table></td></tr></table></form>
<%
			
		}
		else if(action.equals("send")){
			smsManager.saveSMS(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("���Ͷ���Ϣ�ɹ���"));
		}
		else if(action.equals("ɾ���ռ�")){
			smsManager.delInBox(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		 else if(action.equals("����ռ���")){
			smsManager.allDelInBox();
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		  //�ռ���
		else if(action.equals("outbox")){
%>
<form action="usersms.jsp" method=post name=inbox>
    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
            <tr bgcolor=<%=tableTitleColor%>>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>�Ѷ�</b></font></td>
                <td align=center valign=middle width=100><font color="<%=tableFontColor%>"><b>�ռ���</b></font></td>
                <td align=center valign=middle width=300><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=150><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=50><font color="<%=tableFontColor%>"><b>��С</b></font></td>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>����</b></font></td>
            </tr>
<%
	Vector outBox=smsManager.getOutBox();
	if(outBox.size()==0){
%>
                <tr>
                <td bgcolor=<%=tableBodyColor%> align=center valign=middle colspan=6><font color="<%=tableContentColor%>">���ķ�������û���κ����ݡ�</font></td>
                </tr>
<%}else{%>
<%	
	for(i=0;i<outBox.size();i++){
		SMSMSG sms=(SMSMSG)outBox.get(i);
	
	%>
                <tr bgcolor=<%if (sms.getFlag()==0) {%>"<%=aTableBodyColor%>"<%}else{%>"<%=tableBodyColor%>"<%}%>>
                    <td align=center valign=middle><img src="<%=picURL%>m_issend_2.gif"></td>
                    <td align=center valign=middle><%if (sms.getFlag()==0) {%><b><%}%><a href="dispuser.jsp?name=<%=response.encodeURL(sms.getIncept())%>" target=_blank><%=response.encodeURL(sms.getIncept())%></a></td>
                    <td align=left><a href="usersms.jsp?action=edit&id=<%=sms.getID()%>"><%if (sms.getFlag()==0) {%><b><%}%><%=response.encodeURL(sms.getTitle())%></a>	</td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getSendtime()%></font></td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getContent().length()%>Byte</font></td>
                <td align=center valign=middle width=30><input type=checkbox name=id value=<%=sms.getID()%>></td>
                </tr>
<%
		}
	}
%>
                
        <tr bgcolor="<%=tableTitleColor%>"> 
          <td align=right valign=middle colspan=6><font color="<%=tableFontColor%>">��ʡÿһ�ֿռ䣬�뼰ʱɾ��������Ϣ&nbsp;<input type=checkbox name=chkall value=on onclick="CheckAll(this.form)">ѡ��������ʾ��¼&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="ɾ������">&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ��������������еļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="��շ�����"></font></td>
                </tr>
                </table></td></tr></table></form>
<%
		}
		  else if(action.equals("ɾ������")){
			smsManager.delOutBox(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		 else if(action.equals("��շ�����")){
			smsManager.allDelOutBox();
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		else if(action.equals("issend")){
%>
<form action="usersms.jsp" method=post name=inbox>
    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
            <tr bgcolor=<%=tableTitleColor%>>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>�Ѷ�</b></font></td>
                <td align=center valign=middle width=100><font color="<%=tableFontColor%>"><b>�ռ���</b></font></td>
                <td align=center valign=middle width=300><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=150><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=50><font color="<%=tableFontColor%>"><b>��С</b></font></td>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>����</b></font></td>
            </tr>
<%
	Vector isSend=smsManager.getIsSend();
	if(isSend.size()==0){
%>
                <tr>
                <td bgcolor=<%=tableBodyColor%> align=center valign=middle colspan=6><font color="<%=tableContentColor%>">�����ѷ�����Ϣ��û���κ����ݡ�</font></td>
                </tr>
<%}else{%>
<%
	for(i=0;i<isSend.size();i++){
		SMSMSG sms=(SMSMSG)isSend.get(i);
%>
                <tr bgcolor=<%if (sms.getFlag()==0) {%>"<%=aTableBodyColor%>"<%}else{%>"<%=tableBodyColor%>"<%}%>>
                    <td align=center valign=middle><img src="<%=picURL%>m_issend_1.gif"></td>
                    <td align=center valign=middle><%if (sms.getFlag()==0) {%><b><%}%><a href="dispuser.jsp?name=<%=response.encodeURL(sms.getIncept())%>" target=_blank><%=response.encodeURL(sms.getIncept())%></a></td>
                    <td align=left><a href="usersms.jsp?action=outread&id=<%=sms.getID()%>"><%if (sms.getFlag()==0) {%><b><%}%><%=response.encodeURL(sms.getTitle())%></a>	</td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getSendtime()%></font></td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getContent().length()%>Byte</font></td>
                <td align=center valign=middle width=30><input type=checkbox name=id value=<%=sms.getID()%>></td>
                </tr>
<%
	
		}
	}
	
%>
                
        <tr bgcolor="<%=tableTitleColor%>"> 
          <td align=right valign=middle colspan=6><font color="<%=tableFontColor%>">��ʡÿһ�ֿռ䣬�뼰ʱɾ��������Ϣ&nbsp;<input type=checkbox name=chkall value=on onclick="CheckAll(this.form)">ѡ��������ʾ��¼&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="ɾ���ѷ���Ϣ">&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ������ѷ�����Ϣ���еļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="����ѷ�����Ϣ"></font></td>
                </tr>
                </table></td></tr></table></form>
<%
		}
		  else if(action.equals("ɾ���ѷ���Ϣ")){
			smsManager.delIsSend(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		 else if(action.equals("����ѷ�����Ϣ")){
			smsManager.allDelIsSend();
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
//'�ѷ����߼�ɾ�������ڻ���վ������ֶ�delS������������������ɾ��
//'delS��0δ������1������ɾ����2�����ߴӻ���վɾ��

		else if(action.equals("recycle")){
%>
<form action="usersms.jsp" method=post name=inbox>
    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
            <tr bgcolor=<%=tableTitleColor%>>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>�Ѷ�</b></font></td>
                <td align=center valign=middle width=100><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=300><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=150><font color="<%=tableFontColor%>"><b>����</b></font></td>
                <td align=center valign=middle width=50><font color="<%=tableFontColor%>"><b>��С</b></font></td>
                <td align=center valign=middle width=30><font color="<%=tableFontColor%>"><b>����</b></font></td>
            </tr>
<%
	Vector recycle = smsManager.getRecycle();
	if(recycle.size()==0){
%>
                <tr>
                <td bgcolor=<%=tableBodyColor%> align=center valign=middle colspan=6><font color="<%=tableContentColor%>">���ķϼ�����û���κ����ݡ�</font></td>
                </tr>
<%}else{%>
<%
	for(i=0;i<recycle.size();i++){
	SMSMSG sms=(SMSMSG)recycle.get(i);
%>
                <tr bgcolor=<%if (sms.getFlag()==0) {%>"<%=aTableBodyColor%>"<%}else{%>"<%=tableBodyColor%>"<%}%>>
                    <td align=center valign=middle><font face="����" color="#333333"><%if (sms.getFlag()==0) {%><img src="pic/m_news.gif"><%}else{%><img src="pic/m_olds.gif"><%}%></font></td>
                    <td align=center valign=middle><%if (sms.getFlag()==0) {%><b><%}%><a href="dispuser.jsp?name=<%=response.encodeURL(sms.getIncept())%>" target=_blank><%=response.encodeURL(sms.getIncept())%></a></td>
                    <td align=left><a href="usersms.jsp?action=read&id=<%=sms.getID()%>"><%if (sms.getFlag()==0) {%><b><%}%><%=response.encodeURL(sms.getTitle())%></a>	</td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getSendtime()%></font></td>
                    <td><font color="<%=tableContentColor%>"><%if (sms.getFlag()==0) {%><b><%}%><%=sms.getContent().length()%>Byte</font></td>
                <td align=center valign=middle width=30><input type=checkbox name=id value=<%=sms.getID()%>></td>
                </tr>
<%
		}
	}
	
%>
                
        <tr bgcolor="<%=tableTitleColor%>"> 
          <td align=right valign=middle colspan=6><font color="<%=tableFontColor%>">��ʡÿһ�ֿռ䣬�뼰ʱɾ��������Ϣ&nbsp;<input type=checkbox name=chkall value=on onclick="CheckAll(this.form)">ѡ��������ʾ��¼&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ��ɾ��ѡ���ļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="ɾ��ָ����Ϣ">&nbsp;<input type=submit name=action onclick="{if(confirm('ȷ���������վ���еļ�¼��?')){this.document.inbox.submit();return true;}return false;}" value="��ջ���վ"></font></td>
                </tr>
                </table></td></tr></table></form>
<%
		}
		  else if(action.equals("ɾ��ָ����Ϣ")){
			smsManager.delRecycle(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		 else if(action.equals("��ջ���վ")){
			smsManager.allDelRecycle();
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ������Ϣ�ɹ����������������������У�"));
		}
		
//������Ϣ
		else if(action.equals("new")){

	String title="";
	String sendtime="";
	String content="";
	boolean fwSign=false;
	try{
		SMSMSG sms=smsManager.getSMSMSG(request);
		sendtime=sms.getSendtime();
		title="RE " + sms.getTitle();
		content=sms.getContent();
		fwSign=true;
	}
	catch(Exception e){
	}

%>
<form action="usersms.jsp" method=post name=messager>
  <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
    <tr> 
      <td> 
        <table cellpadding=3 cellspacing=1 border=0 width=100%>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> colspan=2 align=center> 
              <input type=hidden name="action" value="send">
              <font color="<%=tableFontColor%>"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=middle width=70><font color="<%=tableContentColor%>"><b>�ռ��ˣ�</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle><font color="<%=tableContentColor%>">
              <input type=text name="touser" value="<%=ParamUtil.getString(request,"touser","")%>" size=50>
              <SELECT name=font onchange=DoTitle(this.options[this.selectedIndex].value)>
              <OPTION selected value="">ѡ��</OPTION>
<%

	Vector friendList=FriendsManager.getFriendList(request);
	for(i=0;i<friendList.size();i++){
		Friend friend=(Friend)friendList.get(i);
%>
			  <OPTION value="<%=friend.getFriendFriend()%>"><%=friend.getFriendFriend()%></OPTION> 
<%
	}
%>
			  </SELECT>
			  &nbsp;ʹ�ö��ţ�,���ֿ������5λ�û�</font>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���⣺</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle><font color="<%=tableContentColor%>">
              <input type=text name="title" size=50 maxlength=80 value="<%=title%>">&nbsp;���޶�50����</font>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���ݣ�</b><br></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle>
              <textarea cols=70 rows=8 name="message" title="">

<%
	if(fwSign) {
%>
============= �� <%=sendtime%> ��������д���� ============
<%=content%>
========================================================<%}%></textarea>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> valign=middle colspan=2 align=center> 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<%
}
//ת����Ϣ
		else if(action.equals("fw")){


	SMSMSG sms=smsManager.getSMSMSG(request,"fw");

%>
<form action="usersms.jsp" method=post name=messager>
  <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
    <tr> 
      <td> 
        <table cellpadding=3 cellspacing=1 border=0 width=100%>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> colspan=2 align=center> 
              <input type=hidden name="action" value="send">
              <font color="<%=tableFontColor%>"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=middle width=70><font color="<%=tableContentColor%>"><b>�ռ��ˣ�</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle><font color="<%=tableContentColor%>">
              <input type=text name="touser" value="<%=ParamUtil.getString(request,"touser","")%>" size=50>&nbsp;ʹ�ö��ţ�,���ֿ������5λ�û�</font>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���⣺</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle><font color="<%=tableContentColor%>">
              <input type=text name="title" size=50 maxlength=80 value="Fw��<%=sms.getTitle()%>">&nbsp;���޶�50����</font>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���ݣ�</b><br></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle>
              <textarea cols=70 rows=8 name="message" title="">


========== ������ת����Ϣ =========
ԭ�����ˣ�<%=sms.getSender()%><%="\n\n"%>
<%=sms.getContent()%>
===================================</textarea>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> valign=middle colspan=2 align=center> 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<%
}
//'������Ϣ
		else if(action.equals("edit")){

	SMSMSG sms=smsManager.getSMSMSG(request,"edit");
%>
<form action="usersms.jsp" method=post name=messager>
  <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
    <tr> 
      <td> 
        <table cellpadding=3 cellspacing=1 border=0 width=100%>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> colspan=2 align=center> 
              <input type=hidden name="action" value="savedit"> 
              <input type=hidden name="id" value="<%=sms.getID()%>">
              <font color="<%=tableFontColor%>"><b>���Ͷ���Ϣ</b>--����������������Ϣ</font></td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=middle width=70><font color="<%=tableContentColor%>"><b>�ռ��ˣ�</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle>
              <input type=text name="touser" value="<%=sms.getIncept()%>" size=70>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���⣺</b></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle><font color="<%=tableContentColor%>">
              <input type=text name="title" size=70 maxlength=80 value="<%=sms.getTitle()%>">&nbsp;���޶�50����</font>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableBodyColor%> valign=top><font color="<%=tableContentColor%>"><b>���ݣ�</b><br></font></td>
            <td bgcolor=<%=tableBodyColor%> valign=middle>
              <textarea cols=70 rows=8 name="message" title=""><%=sms.getContent()%></textarea>
            </td>
          </tr>
          <tr> 
            <td bgcolor=<%=tableTitleColor%> valign=middle colspan=2 align=center> 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type=Submit value="����" name=Submit>
              &nbsp; 
              <input type="reset" name="Clear" value="���">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<%
}
			  
//'��ȡ��Ϣ
		else if(action.equals("savedit")){
			smsManager.saveSMS(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("������Ϣ�ɹ��������������ڷ��������У�"));
		}
		else if(action.equals("delete")){
			smsManager.delete(request);
			response.sendRedirect("usersms.jsp?action=success&msg="+java.net.URLEncoder.encode("ɾ����Ϣ�ɹ��������������ڷ��������У�"));
		}
		else if(action.equals("read")||action.equals("outread")){


	SMSMSG sms=smsManager.getSMSMSG(request,"read");
%>
<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
                
            <tr>
                <td bgcolor=<%=tableTitleColor%> align=center><font  color="<%=tableFontColor%>"><b>��ӭʹ�ö���Ϣ���գ�<%=userName%></b></font></td>
            </tr>
                <tr>
                    <td bgcolor=<%=aTableTitleColor%>><font color="<%=tableContentColor%>">
					<%if (action.equals("outread")) {%>
										��<b><%=sms.getSendtime()%></b>�������ʹ���Ϣ��<b><%=response.encodeURL(sms.getIncept())%></b>��
					<%}else{%>
								��<b><%=sms.getSendtime()%></b>��<b><%=response.encodeURL(sms.getSender())%></b>�������͵���Ϣ��
					<%}%></font></td>
                </tr>
                <tr>
                    <td bgcolor=<%=tableBodyColor%> valign=top align=left><font color=<%=tableContentColor%>>
                    <b>��Ϣ���⣺<%=response.encodeURL(sms.getTitle())%></b><hr size=1>
                    <%=(new MyFilter(sms.getContent()).getFilterString())%></font>
		    </td>
                </tr>
                </table></td></tr></table>
<%
				}
			else if(action.equals("success")){
			
			%>

    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>><font color="<%=tableFontColor%>">�ɹ�������Ϣ</font></td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><%=(new String(ParamUtil.getString(request,"msg","").getBytes("ISO-8859-1"),"GBK"))%></font>
      </td>
    </tr>
    </table>   </td></tr></table>
<%
			}
	else if(action.equals("newmsg")){
			%>


    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>><font color="<%=tableFontColor%>">����Ϣ֪ͨ</font></td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=<%=tableBodyColor%> align=center><br>
<a href=usersms.jsp?action=inbox><img src="<%=picURL%>newmail.gif" border=0>���µĶ���Ϣ</a><br>
                <br>
                <a href="usersms.jsp?action=inbox">���˲鿴</a><br><br>
      </td>
    </tr>
    </table>   </td></tr></table>
<%
	}
	else 
				throw new Exception("��������");
	
	}

	else
		throw new Exception("�����ȵ�½��");
}
catch(Exception e){
	e.printStackTrace();
	String errMsg=e.getMessage();
	%>
	<%@include file="INC/error.jsp"%>
	<%
}%>

<script language="JavaScript">
<!--
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
//-->
</script>
<%@ include file="foot.jsp"%>