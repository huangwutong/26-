<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.acai.util.*,
		 net.acai.forum.*,
		 net.acai.forum.util.*,
		 java.util.Vector"%>
<%@ include file="INC/const.jsp"%>

<%
	
	int perPage=ParamUtil.getInt(request,"perPage",10);
	int Page=ParamUtil.getInt(request,"Page",1);
	int startPage=((Page-1)/10)*10+1;
	int start=(Page-1)*perPage+1;
	int rootID=ParamUtil.getInt(request,"rootID",1);
	int announceID=ParamUtil.getInt(request,"announceID",1);
	stats="�鿴����";
	try{
		
		Forum  theForum=new Forum(forumID);
		
		Vector forumMSGs=theForum.getForumMSGs(forumID,rootID,announceID,start,perPage);
		
		ForumMSG topicMSG=(ForumMSG)forumMSGs.get(0);
		stats=theForum.getForumType()+" �����"+topicMSG.getTopic();
		SkinUtil.checkUserStats(request,response,stats);
%>

<%@ include file="INC/js.jsp"%>
<style>
	TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }
	TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px; color: #000000; }
</style>
<%@ include file="INC/theme.jsp"%>
<%
	
	
	
	
	
		
		int totalMSGNum=theForum.getForumMSGsNum();
		
	%>

<%	stats=" �����"+topicMSG.getTopic();
	out.println(headLine(theForum.getForumID(),forumName,forumLogo,theForum.getForumType(),2,stats));
	

	%>

<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
	<tr><td align=left width=* valign=middle>&nbsp; <a href=announce.jsp?forumID=<%=forumID%>> 
			<img src=pic/post.gif alt=����һ�������� border=0></a>&nbsp; <a href=vote.jsp?forumID=<%=forumID%>>
			<img src=pic/newpoll.gif alt=����һ����ͶƱ border=0></a>&nbsp;<a href=reannounce.jsp?forumID=<%=forumID%>&rootID=<%=rootID%>&parentID=<%=topicMSG.getRootID()%>> 
			<img src=pic/newreply1.gif alt=�ظ����� border=0></a>&nbsp;  </td>
			<td align=right width=""50%"" valign=middle>���Ǳ����ĵ� <B><%=topicMSG.getHits()%></B> ���Ķ���</td>			
			</tr></table>
<table cellpadding=0 cellspacing=0 border=0 width="95%" bgcolor=#FFFFFF align=center>
			<tr> <td height=1> </td></tr></table>

<table cellpadding=0 cellspacing=0 border=0 width="95%" bgcolor="<%=tableBackColor%>" align=center>
			<tr><td height=1> </td></tr></table>
