<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/view_admin/inc/publictag.jsp"%>
<html>
	<head>
		<title>
			admin_popedom
		</title>
		<style type=text/css>
		body {
			background:#CAD7F7; font-size: 12px; margin-top:0px;
			SCROLLBAR-FACE-COLOR: #799AE1; SCROLLBAR-HIGHLIGHT-COLOR: #799AE1; 
			SCROLLBAR-SHADOW-COLOR: #799AE1; SCROLLBAR-DARKSHADOW-COLOR: #799AE1; 
			SCROLLBAR-3DLIGHT-COLOR: #799AE1; SCROLLBAR-ARROW-COLOR: #FFFFFF;
			SCROLLBAR-TRACK-COLOR: #AABFEC;
		}
		TD {
			FONT-SIZE: 12px
		}
		INPUT {
			BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
		}
		TEXTAREA {
			BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
		}
		SELECT {
			BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 12px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px
		}
		SPAN {
			FONT-SIZE: 12px; POSITION: static
		}
		A {
			COLOR: #000000; TEXT-DECORATION: none
		}
		A:hover { color:#428EFF;text-decoration:underline; }
		A.highlight {
			COLOR: red; TEXT-DECORATION: none
		}
		A.highlight:hover {
			COLOR: red
		}
		A.thisclass {
			FONT-WEIGHT: bold; TEXT-DECORATION: none
		}
		A.thisclass:hover {
			FONT-WEIGHT: bold
		}
		A.navlink {
			COLOR: #000000; TEXT-DECORATION: none
		}
		A.navlink:hover {
			COLOR: #003399; TEXT-DECORATION: none
		}
		.twidth {
			WIDTH: 760px
		}
		.content {
			FONT-SIZE: 14px; MARGIN: 5px 20px; LINE-HEIGHT: 140%; FONT-FAMILY: Tahoma,??
		}
		.aTitle {
			FONT-WEIGHT: bold; FONT-SIZE: 15px
		}
		TD.forumHeaderBackgroundAlternate {
			BACKGROUND-IMAGE: url(images/admin_top_bg.gif); COLOR: #000000; BACKGROUND-COLOR: #799ae1
		}
		#TableTitleLink A:link {
			COLOR: #ffffff; TEXT-DECORATION: none
		}
		#TableTitleLink A:visited {
			COLOR: #ffffff; TEXT-DECORATION: none
		}
		#TableTitleLink A:active {
			COLOR: #ffffff; TEXT-DECORATION: none
		}
		#TableTitleLink A:hover {
			COLOR: #ffffff; TEXT-DECORATION: underline
		}
		TD.forumRow {
			PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #F1F3F5; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
		}
		TH {
			FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND-IMAGE: url(images/admin_bg_1.gif); COLOR: white; BACKGROUND-COLOR: #4455aa
		}
		TD.bodytitle {
			BACKGROUND-IMAGE: url(images/admin_bg_2.gif)
		}
		TD.bodytitle1 {
			BACKGROUND-IMAGE: url(images/admin_bg_3.gif)
		}
		TD.tablebody1 {
			PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #bebbdb; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
		}
		TD.forumRowHighlight {
			PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #E4EDF9; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
		}
		.tableBorder {
			BORDER-RIGHT: #183789 1px solid; BORDER-TOP: #183789 1px solid; BORDER-LEFT: #183789 1px solid; WIDTH: 98%; BORDER-BOTTOM: #183789 1px solid; BACKGROUND-COLOR: #ffffff
		}
		.tableBorder1 {WIDTH: 98%; }
		.helplink {
			FONT: 10px verdana,arial,helvetica,sans-serif; CURSOR: help; TEXT-DECORATION: none
		}
		.copyright {
			PADDING-RIGHT: 1px; BORDER-TOP: #6595d6 1px dashed; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; FONT: 11px verdana,arial,helvetica,sans-serif; COLOR: #4455aa; PADDING-TOP: 1px; TEXT-DECORATION: none
		}
		.menuskin {
			BORDER: #666666 1px solid; VISIBILITY: hidden; FONT: 12px Verdana;
			POSITION: absolute; 
			BACKGROUND-COLOR:#EFEFEF;
			background-image:url("../skins/default/dvmenubg3.gif");
			background-repeat : repeat-y;
		}
		.menuskin A {
			PADDING-RIGHT: 10px; PADDING-LEFT: 25px; COLOR: black; TEXT-DECORATION: none; behavior:url(inc/noline.htc);	
		}
		#mouseoverstyle {
			BACKGROUND-COLOR: #C9D5E7; margin:2px; padding:0px; border:#597DB5 1px solid;
		}
		#mouseoverstyle A {
			COLOR: black
		}
		.menuitems{
			margin:2px;padding:1px;word-break:keep-all;
		}
</style>
	</head>
	<script src="images/admin.js" type="text/javascript"></script>
	<script src="../inc/main.js" type="text/javascript"></script>
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<div class=menuskin id=popmenu onmouseover="clearhidemenu();" onmouseout="dynamichide(event)" style="Z-index:100"></div>
		<table cellpadding="3" cellspacing="0" border="0" align=center class="tableBorder1" style="width:100%">
			<tr>
				<td height=10></td>
			</tr>
		</table>

		<table cellpadding="2" cellspacing="1" border="0" width="95%" class="tableBorder" align=center>
			<%@ include file="/view_admin/admin_popedom_util.jsp"%>

			<tr>
				<th colspan=8 align=left height=23>
					搜索结果
				</th>
			</tr>

			<html:form action="admin_Action?method=delAdmin" method="post">
				<tr align=center height=23 class=forumRowHighlight>
					<td class=forumRowHighlight colspan="2">
						<B>
							用户名
						</B>
					</td>
					<td class=forumRowHighlight colspan="2">
						<B>
							Email
						</B>
					</td>
					<td class=forumRowHighlight colspan="2">
						<B>
							权限
						</B>
					</td>
					<td class=forumRowHighlight colspan="2">
						<B>
							操作
						</B>
					</td>
				</tr>

				<c:forEach items="${aList}" var="userList">
					<tr>
						<td class=forumrow colspan="2">
							<a href="?action=modify&userid=206">
								${userList.username}
							</a>
						</td>
						<td class=forumrow colspan="2">
							<html:link href="mailto:${userList.email}">
							${userList.email}
						</html:link>
						</td>
						<td class=forumrow align=center colspan="2">
							<html:link href="/News/admin_Action.do?method=searchPopedom&id=${userList.id}">
								编辑
							</html:link>
						</td>
						<td class=forumrow align=center colspan="2">
							<INPUT type="checkbox" name="id" value="${userList.id}">
						</td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan=8 class=forumrow align=center>
						<B>
							请选择操作：
						</B>
						<input type="radio" name="useraction" value=1 checked="checked">
						删除&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部选定
						<input type=checkbox name="chkall" onclick="aa()" value="on">
					</td>
				</tr>
				<tr>
					<td colspan=8 class=forumrow align=center>
						<input type=submit name=submit value="执行选定的操作" onclick="{if(confirm('您确认要删除吗?')){return true;}return false;}">
					</td>
				</tr>
				<script type="">
					function aa(){
						for (var i=0;i<document.forms[0].elements.length;i++){
							var e = document.forms[0].elements[i];
							if ( (e.type == 'checkbox') ){   			                
								if( e.name.lastIndexOf('id') != -1){
									e.checked =  !e.checked;
								}
							}
						} 
				  }
			  </script>
			</html:form>
		</table>
	</body>
</html>
