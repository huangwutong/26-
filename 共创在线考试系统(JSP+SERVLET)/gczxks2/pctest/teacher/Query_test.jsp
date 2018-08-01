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
String sqlCon=null;
int testNumber=0;
int EveryPage=5;//每页显示的记录数；
int OnPage=1; //当前显示的页数；
int Total=0;//记录的总数；
int TotalPage=0;//记录的总页数；
%>
<%
ArrayList testSet=new ArrayList();

try{
    con=DBCon.getConnection();



%>



<%
//构造查询条件
//String query_grade=(String)session.getAttribute("query_grade");
//String query_sub=(String)session.getAttribute("query_sub");
//String query_knowpoint=(String)session.getAttribute("query_knowpoint");
//String query_testtype=(String)session.getAttribute("query_testtype");
//String errorpad_errorcount=(String)session.getAttribute("errorpad_errorcount");
sqlCon="";
String query_grade=request.getParameter("Grade");
String query_sub=request.getParameter("Subject");
String query_knowpoint=request.getParameter("KnowPoint");
String query_testtype=request.getParameter("testtype");



if(query_grade!=null)
{
    session.setAttribute("query_grade",query_grade);
}
else
{
    query_grade=(String)session.getAttribute("query_grade");
}
if(query_sub!=null)
{
    session.setAttribute("query_sub",query_sub);
}else
{
    query_sub=(String)session.getAttribute("query_sub");
}
if(query_knowpoint!=null)
{
    session.setAttribute("query_knowpoint",query_knowpoint);
}
else
{
    query_knowpoint=(String)session.getAttribute("query_knowpoint");
}
if(query_testtype!=null)
{
    session.setAttribute("query_testtype",query_testtype);
}
else
{
    query_testtype=(String)session.getAttribute("query_testtype");
}

if(query_grade==null)
    query_grade="all";
if(query_sub==null)
    query_sub="all";
if(query_knowpoint==null)
    query_knowpoint="all";
if(query_testtype==null)
    query_testtype="2";

if(debug){
    out.print("<br>grade="+query_grade+
    "<br>sub="+query_sub+
    "<br>knowpoint="+query_knowpoint+
    "<br>testtype="+query_testtype
    );
}
sqlCon="";
int itesttype=Integer.parseInt(query_testtype);
switch (itesttype){
    case 2://单元测试
		sqlCon=" (test.status<>3)";
         if(query_grade!=null){
            if(!query_grade.equals("all")){
                if(query_grade.equals("c")){
                    if(sqlCon.equals(""))
                        sqlCon=" (test.gradenote='c1' OR test.gradenote='c2' OR test.gradenote='c3')";
                    else
                        sqlCon=sqlCon+ " AND "+" (test.gradenote='c1' OR test.gradenote='c2' OR test.gradenote='c3')";
                }else if(query_grade.equals("g")){
                    if(sqlCon.equals(""))
                        sqlCon=" (test.gradenote='g1' OR test.gradenote='g2' OR test.gradenote='g3l' OR test.gradenote='g3w')";
                    else
                        sqlCon=sqlCon+ " AND "+" (test.gradenote='g1' OR test.gradenote='g2' OR test.gradenote='g3l' OR test.gradenote='gw3')";
                }
            else
                if(sqlCon.equals(""))
					sqlCon=" (test.gradenote='"+query_grade+"')";
                else
                    sqlCon=sqlCon+" AND "+" (test.gradenote='"+query_grade+"')";
					
            }
        }
        if(debug)   out.println("<br>grade sql="+sqlCon);

        if(query_sub!=null){
        if(!query_sub.equals("all")){
            if (!sqlCon.equals(""))
                sqlCon=sqlCon +" AND (test.subid="+query_sub+")";
            else
                sqlCon=" (test.subid="+query_sub+")";
            }
        }
        if(debug)    out.println("<br>subject 4"+sqlCon);

        if(query_knowpoint!=null){
            if(!query_knowpoint.equals("all")){
                if(!sqlCon.equals(""))
                    sqlCon=sqlCon+" AND(test.knowpointid1="+query_knowpoint +
                        " OR test.knowpointid2="+query_knowpoint+
                        " OR test.knowpointid3="+query_knowpoint+")";
                else
                    sqlCon=" (test.knowpointid1="+query_knowpoint +
                        " OR test.knowpointid2="+query_knowpoint+
                        " OR test.knowpointid3="+query_knowpoint+")";
            }
        }
        if(debug)    out.println("<br>knowpoint sql="+sqlCon);
        sql="SELECT   `test`.`id`,  `grade`.`Name` AS `gradename`,"+
            "  `test`.`title` AS `testname`,  `test`.`mark`,  `test`.`date` AS `testdate`"+
            "  FROM  `test`  LEFT OUTER JOIN `grade` ON (`test`.`gradenote` = `grade`.`note`)";

        if(!sqlCon.equals("")) sql=sql+" WHERE "+sqlCon;
        sql=sql+" ORDER BY  `test`.`gradenote`,`test`.`subid`,`test`.`id`";

        if(debug) out.println("<br>test sql="+sql);
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            Test t=new Test();
            t.id=rs.getString("id");
            //<a href="Query_test_mn.jsp" target="_self">test</a>
            t.name="<a href="+"Query_test_unit.jsp?testID="+t.id+" target=\"_self\">"+
                        rs.getString("testname")+"</a>";
            t.grade=rs.getString("gradename");
            t.totalMark=rs.getString("mark");
            t.testclass="单元测试";
            t.time=rs.getString("testdate");
            testSet.add(t);
        }
        rs.close();
        stmt.close();

        break;
    case 3://正式考试
        if(query_grade!=null){
            if(!query_grade.equals("all")){
                if(query_grade.equals("c")){
                    if(sqlCon.equals(""))
                        sqlCon=" (mn_test.grade_note='c1' OR mn_test.grade_note='c2' OR mn_test.grade_note='c3')";
                    else
                        sqlCon=sqlCon+" AND "+" (mn_test.grade_note='c1' OR mn_test.grade_note='c2' OR mn_test.grade_note='c3')";
                }else if(query_grade.equals("g")){
                    if(sqlCon.equals(""))
                        sqlCon=" (mn_test.grade_note='g1' OR mn_test.grade_note='g2' OR mn_test.grade_note='g3l' OR mn_test.grade_note='g3w')";
                    else
                        sqlCon=sqlCon+" AND "+" (mn_test.grade_note='g1' OR mn_test.grade_note='g2' OR mn_test.grade_note='g3l' OR mn_test.grade_note='g3w')";
                }
            else  if(sqlCon.equals(""))
                    sqlCon=" (mn_test.grade_note='"+query_grade+"')";
                else
                    sqlCon=sqlCon+" AND "+" (mn_test.grade_note='"+query_grade+"')";
            }
        }
        if(debug)   out.println("<br>grade sql="+sqlCon);

        sql="SELECT   `mn_test`.`id`,  `mn_test`.`name` AS `testname`,"+
            "  `grade`.`Name` AS `gradename`,  `mn_test`.`mntotalmark`,"+
            "  CONCAT(`mn_test`.`begin_date`,\"至\",  `mn_test`.`end_date`) as testtime FROM  `mn_test`"+
            "  LEFT OUTER JOIN `grade` ON (`mn_test`.`grade_note` = `grade`.`note`)";
        if(!sqlCon.equals("")) sql=sql+" WHERE "+sqlCon;
        sql=sql+" ORDER BY  `mn_test`.`grade_note`,`mn_test`.`begin_date`";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            Test t=new Test();
            t.id=rs.getString("id");
            //<a href="Query_test_mn.jsp" target="_self">test</a>
            t.name="<a href="+"Query_test_mn.jsp?mnID="+t.id+" target=\"_self\">"+
                        rs.getString("testname")+"</a>";
            t.grade=rs.getString("gradename");
            t.totalMark=rs.getString("mntotalmark");
            t.testclass="正式考试";
            t.time=rs.getString("testtime");
            testSet.add(t);
        }
        rs.close();
        stmt.close();
        break;
    default:
}







