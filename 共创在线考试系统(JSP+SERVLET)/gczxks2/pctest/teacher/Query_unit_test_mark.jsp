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
%>
<%
try{
	 testid=Long.parseLong(request.getParameter("testid"));
	 markbegin=Integer.parseInt(request.getParameter("markbegin"));
	 markend=Integer.parseInt(request.getParameter("markend"));
}
catch(Exception e){
	Tools.debugPrintln(e.toString());
	throw new Exception("ҳ��ȱ�ٵ��ò�����");

}
if(debug){
	out.print("<br>markbegin="+request.getParameter("markbegin"));
	out.print("<br>markend="+request.getParameter("markend"));
	out.print("<br>testid="+request.getParameter("testid"));
}
String filename = WebHitChart.generate_TestBarChart(testid, session, new PrintWriter(out));
String graphURL = request.getContextPath()+"/chart/temp/" + filename;

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

	//��ϸ��Ϣ
	sql="SELECT   `scores`.`score`,  `userinfo`.`vcName`,  `scores`.`stu_id`"+
		" FROM  `scores`"+
		" LEFT OUTER JOIN `userinfo` ON (`scores`.`stu_id` = `userinfo`.`vcUserNo`)"+
		" WHERE  (`scores`.`test_id` ="+testid+") AND "+
		"  (`scores`.`score` >="+markbegin+") AND "+
		"  (`scores`.`score` <="+markend+")"+
        "  ORDER BY `scores`.`score` DESC";
	if(debug) out.print("<br> info sql="+sql);

    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
	students=new ArrayList();
    while(rs.next()){
    	Student s=new Student();
        s.id=rs.getString("stu_id");
        s.name=rs.getString("vcName");
        s.mark=String.valueOf(rs.getInt("score"));
        students.add(s);
    }
    rs.close();
    stmt.close();


%>

<script language="JavaScript" type="text/JavaScript">
function gotestpaper(){

	document.myform.method = "POST";
    document.myform.action = "Query_test_unit.jsp?testID=<%=testid%>";
    document.myform.target="_self";
    document.myform.submit();
}
</script>


<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<TITLE>����ϵͳ-��ʽ���Գɼ���ѯ</TITLE>
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
  <p><strong><font color="#3366FF" size="+2" face="����">����ϵͳ���Գɼ���ѯ���</font></strong>
    <!--begin test -->
  </p>
  <p> <strong> </strong> <strong><%=testname%></strong> </p>
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
                  <font size="+1">�����������<strong><%=markbegin%></strong>��<strong><%=markend%></strong>֮��Ŀ�����<strong><%=students.size()%></strong>��</font></div></td>
            </tr>
          </table>
          &nbsp;<br>

          <TABLE width=630 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
            <TBODY>
			<TR>
                <th width="70" height=22 nowrap  class=l><strong>ѧ��</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
                <th width="70" nowrap  class=l><strong>ѧ��</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
                <th width="70" nowrap  class=l><strong>ѧ��</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
                <th width="70" nowrap  class=l><strong>����</strong></th>
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
            <input name="goback" type="button" class="s03" id="goback"  onClick="gotestpaper()" value="����">
          </p>
          <p>&nbsp;</p></TD>
      </TR>
    </TBODY>
  </TABLE>
  </FORM>
  <div align="center"></div>
  <p>
    <input name="stu_id" type="hidden" id="studentid2" value="">
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
