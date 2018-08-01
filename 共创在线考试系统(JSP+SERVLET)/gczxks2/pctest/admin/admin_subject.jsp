<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="jinghua.*"%>


<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
%>
 
<%
try{
    con=DBCon.getConnection();

    String sql="SELECT  `subject`.`Name`,  `subject`.`ID`,  `grade`.`Name` AS `gn` "+
        "FROM  `subject`  LEFT OUTER JOIN `grade` ON (`subject`.`gradenote` = `grade`.`note`) "+
        "ORDER BY  `subject`.`gradenote`,  `subject`.`ID`";
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();




%>
<script language="javascript">
function submitit(myform)
{

}


function delit(myform)
{
  if (confirm("将删除所有选择的科目数据？"))
  {
    myform.action="admin_subjectdel.jsp";
    myform.submit();
  }
}



function FanAll(form){
for (var i=1;i<form.elements.length;i++){
var e = form.elements[i];
if (e.checked == false){ e.checked = true; }
else { e.checked = false;}
}}

</script>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>系统管理 | 科目管理</title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>

<body>

<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="25">
  <tr>
    <td width="100%">当前位置： 系统管理  &gt; 科目管理</td>
  </tr>
</table>
<center><form name="admin_sub_add" method="POST" action="admin_subjectadd.jsp">
    <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="558" id="AutoNumber3" height="20">
      <tr>
        <td width="65" bgcolor="#FFFDE8" background="../images/admin_bg_1.gif">
          <p align="center"><b><font color="#FFFFFF">科目名称</font></b></td>
        <td bgcolor="#FFFDE8" width="198"> <p align="left">
            <input type="text" name="subject_name" size="33" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()"     class="inputnormal" value="请输入科目名称">
        </td>
		<td width="80" bgcolor="#FFFDE8" background="../images/admin_bg_1.gif">
        <p align="center"><b><font color="#FFFFFF">计算机等级</font></b></td>

        <td bgcolor="#FFFDE8" width="85"><select name="grade" id="grade">

            <%Tools.showGradeOption(con,out); %>

        </select></td>
        <td width="78" bgcolor="#FFFDE8"> <p align="center">
            <input border="0" value="添 加" name="I1" type="submit" class="s02">
        </td>
      </tr>
    </table>
  </form>
</center>

<p><center>
  </center>
<br>
</p>
<center>
<form name="admin_sub_del" method="get" onSubmit="return submitit(this)">
    <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="362" id="AutoNumber1">
      <tr    class="trh">
        <td width="27" align="center" bgcolor="#E1E1E1" height="20"><input type=checkbox name=del_all1 value=1 onclick=FanAll(adminbanji)></td>
        <td width="36" align="center" bgcolor="#E1E1E1"><font color="#FFFFFF"><b>序号</b></font></td>
        <td align="center" bgcolor="#E1E1E1" width="118"> <font color="#FFFFFF">
          <b>科目</b> </font></td>
        <td align="center" bgcolor="#E1E1E1" width="143"> <font color="#FFFFFF">
          <b>计算机等级</b> </font></td>
      </tr>

	  <%
        int i=1;
        while(rs.next()){%>

      <tr   class="trh1">
        <td align="center"   width="27"> <input type="checkbox" name="id" value="<%=rs.getString("ID")%>"></td>
        <td align="center" width="36"><%=i%>　</td>
        <td width="118" align="center"><%=""+rs.getString("name")%>&nbsp; </td>
        <td width="143" align="center"><%=""+rs.getString("gn")%>&nbsp;</td>
      </tr>
      <%
      i++;
      }
      rs.close();
      pstmt.close();
      %>

      <caption>
      <p align="right">
        <input type="submit" value="删除所选项" name="del" onClick="delit(admin_sub_del)" class="s02">

      </p>
      </caption>
    </table>
  </form>
</center>
</body>

</html>

<%}
catch(SQLException se){
    System.out.print(se.toString());
    out.print(se.toString() );
}
finally{
    DBCon.dropConnection();
}
%>