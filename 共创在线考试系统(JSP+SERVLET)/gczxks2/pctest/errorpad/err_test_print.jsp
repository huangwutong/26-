<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*" %>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%! boolean debug=false;
String studentID;
%>
<%
try{
    studentID=(String)session.getAttribute("studentID");
    if(studentID==null){
        throw new Exception();
    }
    //Tools.showalert(studentID,out);

}catch(Exception e){
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
     Tools.showJS("window.open('../login.jsp','_self')",out);

}

//testtype: 1����Ĵ���;2����б���ѡ�еĴ���;3���Ȿ�е����д���
//testorder:2���˳��;2���ѵ���;3���׵���
int testtype=Integer.parseInt(request.getParameter("testtype"));
int testorder=Integer.parseInt(request.getParameter("testorder"));
int testnumber=Integer.parseInt(request.getParameter("testnumber"));
boolean printtest;
boolean printanswer;
boolean printtip;
int rownum=0;
if(request.getParameter("printtest")==null)
    printtest=false;
else{
    printtest=true;
    rownum++;
}
if(request.getParameter("printanswer")==null)
    printanswer=false;
else{
    printanswer=true;
    rownum++;
}
if(request.getParameter("printtip")==null)
    printtip=false;
else{
    printtip=true;
    rownum+=2;
}

int selectnum=0;
String errorpad_selectID=(String)session.getAttribute("errorpad_selectID");
String errorpad_sqlcon=(String)session.getAttribute("errorpad_sqlcon");

if(debug){
    out.print("<br>testtype="+testtype+
            "<br>testorder="+testorder+
            "<br>errorpad_sqlcon="+errorpad_sqlcon+
            "<br>errorpad_selectid="+errorpad_selectID+
            "<br>printtest="+printtest+
            "<br>printanswer="+printanswer+
            "<br>printtip="+printtip+
            "<br>rownum="+rownum);
}
ResultSet rs=null;
String sql="";
String sqlcon="";
String sqlorder="";
int testnum=0;
int testmark=0;

PreparedStatement pstmt=null;
Statement stmt=null;
StringBuffer dbmsg=new StringBuffer();
StringBuffer testIDs=new StringBuffer();
StringBuffer errorIDs=new StringBuffer();
//StringBuffer Answer=new StringBuffer();
//StringBuffer Mark=new StringBuffer();
int testNumber=0;
String strName=null;
String strDate=null;
try{
    Connection con=DBCon.getConnection();
    //��ѯ������Ϣ
    try{
        sql="SELECT   CURRENT_DATE as curdate,`UserInfo`.`vcName` FROM  `UserInfo`"+
            " WHERE  (`UserInfo`.`vcUserNo` = '"+studentID+"')";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            strName=rs.getString("vcName");
            strDate=rs.getString("curdate");
        }
        rs.close();
        stmt.close();
    }
    catch(Exception e){
        out.println("<BR>Query student error sql="+sql);
        out.print("<br>"+e.toString());
    }

//�����ѯ����
//testtype: 1����Ĵ���;2����б���ѡ�еĴ���;3���Ȿ�е����д���
//testorder:2���˳��;2���ѵ���;3���׵���
switch(testtype){
    case 1:
        sqlcon=errorpad_sqlcon;
        break;
    case 2:
        //�����ύ����ѡ��Ĵ��������
        if(errorpad_selectID==null|| errorpad_selectID.trim().equals("")){
            Tools.showalert("��û�дӴ��Ȿ��ѡ����⣡",out);
            Tools.goback(out);
        }else{
       // String [] strarr=errorpad_selectID.split(",");
       // if(debug)   out.print("<br>select num="+strarr.length);
       // if(strarr.length<testnumber){
       //     Tools.showalert("���Ӵ��Ȿ��ѡ�����Ŀ��������!!",out);
       //     Tools.goback(out);
       // }else{
            sqlcon=errorpad_sqlcon+ " AND (errorpad.id IN ("+errorpad_selectID+")) ";
       // }
        }
        break;
    case 3:
        sqlcon="(`errorpad`.`stu_id` = '"+studentID+"')";
        break;
    default:
        break;
}
switch(testorder){
    case 1:
        sqlorder=" ORDER BY RAND()";
        break;
    case 2:
        sqlorder=" ORDER BY errorpad.errorcount DESC,errorpad.add_date DESC";
        break;
    case 3:
        sqlorder=" ORDER BY errorpad.errorcount ASC,errorpad.add_date DESC";
        break;
    default:
        break;
}
sql="SELECT  errorpad.`id` as errorID,  `question`.`ID`,`question`.`Tip`,`question`.`PreHard` , `question`.`QuestText`,  "+
    " `question`.`Mark`,  `question`.`Answer`"+
    " FROM  `errorpad`"+
    " LEFT OUTER JOIN `question` ON (`errorpad`.`question_id` = `question`.`ID`) "+
    " WHERE "+sqlcon+sqlorder+" LIMIT "+testnumber;

    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();
    testmark=0;
    testnum=0;
    while(rs.next()){
        testmark+=rs.getInt("Mark");
        testnum++;
        //����ID@��@����@���׶�;     һ������ĸ�ʽ����#�Ž���
        testIDs.append(rs.getString("ID")+"@"+rs.getString("Answer")+"@"+rs.getString("Mark")+
            "@"+ rs.getString("PreHard")+"#");
        errorIDs.append(rs.getString("errorID")+",");
    }

    rs.beforeFirst();

    if(debug){
        out.print("<br>query question sql="+sql);
    }





