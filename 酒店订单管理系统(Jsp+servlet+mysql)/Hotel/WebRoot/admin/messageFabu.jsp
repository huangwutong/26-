<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'messageFabu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
       body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
   
}
td{
    height:20px;
}
</style>
<style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decora tion: none;}
		a:hover {text-decoration: none;}
</style>
  </head>
  
  <body>
         <form action="servlet/MessageServlet" method="post">
                <table width="100%" border="1">
                      
                      <tr>
                          <td width="5%">类型</td>
                          <td width="90%">
                              <select name="type">
                                     <option value="1" selected="selected">公告</option>
                                     <option value="2">新闻</option>
                                     <option value="3">热点</option>
                              </select>
                          </td>
                      </tr>
                
                      <tr>
                          <td>主题</td>
                          <td><input type="text" name="topic" maxlength="12"><span>*最多12个字符</span></td>
                      </tr>
                      
                      <tr>
                          <td>内容</td>
                          <td><textarea name="content" cols="50" rows="3" id="content"></textarea><span>*不能为空</span></td>
                      </tr>
                      
                      <tr>
                         <td colspan="2" align="center"><input type="submit" value="发布"></td>
                         <input type="hidden" name="action" value="insert">
                      </tr>
                </table>
                
                
         </form>
  </body>
</html>