if(debug)
    out.println("<br>at last sql="+sql);

//rs.last();//移到最后一条记录;
//Total=rs.getRow();//记录的总数；

//TotalPage=(Total%EveryPage==0)?(Total/EveryPage):(Total/EveryPage+1);


%>

<!--计算机等级，科目，知识点三个下拉列表框联动-->
<%
out.print(Tools.sub_know(con));
out.print(Tools.grade_sub(con));
%>
<script language="JavaScript">
function changegs(locationid){
	document.myform.Subject.length =1;
        document.myform.KnowPoint.length =1;
        var locationid=locationid;
        var i;
        for (i=0;i < gscount; i++){
            if (grade_sub[i][0] == locationid) {
	            document.myform.Subject.options[document.myform.Subject.length] = new Option(grade_sub[i][2], grade_sub[i][1]);
            }
	}
}

function changesk(locationid){
	document.myform.KnowPoint.length =1;
	var locationid=locationid;
	var i;
	for (i=0;i < gskcount; i++){
		if (grade_sub_know[i][1] == locationid){
			document.myform.KnowPoint.options[document.myform.KnowPoint.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
		}
	}
}


function delit(myform)
{
  if (confirm("将删除所有选择的知识点数据？"))
  {
    myform.action="errorpaddel.jsp";
    myfrom.target="_self";
    myform.submit();
  }
}
function del_check()
{
	var count = errorpad.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(errorpad.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("您还没有选择要删除的错题!");
	    return(false);
	 }
  	else
  	{
        	if(confirm("将删除所有选择的错题吗？"))
        	{
                document.errorpad.method = "POST";
                document.errorpad.action = "errorpad_del.jsp";
                document.errorpad.target="_self";
                document.errorpad.submit();
        	}
        	else
        	{
                document.form3.method = "GET";
                document.form3.action = "";
		}
         }
         return false;
}
function addrate_check()
{
	var count = errorpad.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(errorpad.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("您还没有选择要增加错误级别的错题!");
	    return(false);
	 }
  	else
  	{
        	if(confirm("增加所有选择的错题的错误级别吗？"))
        	{
                document.errorpad.method = "POST";
                document.errorpad.action = "errorpad_addrate.jsp";
                document.errorpad.target="_self";
                document.errorpad.submit();
        	}
        	else
        	{
                document.errorpad.method = "GET";
                document.errorpad.action = "";
		}
         }
         return false;
}
function decrate_check()
{
	var count = errorpad.elements.length;
	var noSelect = true;
 	for(var i=0;i<count;i++)
 	{
    	if(errorpad.elements[i].checked)
    		{
      		      noSelect = false;
		      break;
		}
  	}
	if(noSelect == true)
	{
	    alert("您还没有选择要降低错误级别的错题!");
	    return(false);
	 }
  	else
  	{
        	if(confirm("降低所有选择的错题的错误级别吗？"))
        	{
                document.errorpad.method = "POST";
                document.errorpad.action = "errorpad_decrate.jsp";
                document.errorpad.target="_self";
                document.errorpad.submit();
        	}
        	else
        	{
                document.errorpad.method = "GET";
                document.errorpad.action = "";
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
		case "addrate":
            addrate_check();
			break;
		case "decrate":
			decrate_check();
			break;
        case "test":
            selectid();
            break;
		case "print":
			printerror();
            break;

	}

}
function selectid(){
    var winpoint=window.open('','err_test_type','height=240,width=470,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no,depended=yes,alwaysRaised =yes,z-look=yes');
    var toppos=(window.screen.height-240)/2;
    var leftpos=(window.screen.width-470)/2;
    winpoint.moveTo(toppos,leftpos);
    winpoint.focus();
    document.errorpad.method="POST";
    document.errorpad.action="err_test_type.jsp";
    document.errorpad.target="err_test_type";
    document.errorpad.submit();

}
function printerror(){

    var winpoint=window.open('','err_print_type','height=240,width=520,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no,depended=yes,alwaysRaised =yes,z-look=yes');
    var toppos=(window.screen.height-240)/2;
    var leftpos=(window.screen.width-470)/2;
    winpoint.moveTo(toppos,leftpos);
    winpoint.focus();
    document.errorpad.method="POST";
    document.errorpad.action="err_print_type.jsp";
    document.errorpad.target="err_print_type";
    document.errorpad.submit();
}
function openDetail(var1){
    var winpoint=window.open('err_query_detail.jsp?id='+var1,'newwindow','height=400,width=300,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no,depended=yes,alwaysRaised =yes,z-look=yes');
    winpoint.focus();
}
function InitMyform(){
    document.myform.Grade.value='<%=query_grade%>';
    changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value);
    document.myform.Subject.value='<%=query_sub%>';
    changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value);
    document.myform.KnowPoint.value='<%=query_knowpoint%>';
    document.myform.testtype.value='<%=query_testtype%>';


}

