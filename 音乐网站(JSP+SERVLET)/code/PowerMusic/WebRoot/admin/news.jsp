<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.NewsModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageNews"%>
<jsp:useBean id="managenews" class="control.bean.ManageNews" scope="page"></jsp:useBean>
<jsp:useBean id="nmodel" class="model.NewsModel" scope="page"></jsp:useBean>
<!--顶部结束!-->
<%
	String adminname = (String)session.getAttribute("adminname");
	if(adminname==null){
%>
	<script language="JavaScript">
		alert("请先登陆");
	</script>
	<%
		response.sendRedirect(request.getContextPath()+"/index.jsp");
}%>
<%!
	int showstate = 0;
	int updatestate = 0;
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector newsvector;
%>
<%--计算页数 --%>
<%
 	totalcount = managenews.getTotalrow();
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
	newsvector = managenews.displayQuery(5,currentpage,"* from NewsInfo order by NewsID","NewsID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.newspage.page.value=="")
		{
			alert("请输入页数");
			document.newspage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--更新新闻 --%>
<%
	String update = request.getParameter("action");
	int newsid = 0;
	if("update".equals(update)){
		if(request.getParameter("newsid")!=null)
		newsid = Integer.parseInt(request.getParameter("newsid"));
		String modnewstitle = request.getParameter("modnewstitle");
		String modnewsarea = request.getParameter("modnewsarea");
		int rowaffect = managenews.updateNews(newsid,modnewstitle,modnewsarea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("修改成功");
			window.location = "news.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("修改失败");
		window.location = "news.jsp";
	</script>
<%}}%>
<%
	String addnews = request.getParameter("action");
	if("add".equals(addnews)){
		String addadminname = (String)session.getAttribute("adminname");
		String addnewstitle = request.getParameter("addnewstitle");
		String addnewsarea = request.getParameter("addnewsarea");
		int rowaffect = managenews.addNews(addnewstitle,adminname,addnewsarea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("添加成功");
			window.location = "news.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("添加失败");
		window.location = "news.jsp";
	</script><%}}%>
<%
	if(request.getParameter("action")!=null||request.getParameter("state")!=null)
	showstate=1;
%>
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
									<p><a href="<%=request.getContextPath()%>/index.jsp"><FONT color="#ffffff">动力音乐<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">后台管理-新闻管理</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="283" height="266" align="left">
                          <tr>
						  <tr>
                            <p></p>
                            <td width="188" height="50"><a href="<%=request.getContextPath()%>/Login?action=logout">注销</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/user.jsp">管理用户</a></td>
                          </tr>
                          <tr>
						  <tr>
                            <td height="50"><a href="news.jsp">管理新闻</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="music.jsp">管理歌曲</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">管理留言</a></td>
                          </tr>
                        </table> 
                        <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">用户管理</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/news.jsp?state=1">添加新闻</a></td>
                            <td width="28%"><a href="<%=request.getContextPath()%>/admin/index.jsp">管理首页</a></td>
                          </tr>
                        </table>
                        <% if(showstate==0){%>
                        <table width="450" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
							<td width="32%" align="center" nowrap><b>标题</b></td>
							<td align="center" nowrap width="34%"><b>创建日期</b></td>
							<td align="center" nowrap width="34%"><b>发布人</b></td>
						  </tr>
						  <% 
						  	for(int i=0;i<newsvector.size();i++){
						  		nmodel.setNewsID(((NewsModel)newsvector.get(i)).getNewsID());
						    	nmodel.setNewsTitle(((NewsModel)newsvector.get(i)).getNewsTitle());
						    	nmodel.setPromulgator(((NewsModel)newsvector.get(i)).getPromulgator());
						    	nmodel.setSubmitime(((NewsModel)newsvector.get(i)).getSubmitime());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="32%">
						       <a href="news.jsp?action=modify&newsid=<%=nmodel.getNewsID()%>&position=<%=i%>">
						       <%=nmodel.getNewsTitle()%></a></td>
						       <td width="34%" align="center" nowrap><%=nmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="34%"><%=nmodel.getPromulgator()%></td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="newspage" method="post" onSubmit="return page_check();"action="news.jsp">
						<TABLE width="36%">
						<tr>
						<td >共有<%out.print(totalpages);%>页,现在是第<%out.print(currentpage);%>页</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=currentpage-1%>">上一页</a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=currentpage+1%>">下一页 </a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=1">首页 </a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=totalpages%>">尾页 </a>
						<input name="page" type="text" size="5">页<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						<%}else{%>
                        <%--显示待查看更新的新闻资料 --%>
                        <%	
     						String modify = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("newsid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							 position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							nmodel.setNewsID(((NewsModel)newsvector.get(position)).getNewsID());
						    	nmodel.setNewsTitle(((NewsModel)newsvector.get(position)).getNewsTitle());
						    	nmodel.setPromulgator(((NewsModel)newsvector.get(position)).getPromulgator());
						    	nmodel.setSubmitime(((NewsModel)newsvector.get(position)).getSubmitime());
						    	nmodel.setNewsContent(((NewsModel)newsvector.get(position)).getNewsContent());
     					%>
     					<FORM action="news.jsp?action=update&newsid=<%=nmodel.getNewsID()%>" method=post>
     					 <table width="550" height="175" border="0" align=center>
                            <tr align="center"> 
                              <td colspan="3"><b>修改新闻</b></td>
                          </tr>
                          <tr> 
                              <td width="19%" align="right"><strong>新闻标题</strong></td>
                            <td width="81%" colspan="3" align="left">
                             <input type="text" name="modnewstitle" value="<%=nmodel.getNewsTitle()%>">
                             </td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><strong>新闻内容</strong></td>
                          </tr>
                          <tr align="left"> 
                            <td height="41" colspan="3"> 
                            <textarea name="modnewsarea" rows="8" cols="50" wrap="soft"><%=nmodel.getNewsContent()%></textarea> 
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td align="right" width="37%"> 
                              <input type="submit" value="提交">
                            </td>
                            <td align="left"> 
                              <input type="reset">
                            </td>
                          </tr>
                        </table>
                        </FORM>
     					 <%}showstate=0;}%>
					    
						 <!-- 添加新闻开始!-->
						 <%
						 	String state = request.getParameter("state");
						 	if("1".equals(state)){
						 %>
						 <FORM action="news.jsp?action=add" method=post>
                        <table width="550" height="175" border="0">
                          <tr align="center"> 
                            <td colspan="2"><b>添加新闻</b></td>
                          </tr>
                          <tr> 
                            <td align="center"><strong>新闻标题</strong></td>
                            <td colspan="2" align="left"> <input type="text" name="addnewstitle"></td>
                          </tr>
                          <tr align="center"> 
                            <td><strong>新闻内容</strong></td>
                          </tr>
                          <tr align="left"> 
                            <td height="41" colspan="3">
							 <textarea  name="addnewsarea" rows="8" cols="50"></textarea> 
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
                        <%}%>
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
  
<jsp:include page="/inc/footer.jsp"></jsp:include>