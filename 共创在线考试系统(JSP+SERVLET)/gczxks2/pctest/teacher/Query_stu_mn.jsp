<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>

<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
boolean debug=false;
String studentID="";
String gradenote="";
String gradename="";
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
try{
    studentID=(String)session.getAttribute("studentID");
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}

try{
    con=DBCon.getConnection();

    //获取考生的计算机等级信息
    sql=" SELECT   `grade`.`Name`,  `grade`.`note` FROM"+
        "  `grade`  INNER JOIN `UserInfo` ON (`grade`.`note` = `UserInfo`.`gradenote`)"+
        " WHERE  (`UserInfo`.`vcUserNo` = '"+studentID+"')";

    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);

        if(rs.next()){
            gradenote=rs.getString("note");
            gradename=rs.getString("Name");
            rs.close();
            stmt.close();
        }
        if(debug){
            out.print("<br>stuID="+studentID+"<br>gradenote="+gradenote);
        }
    }
    catch(SQLException se){
        out.print("<br> query grade error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query grade error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //查询考生所属计算机等级的错题

%>



<%
//构造查询条件
//String errorpad_grade=(String)session.getAttribute("errorpad_grade");
//String errorpad_sub=(String)session.getAttribute("errorpad_sub");
//String errorpad_knowpoint=(String)session.getAttribute("errorpad_knowpoint");
//String errorpad_testtype=(String)session.getAttribute("errorpad_testtype");
//String errorpad_errorcount=(String)session.getAttribute("errorpad_errorcount");
sqlCon="";
String errorpad_grade=request.getParameter("Grade");

String errorpad_sub=request.getParameter("Subject");
String errorpad_knowpoint=request.getParameter("KnowPoint");
String errorpad_testtype=request.getParameter("testtype");
String errorpad_errorcount=request.getParameter("errorcount");

if(debug){
    out.print("<br>grade="+errorpad_grade+
    "<br>sub="+errorpad_sub+
    "<br>knowpoint="+errorpad_knowpoint+
    "<br>testtype="+errorpad_testtype+
    "<br>errorcunt="+errorpad_errorcount);
}

if(errorpad_grade!=null)
{
    session.setAttribute("errorpad_grade",errorpad_grade);
}
else
{
    errorpad_grade=(String)session.getAttribute("errorpad_grade");
}
if(errorpad_sub!=null)
{
    session.setAttribute("errorpad_sub",errorpad_sub);
}else
{
    errorpad_sub=(String)session.getAttribute("errorpad_sub");
}
if(errorpad_knowpoint!=null)
{
    session.setAttribute("errorpad_knowpoint",errorpad_knowpoint);
}
else
{
    errorpad_knowpoint=(String)session.getAttribute("errorpad_knowpoint");
}
if(errorpad_testtype!=null)
{
    session.setAttribute("errorpad_testtype",errorpad_testtype);
}
else
{
    errorpad_testtype=(String)session.getAttribute("errorpad_testtype");
}
if(errorpad_errorcount!=null)
{
    session.setAttribute("errorpad_errorcount",errorpad_errorcount);
}
else
{
    errorpad_errorcount=(String)session.getAttribute("errorpad_errorcount");
}
if(errorpad_grade==null)
    errorpad_grade="all";
if(errorpad_sub==null)
    errorpad_sub="all";
if(errorpad_knowpoint==null)
    errorpad_knowpoint="all";
if(errorpad_testtype==null)
    errorpad_testtype="all";
if(errorpad_errorcount==null)
    errorpad_errorcount="0";

if(errorpad_grade!=null){
    if(!errorpad_grade.equals("all")){
        if(errorpad_grade.equals("c")){
            sqlCon="(question.gradenote='c1' OR question.gradenote='c2' OR question.gradenote='c3')";
        }else if(errorpad_grade.equals("g")){
            sqlCon="(question.gradenote='g1' OR question.gradenote='g2' OR question.gradenote='g3')";
        }
        else
            sqlCon="(question.gradenote='"+errorpad_grade+"')";
    }
}
if(debug)
    out.println("<br>grade sql="+sqlCon);

if(errorpad_sub!=null){
    if(!errorpad_sub.equals("all")){
        if (!sqlCon.equals(""))
            sqlCon=sqlCon +" AND (question.SubjectID="+errorpad_sub+")";
        else
            sqlCon=" (question.SubjectID="+errorpad_sub+")";
    }
}
if(debug)
    out.println("<br>subject sql="+sqlCon);

if(errorpad_knowpoint!=null){
    if(!errorpad_knowpoint.equals("all")){
        if(!sqlCon.equals(""))
            sqlCon=sqlCon+" AND(question.KnowPointID1="+errorpad_knowpoint +
                " OR question.KnowPointID2="+errorpad_knowpoint+
                " OR question.KnowPointID3="+errorpad_knowpoint+")";
        else
            sqlCon=" (question.KnowPointID1="+errorpad_knowpoint +
                " OR question.KnowPointID2="+errorpad_knowpoint+
                " OR question.KnowPointID3="+errorpad_knowpoint+")";
    }
}
if(debug)
    out.println("<br>knowpoint sql="+sqlCon);


if(errorpad_testtype!=null){
    if(!errorpad_testtype.equals("all")){
        if(!sqlCon.equals(""))
            sqlCon=sqlCon+ " AND(errorpad.sourcetype="+errorpad_testtype+")";
        else
            sqlCon= " (errorpad.sourcetype="+errorpad_testtype+")";
    }
}
if(debug)
    out.println("<br>testtype sql="+sqlCon);

if(errorpad_errorcount!=null){
    if(!sqlCon.equals(""))
        sqlCon=sqlCon+ " AND(errorpad.errorcount>="+errorpad_errorcount+")";
    else
        sqlCon=" (errorpad.errorcount>="+errorpad_errorcount+")";
}
if(debug)
    out.println("<br>errorcount sql="+sqlCon);
sqlCon="(`errorpad`.`stu_id` = 's11')"+" AND"+sqlCon;
//查询满足条件的错题
sql="SELECT  `errorpad`.`id`, `errorpad`.`question_id`, `question`.`QuestText`, DATE_FORMAT( `errorpad`.`add_date`,\"%Y-%m-%e %H:%i:%S\") AS add_date, "+
    " `errorpad`.`errorcount`,  ELT(`errorpad`.`sourcetype`,\"自由测试\",\"自由单元测试\",\"正式考试\") as sourcename, "+
    " `grade`.`Name` AS `gradename`"+
    " FROM  `errorpad`"+
    "  LEFT OUTER JOIN `question` ON (`errorpad`.`question_id` = `question`.`ID`)"+
    "  LEFT OUTER JOIN `grade` ON (`question`.`gradenote` = `grade`.`note`)"+
    " WHERE  "+sqlCon+
    " ORDER BY  `errorpad`.`add_date` ASC";

session.setAttribute("errorpad_sqlcon",sqlCon);
session.setAttribute("errorpad_sql",sql);
if(debug)
    out.println("<br>at last sql="+sql);
stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
rs=stmt.executeQuery(sql);
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
    document.myform.Grade.value='<%=errorpad_grade%>';
    changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value);
    document.myform.Subject.value='<%=errorpad_sub%>';
    changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value);
    document.myform.KnowPoint.value='<%=errorpad_knowpoint%>';
    document.myform.testtype.value='<%=errorpad_testtype%>';
    document.myform.errorcount.value='<%=errorpad_errorcount%>';

}

