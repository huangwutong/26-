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
    //Tools.showalert(studentID,out);
    if(studentID==null){
        throw new Exception();
    }

}catch(Exception e){
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}


//testtype: 1����Ĵ���;2����б���ѡ�еĴ���;3���Ȿ�е����д���
//testorder:2���˳��;2���ѵ���;3���׵���
int testtype=Integer.parseInt(request.getParameter("testtype"));
int testorder=Integer.parseInt(request.getParameter("testorder"));
int testnumber=Integer.parseInt(request.getParameter("testnumber"));
int selectnum=0;
String errorpad_selectID=(String)session.getAttribute("errorpad_selectID");
String errorpad_sqlcon=(String)session.getAttribute("errorpad_sqlcon");

if(debug){
    out.print("<br>testtype="+testtype+
            "<br>testorder="+testorder+
            "<br>errorpad_sqlcon="+errorpad_sqlcon+
            "<br>errorpad_selectid="+errorpad_selectID);
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
sql="SELECT  errorpad.`id` as errorID,  `question`.`ID`,`question`.`PreHard` , `question`.`QuestText`,  "+
    " `question`.`Mark`,  `question`.`Answer`"+
    " FROM  `errorpad`"+
    " LEFT OUTER JOIN `question` ON (`errorpad`.`question_id` = `question`.`ID`) "+
    " WHERE "+sqlcon+sqlorder+" LIMIT "+testnumber;
try{
    Connection con=DBCon.getConnection();
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
        out.print("<br>testIDs="+testIDs.toString());
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

<META content="MSHTML 6.00.2722.900" name=GENERATOR></HEAD>
<BODY text=#000000 bgColor=#ffffff>
<CENTER>
  <form  ACTION="err_test_rs.jsp"  method="post" name="viewdatabase" target="_blank">
    <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><img src="../student/images/test_pop_01.gif" width="102" height="27"></td>
      <td align="right"><img src="../student/images/test_pop_02.gif" width="134" height="27"></td>
    </tr>
  </table>
  <!--begin test -->
  <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="title1" align="center"><font color="#74a8d1" size="+2">
                            <strong><B>
                                ����ϵͳ-���Ȿ���߲���
                                    </B>
                            </strong>
                        </font></td>
    </tr>
  </table>
  <br>
  <table id=AutoNumber1 style="BORDER-COLLAPSE: collapse"
height=82 cellspacing=1 width="650" border=0 cellpadding="2" bgcolor="#c1c1c1">
    <tbody>
      <tr class=trh>
        <td align=center width=80 bgcolor=#eaeaea><b>���</b></td>
        <td align=middle bgcolor=#eaeaea> <p align=center><b>��<%=testnum%>��,<%=testmark%>��</b></p></td>
      </tr>
	  <%while(rs.next()){%>
      <tr class=trh1 bgcolor="#FFFFFF">
        <td align=middle width=80>��
          <table width="100%" border=0>
            <tbody>
              <tr>
                <td> <center>
                   <%=(++testNumber)%> </center></td>
              </tr>
              <tr>
                <td> <center>
                      <%DecimalFormat df=new DecimalFormat("###");
                  String numNF=df.format(rs.getFloat("mark"));
              out.print("("+numNF+"��)");%>
                    </center></td>
              </tr>
            </tbody>
          </table></td>
        <td align=left>
		<br>
         <%=jinghua.TransformString.DeleteBR(rs.getString("questtext"))%>
		 <br>
		 </td>
      </tr>

	  <%}
    rs.close();
    pstmt.close();
    %>
    </tbody>
  </table>
  <table cellspacing=0 cellpadding=8 width=650 border=0>
    <tbody>
    <tr>
      <td align=center>

            <!--begin botton-->
            <input class=s02 type=submit value=�ύ name=submit1>
        &nbsp;&nbsp;
        <input class=s02 type=reset value=���� name=submit2>

          <input name="studentid" type="hidden" id="studentid2" value="<%=studentID %>">
          <input name="testresult" type="hidden" id="studentid2" value="<%=testIDs.toString()%>">
          <input name="errorids" type="hidden" id="studentid2" value="<%=errorIDs.toString()%>">

        <!--end button-->
      </td>
    </tr>
    </tbody>
  </table>
  <!--end test -->
  <!--begin bottom -->
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
            target=_blank>��������</A> | <A
            href="http://jsptestonline.cosoft.org.cn/contact/3_ywhz.html"
            target=_blank>��ϵ��ʽ</A> | ��վ��ͼ | <A
            href="http://jsptestonline.cosoft.org.cn/about/service.html"
            target=_blank>��������</A> | <A
            href="http://jsptestonline.cosoft.org.cn/about/privacy.html"
            target=_blank>��˽Ȩ����</A> | <A
            href="http://jsptestonline.cosoft.org.cn/about/copyright.html"
            target=_blank>��Ȩ����</A></TD>
          <TD align=middle width=220>��Ȩ���У�<A href="http://jsptestonline.cosoft.org.cn/"
            target=_blank>������������</A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!--end bottom --></form></CENTER></BODY></HTML>




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
