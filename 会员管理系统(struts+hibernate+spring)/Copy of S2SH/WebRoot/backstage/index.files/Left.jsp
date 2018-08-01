<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String id = (String) session.getAttribute("id");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<META content="MSHTML 6.00.2900.5848" name=GENERATOR>
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<STYLE type=text/css>
{
FONT-SIZE:15px
}
#menuTree A {
	COLOR: #566984;
	TEXT-DECORATION: none
}

.t {
	filter: Alpha(Opacity = 88)
}

td {
	font-size: 12px;
	line-height: 22px
}

a:link {
	color: #FFFFFF;
	text-decoration: none;
	height: 20px;
	width: 63px;
	border-color: #33CCFF #30CCFF #30CCFF;
	background-color: #0099FF;
	border-style: solid;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px
}

a:visited {
	color: #FFFFFF;
	text-decoration: none;
	height: 20px;
	width: 63px;
	border-color: #33CCFF #30CCFF #30CCFF;
	background-color: #0099FF;
	border-style: solid;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px
}

a:hover {
	background-color: #FF66FF;
	height: 20px;
	width: 61px;
	border: #FFFFFF;
	border-style: dotted;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px
}
</style>

		<script language="JavaScript"
			src="http://localhost:8080/S2SH/backstage/JS/menu.js"></script>

	</HEAD>
	
	<BODY
		style="BACKGROUND-POSITION-Y: -120px; BACKGROUND-IMAGE: url(http://localhost:8080/S2SH/backstage/images/bg.gif); BACKGROUND-REPEAT: repeat-x; background: #778899">

		<div id="Layer1"
			style="align: left; top: 45px; position: absolute; width: 40px; height: 50px; z-index: 1">
			<div id="Layer2"
				style="position: absolute; width: 90px; top: 35px; z-index: 2; background-color: #104E8B; layer-background-color: #0068FF; border: 1px none #000000; visibility: visible"
				class="t">
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%">
					<tr>
						<td align="center" valign="top">
						<!--进行的是颜色的设定
						  -->
							<font color="#FFFFFF"
								onMouseOver="P7AniMagic('Layer2',60,25,3,50,0,0)"
								onMouseOut="P7AniMagic('Layer2',130,59,3,50,0,0)"> 会员信息管理<br>
								<a href="backstage/Vip/Vip-list" target="mainFrame">查看</a> <br>
								
								<a href="http://localhost:8080/S2SH/backstage/Vip/Vip-updateById.jsp"
								target="mainFrame">编辑</a> <br> <a
								href="http://localhost:8080/S2SH/backstage/Vip/Vip-addInput.jsp"
								target="mainFrame">添加</a> <br> <a
								href="http://localhost:8080/S2SH/backstage/Vip/Vip-deleteById.jsp"
								target="mainFrame">删除</a> <br> </font>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
			<TBODY>
				<TR>
					<TD width=10 height=29>
						<IMG
							src="http://localhost:8080/S2SH/backstage/index.files/Left.files/bg_left_tl.gif">
					</TD>
					<TD
						style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(http://localhost:8080/S2SH/backstage/images/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">
						<br>
					</TD>
					<TD width=10>
						<IMG
							src="http://localhost:8080/S2SH/backstage/index.files/Left.files/bg_left_tr.gif">
					</TD>
				</TR>
				<TR>
					<TD
						style="BACKGROUND-IMAGE: url(http://localhost:8080/S2SH/backstage/images/bg_left_ls.gif)"></TD>
					<TD id=menuTree
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white"
						vAlign=top></TD>
					<TD
						style="BACKGROUND-IMAGE: url(http://localhost:8080/S2SH/backstage/images/bg_left_rs.gif)"></TD>
				</TR>
				<TR>
					<TD width=10>
						<IMG
							src="http://localhost:8080/S2SH/backstage/index.files/Left.files/bg_left_bl.gif">
					</TD>
					<TD
						style="BACKGROUND-IMAGE: url(http://localhost:8080/S2SH/backstage/images/bg_left_bc.gif)"></TD>
					<TD width=10>
						<IMG
							src="http://localhost:8080/S2SH/backstage/index.files/Left.files/bg_left_br.gif">
					</TD>
				</TR>
			</TBODY>
		</TABLE>

	</BODY>
</HTML>
