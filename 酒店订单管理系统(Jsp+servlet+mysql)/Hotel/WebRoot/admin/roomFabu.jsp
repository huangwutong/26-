<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'roomFabu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="javascript" src="../yjj.js"></script>
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
       <form action="servlet/RoomServlet" enctype="multipart/form-data" method="post">
        <table width="100%" border="1"  >
                <tr>
                    <td width="20%" align="center">房间号</td>
                    <td><input type="text" name="num"> </td>
                </tr>
                <tr>
                    <td align="center">房间类型</td>
                    <td>
                       <select name="roomTyoe">
                               <option value="1">单人间</option>
                               <option value="2">双人间</option>
                               <option value="3">多人间</option>
                               <option value="4">商务间</option>
                               <option value="5">豪华间</option>
                               <option value="6">总统套房</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">房间价格</td>
                    <td><input type="text" name="roomPrice"> </td>
                </tr>
                <tr>
                    <td align="center">图片上传</td>
                    <td><input  type="file" name="img" size="20" maxlength="20" > </td>
                </tr>
                
               <tr>
                    <td  align="center" colspan="2"><input type="submit" value="发布">
                    <input type="hidden" name="action" value="add"></td>
                </tr>
        </table>
        </form>
  </body>
</html>
