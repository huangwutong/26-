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
	int testnum;

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
String [] question=null;
ArrayList testSet=new ArrayList();
String testname=null;
String paper=null;
String testIDs=null;
Test test=new Test();
StringBuffer sb=null;
try{
    con=DBCon.getConnection();

test.id=request.getParameter("testID");

if(test.id==null)
	throw new Exception("页面缺少调用参数！");


	sql="SELECT  `test`.`paper`,`test`.`testnum`,  `test`.`title`,  `test`.`date`,  `test`.`mark`"+
		"  FROM  `test` WHERE  (`test`.`id` = "+test.id+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(rs.next()){
        test.name=rs.getString("title");
		test.time=rs.getString("date");
		test.totalMark=String.valueOf(rs.getFloat("mark"));
        paper=rs.getString("paper");
		test.testclass="单元测试";
		test.testnum=rs.getInt("testnum");
    }
    rs.close();
    stmt.close();

	if(paper==null)
    	throw new Exception("没有查询到试卷内容!");
	if(paper.equals(""))
    	throw new Exception("没有查询到试卷内容!");

	 question=paper.split("#");
     sb=new StringBuffer();
     //585@A@5@A#586@B@6@B#587@C@7@C#588@D@8@E#
    for(int j=0;j<question.length;j++){
        sb.append(question[j].substring(0,question[j].indexOf("@"))+",");
    }
    paper=sb.toString().substring(0,sb.toString().length()-1);
	sql="select ID,QuestText,Tip,Mark,Answer from question "+
		" where id in ("+paper+") order by id";

    if(debug) out.println("<br>test paper="+paper+
							"<br>test sql="+sql);
	//试题记录集
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);

%>