<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center><tr>
			<td bgcolor="<%=tableBackColor%>" valign=middle width=1 height=24> </td>
			<td bgcolor="<%=tableTitleColor%>" colspan=2 align=left valign=middle width=*> 
			<table cellpadding=0 cellspacing=1 border=0 width="100%">
			<tr><td bgcolor="<%=tableTitleColor%>" align=left valign=middle width="65%"><font color="<%=tableFontColor%>">
            		&nbsp;<b>* ��������</B>�� <%=topicMSG.getTopic()%></font> </td><td width=""35%"" align=right>
			 <a href=# onclick="javascript:WebBrowser.ExecWB(4,1)"><img src=pic/saveas.gif border=0 width=16 height=16 alt=�����ҳΪ�ļ� align=absmiddle></a>&nbsp;<object id="WebBrowser" width=0 height=0 classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></object><a href=report.jsp?forumID="&forumID&"&rootID="&rootID&"&announceID="&announceid_1&"><img src=pic/report.gif alt=���汾�������� border=0></a>&nbsp; 
			<a href="printpage.jsp?forumID=<%=forumID%>&rootID=<%=rootID%>&announceID=<%=announceID%>"><img src=pic/printpage.gif alt=��ʾ�ɴ�ӡ�İ汾 border=0></a>&nbsp; 
			 <a href="usersms.jsp?action=new&forumID=<%=forumID%>&rootID=<%=rootID%>&announceID=<%=announceID%>">
			<img src=pic/pag.gif border=0 alt=�ѱ�������ʵ�></a>&nbsp; 
			<a href="favadd.jsp?forumID=<%=forumID%>&rootID=<%=rootID%>&announceID=<%=announceID%>">
			<IMG SRC=pic/fav_add.gif BORDER=0 alt=�ѱ���������̳�ղؼ�></a>&nbsp; 
			<a href="usersms.jsp?action=new&forumID=<%=forumID%>&rootID=<%=rootID%>&announceID=<%=announceID%>">
			<img src=pic/emailtofriend.gif border=0 alt=���ͱ�ҳ�������></a>&nbsp;
			<a href=#><span style="CURSOR: hand" onClick="window.external.AddFavorite('<%=forumURL%>dispbbs.jsp?forumID=<%=forumID%>&rootID=<%=rootID%>&announceID=<%=topicMSG.getAnnounceID()%>', ' <%=forumName%>- <%=topicMSG.getTopic()%>')"><IMG SRC=pic/fav_add1.gif BORDER=0 width=15 height=15 alt=�ѱ�������IE�ղؼ�></span></a>
			&nbsp;</td></tr>
			</table></td><td bgcolor="&tableBackColor&" valign=middle width=1 height=24> </td>
			</tr></table>
			<table cellpadding=0 cellspacing=0 border=0 width=""95%"" bgcolor="&tableBackColor&" align=center>
			<tr> <td height=1> </td></tr></table>
	<%
	
	for (i=0;i<forumMSGs.size();i++)
	{
		//if(i>=totalMSGNum)	break;
		ForumMSG theMSG=(ForumMSG)forumMSGs.get(i);
		User theUser=theMSG.getUser();
		String nameStyle="";
		if (theUser.getUserClass()==18)
			nameStyle="filter:glow(color=green,strength=2)";
		else if(theUser.getUserClass()==19)
			nameStyle="filter:glow(color=#660099,strength=2)";
		else if (theUser.getUserClass()==20)
			nameStyle="filter:glow(color=#FF3333,strength=2)";
		else
			nameStyle="filter:glow(color=#798AB7,strength=2)";
		String bgcolor=tableBodyColor;
		String abgcolor=aTableBodyColor;
%>
<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
		<tr><td bgcolor="<%=tableBackColor%>" valign=middle width=1 height=24> </td>
		<td bgcolor="<%=bgcolor%>">
		<table width="100%" cellpadding=4 cellspacing=0><tr>
        <td bgcolor="<%=bgcolor%>" valign=top width="20%" rowspan=2><img src="" width=0 height=4><BR><table width="100%" cellpadding=4 cellspacing=0 style="<%=nameStyle%>"><tr><td>
        &nbsp;<img src=<%=theUser.getFace()%>>  &nbsp;<a name="<%=theMSG.getAnnounceID()%>"><B><%=theUser.getUserName()%></B></a></td></tr></table>
	<%
	if ("1".equals(titleFlag)&&theUser.getTitle()!=null&&!"".equals(theUser.getTitle())){
		out.println("��ͷ�Σ�"+theUser.getTitle()+"<br>");
		
		
	}
	    out.println("<br>&nbsp;&nbsp;�ȼ���"+theUser.getUserClassStr()+"<BR>");
	
	/*if FromFlag=0 {
		if boardmaster or master {
		comefrom=address(ip)
		else
        	comefrom="����"
		end if
	else
		comefrom=address(ip)
        end if*/
	out.println("���Ʋ���<img src=pic/bar1.gif width=\""+(theUser.getUserWealth()*0.005+3)+"\" height=8 alt="+theUser.getUserWealth()+"><br>"+
							"�����飺<img src=pic/bar4.gif width="+(theUser.getUserEP()*0.005+3)+" height=8 alt="+theUser.getUserEP()+"><br>"+
							"��������<img src=pic/bar5.gif width="+(theUser.getUserCP()*0.005)+3+" height=8 alt="+theUser.getUserCP()+"><br>");
	out.println("&nbsp;&nbsp;ע�᣺"+Format.getStrDate(theUser.getAddDate()));
	out.println("<BR> &nbsp;&nbsp;���£�"+theUser.getArticle()+"  <br>&nbsp;&nbsp;������"+"����"+" <img src=\"\" width=0 height=4><BR>"+
			"</td><td bgcolor="+bgcolor+" width=1 height=100% rowspan=2>"+ 
            "<table width=1 height=\"100%\" cellpadding=0 cellspacing=0 bgcolor="+tableTitleColor+">"+
            "<tr><td width=1></td></tr></table></td>"+
			"<td bgcolor="+bgcolor+" valign=top width=* height=\"95%\"><img src=\"\" width=0 height=4><BR>"+
            "&nbsp; <a href=javascript:openScript('usersms.jsp?action=new&touser="+theUser.getUserName()+"',420,320)>"+
			"<img src=pic/message.gif border=0 alt=��"+theUser.getUserName()+"����һ������Ϣ></a>&nbsp;"+
            "<a href=javascript:openScript('dispuser.jsp?name="+theUser.getUserName()+"',350,300)>"+
			"<img src=pic/profile.gif border=0 alt=�鿴"+theUser.getUserName()+"�ĸ�������></a>&nbsp;"+
            "<a href=queryresult.jsp?sType=1&nSearch=3&keyword="+theUser.getUserName()+"&forumID="+forumID+"&SearchDate=ALL target=_blank><img src=pic/find.gif border=0 alt=\"����"+theUser.getUserName()+"��"+response.encodeURL(theForum.getForumType())+"����������\"></a>&nbsp; ");

	if (theUser.getUserEmail()!=null&&!"".equals(theUser.getUserEmail()))
		out.println("<A href='mailto:"+theUser.getUserEmail()+"'><IMG alt='������﷢�͵��ʸ�"+theUser.getUserName()+"' border=0 src='pic/email.gif'></A>&nbsp;"); 
   	if (!"".equals(theUser.getOicq()))
	out.println("<a href=http://search.tencent.com/cgi-bin/friend/user_show_info?ln="+theUser.getOicq()+" target=_blank title=\""+theUser.getUserName()+"["+theUser.getOicq()+"]��QQ���\"><img src=pic/oicq.gif width=16 height=16 border=0>OICQ</a>&nbsp;");
	
	if (theUser.getHomePage()!=null&&!"".equals(theUser.getHomePage()))
		out.println("<A href='"+theUser.getHomePage()+"' target=_blank><IMG alt='����"+theUser.getUserName()+"����ҳ'  border=0 src='pic/homepage.gif'></A>&nbsp; ");

	out.println("<a href=reannounce.jsp?forumID="+forumID+"&rootID="+rootID+"&parentID="+theMSG.getAnnounceID()+"&reply=true>"+
			"<img src=pic/reply.gif border=0 alt=���ûظ��������></a>&nbsp; "+
			"<a href=reannounce.jsp?forumID="+forumID+"&rootID="+rootID+"&parentID="+theMSG.getAnnounceID()+">"+
			"<img src=pic/reply_a.gif border=0 alt=�ظ��������></a>&nbsp; "+
            "<BR><hr width=\"100%\" size=1 color=#777777>"+
            "<table cellpadding=0 cellspacing=0 width=\"95%\" style=\"word-break:break-all\">"+
            "<tr><td width=32 align=left valign=top>");
	if (theMSG.getExpression()!=null&&!"".equals(theMSG.getExpression()))
		out.println("<img src='face/"+theMSG.getExpression()+"' border=0 alt=��������>");
	
	out.println("&nbsp;</td><td style=\"LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word\">"+
			"<font face=���� color=#333333>" );
	out.println("<b>"+theMSG.getTopic()+"</b><br>"+theMSG.getBody()); 

if (theMSG.getIsVote()&& theMSG.getAnnounceID()==theMSG.getRootID()){
	try{
	ForumVote theVote=theForum.getForumVote(theMSG.getAnnounceID());
	
	
	String [] votes=theVote.getVoteS();
	int [] voteNum=theVote.getVoteNumS();
	out.println("<table border=0 cellpadding=0 cellspacing=3 width=\"95%\" align=center><tr>");
	out.println("<td colSpan=2>����ΪͶƱ���ݣ�</td></tr>");
	out.println("<form action=postvote.jsp?forumID="+forumID+"&announceID="+rootID+"&action="+theVote.getVoteType()+" method=POST>");
	String voteString="";
	int voteSign=0;
	for(int voteI=0;voteI<votes.length;voteI++)
		if(!votes[voteI].trim().equals("")){
			if (theVote.getVoteType()==0)
				voteString+=(voteSign+1)+".  <input type=radio name=postVote value=\""+(voteSign)+"\">"+(votes[voteI].trim())+"<br>";
			else
				voteString+=(voteSign+1)+".  <input type=checkbox name=postVote_"+voteSign+" value=\""+voteSign+"\">"+votes[voteI].trim()+"<br>";
			voteSign++;
		}
	
	
	
	out.println("<tr><td width=\"60%\"><span style=\"LINE-HEIGHT: 200%;\">"+voteString+"</span></td>");
	voteString="";
	for(int voteI=0;voteI<voteNum.length;voteI++)
		voteString+="Ʊ����<font color=#990000><b>"+voteNum[voteI]+"</b></font><br>";
	
	out.println("<td width=\"40%\" valign=top><span style=\"LINE-HEIGHT: 200%;\">"+voteString+"</span></td></tr>");
	voteString="";
	if("".equals(userName))
		out.println("<tr><td colSpan=2><br><font color=#990000>����û�е�½�����ܽ���ͶƱ��</font></td>");
	else
	if (theVote.getUserSign(userName))
	out.println("<tr><td colSpan=2><br><font color=#990000>���Ѿ�Ͷ��Ʊ�ˣ��뿴����ɡ�</font></td>");
	else
	out.println("<tr><td colSpan=2><br><input type=submit name=Submit value='Ͷ Ʊ'></td>");
	
	out.println("</form>");
	out.println("</tr></table>");
	
	}
	catch(Exception e){
		e.printStackTrace();
		out.println(e.getMessage());
	}
}


	if (theMSG.getSignFlag())
	if (!"".equals(theUser.getSign()))
		out.println("<p><div align='right'>----------------------------------------------<br><font color=red>"+theUser.getSign()+"</font></div>");
	out.println("</font> </td><td width=16> </td></tr></table></td></tr><tr>"+ 
			"<td class=bottomline bgcolor="+bgcolor+" valign=bottom> "+
            "<hr width=100% size=1 color=#777777>"+
            "<table width=100% cellpadding=0 cellspacing=0><tr><td align=left valign=bottom> ");
	if (theUser.getUserName().equals(userName)||forumMaster||master)
			out.println("&nbsp; <a href=editannounce.jsp?forumID="+forumID+"&rootID="+rootID+"&announceID="+theMSG.getAnnounceID()+"><img src=pic/edit.gif border=0 alt=�༭�������></a>");
	out.println("</td><td align=left valign=bottom> ����ʱ�䣺 "+theMSG.getDateAndTime()+" </td>"+
			"<td align=left valign=bottom> <img src=pic/ip.gif border=0 width=13 height=15 alt=\"\">  "); 
	if (("0").equals(ipFlag)) {
		if (forumMaster||master) {
		out.println(theMSG.getUserIP());
		}
		else{
        	out.println("������Ϊ���ܣ�");
		
		}
	}
	else
		out.println("������Ϊ���ܣ�");
		
        
	out.println("</td><td align=right nowarp valign=bottom width=110>");
	if ((forumMaster&&theForum.getForumMaster().indexOf(userName)>-1)||master){
		if (theMSG.getAnnounceID()!=rootID)				
		out.println("<a href=admin_postings.jsp?action=delmsg&forumID="+forumID+"&announceID="+theMSG.getAnnounceID()+"&rootID="+rootID+"&username="+userName+" title=ע�⣺��������ɾ���������ӣ����ָܻ�><img src=pic/delete.gif border=0></a> ");
		
		out.println("<a href=admin_postings.jsp?action=copy&forumID="+forumID+"&announceID="+theMSG.getAnnounceID()+"&rootID="+rootID+" title=���Ƶ������ӵ���İ���><img src=pic/copy.gif border=0></a>  ");
		if (!theMSG.getIsBest())
			out.println("<a href=admin_postings.jsp?action=isbest&forumID="+forumID+"&announceID="+theMSG.getAnnounceID()+"&rootID="+rootID+" title=���������Ӽ��뾫��><img src=pic/jing.gif border=0></a>" );
		else
			out.println("<a href=admin_postings.jsp?action=nobest&forumID="+forumID+"&announceID="+theMSG.getAnnounceID()+"&rootID="+rootID+" title=��������Ӿ���״̬><img src=pic/jing.gif border=0></a>" );
	}	out.println("</td><td align=right valign=bottom width=4> </td></tr></table>"+
			"<img src=\"\" width=0 height=4><BR></td></tr></table></td>"+
			"<td bgcolor="+tableBackColor+" valign=middle width=1 height=24> </td></tr></table>");
		out.println("<table cellpadding=0 cellspacing=0 border=0 width=\"95%\" bgcolor="+tableBackColor+" align=center>"+
			"<tr><td height=1> </td></tr></table>");
			
	 }
	 
  	int n;
  	if(totalMSGNum%perPage==0)
     		n= totalMSGNum/perPage;
  	else
     		n= totalMSGNum/perPage+1;
  	
	out.println("<table border=0 cellpadding=0 cellspacing=3 width=\"95%\" align=center>"+
			"<tr><td valign=middle nowrap>"+
			"<span class=smallFont>ҳ�Σ�<strong>"+Page+"</strong>/<strong>"+n+"</strong>ҳ"+
			"ÿҳ<strong>"+perPage+"</strong> ����������<strong>"+totalMSGNum+"</strong></td>"+
			"<td valign=middle nowrap><div align=right><p>��ҳ�� ");
			
	   for (int p=1;p<n+1;p++) 
	       	if (p==Page)
	       	  	out.println("<font color=gray>[<b>"+p+"</b>]</font> ");
			else
			out.println("<a href='dispbbs.jsp?forumID="+forumID+"&rootID="+rootID+"&announceID="+topicMSG.getAnnounceID()+"&Page="+p+"&skin="+1+"'>[<b>"+p+"</b>]</a>   ");
	
	out.println("</p></div></td></tr></table>");
