<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="jinghua.Tools"%>
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
int pageNumber=0;
String sqlCon=null;
int testNumber=0;
//ArrayList arrQuestSel=null;
String[] arrID=null;
String[] arrSelect=null;

//QuestSel qs=null;
int EveryPage=10;//每页显示的记录数；
int OnPage=1; //当前显示的页数；
int Total=0;//记录的总数；
int TotalPage=0;//记录的总页数；
%>
<%
String strPage=request.getParameter("page");//查询页数
String prePage=request.getParameter("OnPage");
if(debug) {
	out.print("<br>page="+strPage);
	out.print("<br>OnPage="+prePage);
}

if(strPage==null)
	OnPage=1;
else
	OnPage=Integer.parseInt(strPage);
	


String studentID =(String)session.getAttribute("studentID");
//tools.getString((String)session.getAttribute(Configure.sessUserNo));
//BaseInfo objBase = new BaseInfo(studentID);
//Privs objPrivs = objBase.getPrivs();
//String vcGrade = objPrivs.getGrade();

try{
    con=DBCon.getConnection();

    //获取考生的计算机等级信息
    gradenote="c1";
    gradename="初一";
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
//String errorpad_grade=request.getParameter("Grade");

String errorpad_sub=request.getParameter("Subject");

String errorpad_knowpoint=request.getParameter("KnowPoint");
String errorpad_testtype=request.getParameter("testtype");
String errorpad_errorcount=request.getParameter("errorcount");

if(debug){
    out.print("<br>grade="+//errorpad_grade+
    "<br>sub="+errorpad_sub+
    "<br>knowpoint="+errorpad_knowpoint+
    "<br>testtype="+errorpad_testtype+
    "<br>errorcunt="+errorpad_errorcount);
}

//if(errorpad_grade!=null)
//{
//    session.setAttribute("errorpad_grade",errorpad_grade);
//}
//else
//{
//    errorpad_grade=(String)session.getAttribute("errorpad_grade");
//}
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
//if(errorpad_grade==null)
//    errorpad_grade="all";
if(errorpad_sub==null)
    errorpad_sub="all";
if(errorpad_knowpoint==null)
    errorpad_knowpoint="all";
if(errorpad_testtype==null)
    errorpad_testtype="all";
if(errorpad_errorcount==null)
    errorpad_errorcount="0";

//if(errorpad_grade!=null){
//    if(!errorpad_grade.equals("all")){
//        if(errorpad_grade.equals("c")){
//            sqlCon="(question.gradenote='c1' OR question.gradenote='c2' OR question.gradenote='c3')";
//        }else if(errorpad_grade.equals("g")){
//            sqlCon="(question.gradenote='g1' OR question.gradenote='g2' OR question.gradenote='g3l' OR question.gradenote='g3w')";
//        }
//      else
//            sqlCon="(question.gradenote='"+errorpad_grade+"')";
 //   }
//}
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
sqlCon="(`errorpad`.`stu_id` = '"+studentID+"')"+" AND"+sqlCon;
//查询满足条件的错题
sql="SELECT  `errorpad`.`id`, `errorpad`.`question_id`, `question`.`QuestText`, DATE_FORMAT( `errorpad`.`add_date`,\"%Y-%m-%e %H:%i:%S\") AS add_date, "+
    " `errorpad`.`errorcount`,  ELT(`errorpad`.`sourcetype`,\"自由测试\",\"自由单元测试\",\"正式考试\") as sourcename, "+
    " `grade`.`Name` AS `gradename`,`subject`.`name` as `subname`"+
    " FROM  `errorpad`"+
    "  LEFT OUTER JOIN `question` ON (`errorpad`.`question_id` = `question`.`ID`)"+
    "  LEFT OUTER JOIN `grade` ON (`question`.`gradenote` = `grade`.`note`)"+
	"  LEFT OUTER JOIN `subject` ON (`question`.`SubjectID` = `subject`.`ID`)"+
    " WHERE  "+sqlCon+
    " ORDER BY  `errorpad`.`add_date` ASC,`errorpad`.`ID`";

session.setAttribute("errorpad_sqlcon",sqlCon);
session.setAttribute("errorpad_sql",sql);
 if(debug)
    out.println("<br>at last sql="+sql);
stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
rs=stmt.executeQuery(sql);

//是否是新的查询
String newQuery=request.getParameter("newQuery");
if(newQuery==null)
	newQuery="false";

if(debug)
	out.print("<br>newQuery="+newQuery);
if(newQuery.equals("true"))
{//构造新的试题选择数组
	StringBuffer sb1=new StringBuffer();
	StringBuffer sb2=new StringBuffer();
	//arrQuestSel=new ArrayList();

	while(rs.next()){
		//QuestSel qs=new QuestSel();
		//qs.id=rs.getInt("ID");
		sb1.append(rs.getString("ID")+",");
		sb2.append("0,");
		//arrQuestSel.add(qs);


	}
	arrID=sb1.toString().split(",");
	arrSelect=sb2.toString().split(",");

	//session.setAttribute("arrQuestSel",arrQuestSel);


	session.setAttribute("arrID",arrID);
	session.setAttribute("arrSelect",arrSelect);




}else{
//arrQuestSel=(ArrayList)session.getAttribute("arrQuestSel");
arrID=(String[])session.getAttribute("arrID");
arrSelect=(String[])session.getAttribute("arrSelect");
}

//if(arrQuestSel==null)
//	out.print("<br>arrQuestSel=null");




//处理旧页面
String order_chk=request.getParameter("order_chk");
if(debug){
	out.print("<br>order_chk="+order_chk);
	out.print("<br>arrID="+arrID.toString());
	out.print("<br>arrSelect="+arrSelect.toString());
}
if(order_chk!=null && !order_chk.equals("temp")){
//145:0#146:1#
	String arrOrder_Sin[]=null;
	String arrOrder_chk[]=order_chk.split("#");

	for(int i=0;i<arrOrder_chk.length;i++){
		if(debug)
			out.print("<br> arrorder_chk["+i+"]="+arrOrder_chk[i]);
		arrOrder_Sin=arrOrder_chk[i].split(":");
		arrSelect[Integer.parseInt(arrOrder_Sin[0])-1]=arrOrder_Sin[1];

	}

}



rs.last();//移到最后一条记录;
Total=rs.getRow();//记录的总数；
//计算出总的页数TotalPage；
if(Total%EveryPage==0)
TotalPage=Total/EveryPage;
else
TotalPage=Total/EveryPage+1;

 if(OnPage>TotalPage)
 {
  OnPage=TotalPage;
 }
 else if(OnPage<=0)
 {
  OnPage=1;
 }
//生成一个javascript数组
//<script language ="JavaScript">
//Quest_Order=new Array()
//Quest_Order[0]=new Array(91,98);
//Quest_Order[9]=new Array(91,107);
//</script>
out.println("<script language =\"JavaScript\">");
out.println("Quest_Order=new Array();");
rs.absolute((OnPage-1)*EveryPage+1);//指定指针的位置；
pageNumber=0;
testNumber=(OnPage-1)*EveryPage+1;
while( pageNumber<EveryPage ) {
	out.println("Quest_Order["+pageNumber+"]=new Array("+testNumber+","+rs.getInt("ID")+");");

	pageNumber++;
	testNumber++;
	if(!rs.next())
		break;
}
out.println("var QOCount="+pageNumber+";");
out.println("</script>");







if(debug){
	out.print("<br>Total="+Total);
	out.print("<br>totalpage="+TotalPage);

}



%>


<!--计算机等级，科目，知识点三个下拉列表框联动-->
<%
out.print(Tools.grade_sub(con));
out.print(Tools.sub_know(con));

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
</script>

<script language="JavaScript">

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
    myform.target="_self";
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
function Query(myform)
{

    document.myform.action="errorpad.jsp?newQuery=true&page=1";

	document.myform.target="_self";
	document.myform.method = "POST";


    document.myform.submit();

}
function set_Order_Sel(){
	var Order_Sel="";
	for (var i=0;i<document.errorpad.elements.length;i++)
    {
		var e = document.errorpad.elements[i];
		if (e.name == 'id'){
		 	for( var j=0;j<QOCount;j++){
				if(Quest_Order[j][1]==e.value){
					if(e.checked)
						Order_Sel=Order_Sel+Quest_Order[j][0]+":"+"1#";
					else
						Order_Sel=Order_Sel+Quest_Order[j][0]+":"+"0#";
        			break;
				}
			}
		}
	}

	document.errorpad.order_chk.value=Order_Sel;
}
function goToPage( topage)
{
	set_Order_Sel();
	document.errorpad.action="errorpad.jsp";
	document.errorpad.target="_self";
	document.errorpad.method = "POST";
	document.errorpad.page.value = topage;
	document.errorpad.submit();
	return false;
}
function subform(stract)
{
	switch (stract){
		case "Query":
            Query();
			break;
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
	set_Order_Sel();
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
href="style/style.css" type=text/css rel=stylesheet>
<STYLE>
<!--
a,a:link  { font-family: 'Tahoma', 'Verdana', 'Arial'; color: gray; text-decoration: none; }
a:visited { font-family: 'Tahoma', 'Verdana', 'Arial'; color: gray; text-decoration: none; }
a:active  { font-family: 'Tahoma', 'Verdana', 'Arial'; color: black; text-decoration: none; }
a:hover   { font-family: 'Tahoma', 'Verdana', 'Arial'; color: black; text-decoration: none; }
-->
A:link  {font-family: 'Tahoma', 'Verdana', 'Arial'; color:blue; text-decoration: none; cursor: hand; }
A:visited  {font-family: 'Tahoma', 'Verdana', 'Arial'; color: Navy; text-decoration: none}
A:active  {font-family: 'Tahoma', 'Verdana', 'Arial'; color: mediumvioletred; text-decoration: none}
A:hover {font-family: 'Tahoma', 'Verdana', 'Arial'; color: red;  text-decoration: none}

body,td,select,input,div,form,textarea,center,option,pre,br {
            font-family: 'Tahoma', 'Verdana', 'Arial'; font-size: 9pt; color: black; }

body      { margin-top: 2px; margin-right: 2px; margin-bottom: 2px; margin-left: 2px;
            scrollbar-face-color: white;
            scrollbar-shadow-color: gainsboro;
            scrollbar-darkshadow-color: whitesmoke;
            scrollbar-highlight-color: gainsboro;
            scrollbar-3dlight-color: whitesmoke;
            scrollbar-track-color: white;
            scrollbar-arrow-color: gainsboro;
            overflow: auto; }
th {
	font-family: 'Tahoma', 'Verdana', 'Arial'; font-size: 10pt; color: black; }
.button   { font-family: 'Tahoma', 'Verdana', 'Arial'; background-color: white; height: 20px;
                border-width: 1px; border-style: solid; border-color: black; }
.input    { font-family: 'Tahoma', 'Verdana', 'Arial'; background-color: white; height: 20px;
                border-width: 1px; border-style: solid; border-color: black; }
.td_sr {
  background: #ffffff;
}
.tb_sr { background: #eeeeee; }
.th_sr { background: #eeeeee; }
</STYLE>



<link rel="stylesheet" type="text/css" href="../css.css">
</HEAD>
<BODY bgColor=#ffffff text=#000000 onLoad="InitMyform()">

<CENTER>

<TABLE cellSpacing=0 cellPadding=0 width=650 border=0>
  <TBODY>
  <TR>
          <TD><IMG height=27 src="images/test_pop_01.gif" width=102></TD>
          <TD align=right><IMG height=27 src="images/test_pop_02.gif"
      width=134></TD>
        </TR></TBODY></TABLE>
  <strong><font color="#3366FF" size="+2" face="黑体">考试系统错题本</font></strong>
  <!--begin test -->
  <FORM action=errorpad.jsp method=post name=myform target="_self" id="myform">
  <script language="JavaScript">
	document.onload = InitMyform();
	function InitMyform(){
    		//document.myform.Subject.value='<%=errorpad_sub%>';
    		//changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value);
    		//document.myform.KnowPoint.value='<%=errorpad_knowpoint%>';
    		document.myform.testtype.value='<%=errorpad_testtype%>';
    		document.myform.errorcount.value='<%=errorpad_errorcount%>';

	}

</script>
    <TABLE width=100% height="145" border=0 cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD height="75"  align=middle valign="bottom"> <table width="80%" height="56" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr>
                <td height="52" align="center" valign="baseline" nowrap background="images/admin_bg_1.gif" bgcolor="#FFFDE8"><strong> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td nowrap>计算机等级:</td>
                  </tr>
                  <tr>
                    <td><select id=select6 name=Grade onClick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                    <option value="temp">--未选择--</option>
                      <%Tools.showGradeOption(con,out);%>
                    </select></td>
                  </tr>
                </table></strong> </td>
                <td align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td nowrap>科&nbsp;目:</td>
                  </tr>
                  <tr>
                    <td><select name=Subject
size="1" id=select2 onclick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)">
                        <option value="all" selected>全 部</option>
                        <%Tools.showGradeSubjectOption(con,gradenote,out);%>
                    </select></td>
                  </tr>
                </table></td>
                <td align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td nowrap>知识点:</td>
                  </tr>
                  <tr>
                    <td><select name=KnowPoint id="KnowPoint">
                        <option value="all" selected>----全 部----</option>
                      </select>
                    </td>
                  </tr>
                </table></td>
                <td align="center" valign="baseline" nowrap background="images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td nowrap>考试类型：</td>
                    </tr>
                    <tr>
                      <td><select name="testtype" id="select8">
                          <option value="all" selected>全部</option>
                          <option value="1">自由考试</option>
                          <option value="2">单元测试</option>
                          <option value="3">正式考试 </option>
                        </select></td>
                    </tr>
                </table></td>
                <td align="center" valign="baseline" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <table width="94%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td nowrap>错误级别&gt;=</td>
                    </tr>
                    <tr>
                      <td><select name="errorcount" size="1" id="select16">
                          <option value="0" selected>0</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>
                        </select></td>
                    </tr>
                </table></td>
                <td nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <p align="left">
                    <input name="errQuery" type="button"  class="s03" id="errQuery" onClick=subform("Query") value="查询">
                </td>
              </tr>
            </table></TD>
        </TR>
        <TR>
          <TD  align=middle valign="top">
            <table width="80%" height="44" border="1" align="center" cellspacing="1" bordercolor="#799AE1" id="AutoNumber3" style="border-collapse: collapse">
              <tr>
                <td height="40" nowrap background="images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <p align="center">
                    <input name="errDel" type="button" class="s03" id="errDel" value="删 除" border="0"
						onClick=subform("del")>
                    <b><font color="#FFFFFF"> </font></b></td>
                <td width="156" nowrap background="images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <p align="center"><b>

<input name="errAscRate" type="button" class="s03" id="errAscRate2" value="增加级别" border="0" onClick=subform("addrate")>
                    </b> </td>
                <td width="175" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <p align="center"><b>
                    <input name="errDescRate" type="button" class="s03" id="errDescRate" value="降低级别" border="0" onClick=subform("decrate")>
                    </b><b> </b></td>
                <td width="159" background="images/admin_bg_1.gif" bgcolor="#FFFDE8"><div align="center"><b>
                    <input name="errTest" type="button" class="s03" id="errTest2" value="测 验" border="0" onClick=subform("test")>
                    </b> </div></td>
                <td width="164" nowrap background="../images/admin_bg_1.gif" bgcolor="#FFFDE8">
                  <p align="center"><b>
                    <input name="errPrint" type="button"  class="s03" id="errPrint" value="打 印" onClick=subform("print")>
                    </b></td>
              </tr>
            </table>
            </TD>
        </TR>
      </TBODY>
    </TABLE>
		</FORM>
  <FORM method="post" name="errorpad" id="errorpad">
    <TABLE cellSpacing=1 cellPadding=0 width=80% bgColor=#eeeeee border=0>
      <TBODY>
        <TR>
          <TD class=td_sr align=middle width=28 height=20><INPUT title=选择全部记录或取消
      onclick=CheckAllt(); type=checkbox value="Check All" name=allboxt></TD>
          <TD class=td_sr align=right height=20>&nbsp; <A
      href="errorpad.jsp"  onClick="return goToPage(1)">首页</A> <% if(OnPage!=1) {%>
	  <A      href="errorpad.jsp" 	  onClick="return goToPage(<%=OnPage-1%>)">前页</A>
            <% }else {%>
            前页
            <%}%>
            [第<%=OnPage%>页] &nbsp; <%if(OnPage!=TotalPage) {%>
			<A      href="errorpad.jsp" onClick="return goToPage(<%=OnPage+1%>)">后页</A>
            <%} else {%>
            后页
            <%}%> <A      href="errorpad.jsp" onClick="return goToPage(<%=TotalPage%>)">尾页</A>
            　跳转到第
            <SELECT      onChange='return goToPage(this.value)'
      size=1 name=topage>
              <%for(int pageI=1;pageI<OnPage;pageI++)
				out.println("<OPTION value="+pageI+">"+pageI+"</OPTION>");

			%>
              <OPTION value=<%=OnPage%>
        selected><%=OnPage%></OPTION>
              <%for(int pageI=OnPage+1;pageI<=TotalPage;pageI++)
				out.println("<OPTION value="+pageI+">"+pageI+"</OPTION>");

			%>
            </SELECT>
            页，共 <%=TotalPage%> 页 </TD>
        </TR>
      </TBODY>
    </TABLE>
    <%
	rs.absolute((OnPage-1)*EveryPage+1);//指定指针的位置；
    pageNumber=0;
      testNumber=(OnPage-1)*EveryPage+1;
      //while(rs.next()){

	  while( pageNumber<EveryPage && !rs.isBeforeFirst() && !rs.isAfterLast() &&Total>0) {
	  	pageNumber++;

	  %>

    <TABLE width=80% border=1 align=center cellSpacing=1 bordercolor="#799AE1" style="border-collapse: collapse">
      <TBODY>
      <TR>
          <td width="100%" height=22 bgColor=#E3E3E3 class=l>
            <table width="756" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="46" height="20" nowrap>
				<input name="id" type="checkbox" value="<%=rs.getInt("id")%>"
	<%
		if(arrSelect[testNumber-1].equals("1"))
			out.print(" checked");
	%>
	>
                  <%=testNumber%>.
                </td>
                <td width="72" align="left" nowrap>计算机等级：</td>
                <td width="43" nowrap><%=rs.getString("gradename")%></td>
                <td width="154" nowrap> 科目：<%=rs.getString("subname")%></td>
                <td width="83" nowrap> <div align="left">错误级别： <%=rs.getInt("errorcount")%></div></td>
                <td width="66" nowrap><div align="right">添加时间：</div></td>
                <td width="152" nowrap><%=rs.getString("add_date")%></td>
                <td width="91" nowrap>来源：<%=rs.getString("sourcename")%></td>
                <td width="8" nowrap>&nbsp; </td>
                <td width="41" nowrap> <div align="right">
				<img src="images/1026.gif" width="27" height="24" onClick="openDetail(<%=rs.getInt("question_id")%>)"></div></td>
              </tr>
            </table></td>
      </TR>
    </TBODY>
  </TABLE>
  <TABLE cellSpacing=1 width=591 align=center>
    <TBODY>
      <TR>
          <TD width="585" align=left>
            <%if(debug) out.print("ID="+rs.getString("ID"));%> <%=jinghua.TransformString.DeleteBR(rs.getString("QuestText"))%></TD>
      </TR>
    </TBODY>
  </TABLE>
    <%
testNumber++;
if(!rs.next())
	break;
}
%>

    <TABLE cellSpacing=1 cellPadding=0 width=80% bgColor=#eeeeee border=0>
      <TBODY>
        <TR>
          <TD class=td_sr align=middle width=28 height=20><INPUT title=选择全部记录或取消
      onclick=CheckAlle(); type=checkbox value="Check All" name=allboxe></TD>
          <TD class=td_sr align=right height=20>&nbsp; <A
      href="errorpad.jsp"  onClick="return goToPage(1)">首页</A> <% if(OnPage!=1) {%> <A      href="errorpad.jsp" 	  onClick="return goToPage(<%=OnPage-1%>)">前页</A>
            <% }else {%>
            前页
            <%}%>
            [第<%=OnPage%>页] &nbsp;
            <%if(OnPage!=TotalPage) {%> <A      href="errorpad.jsp" onClick="return goToPage(<%=OnPage+1%>)">后页</A>
            <%} else {%>
            后页
            <%}%> <A      href="errorpad.jsp" onClick="return goToPage(<%=TotalPage%>)">尾页</A>
            　跳转到第
            <SELECT      onChange='return goToPage(this.value)'
      size=1 name=select2>
              <%for(int pageI=1;pageI<OnPage;pageI++)
				out.println("<OPTION value="+pageI+">"+pageI+"</OPTION>");

			%>
              <OPTION value=<%=OnPage%>
        selected><%=OnPage%></OPTION>
              <%for(int pageI=OnPage+1;pageI<=TotalPage;pageI++)
				out.println("<OPTION value="+pageI+">"+pageI+"</OPTION>");

			%>
            </SELECT>
            页，共 <%=TotalPage%> 页 </TD>
        </TR>
      </TBODY>
    </TABLE>
    <input name="stu_id" type="hidden" id="studentid2" value="<%=studentID %>">
    <input name="selectcount" type="hidden" id="studentid2" value="">
    <SCRIPT language=JavaScript>
<!--
function CheckAllt()
  {
  	document.errorpad.allboxe.checked=document.errorpad.allboxt.checked;
    for (var i=0;i<document.errorpad.elements.length;i++)
    {
      var e = document.errorpad.elements[i];
      if (e.name == 'id')
        e.checked = document.errorpad.allboxt.checked;
    }
  }
function CheckAlle()
  {
  	document.errorpad.allboxt.checked=document.errorpad.allboxe.checked;
    for (var i=0;i<document.errorpad.elements.length;i++)
    {
      var e = document.errorpad.elements[i];
      if (e.name == 'id')
        e.checked = document.errorpad.allboxe.checked;
    }
  }
//-->
</SCRIPT>
    <input name="OnPage" type="hidden" id="OnPage" value="<%=OnPage%>">
    <input name="page" type="hidden" id="page">
    <input name="order_chk" type="hidden" id="order_chk" value="temp">
  </FORM>
<p>&nbsp;</p>
 <!--end test --><!--begin bottom -->
<TABLE
style="BORDER-TOP: #dbdbdb 1px solid; MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px; BACKGROUND-COLOR: #f6f6f6"
cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=middle colSpan=2 height=30>
      </TD></TR></TBODY>
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

