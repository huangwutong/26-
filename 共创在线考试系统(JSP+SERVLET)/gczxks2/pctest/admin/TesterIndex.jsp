<%@page contentType="text/html;charset=GB2312" %>

<%
request.setCharacterEncoding("gb2312");
webmaster.datamanager.Webdata webdb = new webmaster.datamanager.Webdata();


 %>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<META NAME="DESCRIPTION" CONTENT="">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Window-target" CONTENT="_top">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)">
<title>考生信息维护</title>
<link rel="stylesheet" href="../common/css/style.css" type="text/css">
<script src="../common/js/sys.js"></script>
<script>
	function setColor(e)
	{
		eval(e);
	}
</script>
<style type="text/css">
<!--
.style3 {font-size: 10pt}
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<form name="form1" action="success.htm">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#EEEEEE">

</table>
  <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
    <tr> 
      <td height="71" align="center" valign="middle" class="titlefont1 style3">考生信息维护</td>
    </tr>
    <tr> 
      <td height="14" class="xxline"><img src="../images/1px.gif" width="1" height="1"></td>
    </tr>
    
  </table>
  <table width="95%" border="0" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
      
      <td height="44" align="right" ><input type="button" class="button_xh1" onClick="callSysWithScroll('TesterAdd.jsp',600,500)" value="添加考生"></td>
    </tr>
  </table>
  <br>
  

  <table width="95%" border="0" cellspacing="0" cellpadding="3" align="center" 　bgcolor="#000000">
    <tr> 
      <td width="10%" height="27" align="center" class="tdtopline"><strong>序号</strong></td>
      <td width="24%" align="center" class="tdtopline"><strong> 
        用户名      </strong></td>
      <td width="24%" align="center" class="tdtopline"><strong>用户姓名</strong></td>
      <td width="24%" align="center" class="tdtopline"><strong>维护日期</strong></td>
      <td width="18%" align="center" class="tdtopline"><strong>备注</strong></td>
    </tr>
	
  <%
int i = 0;
int j=0;
java.sql.ResultSet  rs=null;
rs = webdb.query("select * from userinfo order by id");

while(rs.next())
{
i++;j++;
String lname=webdb.getRsStr(rs,"vcUserNo");
if(lname==null || lname.equals(""))
	lname="&nbsp;";

String username=webdb.getRsStr(rs,"vcName");
if(username==null || username.equals(""))
	username="&nbsp;";

String damod=webdb.getRsStr(rs,"ModifyDate");
if(damod==null || damod.equals(""))
	damod="&nbsp;";

String memo=webdb.getRsStr(rs,"vcMemo");
if(memo==null || memo.equals(""))
	memo="&nbsp;";


	

%>	
	
	
	
<tr bgcolor="f7f7f7"><td height=2 colspan="5"></td></tr>
<tr onClick="callSysWithScroll('TesterMod.jsp?iID=<%=webdb.getRsStr(rs,"id")%>',600,500)" bgcolor=ffffff align="center"  id="b<%=i%>" onMouseOver="setColor('b<%=i%>.bgColor=\'#99CCFF\'')" onMouseOut="setColor('b<%=i%>.bgColor=\'ffffff\'')">
	  <td height="28" align="center" ><%=j%></td>
      <td  align="center"><%=lname%></td>
      <td  align="center"><%=username%>1</td>
      <td  align="center"><%=damod%></td>
      <td  align="center"><%=memo%></td>
    
  <%
}
if(rs!=null)rs=null;
webdb.close();
%>  
  </table>
  <table width="95%" border="0" cellspacing="2" cellpadding="0" align="center">
    <tr> 
      <td>&nbsp; </td>
    </tr>
    <tr> 
      <td class="xxline"><img src="../images/1px.gif" width="1" height="1"></td>
    </tr>
    <tr> 
      <td height="34" align="center" class="titlefont1">（点击列表查看和修改详细信息）</td>
    </tr>
  </table>
</form>
</body>
</html>
