<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,com.xh369.dto.Admin,com.xh369.dto.Popedom"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="/view_admin/inc/publictag.jsp"%>
<html>
	<head>
		<title>
			admin_popedom_config
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
			FONT-SIZE: 14px; MARGIN: 5px 20px; LINE-HEIGHT: 140%; FONT-FAMILY: Tahoma,
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
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
		<table cellpadding="3" cellspacing="0" border="0" align=center class="tableBorder1" style="width:100%">
			<tr>
				<td height=10></td>
			</tr>
		</table>

		<table cellpadding="2" cellspacing="1" border="0" width="95%" class="tableBorder" align=center>
			<%@ include file="/view_admin/admin_popedom_util.jsp"%>	
			
			<tr><th colspan=8 height=23 align=left>浏览${admin.username}相关选项</th></tr>
			<tr><td colspan=8 class=forumrow>
				  <table width="100%" border="0" cellspacing="1" cellpadding="0"  align=center>
					<html:form action="admin_Action?method=updatePopedom">
						<input type=hidden name="userid" value="206">
						<input type=hidden name="BoardID" value="0">
						<input type=hidden name="username" value="mytest">
						<input type=hidden name="savetype" value=0>		
						<tr> 
							<th colspan="4" align=left><a name="setting2"></a>编辑权限</th>
						</tr>
						
						<%
							Admin admin = (Admin) request.getAttribute("admin");
							String[] str = admin.getLevel().toString().split(",");
							List aryList = new ArrayList();
							for(int i = 0; i < str.length; i++){
								aryList.add(str[i]);
								pageContext.setAttribute("aryList", aryList);
							}
						%>
							
						<tr>
						<%
							List aList = (ArrayList) request.getAttribute("aList");
							for(int i = 0; i < aList.size(); i++){
								int k = -1;
								Popedom popedom = (Popedom) aList.get(i);
								List arrayList = (ArrayList) pageContext.getAttribute("aryList");
								String pop = "";
								if(i > arrayList.size() - 1){
									for(int n = 0; n < arrayList.size(); n++){
										pop = arrayList.get(n).toString();
										if( String.valueOf(popedom.getId()).equals(pop) ){
											k = 3;
						%>
							<td class=Forumrow>
									<INPUT TYPE="checkbox" NAME="level<%=i%>" value="<%=i%>" checked><%= popedom.getPopedom()%>
							</td>
						<%
										}else{
											if(k != -1 || k == 4){
												break;
											}
											if(n != arrayList.size() -1)
												continue;
						%>
							<td class=Forumrow>
									<INPUT TYPE="checkbox" NAME="level<%=i%>" value="<%=i%>"><%= popedom.getPopedom()%>
							</td>
						<%
											k = 4;
										}
									}
									continue;
								}	
								for(int j = i; j < arrayList.size(); j++){
									pop = arrayList.get(j).toString();
									if( String.valueOf(popedom.getId()).equals(pop) ){
						%>	
									<td class=Forumrow>
										<INPUT TYPE="checkbox" NAME="level<%=i%>" checked value="<%=i%>"><%= popedom.getPopedom()%>
									</td>
						<%
										k = 0;
									}else{
										if(k != -1)
											break;
										for(int m = 0; m < arrayList.size(); m++){
											pop = arrayList.get(m).toString();
											if( String.valueOf(popedom.getId()).equals(pop) ){
												k = 1;
						%>
									<td class=Forumrow>
										<INPUT TYPE="checkbox" NAME="level<%=i%>" checked value="<%=i%>"><%= popedom.getPopedom()%>
									</td>
						<%
											}else{
												if(k != -1 || k == 2)
													break;
												if(m != arrayList.size() - 1)
													continue;
						%>
									<td class=Forumrow>
										<INPUT TYPE="checkbox" NAME="level<%=i%>" value="<%=i%>"><%= popedom.getPopedom()%>
									</td>
						<%
													k = 2;
											}
										}
									}
									break;
								}
							}
						%>
						</tr>
						
						<tr> 
							<td  class=Forumrow></td>
							<td  class=Forumrow colspan=3>
							<html:hidden property="id"/>
								<html:submit>提交</html:submit>
							</td>
						</tr>
					</html:form>
				</table>
		</td></tr>
	</table>
</body>
</html>