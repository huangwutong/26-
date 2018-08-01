<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body  bgcolor="#eeffff">
<h2 align="center">产品介绍</h2>
<table width="730" height="320" border="0">
  <tr>
    <td height="252"><table width="350" height="251" border="0">
      <tr>
        <td width="165"><img src="tupian/newscms.jpg" width="104" height="108" /></td>
        <td width="176"><ul>
          <li><a href="#" target="_blank">网站开发</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		  <a href="#" target="_blank">软件开发</a> </li>
          <li><a href="#" target="_blank">模板制作</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <a href="#" target="_blank">解决方案</a> </li>
        </ul>
        </td>
      </tr>
      <tr>
        <td colspan="2">承接项目：大型门户站点开发，网络应用软件开发,技术解决方案。开发技术：Asp、Asp.Net(C#)、Java。</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="350" height="180" border="0">
      <tr>
        <td width="165"><img src="tupian/discuz.jpg" width="107" height="103" /></td>
        <td width="179"><ul>
          <li><a href="#">Discuz!</a> <br><a href="#">Discuz!NT</a>  <br></li>
          <li><a href="#">SupeSite</a> <br>
          <a href="#">X-Space</a> <br> </li>
          <li><a href="http://www.foosun.net/FS/FSFA/FS4HJB1477.html">&nbsp;seo培训</a> <br>
           <a href="#">网络安全</a> </li>
        </ul>
        </td>
      </tr>
      <tr>
        <td height="118" colspan="2">FoosunCMS+Discuz!为你提供高效的大型门户社区一站式集成解决方案包；SEO由资深顾问王通提供指导。</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="278" height="180" border="0">
      <tr>
        <td width="127" height="77"><img src="tupian/Fs_Cms.jpg" width="104" height="108" /></td>
        <td width="134"><ul>
          <li><a title="风讯CMS下载" href="#"><img src="tupian/down_R.jpg" alt="df" width="113" height="37" border="0" /></a> </li>
          <li><a href="#">主要特点</a> <br>
          <a href="#">详细介绍</a> </li>
          <li><a href="#">成功案例</a> <br><a href="#">在线演示</a> </li>
        </ul>
        </td>
      </tr>
      <tr>
        <td colspan="2">FoosunCMS是国内领先的第一款集成web2.0元素的、模块化的、开源的ＣＭＳ建站系统，包含13个子系统。</td>
        <td width="10">&nbsp;</td>
      </tr>
    </table></td>
    <td><table width="350" height="192" border="0">
      <tr>
        <td width="157" height="125"><img src="tupian/Fs_Vif.jpg" width="104" height="108" /></td>
        <td width="183"><ul>
          <li><a title="风讯CMS下载" href="#"><img src="tupian/down_R.jpg" alt="df" width="113" height="37" border="0" /></a> </li>
          <li><a href="#">主要特点</a><br> <a href="#">详细介绍</a> <br></li>
          <li><a href="#">成功案例</a> <br><a href="#">在线演示</a></li>
        </ul>
        </td>
      </tr>
      <tr>
        <td height="61"  colspan="2">VIF是一个基于Windows IIS web服务器技术开发的IIS防火墙软件,用SDK的开发方式开发.界面友好,可视化的界面操作。</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<h3><a href="index.jsp">返回</a></h3>
</body>
</html>