</script>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<TITLE>考试系统-错题本</TITLE>
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
  <strong><font color="#3366FF" size="+2" face="黑体">考试系统成绩查询</font></strong> 
  <!--begin test -->
  <FORM action=../errorpad/errorpad.jsp method=post name=myform target="_self" id="myform">
    <TABLE width=100% height="145" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD height="75"  align=middle valign="bottom">
            <table width="84%" height="56" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr> 
                <td width="87" height="52" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
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
                <td width="70" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
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
                <td width="126" align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
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
                <td width="105" align="center" valign="baseline" nowrap background="../errorpad/images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td nowrap>考试类型：</td>
                    </tr>
                    <tr> 
                      <td nowrap> <select name="testtype" id="select8">
                          <option value="all" selected>全部</option>
                          <option value="2">单元测试</option>
                          <option value="3">正式考试 </option>
                        </select> </td>
                    </tr>
                  </table></td>
                <td width="121" align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
                  <table width="94%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td nowrap>分数段</td>
                    </tr>
                    <tr> 
                      <td nowrap>从 <input name="mark1" type="text" id="mark1" value="0" size="5" maxlength="5">
                        至 
                        <input name="mark2" type="text" id="mark2" size="5" maxlength="5"></td>
                    </tr>
                  </table></td>
                <td width="47" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"> 
                  <p align="center"> 
                    <input type="submit"  class="s03" name="Submit" value="查询">
                </td>
                <td width="53" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"><div align="center"><b> 
                    <input name="errPrint" type="button"  class="s03" id="errPrint2" value="打印" onClick=subform("print")>
                    </b></div></td>
              </tr>
            </table>
            </TD>
        </TR>
        <TR>
          <TD  align=middle valign="top">&nbsp; </TD>
        </TR>
      </TBODY>
    </TABLE>
		</FORM>
  <FORM method="post" name="errorpad" id="errorpad">
    <%
      testNumber=1;
      while(rs.next()){

	  %>
    <TABLE width=80% border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
      <TR>
          <td width="650" height=22 bgColor=#E3E3E3 class=l>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="81" height="20" nowrap>姓名 </td>
                <td width="60" nowrap><div align="right">注册号</div></td>
                <td width="43" nowrap><div align="left">计算机等级：</div></td>
                <td width="100" nowrap>考试名称</td>
                <td width="100" nowrap><div align="right">考试时间:</div></td>
                <td width="174" nowrap>分数</td>
                <td width="155" nowrap>考试类型</td>
                <td nowrap> <div align="right"> </div></td>
              </tr>
            </table></td>
      </TR>
	  <TR>
          <td width="650" height=22 class=l>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="81" height="20" nowrap>姓名 </td>
                <td width="60" nowrap><div align="right">注册号</div></td>
                <td width="43" nowrap><div align="left">计算机等级：</div></td>
                <td width="100" nowrap>考试名称</td>
                <td width="100" nowrap><div align="right">考试时间:</div></td>
                <td width="173" nowrap>分数</td>
                <td width="154" nowrap>考试类型</td>
                <td width="12" nowrap>&nbsp; </td>
                <td width="45" nowrap> <div align="right"> <img src="../errorpad/images/1026.gif" width="27" height="24" onClick="openDetail(<%=rs.getInt("question_id")%>)"></div></td>
              </tr>
            </table></td>
      </TR>

    </TBODY>
  </TABLE>
  <%
testNumber++;
}
%>
<input name="stu_id" type="hidden" id="studentid2" value="<%=studentID %>">
<input name="selectids" type="hidden" id="studentid2" value="">
<input name="selectcount" type="hidden" id="studentid2" value="">
</FORM>
<p>&nbsp;</p>
 <!--end test --><!--begin bottom -->
<TABLE
style="BORDER-TOP: #dbdbdb 1px solid; MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px; BACKGROUND-COLOR: #f6f6f6"
cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=middle colSpan=2 height=30>
      <TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
        <TBODY>
        <TR>
          <TD><A href="http://jsptestonline.cosoft.org.cn/index.html"
            target=_blank>关于我们</A> | <A
            href="http://jsptestonline.cosoft.org.cn/contact/3_ywhz.html"
            target=_blank>联系方式</A> | 网站地图 | <A
            href="http://jsptestonline.cosoft.org.cn/about/service.html"
            target=_blank>服务条款</A> | <A
            href="http://jsptestonline.cosoft.org.cn/about/privacy.html"
            target=_blank>隐私权保护</A> | <A
            href="http://jsptestonline.cosoft.org.cn/about/copyright.html"
            target=_blank>版权声明</A></TD>
          <TD align=middle width=220>版权所有：<A href="http://jsptestonline.cosoft.org.cn/"
            target=_blank>共创教育机构</A></TD></TR></TBODY>
</TABLE></TD></TR></TBODY>
</TABLE><!--end bottom --></CENTER>
</BODY>
</HTML>

<%}
catch(Exception e){
    out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