%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->
<HTML><HEAD><TITLE>����ϵͳ-���Ȿ���߲���</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../student/style/style.css" type=text/css rel=stylesheet>
<SCRIPT src="../student/js/html.js"></SCRIPT>

<SCRIPT src="../student/js/gnb_menus_layer.js"></SCRIPT>

<SCRIPT src="../student/js/menu.js"></SCRIPT>

<SCRIPT src="../student/js/jumpmenu.js"></SCRIPT>

<SCRIPT src="../student/js/Valid.js"></SCRIPT>

<META content="MSHTML 6.00.2722.900" name=GENERATOR>
<style media="print">
.noprint { display: none }
</style>
<script language="VBScript">
dim hkey_root,hkey_path,hkey_key
hkey_root="HKEY_CURRENT_USER"
hkey_path="\Software\Microsoft\Internet Explorer\PageSetup"
'//������ҳ��ӡ��ҳüҳ��Ϊ��
function pagesetup_null()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,""
end function
'//������ҳ��ӡ��ҳüҳ��ΪĬ��ֵ
function pagesetup_default()
on error resume next
Set RegWsh = CreateObject("WScript.Shell")
hkey_key="\header"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&w&bҳ�룬&p/&P"
hkey_key="\footer"
RegWsh.RegWrite hkey_root+hkey_path+hkey_key,"&u&b&d"
end function
</script>

</HEAD>
<BODY text=#000000 bgColor=#ffffff onLoad="pagesetup_null()">
<CENTER>
  <form  ACTION="err_test_rs.jsp"  method="post" name="viewdatabase" target="_blank">
    <table width="80%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="64%"><img src="../student/images/test_pop_01.gif" width="102" height="27"></td>
        <td align="right"><img src="../student/images/test_pop_02.gif" width="134" height="27"></td>
      </tr>
    </table>
    <!--begin test -->
    <div align="right" class=noprint>
      <OBJECT classid=CLSID:8856F961-340A-11D0-A96B-00C04FD705A2 height=0 id=WebBrowser width=0>
      </OBJECT>
      <input name=Button onClick=document.all.WebBrowser.ExecWB(6,6) type=button value=ֱ�Ӵ�ӡ>
      <input name=Button onClick=document.all.WebBrowser.ExecWB(7,1) type=button value=��ӡԤ��>
      <input name=Button onClick=document.all.WebBrowser.ExecWB(8,1) type=button value=ҳ������>
      <input name=Button onClick=document.all.WebBrowser.ExecWB(45,1) type=button value=�ر�>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" nowrap class="title1"><div align="center"><font color="#74a8d1" size="+2"><strong><b>����ϵͳ-���Ȿ</b></strong></font>
          </div></td>
      </tr>
      <tr>
        <td align="center" nowrap class="title1"> <div align="right"> <font color="#74a8d1" size="+2"><strong>
            </strong></font></div>
          <div align="right"></div>
          <div align="left">
            <table width="85%" height="21" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="26%"><div align="right"></div></td>
                <td width="15%" nowrap> <div align="right">������</div></td>
                <td width="10%" nowrap> <div align="right"><%=strName%></div></td>
                <td width="4%"><div align="left"></div>
                  <div align="right"></div></td>
                <td width="45%"><div align="left"><%=strDate%></div></td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
    </table>
  <br>
    <table id=AutoNumber1 style="BORDER-COLLAPSE: collapse"
height=82 cellspacing=1 width="85%" border=0 cellpadding="2" bgcolor="#c1c1c1">
      <tbody>
        <tr class=trh>
          <td width=34 align=center nowrap bgcolor=#eaeaea><b>���</b></td>
          <td align=middle bgcolor=#eaeaea> <p align=center><b>��<%=testnum%>��</b></p></td>
        </tr>
        <%while(rs.next()){%>
        <tr class=trh1 bgcolor="#FFFFFF">
          <td width="34"  align=center valign="top"><%=(++testNumber)%>. </td>
          <td align=left valign="top">
            <div align="left" >
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class=trh1>
                  <td height="22">
                    <%
         String temp=rs.getString("questtext");
         temp=jinghua.TransformString.deTransformSelection(temp);
         temp=jinghua.TransformString.DeleteBR(temp);

         out.print(temp);
         %>
                  </td>
                </tr>
        <%if(printanswer){%>
                <tr class=trh1>
                  <td height="25" align="left" valign="bottom">�𰸣�<%=rs.getString("Answer")%></td>
                </tr>
        <%}
        if(printtip){
        %>
                <tr>
                  <td height="22" align="left" valign="bottom">��ʾ��</td>
                </tr>

                <tr>
                  <td >
                  <%
                  temp=rs.getString("Tip");
                  temp=jinghua.TransformString.DeleteBR(temp);
                  out.print(temp);
                  %></td>
                </tr>
        <%}%>
              </table>
            </div>

          </td>
        </tr>

        <%}
    rs.close();
    pstmt.close();
    %>
      </tbody>
    </table>

    <p>&nbsp;</p><p>&nbsp;</p></form></CENTER></BODY></HTML>




<%


}catch(SQLException e){
    out.print("<br>SQL Error:sql="+sql+"<br>"+e.toString());
}catch(Exception e){
    out.print(e.toString() );
}
finally{
    DBCon.dropConnection();
}
%>
