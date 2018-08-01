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

    String sql="SELECT   `grade`.`Name` AS `gn`,  `knowpoint`.`ID`,  `knowpoint`.`Name`, "+
        " `subject`.`Name` AS `sn`,  `knowpoint`.`gradeid` FROM  `knowpoint` "+
        "  LEFT OUTER JOIN `subject` ON (`knowpoint`.`subid` = `subject`.`ID`) "+
        "  LEFT OUTER JOIN `grade` ON (`knowpoint`.`gradenote` = `grade`.`note`) "+
        "ORDER BY   `grade`.`ID`,  `subject`.`ID`";
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();



%>
<script language="javascript">
function submitit(myform)
{

}
function checkdata(){
    if( myform.selgrade.selectedIndex == 0) {
        alert("��ѡ��֪ʶ��ļ�����ȼ���Ϣ!")
        return false;
    }
    if(myform.selsubject.selectedIndex==0){
        alert("��ѡ��֪ʶ��Ŀ�Ŀ��Ϣ!")
        return false;
    }
}


function delit(myform)
{
  if (confirm("��ɾ������ѡ���֪ʶ�����ݣ�"))
  {
    myform.action="admin_knowdel.jsp";
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
<%String gs=Tools.selgrade_sub(con);
out.print(gs);
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ϵͳ���� | ��Ŀ����</title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>

<body>

<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="25">
  <tr>
    <td width="100%">��ǰλ�ã� ϵͳ���� &gt; ֪ʶ�����</td>
  </tr>
</table>
<center><form name="myform" method="POST" action="admin_knowadd.jsp" onSubmit="return checkdata()">
    <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="654" id="AutoNumber3" height="20">
      <tr>
        <td width="69" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
        <p align="center"><b><font color="#FFFFFF">֪ʶ������</font></b></td>
        <td bgcolor="#FFFDE8" width="188"> <p align="left">
            <input type="text" name="name" size="33" onBlur="this.className='inputnormal'" onFocus="this.className='inputedit';this.select()"     class="inputnormal" value="������֪ʶ������">
        </td>
        <td width="86" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
        <p align="center"><b><font color="#FFFFFF">������ȼ�</font></b></td>
 <td bgcolor="#FFFDE8" width="77">


 <select name="selgrade" id="grade"
        onChange="changegs(document.myform.selgrade.options[document.myform.selgrade.selectedIndex].value)" size="1">
        <option selected value="temp">δѡ��</option>
            <%Tools.showGradeOption(con,out); %>
        </select></td>
        <td width="35" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
        <p align="center"><b><font color="#FFFFFF">��Ŀ</font></b></td>
        <td width="83" bgcolor="#FFFDE8">


<select name="selsubject" id="subject">
        <option selected value="temp">δѡ��</option>
        </select></td>
        <td width="78" bgcolor="#FFFDE8">
        <input border="0" value="�� ��" name="I1" type="submit" class="s02" onsubmit="return checkform1(this)"></td>
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
    <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="424" id="AutoNumber1">
      <tr    class="trh"> 
        <td width="36" align="center" bgcolor="#E1E1E1" height="20"><input type=checkbox name=del_all1 value=1 onclick=FanAll(adminbanji)></td>
        <td width="48" align="center" bgcolor="#E1E1E1"><font color="#FFFFFF"><b>���</b></font></td>
        <td align="center" bgcolor="#E1E1E1" width="175"> <font color="#FFFFFF"> 
          <b>֪ʶ��</b> </font></td>
        <td align="center" bgcolor="#E1E1E1" width="71"><font color="#FFFFFF"><b>��Ŀ</b> 
          </font></td>
        <td align="center" bgcolor="#E1E1E1" width="66"> <font color="#FFFFFF"> 
          <b>������ȼ�</b> </font></td>
      </tr>
      <%
      int i=1;
        while(rs.next()){%>
      <tr   class="trh1"> 
        <td align="center"   width="36"> <input type="checkbox" name="id" value="<%=rs.getString("ID")%>"></td>
        <td align="center" width="48"><%=i%>��</td>
        <td width="175" align="center"><%=""+rs.getString("name")%>&nbsp; </td>
        <td width="71" align="center"><%=rs.getString("sn")%>&nbsp;</td>
        <td width="66" align="center"><%=""+rs.getString("gn")%>&nbsp;</td>
      </tr>
      <%
      i++;}
      rs.close();
      pstmt.close();
      %>
      <caption>
      <p align="right"> 
        <input type="submit" value="ɾ����ѡ��" name="del" onClick="delit(admin_sub_del)" class="s02">
      </p>
      </caption>
    </table>
  </form>
</center>
</body>

</html>
<%
}
catch(SQLException se){
    out.print(se.toString() );
}
catch(Exception e){
    out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>