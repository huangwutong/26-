<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
<%@ page import="java.io.*"%>
<%@ page import="model.MusicModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageMusic"%>
<jsp:useBean id="showmusic" class="control.bean.ManageMusic" scope="page"></jsp:useBean>
<jsp:useBean id="mmodel" class="model.MusicModel" scope="page"></jsp:useBean>
<!--顶部结束!-->

<%!
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    int playstate = 0;
    Vector musicvector;
%>
<%--计算页数 --%>
<%
 	totalcount = showmusic.getTotalrow();
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
	musicvector = showmusic.displayQuery(10,currentpage,"* from MusicInfo order by MusicID","MusicID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.musicpage.page.value=="")
		{
			alert("请输入页数");
			document.musicpage.page.focus();
			return false;
		}
		return true;
	}
</script>

<%
	if(request.getParameter("action")!=null)
		playstate=1;
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
									<p><a href="<%=request.getContextPath()%>/index.jsp">
									<FONT color="#ffffff">动力音乐<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">音乐欣赏</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
					<table width="40%" height="23" border="0" align="center">
                       <tr> 
                          <td width="42%"><a href="<%=request.getContextPath()%>/PostFile?action=open">上传文件</a></td>
                          <td width="30%"><a href="<%=request.getContextPath()%>/show/music.jsp">歌曲列表</a></td>
                          <td width="28%"><a href="<%=request.getContextPath()%>/show/news.jsp">新闻列表</a></td>
                       </tr>
                    </table>
                    <% if(playstate==0){%>
					<table width="550" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff" align=center>
					  <tr bgcolor="#cccccc">
							<td align="center" nowrap width="25%"><b>歌曲名称</b></td>
							<td align="center" nowrap width="22%"><b>歌手名字</b></td>
							<td align="center" nowrap width="21%"><b>上传时间</b></td>
							<td align="center" nowrap width="15%"><b>类型</b></td>
							<td align="center" nowrap width="17%"><b>试听</b></td>
						  </tr>
						  <% 
						  	for(int i=0;i<musicvector.size();i++){
						  		mmodel.setMusicid(((MusicModel)musicvector.get(i)).getMusicid());
						    	mmodel.setMusicName(((MusicModel)musicvector.get(i)).getMusicName());
						    	mmodel.setSingerName(((MusicModel)musicvector.get(i)).getSingerName());
						    	mmodel.setSubmitime(((MusicModel)musicvector.get(i)).getSubmitime());
						    	mmodel.setMusicType(((MusicModel)musicvector.get(i)).getMusicType());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="25%"><%=mmodel.getMusicName()%></td>
						       <td width="22%" align="center" nowrap><%=mmodel.getSingerName()%></td>
						       <td align="center" nowrap width="21%"><%=mmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="15%"><%=mmodel.getMusicType()%></td>
						       <td align="center" nowrap width="17%">
						  <a href="music.jsp?action=audition&musicname=<%=mmodel.getMusicName()%>&musictype=<%=mmodel.getMusicType()%>&singername=<%=mmodel.getSingerName()%>">
						       Go</a>
						       </td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="musicpage" method="post" onSubmit="return page_check();"action="music.jsp">
						<TABLE align = right width="36%">
						<tr>
						<td >共有<%out.print(totalpages);%>页,现在是第<%out.print(currentpage);%>页</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=currentpage-1%>">上一页</a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=currentpage+1%>">下一页 </a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=1">首页 </a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=totalpages%>">尾页 </a>
						<input name="page" type="text" size="5">页<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						<%}else{%>
                   	 <%
                    	String action = request.getParameter("action");
						//String realpath = new File(request.getSession().getServletContext().getRealPath(request.getContextPath())).getParent();
						String realpath = request.getContextPath();
						String musicroot = realpath+"/Upload/";
						String musicname = "";
						String musictype = "";
						String singername = "";
						if("audition".equals(action)){
							if(session.getAttribute("username")==null){
						%>
							<script language="JavaScript">
								alert("请先登陆");
								window.location = "<%=request.getContextPath()%>/index.jsp";
							</script>
						<%}
							if(request.getParameter("musicname")!=null){
								musicname = request.getParameter("musicname");
								musictype = request.getParameter("musictype");
								singername = request.getParameter("singername");
						}%>
					 <table border=0 align=center>
					  <tr>
					    <td><object id="player" height="240" width="320" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
					    <param NAME="AutoStart" VALUE="-1">
					    <!--是否自动播放-->
					    <param NAME="Balance" VALUE="0">
					    <!--调整左右声道平衡,同上面旧播放器代码-->
					    <param name="enabled" value="-1">
					    <!--播放器是否可人为控制-->
					    <param NAME="EnableContextMenu" VALUE="-1">
					    <!--是否启用上下文菜单-->
					    <param NAME="url" value="<%=(musicroot+singername+musicname+"."+musictype)%>">
					    <!--播放的文件地址-->
					    <param NAME="PlayCount" VALUE="1">
					    <!--播放次数控制,为整数-->
					    <param name="rate" value="1">
					    <!--播放速率控制,1为正常,允许小数,1.0-2.0-->
					    <param name="currentPosition" value="0">
					    <!--控件设置:当前位置-->
					    <param name="currentMarker" value="0">
					    <!--控件设置:当前标记-->
					    <param name="defaultFrame" value="">
					    <!--显示默认框架-->
					    <param name="invokeURLs" value="0">
					    <!--脚本命令设置:是否调用URL-->
					    <param name="baseURL" value="">
					    <!--脚本命令设置:被调用的URL-->
					    <param name="stretchToFit" value="0">
					    <!--是否按比例伸展-->
					    <param name="volume" value="500">
					    <!--默认声音大小0%-100%,50则为50%-->
					    <param name="mute" value="0">
					    <!--是否静音-->
					    <param name="uiMode" value="Full">
					    <!--播放器显示模式:Full显示全部;mini最简化;None不显示播放控制,只显示视频窗口;invisible全部不显示-->
					    <param name="windowlessVideo" value="0">
					    <!--如果是0可以允许全屏,否则只能在窗口中查看-->
					    <param name="fullScreen" value="0">
					    <!--开始播放是否自动全屏-->
					    <param name="enableErrorDialogs" value="-1">
					    <!--是否启用错误提示报告-->
					    <param name="SAMIStyle" value>
					    <!--SAMI样式-->
					    <param name="SAMILang" value>
					    <!--SAMI语言-->
					    <param name="SAMIFilename" value>
					    <!--字幕ID-->
					</object></td>
					  </tr>
					</table>
					<%}playstate=0;}%>
					
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


  