<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.acai.util.*,
		 net.acai.forum.*,
		 net.acai.forum.util.*,
		 java.util.Vector"%>
<%@ include file="INC/const.jsp"%>
<%
	
	int perPage=ParamUtil.getInt(request,"perPage",25);
	int Page=ParamUtil.getInt(request,"Page",1);
	int startPage=((Page-1)/10)*10+1;
	int start=(Page-1)*perPage+1;
	try{
		Forum theForum=ForumFactory.getForum(request,response,session,forumID);
		stats=theForum.getForumType();
		
	%>
<%@ include file="INC/theme.jsp"%>
<script language=javascript src="INC/list.js"></script>


<%	out.println(headLine(forumID,forumName,forumLogo,theForum.getForumType(),1,stats));
	%>
<TABLE cellSpacing=0 cellPadding=0 width=95% border=0 align=center>
<TBODY><tr>
	<td align=center width=34 valign=middle> <img src='pic/gb.gif' border=0 alt=������̳�Ĺ��棡���ɲ������� width=20 height=17> 

	</td>
	<td valign=middle align=left>
	<%
	try{
		ForumNews forumNews=ForumNewsManager.getForumNews(forumID);
		out.println("<b><a href=announcements.jsp?forumID="+forumID+" target=_blank><ACRONYM TITLE="+forumNews.getTitle()+">"+forumNews.getTitle()+"</ACRONYM></a></b> ("+forumNews.getAddTime()+")" );
	}
	catch(ForumNewsNotFoundException e){
		out.println("<b><a href=announcements.jsp?forumID="+forumID+" target=_blank><ACRONYM TITLE=��ǰû�й���>��ǰû�й���</ACRONYM></a></b>("+NDate+")");
	}
	%>

	</td>
	<td align=right valign=middle><p>
		<form action=list.jsp method=get>
		<input type=hidden name=forumID value=<%=forumID%>>
		<select name=selTimeLimit onchange='javascript:submit()'>
			<option value=all>�鿴���е�����
			<option value=1>�鿴һ���ڵ�����
			<option value=2>�鿴�����ڵ�����
			<option value=7>�鿴һ�����ڵ�����
			<option value=15>�鿴������ڵ�����
			<option value=30>�鿴һ�����ڵ�����
			<option value=60>�鿴�������ڵ�����
			<option value=180>�鿴�����ڵ�����
		</select>
		</form></p></td></tr></TBODY></TABLE>
<table cellspacing=0 border=0 width=95% bgcolor="<%=tableBackColor%>" align=center>
	<tr><td height=1></td></tr></table>
<TABLE border=1 cellpadding=0 cellspacing=0 width=95% align=center bordercolor=<%=tableBackColor%>>
  <TBODY><TR>
  	<TD height=27 width="95%" bgColor=<%=tableTitleColor%>><font color=<%=tableFontColor%>>Ŀǰ��̳������<b><%=ForumFactory.getOLUsersNum()%></b>�ˣ�����<%=theForum.getForumType()%>�Ϲ��� <b><%=theForum.getForumOLMemberUsersNum()%></b> λ��Ա�� <b><%=theForum.getForumOLGuestUsersNum()%></b> λ����.�������� <font color="<%=alertFontColor%>"><b><%=theForum.getTodayNum()%></b></font>
<%

if(!"online".equals(ParamUtil.getString(request,"action")))
	out.println( "[<a href=list.jsp?action=online&forumID="+forumID+"><font color="+tableFontColor+">�ر���ϸ�б�</font></a>]");
else
	out.println( "[<a href=list.jsp?forumID="+forumID+"><font color="+tableFontColor+">��ʾ��ϸ�б�</font></a>]");


out.println( "&nbsp;[<a href=online.jsp?forumID="+forumID+"><font color="+tableFontColor+">�����û�</font></a>]</TD><TD bgColor="+tableTitleColor+" width=\"5%\" align=center><a href='list.jsp?forumID="+ forumID+"&Page=1&skin="+ParamUtil.getString(request,"skin","")+"'>"+
				"<img src='pic/refresh_1.gif' border=0 alt='ˢ��'></a></TD></TR>");

if (!"online".equals(ParamUtil.getString(request,"action"))){
out.println( "<tr><td colspan=2 bgcolor="+tableBodyColor+"><table cellpadding=6 cellspacing=1 border=0 width=\"100%\" style=\"word-break:break-all;\">");
		Vector OLUsers=ForumFactory.getOLUsers("member");
		for(i=0;i<OLUsers.size();i++){
			OLUser theUser=(OLUser)OLUsers.get(i);
			
			if(theUser.getStats().indexOf(theForum.getForumType())<0)
				continue;
			
			if(i%7==0) 
				out.println("<tr><td width=\"14%\">");
			else
				out.println("<td width=\"14%\">");
	
			
			if (theUser.getUserClass().equals("�ܰ���"))
				out.println( "<img src="+picURL+picOM+" alt=��̳�� width=12 height=11>&nbsp;");
			else if (theUser.getUserClass().equals("����"))
				out.println( "<img src="+picURL+picOB+" alt=���� width=12 height=11>&nbsp;");
			else if (theUser.getUserClass().equals("���"))
				out.println( "<img src="+picURL+picOV+" alt=��� width=12 height=11>&nbsp;");
			else
				out.println( "<img src="+picURL+picOH+" width=12 height=11>&nbsp;");
			out.println( "<a href=dispuser.jsp?name="+response.encodeURL(theUser.getUserName())+" target=_blank>");
	out.println( "<ACRONYM TITLE=\"Ŀǰλ�ã�"+response.encodeURL(theUser.getStats())+"<br>����ʱ�䣺"+theUser.getStartTime()+"<br>�ʱ�䣺"+theUser.getLastTimeBK()+"<br>"+theUser.getUserSystem()+"<br>"+theUser.getUserBrowser());
	out.println( "<br>��ʵ�ɣУ�");
    if(("0").equals(ipFlag)){
		if (forumMaster || master) {
			if (theUser.getUserIP()!=null)
			out.println(theUser.getUserIP());
		}
        else
		out.println( "�����ñ���");
	}	
	else
		if (theUser.getUserIP()!=null)
			out.println(theUser.getUserIP());
    out.println( "<br>��Դ������");
	if (fromFlag.equals("0")){
		if (forumMaster || master){ 
			if (theUser.getComeFrom()!=null)
			out.println(theUser.getComeFrom());
		}
        else
		out.println( "�����ñ���");
	}
	else
		if (theUser.getComeFrom()!=null)
			out.println(theUser.getComeFrom());
	out.println( "\">");
	out.println(response.encodeURL(theUser.getUserName()));
	
	out.println( "</ACRONYM></a>&nbsp;");
	
	out.println( "</td>");
	if(i%7==0)  out.println( "</tr>");
	


		}

out.println( "</TABLE></tr>");
}
out.println( "</TBODY></TABLE>");

out.println( "<br><table cellpadding=0 cellspacing=0 border=0 width=95% align=center><tr>"+
			"<td align=center width=2 valign=middle> </td>"+
			"<td align=left valign=middle> <a href='announce.jsp?forumID="+ forumID +"'>"+
			"<img src='pic/post.gif' border=0 alt='������'></a>"+
			"&nbsp;&nbsp;<a href='vote.jsp?forumID="+forumID+"'>"+
			"<img src='pic/newpoll.gif' border=0 alt='������ͶƱ'></a></td>"+
			"<td align=right> ");
			if ((forumMaster&&theForum.getForumMaster().indexOf(userName)>-1)||master)			
			out.println( "�� <b><a href='admin_boardaset.jsp?forumID="+ forumID +"'>�������</a>");
						
out.println( "<b><a href='list.jsp?forumID="+forumID +"'>��̳�����б�</a>�� "+
			"��̳����</b>��");
					String masterName=theForum.getForumMaster();
					if(masterName==null||"".equals(masterName))
						out.println("��ȱ");
					else{
					String [] masterNames=theForum.getForumMaster().split("\\|");
					
					 masterName="";
					
					
					for(int k=0;k<masterNames.length;k++)
					{
						masterName=masterName+"<a href=\"javascript:openScript('dispuser.jsp?name="+masterNames[k]+"',350,300)\">"+masterNames[k]+"</a><br>" ;
						if(k>2){
							masterName=masterName + "<font color=#000066>More...</font>";
							break;
						}
					}
					out.println(masterName);
					}
					out.println("</td></tr></table>");
	try{
		Vector forumTopics=theForum.getForumBestTopics(forumID,start,perPage);

%>	
<table cellspacing=0 border=0 width=95% bgcolor="<%=tableBackColor%>" align=center><tr><td height=1></td></tr></table>
				<TABLE style=color:"&tableFontColor&"  border=1 cellPadding=0 cellSpacing=0 width=95% align=center bordercolor="<%=tableBackColor%>">
  				<TBODY>
				<TR align=middle>
				<TD height=27 width=32 bgColor="<%=tableTitleColor%>"><font color="<%=tableFontColor%>">״̬</TD> 
				<TD bgColor="<%=tableTitleColor%>" width=*><font color="<%=tableFontColor%>">�� ��  (��<img src=pic/plus.gif>����չ�������б�)</TD>
				<TD bgColor="<%=tableTitleColor%>" width=80><font color="<%=tableFontColor%>">�� ��</TD>
				<TD bgColor="<%=tableTitleColor%>" width=64><font color="<%=tableFontColor%>">�ظ�/����</TD>
				<TD bgColor="<%=tableTitleColor%>" width=195><font color="<%=tableFontColor%>">������ | �ظ���</TD>
				</TR> 
				</TBODY></TABLE>
		<%
		for( i=0;i<forumTopics.size();i++){
			ForumTopic forumTopic=(ForumTopic)forumTopics.get(i);
		%>

<TABLE style=color:"<%=tableContentColor%>" border=1 cellPadding=0 cellSpacing=0 width=95% align=center bordercolor="<%=tableBackColor%>">
				<TBODY><TR align=middle>
				<TD bgColor="<%=aTableBodyColor%>" width=32 height=27>

<%
if(!forumTopic.getLockTopic()&&!forumTopic.getIsTop()&&!forumTopic.getIsVote()&&!forumTopic.getIsBest()&&!(forumTopic.getChildNum()>10))
	out.println( "<img src=\"pic//folder.gif\" alt=��������>");
else if(forumTopic.getIsVote())
	out.println("<img src=\"pic//closedb.gif\" alt=ͶƱ����>");
else if(forumTopic.getIsTop())
	out.println("<img src=\"pic//istop.gif\" alt=�̶�����>");
else if(forumTopic.getIsBest())
	out.println("<img src=\"pic//isbest.gif\" alt=��������>");
else if(forumTopic.getChildNum()>10)
	out.println("<img src=\"pic//hotfolder.gif\" alt=��������>");
else if(forumTopic.getLockTopic())
	out.println("<img src=\"pic//lockfolder.gif\" alt=������������>");
else
	out.println("<img src=\"pic//folder.gif\" alt=��������>");

%>
	</TD>
	<TD align=left bgcolor="<%=tableBodyColor%>" width=* onmouseover=javascript:this.bgColor='<%=aTableBodyColor%>' onmouseout=javascript:this.bgColor='<%=tableBodyColor%>'>
<%
if (forumTopic.getChildNum()==0)
	out.println("<img src='"+picURL +"nofollow.gif' id='followImg"+forumTopic.getRootID()+"'>");
else
	out.println("<img loaded=no src='"+picURL +"plus.gif' id='followImg"+forumTopic.getRootID()+"'   style='cursor:hand;'  onclick='loadThreadFollow("+forumTopic.getRootID()+","+forumTopic.getAnnounceID()+","+forumID+")' title=չ�������б�>");
	

	
out.println("<a href=\"dispbbs.jsp?forumID="+forumID+"&rootID="+forumTopic.getRootID()+"&announceID="+forumTopic.getAnnounceID()+"\" title=\"��"+ forumTopic.getNoFilterTopic()+"��<br>���ߣ�"+forumTopic.getUserName()+"<br>������"+forumTopic.getDateAndTime()+"<br>��������"+response.encodeURL(forumTopic.getFollowMSG())+"...\">");
out.println(forumTopic.getNoFilterTopic());
out.println("</a>");

%>	</TD>
	<TD bgColor="<%=aTableBodyColor%>" width=80><a href=javascript:openUser('<%=forumTopic.getUserName()%>')><%=forumTopic.getUserName()%></a></TD>
	<TD bgColor="<%=tableBodyColor%>" width=64>
	<font color="<%=tableContentColor%>"><%=forumTopic.getChildNum()%>/<%=forumTopic.getHits()%></font>
	</TD>
	<TD align=left bgColor="<%=aTableBodyColor%>" width=195>
	&nbsp;<a href=dispbbs.jsp?forumID=<%=forumID%>&rootID=<%=forumTopic.getRootID()%>&id=<%=forumTopic.getTimes()%>>
						<%=forumTopic.getFollowDateAndTime()%>
						</a>&nbsp;<font color=#990000>|</font>&nbsp;
		
		<a href=javascript:openUser('<%=forumTopic.getFollowUser()%>')><%=forumTopic.getFollowUser()%></a>

	</TD></TR>
	<tr style=display:none id='follow<%=forumTopic.getAnnounceID()%>'><td colspan=5 id='followTd<%=forumTopic.getAnnounceID()%>' style=padding:0px><div style='width:240px;margin-left:18px;border:1px solid black;background-color:lightyellow;color:black;padding:2px' onclick=loadThreadFollow(<%=forumTopic.getAnnounceID()%>)>���ڶ�ȡ���ڱ�����ĸ��������Ժ��</div></td></tr>
</TBODY></TABLE>
<%

		}
	}
	catch(ForumTopicNotFoundException e)
	{
	e.printStackTrace();
	out.println("û������!");
	}
	int forumTopicNum=theForum.getForumTopicNum();
	int totalPage=forumTopicNum/perPage+1;
	%>
<table border=0 cellpadding=0 cellspacing=3 width=95% align=center >
	<form method=post action=list.jsp name=frmList2 >
		<input type=hidden name=selTimeLimit value="">
	<tr>
		<td valign=middle><span class=smallFont >ҳ�Σ�<strong><%=Page%></strong>/<strong><%=totalPage%></strong>ҳ ÿҳ<strong><%=perPage%></strong> ������<strong><%=forumTopicNum%></strong></td><td valign=middle><div align=right ><p>��ҳ��
	<%
	if (startPage>10) 
	out.println("<a href='list.jsp?forumID="+forumID+"&Page="+(startPage-1)+"' >[<<]</a>");
	
	for(i=startPage;i<startPage+10;i++){
		if (i==Page)
		   	out.println("<font color=gray>["+i+"]</font> ");
	  	else
	      		out.println("<a href='list.jsp?forumID="+forumID+"&Page="+i+"' >["+i+"]</a>   ");
		   
		if(i==totalPage) break;
	}
	if(i<totalPage)
		out.println("<a href='list.jsp?forumID="+forumID+"&Page="+i+"'>[>>]</a>   ");

		out.println("<span class=smallFont >ת��:<input type=text name=Page size=3 maxlength=10  value='"+ Page+"'><input type='submit' value=Go   id=button1 name=button1 ></span></p>"+     
					"</div></td></tr>"+
					"<input type=hidden name=forumID value='"+ forumID +"'>"+
					"</form></table>");

%>


<table border=0 cellpadding=0 cellspacing=3 width=95% align=center>
			<tr>
			<td valign=middle nowrap> <div align=right>
			<select  onchange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}">
			<option value=''>��̳��ת��...</option>
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
						out.println("<option value=\"list.jsp?forumID="+theListForum.getForumID()+"\">����"+theListForum.getForumType()+"</option>");
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
			

	
	</select><div></td></tr></form></table>



