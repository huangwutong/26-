<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page errorPage="QuestGen_error.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="jinghua.Tools"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con=null;
	String teachID="";
String sql=null;
Statement stmt=null;
ResultSet rs=null;
String testname=null;
%>
<%
try{

String testID=request.getParameter("testID");
if(testID==null)
	throw new Exception("调用参数不足!");
	con=DBCon.getConnection();
	sql="SELECT  `test`.`paper`,`test`.`testnum`,  `test`.`title`,  `test`.`date`,  `test`.`mark`"+
		"  FROM  `test` WHERE  (`test`.`id` = "+testID+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
	if(rs.next()){
		testname=rs.getString("title");
		rs.close();
		stmt.close();
	}else{
		rs.close();
		stmt.close();
		throw new Exception("查询试卷题目错误!");
	}

%>

<script language="javascript">
function CheckForm(f)
{
//获取HTML文本
	if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.Composition.document.body.innerText;
   else
	  document.myform.Content.value=editor.Composition.document.body.innerHTML;

	//var v=document.myform.Content.value=editor.Composition.document.body.innerHTML;
	//alert(v);

	if (f.Answer.value.length < 1) // 没有输入答案
	{
	    alert("您还没有输入答案!");
		return false;
	}

	if( f.Mark.value.length<1)
	{
	    alert("您还有输入该试题的分数!");
		return false;
	}

	if(!isNumberString(f.Mark.value,"1234567890."))
	{
	    alert("嘿！您在分数里填了东西,但怎么不是数字呢？\n");
	    return false;
	}

    if( f.Grade.selectedIndex == 0) {
        alert("请选择计算机等级信息!")
        return false;
    }
    if(f.Subject.selectedIndex==0){
        alert("请选择科目信息!")
        return false;
    }
    if((f.KnowPoint1.selectedIndex==0)&&(f.KnowPoint2.selectedIndex==0)&&(f.KnowPoint3.selectedIndex==0)){
        alert("请选知识点信息!")
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
    document.myform.action = "modify_test_unit.jsp";
    document.myform.target="_self";
    document.myform.submit();
}
</script>

<!--计算机等级，科目，知识点三个下拉列表框联动-->
<%
String temp=Tools.sub_know(DBCon.getConnection());
out.print(temp);
temp=Tools.grade_sub(DBCon.getConnection());
out.print(temp);
%>
<script language="JavaScript">
function changegs(locationid){
	    document.myform.Subject.length =1;
        document.myform.KnowPoint1.length =1;
        document.myform.KnowPoint2.length =1;
        document.myform.KnowPoint3.length =1;
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
	document.myform.KnowPoint1.length =1;
    document.myform.KnowPoint2.length =1;
    document.myform.KnowPoint3.length =1;
	var locationid=locationid;
	var i;
	for (i=0;i < gskcount; i++){
		if (grade_sub_know[i][1] == locationid){
			document.myform.KnowPoint1.options[document.myform.KnowPoint1.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
            document.myform.KnowPoint2.options[document.myform.KnowPoint2.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
            document.myform.KnowPoint3.options[document.myform.KnowPoint3.length] = new Option(grade_sub_know[i][3], grade_sub_know[i][2]);
		}
	}
}
</script>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="../css.css">
<title>试题提交</title>
</head>

<body>

<FORM action="unit_test_quest_add_rs.jsp" method=post name=myform target="_self" onSubmit="return CheckForm(this)">
  <TABLE width="100%" border=0 align=center cellPadding=0 cellSpacing=0>
    <TBODY>
      <TR>
        <TD width="21%" rowSpan=2> <div align="left"><img height=45 src="images/logo.gif"
  width=160></div></TD>

        <TD width="63%" height=45>
          <div align="center"><strong><font color="#3366FF" size="+2" face="黑体">试题录入<strong><font color="#3366FF" size="+2" face="黑体">:<%=testname%></font></strong></font></strong></div></TD>
        <TD width="16%"><div align="right"></div></TD>
      </TR>
    </TBODY>
  </TABLE>
  　
  <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr>
    <td width="100%" height="535" valign="top">
<table width="100%" height="354" border="1" bordercolor="#d3add1" background="images/lvbgcolor.gif">
          <tr>
            <td width="34%" height="40" align="left" valign="middle"> 题目类型:
              <select id=QuestType name=QuestType>
                <%Tools.showOption("select * from questtype",con,out);%>
              </select>
            </td>
            <td width="66%" align="left" valign="middle"><table width="100%" border="0">
                <tr>
                  <td width="21%" height="39" align="left" nowrap>答案: <input name="Answer" type="text" id="Answer3" size="5" maxlength="5">
                  </td>
                  <td width="20%" align="left" nowrap>分数: <input name="Mark" type="text" id="Mark2" size="5"></td>
                  <td width="26%" align="left" nowrap> <div align="left">难易度:
                      <select name=Difficulty id="select6">
                        <option value="A" selected>A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
                      </select>
                    </div></td>
                  <td width="11%" align="left" valign="middle"> <input name="Submit" type="submit" class="s03" value="提交">
                  </td>
                  <td width="11%" align="left" valign="middle">
				  <input name="Reset_Quest" type="reset" class="s03" id="Reset_Quest2" value="重置">
                  </td>
                  <td width="11%" align="left" valign="middle">
				  <input name="Submit2" type="button" class="s03" onClick="gotestpaper()" value="返回"></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="40" align="left" valign="middle"> 计算机等级:
              <select id=select10 name=Grade onClick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                <option value="temp">未选择</option>
                <%Tools.showGradeOption(con,out);%>
              </select> </td>
            <td rowspan="3" align="center"> <iframe src="../editor/edit.jsp" id='editor' frameborder=0 scrolling=auto width=544 height=321>
              </iframe>
              <textarea name="Content" style="display:none"></textarea>
              &nbsp; <input name="group" type="hidden" id="group" value="single">
              <input name="testID" type="hidden" id="testID" value="<%=testID%>">
              <input name="teacherID" type="hidden" value="1"></td>
          </tr>
          <tr>
            <td height="40" align="left" valign="middle"> 科 目:
              <select id=select8 name=Subject onClick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)"
size="1">
                <option value="temp">未选择</option>
                <%--Tools.showOption("select * from subject order by id",con,out);--%>
              </select>
            </td>
          </tr>
          <tr>
            <td height="215" align="left" valign="top">
              <table width="100%" height="175" border="0" align="center">
                <tr>
                  <td width="68%" height="21">知识点1: </td>
                </tr>
                <tr>
                  <td height="35">
<select name=KnowPoint1 id="select7">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select></td>
                </tr>
                <tr>
                  <td height="25">知识点2:</td>
                </tr>
                <tr>
                  <td height="36">
                    <select name=KnowPoint2 id="select12">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select></td>
                </tr>
                <tr>
                  <td height="21">知识点3:</td>
                </tr>
                <tr>
                  <td height="23">
<select name=KnowPoint3 id="select16">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select></td>
                </tr>
              </table>
            </td>
          </tr>

        </table></td>
  </tr>
</table>
</form>
</body>
</html>
<%}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