<script language="JavaScript">
function gotestpaper(){

	document.myform.method = "POST";
    document.myform.action = "modify_test.jsp";
    document.myform.target="_self";
    document.myform.submit();
}
function del_check()
{
	var count = myform.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(myform.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("您还没有选择要删除的试题");
	    return(false);
	 }
  	else
  	{
        	if(confirm("将删除所有选择的试题吗？"))
        	{
                document.myform.method = "POST";
                document.myform.action = "unit_test_quest_del.jsp";
                document.myform.target="_self";
                document.myform.submit();
        	}
        	else
        	{
                document.myform.method = "GET";
                document.myform.action = "";
		}
     }
     return false;
}
function add_check()
{
	document.myform.method = "POST";
    document.myform.action = "unit_test_quest_add.jsp";
    document.myform.target="_self";
    document.myform.submit();
        
    return false;
}
function deactive_check()
{
	var count = myform.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(myform.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("您还没有选择要注销的试卷!");
	    return(false);
	 }
  	else
  	{
        	if(confirm("注销所有选择的试卷吗？"))
        	{
                document.myform.method = "POST";
                document.myform.action = "test_deactivde.jsp";
                document.myform.target="_self";
                document.myform.submit();
        	}
        	else
        	{
                document.myform.method = "GET";
                document.myform.action = "";
		}
         }
         return false;
}
function subform(stract)
{
	switch (stract){
		case "del":
            del_check();
			break;
		case "add":
            add_check();
			break;
		case "deactive":
			deactive_check();
			break;

	}
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

<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="../errorpad/images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="../errorpad/images/test_pop_02.gif"
      width=134></TD>
        </TR></TBODY></TABLE>
  <strong><font color="#3366FF" size="+2" face="黑体">自由测试试卷修改</font></strong> 
  <!--begin test -->
  <FORM action=Query_unit_test_mark.jsp method=post name=myform target="_self" id="myform" onSubmit="return CheckForm(this)">
    <TABLE width=100% height="60" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD height="75"  align=middle> <table width="600" height="62" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr> 
                <td height="58" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"><b><font color="#FFFFFF"> 
                  </font></b> 
                  <div align="center">
<table width="100%" border="0">
                      <tr> 
                        <td width="35%">&nbsp;</td>
                        <td width="16%"><input name="errDel" type="button" class="s03" id="errDel" value="删 除" border="0" onClick=subform("del")></td>
                        <td width="15%"><input name="errAscRate" type="button" class="s03" id="errAscRate2" value="添 加" border="0" onClick=subform("add")></td>
                        <td width="24%"> <input name="goback" type="button" class="s03" id="goback"  onClick="gotestpaper()" value="返回"></td>
                        <td width="10%">&nbsp;</td>
                      </tr>
                    </table>
                    
                  </div>
                  </td>
              </tr>
            </table></TD>
        </TR>

      </TBODY>
    </TABLE>



    <TABLE width=600 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
        <TR>
          <td width="587" height=30 bgColor=#E3E3E3 class=l> 
            <table width="100%" border="0" cellspacing="0" bgcolor="#FFFDE8">
              <tr bgcolor="#FFFDE8"> 
                <td width="47" height="20" nowrap background="../images/admin_bg_1.gif"> 
                  <div align="center"></div></td>
                <td width="197" height="30" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
                  <div align="left"><strong>试卷名称</strong></div></td>
                <td width="138" nowrap background="../images/admin_bg_1.gif"> 
                  <div align="center"><strong>考试发布时间</strong></div></td>
                <td width="117" nowrap background="../images/admin_bg_1.gif"> 
                  <div align="center"><strong>考试类型</strong></div></td>
                <td width="93" nowrap background="../images/admin_bg_1.gif"> 
                  <div align="left"><strong>总分</strong></div></td>
              </tr>
            </table></td>
        </TR>

            <TR>
          <td width="587" height=22 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="43" height="20" nowrap><div align="center"> </div></td>
                <td width="201" nowrap> <div align="left"><%=test.name%></div></td>
                <td width="136" nowrap><div align="center"><%=test.time%></div></td>
                <td width="118" nowrap><div align="center"><%=test.testclass%></div></td>
                <td width="94" nowrap> <div align="left"><%=test.totalMark%></div></td>
              </tr>
            </table></td>
        </TR>



      </TBODY>
    </TABLE>

    <br>
    <table  width="600" height="82" border="1" cellspacing="1" bordercolor="#799AE1" id="AutoNumber1" style="border-collapse: collapse">
      <tr class="trh">
        <td width="52" height="30" align="center" nowrap background="../images/admin_bg_1.gif"> 
          <font color="#FFFFFF"><b>序号</b></font></td>
        <td width="535" height="30" align="center" nowrap background="../images/admin_bg_1.gif"> 
          <p align="center"><font color="#FFFFFF"> <b>单项选择题（共<%=test.testnum%>&nbsp;题,<%=test.totalMark%>分）</b></font></td>
      </tr>
      <%	int testNumber=0;

		while(rs.next()){%>
      <tr class="trh1">
        <td width="52"   height="35" align="center" nowrap bgcolor="#FFFFFF">　 
          <center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#FFFFFF"> 
                  <div align="center">
                    <input name="id" type="checkbox" id="id" value="<%=rs.getInt("ID")%>">
                    <%out.print(testNumber+1);%>
                    . </div></td>
              </tr>
              <tr>
                <td bgcolor="#FFFFFF">
<div align="center">(<%=rs.getInt("Mark")%>分)</div></td>
              </tr>
            </table>
          </center>
          &nbsp;</td>
        <td width="535" height="35" align="left" bgcolor="#FFFFFF"><br>
          <%
			out.print("题目:<br>"+rs.getString("QuestText"));
			out.print("答案:&nbsp;&nbsp;"+rs.getString("Answer"));
			out.print("<br>提示：<br>"+""+rs.getString("Tip"));
			testNumber++;
		%>
        </td>
      </tr>
      <%}
    rs.close();
    stmt.close();
    %>

    </table>
    <p>
    <input name="testID" type="hidden" id="testID" value="<%=test.id%>">

</FORM>

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