<table cellspacing=0 cellpadding=0 width=95% align=center bgcolor="<%=tableBackColor%>" border=0>
				<tr><td><table cellspacing=1 cellpadding=3 width=100% border=0><tr bgcolor="<%=tableTitleColor%>">
				<td width=80% ><font color="<%=tableFontColor%>"><b>��-=> <%=forumName%>ͼ��</b></font></td>
				<td noWrap width=20% align=right><font color="<%=tableFontColor%>">����ʱ���Ϊ - ����ʱ�� &nbsp;</td>
				</tr><tr><td colspan=3 bgcolor="<%= tableBodyColor%>">
				<table cellspacing=4 cellpadding=0 width=92% border=0 align=center>
				<tr><td><img src=pic/folder.gif> ���ŵ�����</td>
				<td><img src=pic/hotfolder.gif> �ظ�����10��</td>
				<td><img src=pic/lockfolder.gif> ����������</td>
				<td><img src=pic/istop.gif> �̶����˵����� </td>
				<td> <img src=pic/isbest.gif> �������� </td>
				</tr><tr><td width=100% colspan=5>
<%
if (theForum.getStrAllowHTML())
	out.println( "HTML��ǩ��<font color=#990000>OFF</font>.");
else
	out.println( "HTML��ǩ��<font color=#003399>ON</font>.");


