<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page errorPage="QuestGen_error.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="jinghua.JH_Tools"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>

<%!Connection con=null;
	String teachID="";

%>
<%
try{

    con=DBCon.getConnection();

 %>
<script language="javascript">
function CheckForm(f)
{
//��ȡHTML�ı�
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
	    	alert("�ύ�������е� "+i+" �����д�Word�����ͼƬ��Ϣ������ϸ���!\n"+"ԭ��ĿΪ��\n"+arrQuestText[i]);
			return false;
		}
	}
	
	

    if( f.Grade.selectedIndex == 0) {
        alert("��ѡ�������ȼ���Ϣ!")
        return false;
    }
    if(f.Subject.selectedIndex==0){
        alert("��ѡ���Ŀ��Ϣ!")
        return false;
    }
    if(f.mntest.selectedIndex==0){
        alert("��ѡ����ʽ������Ϣ!")
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

<!--������ȼ�����Ŀ��֪ʶ�����������б������-->
<%
String temp=jinghua.JH_Tools.grade_mntest(con);
out.print(temp);
temp=jinghua.JH_Tools.sub_know(DBCon.getConnection());
out.print(temp);
temp=jinghua.JH_Tools.grade_sub(DBCon.getConnection());
out.print(temp);
%>
<script language="JavaScript">
function changegm(locationid){
	    document.myform.mntest.length =1;
		document.myform.Subject.length =1;
		document.myform.KnowPoint1.length =1;
        document.myform.KnowPoint2.length =1;
        document.myform.KnowPoint3.length =1;
        var locationid=locationid;
        var i;
        for (i=0;i < gmcount; i++){
            if (grade_mntest[i][0] == locationid) {
	            document.myform.mntest.options[document.myform.mntest.length] = new Option(grade_mntest[i][2], grade_mntest[i][1]);
            }
	}
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
<title>ģ�������ύ</title>
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

<FORM name=myform action="updatetest_mn.jsp" method=post onSubmit="return CheckForm(this)">

  <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
    <TBODY>
      
      <TR> 
        <TD height=45><div align="center"><span class="style1">��ʽ���Ծ�</span></div></TD>
      </TR>
    </TBODY>
  </TABLE>

��
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="100%" height="535" valign="top">
<table width="100%" height="321" border="1" bordercolor="#d3add1" background="images/lvbgcolor.gif">
          <tr> 
            <td width="17%" height="39" align="left" valign="middle">������ȼ�: 
              <select id=select16 name=Grade onclick="changegm(document.myform.Grade.options[document.myform.Grade.selectedIndex].value)" size="1">
                <option value="temp">δѡ��</option>
                <%jinghua.JH_Tools.showGradeOption(con,out);%>
              </select> </td>
            <td width="15%" align="left" valign="middle">��Ŀ����: 
              <select id=select15 name=QuestType>
                <%jinghua.JH_Tools.showOption("select * from questtype",con,out);%>
              </select> </td>
            <td width="68%" align="left" valign="middle"><table width="100%" border="0">
                <tr> 
                  <td width="8%" height="31" nowrap>���ƣ�</td>
                  <td width="54%"><input name="suit_title" type="text" id="suit_title3" size="40" maxlength="200"></td>
                  <td width="7%">&nbsp;</td>
                  <td width="6%"><input name="Reset_Quest2" type="reset" class="s03" id="Reset_Quest4" value="����"></td>
                  <td width="6%">&nbsp;</td>
                  <td width="19%"><input name="Submit2" type="submit" class="s03" value="�ύ"></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="50" colspan="2" align="left" valign="middle"> <table width="100%" border="0">
                <tr> 
                  <td>��ʽ���ԣ� </td>
                </tr>
                <tr> 
                  <td><select id=select6 name=mntest  size="1">
                      <option value=-1>----δѡ��----</option>
                    </select></td>
                </tr>
              </table></td>
            <td rowspan="3" align="center"><iframe src="../editor/edit.jsp" id='editor' frameborder=0 scrolling=auto width=544 height=321> </iframe>
              <textarea name="Content" style="display:none"></textarea>
              &nbsp;
              <input name="group" type="hidden" id="group" value="suit"> 
            <input name="teacherID" type="hidden" id="teacherID" value="1"></td>
          </tr>
          <tr> 
            <td height="30" colspan="2" align="left" valign="middle"> �� Ŀ: 
              <select id=select4 name=Subject onClick="changesk(document.myform.Subject.options[document.myform.Subject.selectedIndex].value)"
size="1">
                <option value="temp">δѡ��</option>
                <%--Tools.showOption("select * from subject order by id",con,out);--%>
              </select>            </td>
          </tr>
          <tr> 
            <td height="189" colspan="2" align="center" valign="middle"> 
              <table width="100%" height="60%" border="0">
                <tr> 
                  <td height="56"> <table width="100%" border="0">
                      <tr> 
                        <td>֪ʶ��1: </td>
                      </tr>
                      <tr> 
                        <td><select name=KnowPoint1 id="select7">
                            <option value=-1>----δѡ��----</option>
                            <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                          </select></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="62"> <table width="100%" border="0">
                      <tr> 
                        <td>֪ʶ��2:</td>
                      </tr>
                      <tr> 
                        <td><select name=KnowPoint2 id="select">
                            <option value=-1>----δѡ��----</option>
                            <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                          </select></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="59"><table width="100%" border="0">
                      <tr> 
                        <td>֪ʶ��3:</td>
                      </tr>
                      <tr> 
                        <td><select name=KnowPoint3 id="select5">
                            <option value=-1>----δѡ��----</option>
                            <%-- Tools.showOption("select * from knowpoint order by id",con,out);--%>
                          </select></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
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