</script>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<TITLE>考试系统-考试查询</TITLE>
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
<BODY bgColor=#ffffff text=#000000 onLoad="InitMyform()">

<CENTER>

<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="../errorpad/images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="../errorpad/images/test_pop_02.gif"
      width=134></TD>
      </TR></TBODY></TABLE>
  <strong><font color="#3366FF" size="+2" face="黑体">试卷查询</font></strong>
  <!--begin test -->
  <FORM action=Query_test.jsp method=post name=myform target="_self" id="myform">
    <TABLE width=100% height="60" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD height="75"  align=middle>
            <table width="600" height="56" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr>
                <td width="100" height="52" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>计算机等级:</td>
                    </tr>
                    <tr>
                      <td height="24" nowrap> <select id=select30 name=Grade onclick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                          <option value="all" selected>-全 部-</option>
                          <%Tools.showGradeOption(con,out);%>
                        </select> </td>
                    </tr>
                  </table>
                  &nbsp; </td>
                <td width="88" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td nowrap>科&nbsp;目:</td>
                    </tr>
                    <tr>
                      <td nowrap> <select id=select29 name=Subject onclick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)"
size="1">
                          <option value="all" selected>全 部</option>
                        </select> </td>
                    </tr>
                  </table>
                  <strong> </strong> </td>
                <td width="187" align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td nowrap>知识点:</td>
                    </tr>
                    <tr>
                      <td nowrap> <select name=KnowPoint id="select31">
                          <option value="all" selected>----全 部----</option>
                        </select> </td>
                    </tr>
                  </table></td>
                <td width="104" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td nowrap>考试类型：</td>
                    </tr>
                    <tr>
                      <td nowrap> <select name="testtype" id="select8">
                          <option value="2" selected>单元测试</option>
                          <option value="3">正式考试 </option>
                        </select> </td>
                    </tr>
                  </table></td>
                <td width="111" align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"><input type="submit"  class="s03" name="Submit" value="查询"></td>
              </tr>
            </table>
          </TD>
        </TR>

      </TBODY>
    </TABLE>
  </FORM>
 <%if (testSet.size()>0){
 %>
  <FORM method="post" name="errorpad" id="errorpad">
    <TABLE width=600 border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
        <TR>
          <td width="587" height=22 bgColor=#E3E3E3 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="41" height="20" nowrap><div align="center"><strong>序号</strong></div></td>
                <td width="50" nowrap><div align="center"><strong>计算机等级</strong></div></td>
                <td width="190" nowrap> <div align="left"><strong>考试名称</strong></div></td>
                <td width="149" nowrap><div align="center"><strong>考试发布时间</strong></div></td>
                <td width="78" nowrap><div align="center"><strong>考试类型</strong></div></td>
                <td width="84" nowrap><div align="center"><strong>总分</strong></div></td>
              </tr>
            </table></td>
        </TR>
<%          Iterator iter = testSet.listIterator();
            int order=0;
            while (iter.hasNext()) {
                Test t = (Test) iter.next();
                order++;
%>
            <TR>
          <td width="587" height=22 class=l> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="41" height="20" nowrap><div align="center"><%=order%>.</div></td>
                <td width="48" nowrap><div align="center"><%=t.grade%></div></td>
                <td width="190" nowrap> <div align="left"><%=t.name%></div></td>
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

<input name="stu_id" type="hidden" id="studentid2" value="">

</FORM>
<%}
else{
   %>


  <table width="77%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="33%"><img src="images/pic_notice.gif" width="150" height="150"></td>
      <td width="67%" align="center" valign="middle" nowrap>
        <div align="center"><font size="+2">没有查询到满足条件的数据!</font></div></td>
    </tr>
  </table>

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
