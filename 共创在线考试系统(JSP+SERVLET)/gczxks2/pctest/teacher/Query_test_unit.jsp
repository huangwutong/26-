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
class Test{
    String id;
    String name;
    String grade;
    String time;
    String totalMark;
    String testclass;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name;
        return temp;
   }
};



Statement stmt=null;
ResultSet rs=null;
String sql="";


%>
<%

ArrayList testSet=new ArrayList();
String testname=null;
String testIDs=null;
try{
    con=DBCon.getConnection();

String testID=request.getParameter("testID");

if(testID==null)
	throw new Exception("ҳ��ȱ�ٵ��ò�����");
long testid=Long.parseLong(testID);
String filename = WebHitChart.generate_TestBarChart(testid, session, new PrintWriter(out));
String graphURL =  request.getContextPath()+"/chart/temp/" + filename;


	sql="SELECT   `test`.`title` FROM  `test`"+
        " WHERE  (`test`.`id` = "+testid+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(rs.next()){
        testname=rs.getString("title");
        rs.close();
	    stmt.close();
    }
    else{
        testname="";
        rs.close();
	    stmt.close();
		throw new Exception("û�в�ѯ���йظÿ��Ե���Ϣ��");
    }



	sql="SELECT   `test`.`id`,  `grade`.`Name` AS `gradename`,"+
    "  `test`.`title` AS `testname`,  `test`.`mark`,  `test`.`date` AS `testdate`"+
    "  FROM  `test`  LEFT OUTER JOIN `grade` ON (`test`.`gradenote` = `grade`.`note`)"+
	"  WHERE `test`.`id` ="+testid;

    if(debug) out.println("<br>test sql="+sql);
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    while(rs.next()){
    	Test t=new Test();
        t.id=rs.getString("id");
        t.name=rs.getString("testname");
        t.grade=rs.getString("gradename");
        t.totalMark=rs.getString("mark");
		t.testclass="��ʽ����";
        t.time=rs.getString("testdate");
        testSet.add(t);
    }
    rs.close();
    stmt.close();


%>

<script language="JavaScript" type="text/JavaScript">
function gotestpaper(){

	document.myform.method = "POST";
    document.myform.action = "Query_test.jsp";
    document.myform.target="_self";
    document.myform.submit();
}
</script>
<script language="JavaScript">
function CheckForm(f)
{
	var count = f.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(f.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("����û��ѡ��Ҫ��ѯ�������Ծ�!");
	    return(false);
	 }

	if( f.markbegin.value.length<1)
	{
	    alert("�����������ѯ����������!");
		return false;
	}

	if(!isNumberString(f.markbegin.value,"1234567890."))
	{
	    alert("�٣����ڷ������������˶���,����ô���������أ�\n");
	    return false;
	}

    if( f.markend.value.length<1)
	{
	    alert("�����������ѯ����������!");
		return false;
	}

	if(!isNumberString(f.markend.value,"1234567890."))
	{
	    alert("�٣����ڷ������������˶���,����ô���������أ�\n");
	    return false;
	}
	return true;
}

function isNumberString (InString,RefString)
{
if(InString.length==0) return (false);
for (Count=0; Count < InString.length; Count++)  {
	TempChar= InString.substring (Count, Count+1);
	if (RefString.indexOf (TempChar, 0)==-1)
	return (false);
}
return (true);
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

<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="../errorpad/images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="../errorpad/images/test_pop_02.gif"
      width=134></TD>
        </TR></TBODY></TABLE>
  <strong><font color="#3366FF" size="+2" face="����">����ϵͳ���Գɼ���ѯ</font></strong>
  <!--begin test -->
  <FORM action=Query_unit_test_mark.jsp method=post name=myform target="_self" id="myform" onSubmit="return CheckForm(this)">
    <TABLE width=100% height="60" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD height="75"  align=middle>
            <table width="447" height="44" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr valign="middle">
                <td width="297" height="40" align="center" valign="middle" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="71%" height="24" valign="middle" nowrap><div align="center">�����Σ�����
                          <input name="markbegin" type="text" id="markbegin" size="10" maxlength="10">
                          ��
                          <input name="markend" type="text" id="markend" size="10" maxlength="10">
                        </div></td>
                    </tr>
                  </table>
                </td>
                <td width="123" align="center" valign="middle" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><input type="submit"  class="s03" name="Submit" value="��ѯ"></td>
                      <td><input name="goback" type="button" class="s03" id="goback2"  onClick="gotestpaper()" value="����"></td>
                    </tr>
                  </table> 
                  
                </td>
              </tr>
            </table>
            </TD>
        </TR>

      </TBODY>
    </TABLE>

    <div align="center"> 
      <%if (testSet.size()>0){
 %>
  </div>

    <TABLE width=600 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
        <TR>
          <td width="587" height=22 bgColor=#E3E3E3 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="83" height="20" nowrap><div align="center"></div></td>
                <td width="198" nowrap> <div align="left"><strong>�Ծ�����</strong></div></td>
                <td width="149" nowrap><div align="center"><strong>���Է���ʱ��</strong></div></td>
                <td width="78" nowrap><div align="center"><strong>��������</strong></div></td>
                <td width="84" nowrap><div align="center"><strong>�ܷ�</strong></div></td>
              </tr>
            </table></td>
        </TR>
<%          Iterator iter = testSet.listIterator();
            while (iter.hasNext()) {
                Test t = (Test) iter.next();
%>
            <TR>
          <td width="587" height=22 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="82" height="20" nowrap><div align="center">
                    <input name="testid" type="radio" value="<%=t.id%>" checked>
                  </div></td>
                <td width="197" nowrap> <div align="left"><%=t.name%></div></td>
                <td width="153" nowrap><div align="center"><%=t.time%></div></td>
                <td width="77" nowrap><div align="center"><%=t.testclass%></div></td>
                <td width="83" nowrap> <div align="center"><%=t.totalMark%></div></td>
              </tr>
            </table></td>
        </TR>


<%
            }
%>
      </TBODY>
    </TABLE>
    <p>
    <table width="397" height="85" border="0" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
      <tr valign="middle">
        <td> <p align="center"><img src="<%= graphURL %>" width=500 height=350 border=0 usemap="#<%= filename %>"></p></td>
      </tr>
    </table>
<input name="stu_id" type="hidden" id="studentid2" value="">

</FORM>
<%}
else{
   %>
  <%
}
%>
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
