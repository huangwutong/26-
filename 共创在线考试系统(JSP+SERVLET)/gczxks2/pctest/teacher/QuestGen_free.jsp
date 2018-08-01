<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page errorPage="QuestGen_error.jsp" %>
<%@ page import="java.io.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%@ page import="jinghua.Tools"%>
<script language="javascript">
function CheckForm(f)
{
//获取HTML文本
	var strText="";
	if (editor.EditMode.checked==true){
	  document.myform.Content.value=editor.Composition.document.body.innerText;
	  strText=editor.Composition.document.body.innerHTML;
	  }
   else{
	  document.myform.Content.value=editor.Composition.document.body.innerHTML;
	  strText=editor.Composition.document.body.innerText;
	}
	//var v=document.myform.Content.value=editor.Composition.document.body.innerHTML;
	//alert(v);
	
	var imageindex;
	var strHtml=document.myform.Content.value;
	var arrQuest=new Array();
	arrQuest=strHtml.split("@@");
	var arrQuestText=new Array();
	arrQuestText=strText.split("@@");
	
	for( var i=0;i<arrQuest.length;i++){
		imageindex=arrQuest[i].indexOf("v:imagedata");
		
		if(imageindex>=0)
		{
	    	alert("提交的试题中第 "+i+" 道含有从Word导入的图片信息，请仔细检查!\n"+"原题目为：\n"+arrQuestText[i]);
			return false;
		}
	}
	
	

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
<style type="text/css">
<!--
.style1 {
	font-size: 16pt;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<%!Connection con=null;
	String teachID="";

%>
<%
try{

    con=DBCon.getConnection();

 %>
<FORM name="myform" action="updatetest_free.jsp" method=post onSubmit="return CheckForm(this)">
  <input name="teacherID" type="hidden" value="<%=request.getParameter("teacherID")%>">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
    
    <TR>
        <TD height=45><div align="center" class="style1">自由测试卷</div></TD>
    </TR>
  </TBODY>
</TABLE>
　　
  <table width="100%" height="400" border="0" align="center" cellpadding="0" cellspacing="0">
    <!--DWLayoutTable-->
    <tr>
    <td width="100%" height="535" valign="top">
<table width="100%" height="312" border="1" bordercolor="#d3add1" background="images/lvbgcolor.gif">
          <tr> 
            <td width="34%" height="31" align="left" valign="middle"> 题目类型: 
              <select id=QuestType name=QuestType>
                <%Tools.showOption("select * from questtype",con,out);%>
              </select> </td>
            <td width="66%" align="left" valign="middle" nowrap>
<table width="100%" border="0">
                <tr>
                  <td width="10%" height="31" nowrap>名称：</td>
                  <td width="56%"><input name="suit_title" type="text" id="suit_title3" size="40" maxlength="200"></td>
                  <td width="7%">&nbsp;</td>
                  <td width="7%"><input name="Reset_Quest" type="reset" class="s03" id="Reset_Quest4" value="重置"></td>
                  <td width="7%">&nbsp;</td>
                  <td width="13%"><input name="Submit" type="submit" class="s03" value="提交"></td>
                </tr>
              </table>
              
            </td>
          </tr>
          <tr> 
            <td height="31" align="left" valign="middle"> 计算机等级: 
              <select id=select10 name=Grade onClick="changegs(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                <option value="temp">未选择</option>
                <%Tools.showGradeOption(con,out);%>
              </select> </td>
            <td rowspan="3" align="center"> <iframe src="../editor/edit.jsp" id='editor' frameborder=0 scrolling=auto width=544 height=321> 
              </iframe> <textarea name="Content" style="display:none"></textarea> 
              &nbsp; <input name="group" type="hidden" id="group" value="suit"> 
              <input name="teacherID" type="hidden" id="teacherID" value="1"></td>
          </tr>
          <tr> 
            <td height="31" align="left" valign="middle"> 科 目: 
              <select id=select8 name=Subject onClick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)"
size="1">
                <option value="temp">未选择</option>
                <%--Tools.showOption("select * from subject order by id",con,out);--%>
              </select>
            </td>
          </tr>
          <tr> 
            <td height="199" align="center" valign="middle"> 
              <table width="100%" height="60%" border="0">
                <tr> 
                  <td width="74%" height="28" valign="bottom" nowrap>知识点1:</td>
                </tr>
                <tr> 
                  <td height="32" nowrap> <select name=KnowPoint1 id="select6">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select> </td>
                </tr>
                <tr> 
                  <td height="28" valign="bottom" nowrap>知识点2:</td>
                </tr>
                <tr> 
                  <td height="39"><select name=KnowPoint2 id="select7">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select></td>
                </tr>
                <tr> 
                  <td height="25" valign="bottom" nowrap>知识点3:</td>
                </tr>
                <tr> 
                  <td height="29" nowrap> <select name=KnowPoint3 id="select12">
                      <option value=-1>----未选择----</option>
                      <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                    </select> </td>
                </tr>
              </table> </td>
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
