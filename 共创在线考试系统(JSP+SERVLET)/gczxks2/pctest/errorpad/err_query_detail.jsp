<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

String id=request.getParameter("id");
String sql;
String questtext="";
String tip="";
String ans="";

sql="SELECT   `question`.`QuestText`,  `question`.`Tip`,  `question`.`Answer`"+
    " FROM  `question`WHERE  (`question`.`ID` ="+id+")";
if(debug){
    out.print("<br>sql="+sql);
}
try{
    Connection con=DBCon.getConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    if(rs.next()){
        questtext=rs.getString("QuestText");
        tip=rs.getString("Tip");
        ans=rs.getString("Answer");
    }
}
catch(SQLException se){
    out.println(se.toString());
}
catch(Exception e){
    out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}


%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>试题编号：<%=id%></title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>

<body >
<div align="center">
  <table width="100%" height="87%" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
    <tr> 
      <td height="41" nowrap>答案：<%=ans%></td>
    </tr>
    <tr>
      <td height="300" valign="top">提示：<br> <p><%=tip%></p>
       <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        </td>
    </tr>
    <tr> 
      <td height="25" valign="top"> <div align="center">
          <input border="0" value="关 闭" name="I1" type="button" class="s02" onClick="window.close()">
        </div></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="left">&nbsp;</p>
  <p align="left"><font color="#000000"> </font></p>
  <p align="left">&nbsp; </p>
</div>
</body>
</html>
