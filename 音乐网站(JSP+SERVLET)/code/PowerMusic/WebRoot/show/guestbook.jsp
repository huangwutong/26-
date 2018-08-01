<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
<%@ page import="java.io.*"%>
<%@ page import="model.MessageModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageGuestBook"%>
<jsp:useBean id="showmsg" class="control.bean.ManageGuestBook" scope="page"></jsp:useBean>
<jsp:useBean id="gmodel" class="model.MessageModel" scope="page"></jsp:useBean>
<!--顶部结束!-->

<%!
	int showstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector msgvector;
%>
<%--计算页数 --%>
<%
 	totalcount = showmsg.getTotalrow();
  	totalpages = totalcount/countperpage;
  	if(totalpages%countperpage>0||totalcount<countperpage){
   		totalpages+=1;
 	}
 	if(request.getParameter("page")==null){
		currentpage=1;
	}else{
		currentpage=Integer.parseInt(request.getParameter("page"));
		if(currentpage>totalpages)
			currentpage=totalpages;
		if(currentpage<1)
		currentpage=1;
	}//将第n页的提取出来
	msgvector = showmsg.displayQuery(10,currentpage,"* from MessageInfo order by MessageID","MessageID");
%>
<%
	if(request.getParameter("action")!=null||request.getParameter("state")!=null)
		showstate=1;
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.msgpage.page.value=="")
		{
			alert("请输入页数");
			document.msgpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%
	String addmessage = request.getParameter("action");
	if("add".equals(addmessage)){
		String addausername = (String)session.getAttribute("username");
		String addmessagetitle = request.getParameter("addmessagetitle");
		String addmessagearea = request.getParameter("addmessagearea");
		int rowaffect = showmsg.addMessage(addmessagetitle,addausername,addmessagearea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("添加成功");
			window.location = "guestbook.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("添加失败");
		window.location = "guestbook.jsp";
	</script><%}}%>

<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
   <TBODY>
     <TR>
		<TD width=3 background=images/bian.gif></TD>
		<TD>
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
				   <TD width=6 background=images/left-shu.gif rowSpan=3></TD>
				   
              <TD background=images/hen.gif height=16></TD>
				   <TD width=6 background=images/right-shu.gif rowSpan=3></TD>
				</TR>
			    <TR>
			       
              <TD height="233"> 
                <TABLE width="100%" height="480" 
					border=0 cellPadding=0 cellSpacing=0 bgColor=#42748d>
                  <TBODY>
                    <TR vAlign=top> 
                      <TD height="40" bgcolor="#3300cc">
									<p>&nbsp;</p>
									<p><a href="<%=request.getContextPath()%>/index.jsp">
									<FONT color="#ffffff">动力音乐<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">查看留言</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
					<table width="40%" height="23" border="0" align="center">
                       <tr> 
                          <td width="25%"><a href="<%=request.getContextPath()%>/PostFile?action=open">上传文件</a></td>
                          <td width="25%"><a href="<%=request.getContextPath()%>/show/music.jsp">歌曲列表</a></td>
                          <td width="25%"><a href="<%=request.getContextPath()%>/show/news.jsp">新闻列表</a></td>
                          <td width="25%"><a href="<%=request.getContextPath()%>/show/guestbook.jsp?state=1">添加留言</a></td>
                       </tr>
                    </table>
                    <% if(showstate==0){%>
					<table width="450" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff" align="center">
						  <tr bgcolor="#cccccc">
							<td width="32%" align="center" nowrap><b>标题</b></td>
							<td align="center" nowrap width="34%"><b>创建日期</b></td>
							<td align="center" nowrap width="34%"><b>发布人</b></td>
						  </tr>
						  <% 
						  	for(int i=0;i<msgvector.size();i++){
						  		gmodel.setMessageID(((MessageModel)msgvector.get(i)).getMessageID());
						    	gmodel.setMessageTitle(((MessageModel)msgvector.get(i)).getMessageTitle());
						    	gmodel.setPromulgator(((MessageModel)msgvector.get(i)).getPromulgator());
						    	gmodel.setSubmitime(((MessageModel)msgvector.get(i)).getSubmitime());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="32%">
						       <a href="guestbook.jsp?action=show&msgid=<%=gmodel.getMessageID()%>&position=<%=i%>">
						       <%=gmodel.getMessageTitle()%></a></td>
						       <td width="34%" align="center" nowrap><%=gmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="34%"><%=gmodel.getPromulgator()%></td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="msgpage" method="post" onSubmit="return page_check();"action="guestbook.jsp">
						<TABLE width="36%" align=right>
						<tr>
						<td >共有<%out.print(totalpages);%>页,现在是第<%out.print(currentpage);%>页</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/show/guestbook.jsp?page=<%=currentpage-1%>">上一页</a>
						<a href="<%=request.getContextPath()%>/show/guestbook.jsp?page=<%=currentpage+1%>">下一页 </a>
						<a href="<%=request.getContextPath()%>/show/guestbook.jsp?page=1">首页 </a>
						<a href="<%=request.getContextPath()%>/show/guestbook.jsp?page=<%=totalpages%>">尾页 </a>
						<input name="page" type="text" size="5">页<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						<%}else{%>
						<%--显示待查看的新闻资料 --%>
                        <%	
     						String show = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("msgid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							 position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("show".equals(show)){
     							gmodel.setMessageID(((MessageModel)msgvector.get(position)).getMessageID());
						    	gmodel.setMessageTitle(((MessageModel)msgvector.get(position)).getMessageTitle());
						    	gmodel.setPromulgator(((MessageModel)msgvector.get(position)).getPromulgator());
						    	gmodel.setSubmitime(((MessageModel)msgvector.get(position)).getSubmitime());
						    	gmodel.setMessageContent(((MessageModel)msgvector.get(position)).getMessageContent());
     					%>
     					
     					 <table width="550" height="175" border="0" align=center>
                            <tr align="center"> 
                              <td colspan="3"><font color="#990066"><b>标题 : <%=gmodel.getMessageTitle()%></b></font></td>
                          </tr>
                          <tr> 
                              
                            <td width="192" align="center"><strong>发表人 : <%=gmodel.getPromulgator()%></strong></td>
                            <td width="348"  align="center">发表时间: <%=gmodel.getSubmitime()%></td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><font color="#FFFF99"><%=gmodel.getMessageContent()%></font></TD>
                          </tr>
                        </table>
               		 <%}showstate=0;}%>
               		  <!-- 添加新闻开始!-->
						 <%
						 	String state = request.getParameter("state");
						 	if("1".equals(state)){
						 %>
						 <FORM action="guestbook.jsp?action=add" method=post>
                        <table width="550" height="175" border="0">
                          <tr align="center"> 
                            <td colspan="3"><b>添加留言</b></td>
                          </tr>
                          <tr> 
                            <td width="50%" align="right"><strong>留言标题</strong></td>
                            <td width="50%" align="center"> <input type="text" name="addmessagetitle"></td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><strong>留言内容</strong></td>
                          </tr>
                          <tr align="right"> 
                            <td height="41" colspan="3">
							 <textarea  name="addmessagearea" rows="8" cols="50"></textarea> 
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td align="right" width="39%"> 
                              <input type="submit" value="提交">
                            </td>
                            <td align="left"> 
                              <input type="reset">
                            </td>
                          </tr>
                        </table>
                        </FORM>
                        <%}showstate=0;%>
                        <P>&nbsp;</P>
					</TD>
                    </TR>
                  </TBODY>
                </TABLE>
					</TD>
				</TR>
				
            <TR> 
              <TD background=images/middle-shu.gif height=60>
              </TD>
			</TR>
			</TBODY>
		 </TABLE>
	  </TD>
		<TD width=3 background=images/bian3.gif></TD>
	</TR>
   </TBODY>
  </TABLE>
  
<jsp:include page="inc/footer.jsp"></jsp:include>

