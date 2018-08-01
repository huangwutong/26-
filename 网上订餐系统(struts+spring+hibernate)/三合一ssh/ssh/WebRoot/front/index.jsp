<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="com.xaccp.po.UserInfo"/>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>
    <title>index.jsp</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="fontstyle/front_style.css" type="text/css"></link>
<style>
.body{
  	margin-top: 0px;
}
</style>
	<script>
		function button_submit(){
			window.document.fm.action="userLogin.do";
			window.document.fm.submit();
		}
		function button_termQuery(){
			window.document.fm.action="termQueryFood.do";
			window.document.fm.submit();
		}
		function stop(){
			var mar=document.getElementById("mar");
			mar.scrollAmount=0;
		}
		function go(){
			var mar=document.getElementById("mar");
			mar.scrollAmount=1;
		}
	</script>
  	
</head>

<body class="body">
	<table border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>
				<jsp:include flush="true" page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td height="5"></td>
		</tr>
		<tr>
			<td>
	<form id="fm" name="fm" method="post" action="">
		<table width="770" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="150" valign="top">
					<table width="100%" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td valign="top">
								<table width="100%" height="22" border="0" align="center"
									cellpadding="0" cellspacing="0">
									<tr>
										<td background="front/image/bg-left.gif"
											class="font_style_white1">
											　　本站公告
										</td>
									</tr>
								</table>
								<!-- 设置页面的模式为滚动模式-->
								<marquee behavior="scroll" id="mar" direction="up" scrollamount="1" height="100">
									<table width="90%" border="0" align="center" cellpadding="0"
										cellspacing="0">

										<tr>
											<td height="20" style="color: red;font-weight: bold;font-size: 12px;">
												·公告信息
											</td>
										</tr>
										<tr>
											<td height="20" class="font_style_normal">
												·本网站最新推出送餐上门详情请访问<a href="#" style="color: red;" onmouseover="stop();" onmouseout="go();">http://www.eatery.com</a>
											</td>
										</tr>
										
									</table>
								</marquee>
							</td>
						</tr>
					</table>
					<table width="100%" height="22" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td background="front/image/bg-left.gif"
								class="font_style_white1">
								　　餐饮分类
							</td>
						</tr>
					</table>
					<!--获得数组name的集合的对象  -->
					<logic:iterate id="foodtype" name="listBigType">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#CB7F0C">
							<tr>
								<td bgcolor="ffffff" class="font_style_orange">
									<img src="front/image/arrow01.gif"></img>　${foodtype.fbtName }
								</td>
							</tr>
							<logic:iterate id="foodsmalltype"
								collection="${foodtype.foodSmallTypes}">
								<tr>
									<td align="center" bgcolor="ffffff">${foodsmalltype.fstName }
										<%--<a href="findFoodByType.do?foodType=${foodsmalltype.fstId }" class="menu_font_style1"></a>
									
									--%></td>
								</tr>
							</logic:iterate>
						</table>
					</logic:iterate>
				</td>
				<td valign="top">
					<table width="98%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td class="font_style_orange">
								最新推荐
							</td>
						</tr>
						<tr>
							<td height="1" bgcolor="#EAB35F"></td>
						</tr>
						<tr>
							<td>
								<%
								int num = 0;
								%>
								<table>
									<logic:iterate id="foodinfo" name="listFoodState1" length="4">
										<%
										if (num % 2 == 0) {
										%>
										<tr>
											<%
											}
											%>
											<td>
												<table>
													<tr>
														<td rowspan="4"><img src="${foodinfo.FImage}" width="100" height="91" border="no">
															<%--<a href="queryFoodInfo.do?fid=${foodinfo.FId }"></a>
														--%></td>
														<td class="font_style_normal">
															名称：${foodinfo.FName }
														</td>
													</tr>
													<tr>
														<td style="color: red;font-size: 12px;">
															￥：${foodinfo.FPrice }
														</td>
													</tr>
													<tr>
														<td class="font_style_normal">
															产地：${foodinfo.FFrom }
														</td>
													</tr>
													<tr>
														<td><img src="front/image/addto.gif" border="no"/>
															<%--<a href="foodCart.do?Add=${foodinfo.FId}" class="menu_font_style"></a>
														--%></td>
													</tr>
												</table>
											</td>
											<%
											if (num % 2 == 1) {
											%>
										
										</tr>
											<%
											}
											num ++;
											%>
										
									</logic:iterate>
								</table>

							</td>
						</tr>
					</table>
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td class="font_style_orange">热买菜品</td>
						</tr>
						<tr>
							<td height="1" bgcolor="#EAB35F"></td>
						</tr>
						<tr>
							<td>
								<%
								int num2 = 0;
								%>
								<table>
									<logic:iterate id="foodinfo" name="listFoodState2" length="6">
										<%
										if (num2 % 2 == 0) {
										%>
										<tr>
											<%
											}
											%>
											<td>
												<table>
													<tr>
														<td rowspan="4"><img src="${foodinfo.FImage}" width="100" height="91" border="no">
															<%--<a href="queryFoodInfo.do?fid=${foodinfo.FId }"></a>
														--%></td>
														<td class="font_style_normal">
															名称：${foodinfo.FName }
														</td>
													</tr>
													<tr>
														<td style="color: red;font-size: 12px;">
															￥：${foodinfo.FPrice }
														</td>
													</tr>
													<tr>
														<td class="font_style_normal">
															产地：${foodinfo.FFrom }
														</td>
													</tr>
													<tr>
														<td><img src="front/image/addto.gif" border="no"/>
															<%--<a href="foodCart.do?Add=${foodinfo.FId}" class="menu_font_style"></a>
														--%></td>
													</tr>
												</table>
											</td>
											<%
											if (num2 % 2 == 1) {
											%>
										
										</tr>
											<%
											}
											num2 ++;
											%>
										
									</logic:iterate>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td width="200" valign="top">
					<% 
						UserInfo userInfo=(UserInfo)request.getSession().getAttribute("USERINFO");
						if(userInfo==null){
						
					%>
					<table width="100%" height="22" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td background="front/image/bj_2.gif" class="font_style_white1"
								align="center">
								用 户 登 陆
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="border_style_table">
						<tr>
							<td width="71" height="30" align="center" class="font_style_normal">用户名:</td>
							<td width="125">
								<input name="userName" type="text" size="12" class="text_style_border2"/>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" class="font_style_normal">密　码:</td>
							<td>
								<input name="userPass1" type="password" size="12" class="text_style_border2"/>
							</td>
						</tr>
						<tr>
							<td height="30" colspan="2" align="center">
								<a href="javascript:button_submit();"><img src="front/image/login.gif" border="no"/></a>

								<a href="preRegister.do"><img src="front/image/zc.gif" border="no" /></a>
							</td>
						</tr>
					</table>
					<%
						}else{
					%>
					<table width="100%" height="22" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td background="front/image/bj_2.gif" class="font_style_white1"
								align="center">
								登 陆 成 功
							</td>
						</tr>
					</table>
					<table width="100%" height="80" border="0" cellpadding="0" cellspacing="0" class="border_style_table">
						<tr>
							<td align="center" class="font_style_normal"><span style="color: red;font-size: 12px;font-weight: bold; ">${USERINFO.UName}</span>你好！</td>
						</tr>
						<tr>
							<td class="font_style_normal" align="center">你已成功登陆！</td>
						</tr>
						<tr>
							<td align="center"><a href="preUserLogin.do" class="menu_font_style1">会员中心</a></td>
						</tr>
					</table>	
					<%
						}
					 %>
					 <br/>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="border_style_table"　align="center">
						<tr>
							<td height="22" background="front/image/bj_2.gif" class="font_style_white1">
								商品查询
							</td>
						</tr>
						<tr>
							<td>
							  <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr class="font_style_normal">
                                  <td height="25">类别：
                                    <select name="fstId">
                                    	<option value="0">不限</option>
                                    	<logic:iterate id="foodSmallType" name="listSmallType">
                                    		<option value="${foodSmallType.fstId }">${foodSmallType.fstName }</option>
                                    	</logic:iterate>
                                    </select>
                                 </td>
                                </tr>
                                <tr class="font_style_normal">
                                  <td height="25">名称：
                                    <input name="foodName" type="text" size="12" class="text_style_border2"/>
                                  </td>
                                </tr>
                                <tr class="font_style_normal">
                                  <td height="25">价格：
                                    <input name="startPrice" type="text" size="2" class="text_style_border2"/>到<input name="endPrice" type="text" size="2" class="text_style_border2"/>之间
                                  </td>
                                </tr>
                                <tr class="font_style_normal">
                                  <td height="25">餐厅：
                                    <select name="eid">
                                    	<option value="0">不限</option>
                                    	<logic:iterate id="enterprise" name="listEnter">
                                    		<option value="${enterprise.EId }">${enterprise.EName }</option>
                                    	</logic:iterate>
                                    </select>
                                  </td>
                                </tr>
                                <tr class="font_style_normal">
                                  <td height="25" align="center">
                                    <a href="javascript:button_termQuery();"><img src="front/image/sou.gif" border="no"/></a>
                                  </td>
                                </tr>
                              </table>
							</td>
						</tr>
					</table>
					<br/>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="border_style_table">
						<tr>
							<td height="22" background="front/image/bj_2.gif" class="font_style_white1">
								最新餐厅
							</td>
						</tr>
						<logic:iterate id="enter" name="listEnter" length="10">
							<tr>
								<td height="21">
									　<img src="front/image/an-bule.gif"/>　<a href="#" class="menu_font_style1">${enter.EName }</a>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</td>
			</tr>
		</table>
	</form>
	</td>
	</tr>
	<tr>
		<td>
		    <jsp:include flush="true" page="buttom.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html:html>