if (theForum.getStrAllowForumCode())
	out.println( " UBB��ǩ��<font color=#990000>ON</font>.");
else
	out.println( " UBB��ǩ��<font color=#003399>OFF</font>.");


if (theForum.getStrIcons())
	out.println( " ��ͼ��ǩ��<font color=#990000>OFF</font>.");
else
	out.println( " ��ͼ��ǩ��<font color=#003399>ON</font>.");


if (theForum.getStrFlash())
	out.println( " Flash��ǩ��<font color=#990000>OFF</font>.");
else
	out.println( " Flash��ǩ��<font color=#003399>ON</font>.");


if (theForum.getStrIMGInPosts())
	out.println( " �����ַ�ת����<font color=#990000>OFF</font>.");
else
	out.println( " �����ַ�ת����<font color=#003399>ON</font>.");


if ("1".equals(uploadFlag)) 
	out.println( " ͷ���ϴ���<font color=#990000>OFF</font>.");
else
	out.println( " ͷ���ϴ���<font color=#003399>ON</font>.");


if (!"1".equals(titleFlag))
	out.println( " �û�ͷ�Σ�<font color=#990000>OFF</font>.");
else
	out.println( " �û�ͷ�Σ�<font color=#003399>ON</font>.");

%>
</td></tr></table></td></tr></table></td></tr></table><BR>
	

<% 	}
	catch(ForumNotFoundException e){
		e.printStackTrace();
	}
%>
<%@ include file="foot.jsp"%>
<iframe width=0 height=0 src="" id="hiddenframe"></iframe>
