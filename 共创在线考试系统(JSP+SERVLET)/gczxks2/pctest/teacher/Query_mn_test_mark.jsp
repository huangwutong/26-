<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "jinghua.chart.servlet.WebHitChart" %>
<%@ page import = "jinghua.chart.servlet.WebHitDataSet" %>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;

boolean debug=false;
class Student{
    String id;
    String name;
    String mark;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name;
        return temp;
   }
};
ArrayList students=null;
Statement stmt=null;
ResultSet rs=null;
String sql="";
String testname=null;
int markbegin=0;
int markend=0;
long testid=0;
String mn_testID=null;
%>
<%
try{
	 testid=Long.parseLong(request.getParameter("testid"));
	 markbegin=Integer.parseInt(request.getParameter("markbegin"));
	 markend=Integer.parseInt(request.getParameter("markend"));
	 mn_testID=request.getParameter("mn_testID");
}
catch(Exception e){
	Tools.debugPrintln(e.toString());
	throw new Exception("页面缺少调用参数！");

}
if(debug){
	out.print("<br>markbegin="+request.getParameter("markbegin"));
	out.print("<br>markend="+request.getParameter("markend"));
	out.print("<br>testid="+request.getParameter("testid"));
}
String filename = WebHitChart.generateMn_TestBarChart(testid, session, new PrintWriter(out));
String graphURL =request.getContextPath()+"/chart/temp/" + filename;

try{
    con=DBCon.getConnection();
    sql="SELECT   `test`.`title` FROM  `test`"+
        " WHERE  (`test`.`id` = "+testid+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(rs.next())
        testname=rs.getString("title");
    else
        testname="";

	//详细信息
	sql="SELECT   `mn_scores`.`score`,  `userinfo`.`vcName`,  `mn_scores`.`stu_id`"+
		" FROM  `mn_scores`"+
		" LEFT OUTER JOIN `userinfo` ON (`mn_scores`.`stu_id` = `userinfo`.`vcUserNo`)"+
		" WHERE  (`mn_scores`.`test_id` ="+testid+") AND "+
		"  (`mn_scores`.`score` >="+markbegin+") AND "+
		"  (`mn_scores`.`score` <="+markend+")"+
        "  ORDER BY `mn_scores`.`score` DESC";
	if(debug) out.print("<br> info sql="+sql);

    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
	students=new ArrayList();
    while(rs.next()){
    	Student s=new Student();
        s.id=rs.getString("stu_id");
        s.name=rs.getString("vcName");
        s.mark=String.valueOf(rs.getInt("score"));;
        students.add(s);
    }
    rs.close();
    stmt.close();


%>

<script language="JavaScript" type="text/JavaScript">
function gotestpaper(){

	document.myform.method = "POST";
    document.myform.action = "Query_test_mn.jsp?mnID=<%=mn_testID%>";
    document.myform.target="_self";
    document.myform.submit();
}
</script>

<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<TITLE>考试系统-正式考试成绩查询</TITLE>
<SCRIPT language=JavaScript>
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;


//-->
</SCRIPT>


<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK
href="../errorpad/style/style.css" type=text/css rel=stylesheet>


<META content="MSHTML 6.00.2462.0" name=GENERATOR>
<link rel="stylesheet" type="text/css" href="../css.css">
</HEAD>
<BODY bgColor=#ffffff text=#000000 onLoad="InitMyform()">

<CENTER>
  <FORM name="myform" id="myform">
  
<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="../errorpad/images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="../errorpad/images/test_pop_02.gif"
      width=134></TD>
        </TR></TBODY></TABLE>
  <p><strong><font color="#3366FF" size="+2" face="黑体">考试系统正式考试成绩查询结果</font></strong> 
    <!--begin test -->
  </p>
   <strong> </strong> <strong><%=testname%></strong> 
  <TABLE width=100% height="60" border=0 cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD height="75"  align=middle> <table width="630" height="405" border="0" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
            <tr valign="middle">
              <td> <p align="center">
<img src="<%= graphURL %>" width=500 height=350 border=0 usemap="#<%= filename %>"></p></td>
            </tr>
            <tr valign="middle">
              <td height="18" align="center" valign="middle" nowrap bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td height="20" align="center" valign="middle" nowrap bgcolor="#FFFFFF"><div align="left">
                  <font size="+1">结果：分数在<strong><%=markbegin%></strong>和<strong><%=markend%></strong>之间的考生有<strong><%=students.size()%></strong>人</font></div></td>
            </tr>
          </table>
          &nbsp;<br>

          <TABLE width=630 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
            <TBODY>
			<TR>
                <th width="70" height=22 nowrap  class=l><strong>学号</strong></th>
                <th width="70" nowrap  class=l><strong>姓名</strong></th>
                <th width="70" nowrap  class=l><strong>分数</strong></th>
                <th width="70" nowrap  class=l><strong>学号</strong></th>
                <th width="70" nowrap  class=l><strong>姓名</strong></th>
                <th width="70" nowrap  class=l><strong>分数</strong></th>
                <th width="70" nowrap  class=l><strong>学号</strong></th>
                <th width="70" nowrap  class=l><strong>姓名</strong></th>
                <th width="70" nowrap  class=l><strong>分数</strong></th>
              </TR>
 <% Iterator iter = students.listIterator();
	while (iter.hasNext()) {%>
              <TR>
              <% Student s=(Student)iter.next();%>
                <td height=22 nowrap  class=l><div align="center"><%=s.id%></div></td>
                <td nowrap  class=l><div align="center"><%=s.name%></div></td>
                <td nowrap  class=l><div align="center"><%=s.mark%></div></td>
                 <% if(iter.hasNext()){
                 s=(Student)iter.next();%>
                <td height=22 nowrap  class=l><div align="center"><%=s.id%></div></td>
                <td nowrap  class=l><div align="center"><%=s.name%></div></td>
                <td nowrap  class=l><div align="center"><%=s.mark%></div></td>
                <%}else{%>
                <td nowrap  class=l><div align="center"></div></td>
                <td nowrap  class=l><div align="center"></div></td>
                <td nowrap  class=l><div align="center"></div></td>
                <%}%>

                <% if(iter.hasNext()){
                 s=(Student)iter.next();%>
                <td height=22 nowrap  class=l><div align="center"><%=s.id%></div></td>
                <td nowrap  class=l><div align="center"><%=s.name%></div></td>
                <td nowrap  class=l><div align="center"><%=s.mark%></div></td>
                <%}else{%>
                <td nowrap  class=l><div align="center"></div></td>
                <td nowrap  class=l><div align="center"></div></td>
                <td nowrap  class=l><div align="center"></div></td>
                <%}%>
              </TR>
<%}%>
            </TBODY>
          </TABLE>
          <p align="center"> 
            <input name="goback" type="button" class="s03" id="goback"  onClick="gotestpaper()" value="返回">
          </p>
          <p>&nbsp;</p></TD>
      </TR>
    </TBODY>
  </TABLE>
  </FORM>
  <div align="center"></div>
  <p>
    
  <!--end test -->
  <!--begin bottom -->
  <!--end bottom -->
</CENTER>
</BODY>
</HTML>

<%}
catch(SQLException se){
    out.println("<br>sql="+sql);
    out.println("<br>"+se.toString());
}
catch(Exception e){
    out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
