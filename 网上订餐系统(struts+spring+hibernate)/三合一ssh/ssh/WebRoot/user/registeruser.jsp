<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>
    <link rel="stylesheet" type="text/css" href="user/style_css/user_style.css">
    
    <script>
    	 var xmlHttp = new ActiveXObject("MSXML2.XMLHTTP");
			function sendRequest(v) {
				xmlHttp.open('POST','validateUser.do',true);
				xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xmlHttp.onReadyStateChange=getResponse;
				xmlHttp.send('userName='+v);
			
			}		
			
			function getResponse() {
					
				if (xmlHttp.readyState==4) {
					divMsg.innerHTML = xmlHttp.responseText;
				}
			}
			
			function changeImage(){
				window.location="preRegister.do";
			}
    	    	
    </script>
  </head>
  <body>
  	<table border="0" cellspacing="0" cellpadding="0" align="center">
  		<tr>
  			<td><jsp:include flush="true" page="../front/top.jsp"/></td>
  		</tr>
  		<tr>
  			<td width="5"></td>
  		</tr>
  		<tr>
  		
  			<td>
	<html:form  action="addUserInfo.do">
	  <table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	      <td width="218" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="user/image/xx_ss_s.gif" width="223" height="20" /></td>
	          </tr>
	          <tr>
	            <td align="center" background="user/image/xx_bj2.gif" style="font-size: 12px;color: green;font-weight: bold;">注意事项</td>
	          </tr>
	          <tr>
	            <td background="user/image/xx_bj2.gif"><table width="64%" border="0" align="center" cellpadding="0" cellspacing="0">
	                <tr class="font_style_normal">
	                  <td><p>1、用户一经注册则表示您已经仔细阅读并完全理解和接受网上订餐的<font 
	                  color="#ff0000">服务条款</font> ！</p>
	                      <p>2、注册用户必须遵守国家相关的法律法规；对发布信息的内容及真实性承担独立责任；</p>
	                    <p>3、对用户发布的信息，我们保留编辑及删除的权利；</p>
	                    <p>4、发布虚假信息、不及时删除已成交信息的用户将被取消资格，并承担一些法律责任，我方将停止一切服务！</p></td>
	                  <td width="10">&nbsp;</td>
	                </tr>
	            </table></td>
	          </tr>
	          <tr>
	            <td><img src="user/image/xx_ss_x.gif" width="223" height="26" /></td>
	          </tr>
	      </table></td>
	      
	      <td valign="top">
	      	<table width="100%" border="0" cellspacing="2" cellpadding="0" class="font_style_normal">
	          <tr>
	            <td height="30" colspan="2" style="font-weight: bold;color: red;">&lt;会员帐号&gt;</td>
	          </tr>
	          <tr>
	            <td width="100" height="25" align="center">用 户 名：</td>
	            <td width="450">
	              <html:text property="userName" styleClass="text_style_border" onchange="sendRequest(this.value);"/>  <span style="color: red;">*</span><div id="divMsg" style="display: inline;"></div>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">密　　码：</td>
	            <td>
	              <html:password property="userPass1" styleClass="text_style_border"/>  <span style="color: red;">*</span>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">确认密码：</td>
	            <td>
	              <html:password property="userPass2" styleClass="text_style_border"/>  <span style="color: red;">*</span>
	            </td>
	          </tr>
	          <tr>
	            <td height="30" colspan="2" style="font-weight: bold;color: red;">&lt;用户资料&gt;</td>
	          </tr>
	          <tr>
	            <td height="25" align="center">真实姓名：</td>
	            <td>
	              <html:text property="realName" styleClass="text_style_border"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">证件号码：</td>
	            <td>
	              <html:text property="paperCode" styleClass="text_style_border"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">性　　别：</td>
	            <td>
	              <input type="radio" name="userSex" value="1" checked="checked"/>
	            男
	            <input type="radio" name="userSex" value="2" />
	            女</td>
	          </tr>
	          <tr>
	            <td height="25" align="center">年　　龄：</td>
	            <td>
	              <html:text property="userAge" styleClass="text_style_border2" size="8"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">联系电话：</td>
	            <td>
	              <html:text property="userTel" styleClass="text_style_border"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">联系地址：</td>
	            <td>
	              <html:text property="uaddress" styleClass="text_style_border"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">电子邮箱：</td>
	            <td>
	              <html:text property="uemail" styleClass="text_style_border"/>
	            </td>
	          </tr>
	          <tr>
	            <td height="25" align="center">验 证 码：</td>
	            <td><input type="text" name="randCode" id="randCode" class="text_style_border2" size="15"><a href="javascript:changeImage();"><img src="randomCode" border="no"></a>　<span style="color: blue;">(换一张图片,请单击图片)</span><span style="color: red;font-weight: bold;"><html:errors property="randError"/></span></td>
	          </tr>
	          <tr>
	          	<td>&nbsp;</td>
	            <td height="40">
	             <input type="submit" name="Submit" value="提交"/>
	             　　  
	             <input type="reset" name="Submit2" value="重置" />
	            </td>
	          </tr>
	      </table></td>
	    </tr>
	  </table>
</html:form>
  			</td>
  		</tr>
  		<tr>
  			<td><jsp:include flush="true" page="../front/buttom.jsp"/></td>
  		</tr>
  	</table>
  </body>
</html:html>