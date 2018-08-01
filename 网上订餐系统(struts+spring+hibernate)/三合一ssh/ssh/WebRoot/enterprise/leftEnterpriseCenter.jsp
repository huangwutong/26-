<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <link rel="stylesheet" type="text/css" href="enterprise/style_css/enterprise_style.css">

  </head>
  
  <body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="40" colspan="2" class="font_style_orange">&nbsp;&nbsp;&nbsp;&nbsp;<img src="enterprise/image/an.gif" width="12" height="11" />企业管理中心</td>
        </tr>
      <tr>
        <td width="40">&nbsp;</td>
        <td height="25"><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="findEnterpriseInfo.do" class="menu_font_style">企业基本信息</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="25"><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="findMyFoods.do" class="menu_font_style">我的餐饮</a></td>
      </tr>
      <tr>
        <td height="25">&nbsp;</td>
        <td><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="preAddFoodInfo.do" class="menu_font_style">新增餐饮</a></td>
      </tr>
      <tr>
        <td height="25">&nbsp;</td>
        <td><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="findMyOrders.do" class="menu_font_style">我的定单</a></td>
      </tr>
      
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="40" colspan="2" class="font_style_orange">&nbsp;&nbsp;&nbsp;&nbsp;<img src="enterprise/image/an.gif" width="12" height="11" />修改信息</td>
        </tr>
        <tr>
          <td width="40" height="25">&nbsp;</td>
          <td><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="preEditEnterprise.do" class="menu_font_style">修改基本资料</a></td>
        </tr>
        <tr>
          <td height="25">&nbsp;</td>
          <td><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="preEditEnterprisePass.do" class="menu_font_style">修改密码</a></td>
        </tr>
        <tr>
          <td height="25">&nbsp;</td>
          <td><img src="enterprise/image/dot.gif" width="14" height="13" /><a href="logout.do" class="menu_font_style">退出管理中心</a></td>
        </tr>
      </table></td>
  </tr>
</table>
  </body>
</html:html>
