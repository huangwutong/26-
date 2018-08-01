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
<link rel="stylesheet" type="text/css" href="user/style_css/user_style.css">
	<script type="text/javascript">
	/* 获取我们需要的信息 */
		 var xmlHttp = new ActiveXObject("MSXML2.XMLHTTP");
		 	var x,y;
			function sendRequest(v) {
				xmlHttp.open('POST','findMyCredit.do',true);
				xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xmlHttp.onReadyStateChange=getResponse;
				xmlHttp.send('uid='+v);
				x=event.x;y=event.y;
			}		
			
			function getResponse() {
					
				if (xmlHttp.readyState==4) {
					divMsg.style.display='block';
					divMsg.style.backgroundColor='#CCCC66';
					divMsg.style.left=x;
					divMsg.style.top=y;
					divMsg.innerHTML = xmlHttp.responseText;
				}
			}
			
			function closeDiv(){
				divMsg.style.display='none';
			}
			
			function setTime(){
				window.setTimeout(closeDiv,5000);
			}
	</script>
  </head>
  <body>
  				<%
  					UserInfo ui=(UserInfo)request.getSession().getAttribute("USERINFO");
  				 %>
    		    <table width="100%" border="0" cellspacing="0" cellpadding="0">
				      <tr>
				        <td height="40" colspan="2" class="font_style_orange">&nbsp;&nbsp;&nbsp;&nbsp;<img src="user/image/an.gif" width="12" height="11" />会员中心</td>
			          </tr>
				      <tr>
				        <td width="40">&nbsp;</td>
				        <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="findUserInfo.do" class="menu_font_style">我的信息</a></td>
				      </tr>
				      <tr>
				        <td>&nbsp;</td>
				        <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="findUserOreders.do" class="menu_font_style">我的定单</a></td>
				      </tr>
				      <tr>
				        <td>&nbsp;</td>
				        <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="foodCart.do" class="menu_font_style">我的订餐车</a></td>
				      </tr>
				      <tr>
				        <td>&nbsp;</td>
				        <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="javascript:void();" class="menu_font_style" onclick="sendRequest(<%=ui.getUId() %>);" onmouseout="setTime();">我的积分</a></td>
				      	
				      </tr>
				      
				      <tr>
				        <td>&nbsp;</td>
				        <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="preAddComplain.do" class="menu_font_style">我要投诉</a></td>
				      </tr>
				    </table>
				      <table width="100%" border="0" cellspacing="0" cellpadding="0">
				        <tr>
				          <td height="40" colspan="2" class="font_style_orange">&nbsp;&nbsp;&nbsp;&nbsp;<img src="user/image/an.gif" width="12" height="11" />会员修改</td>
				        </tr>
				        <tr>
				          <td width="40">&nbsp;</td>
				          <td width="165" height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="preEditUserInfo.do" class="menu_font_style">修改我的资料</a></td>
				        </tr>
				        <tr>
				          <td>&nbsp;</td>
				          <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="preEditUserPass.do" class="menu_font_style">修改我的密码</a></td>
				        </tr>
				        <tr>
				          <td>&nbsp;</td>
				          <td height="25"><img src="user/image/dot.gif" width="14" height="13" /><a href="logoutUser.do" class="menu_font_style">退出会员中心</a></td>
				        </tr>
			        </table>
			        <div id="divMsg" style="position: absolute;"></div>
  </body>
</html:html>