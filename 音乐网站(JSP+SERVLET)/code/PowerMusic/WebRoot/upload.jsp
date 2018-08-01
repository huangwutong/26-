<!--上传文件页面!-->
<%@ page language="java" contentType="text/html; charset=gbk"%>
<jsp:include page="inc/top.jsp"></jsp:include>
<%
	if(session.getAttribute("username")==null){
%>
	<script language="JavaScript">
		alert("请先登陆");
	</script>
<%
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}%>
<!--顶部结束!-->
<p>
<table border=0 width=20%>
  <tr>
    <td align=right><a href="index.jsp">首页</a></td>
    <td align=center><a href="<%=request.getContextPath()%>/show/music.jsp">音乐欣赏</a></td>
  </tr>
</table>
</p>
<%
		String upstate = (String)request.getAttribute("upstate");
		if("open".equals(upstate)){
	%>
<div align="left"></div>
<p align="center">上传文件选择</p>
<%
	}if("upsucessed".equals(upstate)){
%>
		<p align="center">上传成功</p>
		<p align="center">你可以继续上传</p>
<%}%>
<FORM ACTION="<%=request.getContextPath()%>/PostFile?action=upfile" METHOD="POST" 
	ENCTYPE="multipart/form-data" name="upform" 
	id="upfomrid" onSubmit="return Validator.Validate(this)">
	<script language="JavaScript" src="inc/ValidaFileType.js"></script>
 <table width="75%" border="0" align="center">
    <TR>
    <TD><div align="center">歌曲名</div></TD>
    <TD><input type="text" name="musicname"></TD>
    </TR>
     <TR>
    <TD><div align="center">歌手</div></TD>
    <TD><input type="text" name="singername"></TD>
    </TR>
    <TR>
    <TD><div align="center">性别</div></TD>
    <TD>
    	<SELECT name="singersex">
					<OPTION value="male">男</OPTION>
					<OPTION value="female">女</OPTION>
		</SELECT>
	</TD>
    </TR>
 </table>
    <TABLE width="75%">
    <tr> 
      <td><div align="center">
          <input name="upflie" dataType="Filter" msg="不允许此文件格式" type="file" accept="mp3, wma,wav" size="20">
        </div></td>
	</tr>
	<TR>
      <td><div align="center">
         <input value="上传" type="submit">
         <INPUT type="reset">
      </div></td>
    </tr>
    </TABLE>
</FORM>

<jsp:include page="inc/footer.jsp"></jsp:include>