%>
<table cellpadding=0 cellspacing=0 border=0 width="95%" align=center>
	<tr bgcolor=<%=tableTitleColor%>><td align=left width=90% valign=middle> <font color=<%=tableFontColor%>>&nbsp;<b>*���ٻظ�</b>��<%=topicMSG.getTopic()%></font></td>
			<td width=10% align=right valign=middle height=24> <a href=#top><img src=pic/gotop.gif border=0><font color=<%=tableFontColor%>>����</font></a>&nbsp;</td></tr></table>

<TABLE cellSpacing=1 cellPadding=1 width=95% border=0 align=center>
			<TBODY> <TR bgColor=<%=tableBackColor%>><TD vAlign=top colSpan=3> 
			<TABLE cellSpacing=0 cellPadding=3 width=100% bgColor=<%=tableTitleColor%> border=0>
			<form action=SaveReAnnounce.jsp?method=fastreply&forumID=<%=forumID%> method=POST  name=frmAnnounce onSubmit=submitonce(this)>
			<input type=hidden name=parentID value=<%=topicMSG.getAnnounceID()%>>
			<input type=hidden name=rootID value=<%=rootID%>>
			<INPUT TYPE=hidden name=forumType value=<%=theForum.getForumType()%>>
			<TBODY><TR bgColor=<%=tableBodyColor%>><TD noWrap width=175>����û���:</TD>
            <TD><INPUT maxLength=25 size=15 value="<%=userName%>" name="userName">
            &nbsp;&nbsp; <A href=reg.jsp>��ûע��?</A> ����: 
            <INPUT type=password maxLength=13 size=15 value="<%=userPassword%>" name="userPassword">
            &nbsp;&nbsp; <A href=lostpass.jsp>��������?</A> </TD></TR>
			<TR bgColor=<%=aTableBodyColor%>> <TD vAlign=top noWrap><b>����</b><br>
            <li>HTML��ǩ�� 
	<%if(!theForum.getStrAllowHTML())
		out.println("������"); 
	else
		out.println("����"); 

	out.println("<li>UBB��ǩ��"); 
	if(!theForum.getStrAllowForumCode())
		out.println("������ ");
	else
		out.println("����");
	
	out.println("<li>��ͼ��ǩ�� ");
	if (!theForum.getStrIcons())
		out.println("������");
	else
		out.println("����");
	
	out.println("<li>Flash��ǩ��");
	if (!theForum.getStrFlash())
		out.println("������");
	else
		out.println("����");
	
	out.println("<li>�����ַ�ת����");
	if (!theForum.getStrIMGInPosts())
		out.println("������");
	else
		out.println("����");
	
	out.println("<li>�ϴ�ͼƬ��");
	if ("0".equals(uploadPic))
		out.println("������");
	else
		out.println("����");
