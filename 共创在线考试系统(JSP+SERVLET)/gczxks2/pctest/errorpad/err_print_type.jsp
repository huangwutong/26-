<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%!
String sqlCon;
String sql;
String selectID;
boolean debug=false;

String[] arrID;
String[] arrSelect;
%>
<%
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
int idnum=0;
try{

arrID=(String[])session.getAttribute("arrID");
arrSelect=(String[])session.getAttribute("arrSelect");

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
//取回选择试题的ID
selectID="";
StringBuffer sb=new StringBuffer();
idnum=0;
for(int i=0;i<arrID.length;i++){

	if(arrSelect[i].equals("1")){
		sb.append(arrID[i]+",");
		idnum++;
	}
}

selectID=sb.toString().substring(0,sb.length()-1);
if(debug)
	out.print("<br>selectID="+selectID);

session.setAttribute("errorpad_selectID",selectID);

}
catch(Exception e){
    out.print("<br>error "+e.toString());
}
%>



<script language="javascript">
function CheckForm(f)
{
	if( f.testnumber.value.length<1)
	{
	    alert("您还有输入测验的试题数!");
		return false;
	}

	if(!isNumberString(f.testnumber.value,"1234567890."))
	{
	    alert("嘿！您在试题数里填了东西,但怎么不是数字呢？\n");
	    return false;
	}else if(f.testnumber.value<5 && (!f.testtype[1].checked)){
            alert("您在试题数里填写大于4的数字!");
            return false;
	}

   if( !(f.testtype[0].checked || f.testtype[1].checked||f.testtype[2].checked) ) {
		alert("您还没有选择打印范围!!")
		return false;
	}
    if(f.testtype[1].checked){

        if(f.selectcount.value==0){
            alert("您还没有在错题本中选择错题!!");
            return false;
        }
    }
	if( !(f.testorder[0].checked || f.testorder[1].checked||f.testorder[2].checked) ) {
		alert("您还没有选择测试顺序!")
		return false;
	}


	if(!(f.printtest.checked||f.printanswer.checked||f.printtip.checked)){
		alert("您还没有选择打印内容!")
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>错题本测验－选择测验类型</title>
</head>

<body bgcolor="#C8D6F0">
<div align="center">

  <form action="err_test_print.jsp" method="post" name="testtype" target="_blank" onSubmit="return CheckForm(this)">
    <table width="561" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="42" colspan="4"> <div align="center"><font color="#000000">精化学堂错题本</font>-请选择打印内容</div></td>
      </tr>
      <tr>
        <td height="30" colspan="2" nowrap><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　打印范围：</font></td>
        <td nowrap><font color="#000000">打印顺序：</font></td>
        <td nowrap>打印内容：</td>
      </tr>
      <tr>
        <td width="9%"><div align="right">
            <input type="radio" name="testtype" value="1">
          </div></td>
        <td width="35%" nowrap>浏览的错题</td>
        <td width="26%" nowrap>
<input type="radio" name="testorder" value="1">
          随机顺序</td>
        <td width="30%" nowrap>
		<input name="printtest" type="checkbox" id="printtest" value="1" checked onClick="this.checked=true">
          试题</td>
      </tr>
      <tr>
        <td> <div align="right">
            <input type="radio" name="testtype" value="2"　 onclick="document.testtype.testnumber.value=document.testtype.selectcount.value">
          </div></td>
        <td nowrap>浏览列表中选中的错题</td>
        <td nowrap>
<input type="radio" name="testorder" value="2">
          从难到易</td>
        <td nowrap><input name="printanswer" type="checkbox" id="printanswer" value="1">
          答案 </td>
      </tr>
      <tr>
        <td height="23"> <div align="right">
            <input type="radio" name="testtype" value="3">
          </div></td>
        <td nowrap>错题本中的所有错题</td>
        <td nowrap>
<input type="radio" name="testorder" value="3">
          从易到难</td>
        <td nowrap><input name="printtip" type="checkbox" id="printtip" value="1">
          <font color="#000000">提示</font></td>
      </tr>
      <tr>
        <td height="43" colspan="4" nowrap><div align="center"><font color="#000000">试题数：
            <input name="testnumber" type="text" id="testnumber2" value="5" size="10">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </font></div></td>
      </tr>
      <tr>
        <td colspan="4" nowrap> <div align="center">
            <input name="testbegin" type="submit" id="testbegin3" value="打 印" onClick="window.close()">
          </div></td>
      </tr>
    </table>
    <p align="left">&nbsp; </p>
    <p>&nbsp; </p>
    <p>
      <input  name="sqlcon" id="sqlcon3" type="hidden" value="<%=sqlCon%>" >
      <input  name="selectcount" id="sql3" type="hidden" value="<%=idnum%>" >
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </form>
  <p align="left">&nbsp;</p>
  <p align="left"><font color="#000000"> </font></p>
  <p align="left">&nbsp; </p>
</div>
</body>
</html>
