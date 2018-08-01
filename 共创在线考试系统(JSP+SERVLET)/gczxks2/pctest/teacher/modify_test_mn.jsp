<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>


<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
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
boolean debug=false;


Statement stmt=null;
ResultSet rs=null;
String sql="";
String mnName=null;
int mntotalmark=0;
%>
<%

ArrayList testSet=new ArrayList();
String testIDs=null;
try{
    con=DBCon.getConnection();

String mn_testID=request.getParameter("mnID");
if(mn_testID==null)
	throw new Exception("页面缺少调用参数！");


	sql="SELECT   `mn_test`.`test_paper`,`mn_test`.`mntotalmark`,`mn_test`.`name` FROM  `mn_test`"+
		" WHERE   `mn_test`.`id`="+mn_testID;
	stmt=con.createStatement();
	rs=stmt.executeQuery(sql);

	if(rs.next()){
		testIDs=rs.getString("test_paper");
		mnName=rs.getString("name");
		mntotalmark=rs.getInt("mntotalmark");
	}
	else
	{
		jinghua.Tools.showalert("没有查询到有关该正式考试的试题数!",out);
		return;
		
	}
	if(testIDs==null)
	{
		jinghua.Tools.showalert("没有查询到有关该正式考试的试题数!",out);
		return;
	}

	rs.close();
	stmt.close();

	sql="SELECT   `test`.`id`,  `grade`.`Name` AS `gradename`,"+
    "  `test`.`title` AS `testname`,  `test`.`mark`,  `test`.`date` AS `testdate`"+
    "  FROM  `test`  LEFT OUTER JOIN `grade` ON (`test`.`gradenote` = `grade`.`note`)"+
	"  WHERE `test`.`id` IN("+testIDs+")";

    if(debug) out.println("<br>test sql="+sql);
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    while(rs.next()){
    	Test t=new Test();
        t.id=rs.getString("id");
        t.name=rs.getString("testname");
        t.grade=rs.getString("gradename");
        t.totalMark=rs.getString("mark");
		t.testclass="正式考试";
        t.time=rs.getString("testdate");
        testSet.add(t);
    }
    rs.close();
    stmt.close();


%>


<script language="JavaScript">
function CheckForm(f)
{
	

	if( f.mntotalmark.value.length<1)
	{
	    alert("您还没有输入分数!");
		return false;
	}

	if(!isNumberString(f.mntotalmark.value,"1234567890."))
	{
	    alert("嘿！您在分数下限里填了东西,但怎么不是数字呢？\n");
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
function gotestpaper(){

	document.myform.method = "POST";
    document.myform.action = "modify_test.jsp";
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
<SCRIPT src=""></SCRIPT>

<SCRIPT src=""></SCRIPT>

<SCRIPT src=""></SCRIPT>

<SCRIPT src=""></SCRIPT>

<SCRIPT src=""></SCRIPT>

<META content="MSHTML 6.00.2462.0" name=GENERATOR>
<link rel="stylesheet" type="text/css" href="../css.css">
</HEAD>
<BODY bgColor=#ffffff text=#000000 >

<CENTER>

<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="../errorpad/images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="../errorpad/images/test_pop_02.gif"
      width=134></TD>
        </TR></TBODY></TABLE>
  <strong><font color="#3366FF" size="+2" face="黑体">正式考试试卷修改</font></strong>
  <!--begin test -->
  <FORM action=modify_mn_test_totalmark.jsp method=post name=myform target="_self" id="myform" onSubmit="return CheckForm(this)">
    <TABLE width=100% height="60" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>


      </TBODY>
    </TABLE>

  <div align="center"><strong><%=mnName%></strong>
    <%if (testSet.size()>0){
 %>
  </div>

    <TABLE width=600 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
        <TR>
          <td width="587" height=22 bgColor=#E3E3E3 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="42" height="20" nowrap><div align="center"></div></td>
                <td width="239" nowrap> <div align="left"><strong>试卷名称</strong></div></td>
                <td width="149" nowrap><div align="center"><strong>考试发布时间</strong></div></td>
                <td width="78" nowrap><div align="center"><strong>考试类型</strong></div></td>
                <td width="84" nowrap><div align="center"><strong>总分</strong></div></td>
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
                <td width="41" height="20" nowrap><div align="center"> </div></td>
                <td width="238" nowrap> <div align="left">
				<a href="modify_test_mn_paper.jsp?testID=<%=t.id%>&mnID=<%=mn_testID%>" target="_self"><%=t.name%></a></div></td>
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
    <p>&nbsp;</p>
    <table width=600 border=1 align=center cellspacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      
      <tbody>
        <tr>
          <td width="587" height=75 bgcolor=#E3E3E3 class=l>
            <table width="100%" border="0">
              <tr>
                <td><table width="100%" border="0">
                    <tr>
                      <td width="4%">&nbsp;</td>
                      <td width="26%" nowrap><strong>正式考试的总分合计为：</strong></td>
                      <td width="70%" nowrap><strong><%=mntotalmark%></strong></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0">
                    <tr>
                      <td width="4%" nowrap>&nbsp;</td>
                      <td width="50%" nowrap><strong>如果正式考试的总分合计不对，重新将其设置为：</strong></td>
                      <td width="18%"><input name="mntotalmark" type="text" id="mntotalmark3" size="10" maxlength="10"></td>
                      <td width="28%"><input name="Submit" type="submit" class="s03" value="重设总分"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </tbody>
    </table>




    <br>
    <input name="Submit2" type="button" class="s03" onClick="gotestpaper()" value="返回">
    <input name="mn_testID" type="hidden" id="mn_testID" value="<%=mn_testID%>">
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