%>	
<li>���"<%=Integer.parseInt(announceMaxBytes)/1024%>"KB </TD><TD> 
			<TEXTAREA name=content cols=80 rows=6 wrap=VIRTUAL title=����ʹ��Ctrl+Enterֱ���ύ����  onkeydown=ctlent()></TEXTAREA>
            </TD></TR><TR bgColor=<%=tableBodyColor%>><TD noWrap> 
			<INPUT type=checkbox value=0 name=emailFlag>
            �ʼ��ظ� <INPUT type=checkbox CHECKED value=1 name=signFlag>
            ��ʾǩ�� </TD><TD width="100%"> 
            <input type=Submit value=OK!�����ҵĻ�Ӧ���� name=Submit>
            &nbsp;<input type=reset name=Clear value=������ݣ�>
            [<font color=&alertFontColor&>Ctrl+Enterֱ���ύ����</font>] </TD>
			</TR></FORM></TBODY></TABLE></TD></TR> </TBODY> </TABLE>

<%
	
if ((forumMaster&&theForum.getForumMaster().indexOf(userName)>-1)||master)  {
		out.println( "<TABLE cellSpacing=0 cellPadding=0 width=\""+tableWidth+"\" border=0 align=center>"+
				"<tr valign=center> <td width =100% align=right><font color="+bodyFontColor+"> ");
				if(!topicMSG.getLockTopic()){
					out.println("<a href=admin_postings.jsp?action=lock&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+" title=����������><font color="+bodyFontColor+">����</font></a> ");
				}
				else{
					out.println("<a href=admin_postings.jsp?action=unlock&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+" title=��������⿪����><font color="+bodyFontColor+">����</font></a>");
				}
				out.println("  | <a href=admin_postings.jsp?action=deltopic&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+"&username="+response.encodeURL(topicMSG.getUserName())+" title=ע�⣺��������ɾ���������������ӣ����ָܻ�><font color="+bodyFontColor+">ɾ��</font></a>"+ 
				"  | <a href=admin_postings.jsp?action=move&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+" title=�ƶ�����><font color="+bodyFontColor+">�ƶ�</font></a>  |  ");
				
	if (!topicMSG.getIsTop()) {
		out.println( "<a href=admin_postings.jsp?action=top&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+" title=��������̶�><font color="+bodyFontColor+">�̶�</font></a>");
	}
	else{
		out.println( "<a href=admin_postings.jsp?action=untop&forumID="+theForum.getForumID()+"&announceID="+topicMSG.getAnnounceID()+"&rootID="+topicMSG.getRootID()+" title=��������̶�״̬���><font color="+bodyFontColor+">���</font></a>");
	}
	out.println( "  | <a href=\"admin_boardaset.jsp?forumID="+theForum.getForumID()+"\"><font color="+bodyFontColor+">��������</font></a>  | <a href=\"admin_alldel.jsp?forumID="+theForum.getForumID()+"&action=delall\"><font color="+bodyFontColor+">����ɾ��</font></a>");
	out.println( "</font></td></tr></table>");
}

%>
<%	
	}
	catch(Exception e){
	e.printStackTrace();
	//out.println("��������!");
	}

%>

<script language=javascript>
<!--
ie = (document.all)? true:false
if (ie){
function ctlent(eventobject){if(event.ctrlKey && window.event.keyCode==13){this.document.frmAnnounce.submit();}}
}
//-->
</script>
<%@ include file="foot.jsp"%>