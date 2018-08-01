<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

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
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}




int subID=Integer.parseInt(request.getParameter("Subject"));//-1为全部
int knowID=Integer.parseInt(request.getParameter("KnowPoint"));//-1为全部
//1:任意；2：容易；3：中等；4：较难
int hardID=Integer.parseInt(request.getParameter("hard"));
//testorder:2随机顺序;2从难到易;3从易到难
int testorder=Integer.parseInt(request.getParameter("testorder"));
int testnumber=Integer.parseInt(request.getParameter("testnumber"));
//难易度设置：A,B,C,D,E
//容易：E:30%,D:30%,C:30%;B:10%
//中等：D:20%,C:30%,B:30%,A:10%,E:10%;
//较难：C:20%,B:20%,A:50%,D:10%
int numA=0,numB=0,numC=0,numD=0,numE=0,numElse=0;//各难度试题的个数
switch(hardID){
    case 1:
        numElse=testnumber;
        break;
    case 2:

        numA=0;
        numB=(int)Math.floor(testnumber*0.1);
        numC=(int)Math.floor(testnumber*0.3);
        numD=(int)Math.floor(testnumber*0.3);
        numE=(int)Math.floor(testnumber*0.3);
        numElse=testnumber-numA-numB-numC-numD-numE;
        break;

    case 3:
        numA=(int)Math.floor(testnumber*0.1);
        numB=(int)Math.floor(testnumber*0.3);
        numC=(int)Math.floor(testnumber*0.3);
        numD=(int)Math.floor(testnumber*0.2);
        numE=(int)Math.floor(testnumber*0.1);
        numElse=testnumber-numA-numB-numC-numD-numE;
        break;
    case 4:
        numA=(int)Math.floor(testnumber*0.4);
        numB=(int)Math.floor(testnumber*0.2);
        numC=(int)Math.floor(testnumber*0.2);
        numD=(int)Math.floor(testnumber*0.1);
        numE=(int)Math.floor(testnumber*0.1);
        numElse=testnumber-numA-numB-numC-numD-numE;
        break;
}
if(debug){
    out.print("<br>studentID="+studentID+
            "<br>subID="+subID+
            "<br>knowID="+knowID+
            "<br>hardID="+hardID+
            "<br>testorder="+testorder+
            "<br>numA="+numA+
            "<br>numB="+numB+
            "<br>numC="+numC+
            "<br>numD="+numD+
            "<br>numE="+numE+
            "<br>numElse="+numElse
            );
}
ResultSet rs=null;
String sql="";
String sqlcon="";
String sqlorder="";

int testnum=0;
int testmark=0;
int i=0;
String strQuestIDs=null;
Statement stmt=null;

StringBuffer testIDs=new StringBuffer();

//StringBuffer Answer=new StringBuffer();
//StringBuffer Mark=new StringBuffer();
int testNumber=0;



try{
    Connection con=DBCon.getConnection();
//构造查询条件
//科目
sqlcon="(`question`.`Source` =1)";

if(subID!=-1){
    sqlcon=sqlcon+" AND "+" (`question`.`SubjectID`="+subID+") ";
}
//知识点
if(knowID!=-1){
    if(sqlcon.equals(""))
        sqlcon=" ((`question`.`KnowPointID1` = "+knowID+") OR "+
                "  (`question`.`KnowPointID2` = "+knowID+") OR "+
                "  (`question`.`KnowPointID3` = "+knowID+")) ";
    else
        sqlcon=sqlcon+ " AND "+
                "((`question`.`KnowPointID1` = "+knowID+") OR "+
                "  (`question`.`KnowPointID2` = "+knowID+") OR "+
                "  (`question`.`KnowPointID3` = "+knowID+")) ";
}

if(debug){
    out.println("<br>sqlcon="+sqlcon);
}
//testorder:2随机顺序;2从难到易;3从易到难
switch(testorder){
    case 1:
        sqlorder=" ORDER BY RAND()";
        break;
    case 2:
        sqlorder=" ORDER BY `question`.`PreHard` ASC,`question`.`ID` ASC";
        break;
    case 3:
        sqlorder=" ORDER BY `question`.`PreHard` DESC,`question`.`ID` ASC";
        break;
    default:
        break;
}

//难易度
Vector questIDs=new Vector();
//A
if(numA>0){
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`PreHard` = 'A')"+" ORDER BY RAND() "+" LIMIT  "+numA;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`PreHard` = 'A')"+" ORDER BY RAND() "+" LIMIT  "+numA;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
        if(debug)
            out.print("<br>select numA sql="+sql);
    }
    catch(Exception e){
        out.print("<br> query question hard A error sql="+sql);
        out.print("<br>"+e.toString());
    }
}
if(debug){
    out.print("<br>vector number A="+questIDs.size());
}
//B
if(numB>0){
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`PreHard` = 'B')"+" ORDER BY RAND() "+" LIMIT  "+numB;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`PreHard` = 'B')"+" ORDER BY RAND() "+" LIMIT  "+numB;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
        if(debug)
            out.print("<br>select numB sql="+sql);
    }
    catch(Exception e){
        out.print("<br> query question hard B error sql="+sql);
        out.print("<br>"+e.toString());
    }
}
if(debug){
    out.print("<br>vector number B="+questIDs.size());
}

//C
if(numC>0){
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`PreHard` = 'C')"+" ORDER BY RAND() "+" LIMIT  "+numC;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`PreHard` = 'C')"+" ORDER BY RAND() "+" LIMIT  "+numC;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
        if(debug)
            out.print("<br>select numC sql="+sql);
    }
    catch(Exception e){
        out.print("<br> query question hard C error sql="+sql);
        out.print("<br>"+e.toString());
    }
}
if(debug){
    out.print("<br>vector number C="+questIDs.size());
}

//D
if(numD>0){
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`PreHard` = 'D')"+" ORDER BY RAND() "+" LIMIT  "+numD;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`PreHard` = 'D')"+" ORDER BY RAND() "+" LIMIT  "+numD;

    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
        if(debug)
            out.print("<br>select numD sql="+sql);
    }
    catch(Exception e){
        out.print("<br> query question hard D error sql="+sql);
        out.print("<br>"+e.toString());
    }
}
if(debug){
    out.print("<br>vector number D="+questIDs.size());
}

//E
if(numE>0){
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`PreHard` = 'E')"+" ORDER BY RAND() "+" LIMIT  "+numE;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`PreHard` = 'E')"+" ORDER BY RAND() "+" LIMIT  "+numE;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
        if(debug)
            out.print("<br>select numE sql="+sql);
    }
    catch(Exception e){
        out.print("<br> query question hard E error sql="+sql);
        out.print("<br>"+e.toString());
    }
}
if(debug){
    out.print("<br>vector number E="+questIDs.size());
}

//Else  strQuestIDs
if(questIDs.size()<testnumber){
//if(numElse>0){
    numElse=testnumber-questIDs.size();
    StringBuffer sb=new StringBuffer();
    for(i=0;i<questIDs.size();i++)
        sb.append(questIDs.elementAt(i)+",");
    if(sb.length()>0){
        strQuestIDs=sb.toString().substring(0,sb.toString().length()-1);
    }
    else
        strQuestIDs="-1";
    sb=null;
    if(sqlcon.equals(""))
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
                "(`question`.`ID` NOT IN ("+strQuestIDs+"))"+" ORDER BY RAND() "+" LIMIT  "+numElse;
    else
        sql="SELECT   `question`.`ID` FROM  `question` WHERE "+
            sqlcon+" AND "+"(`question`.`ID` NOT IN ("+strQuestIDs+"))"+" ORDER BY RAND() "+" LIMIT  "+numElse;

    if(debug)
        out.print("<br>query question numElse sql="+sql);
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        while(rs.next()){
            questIDs.addElement(new String(rs.getString("ID")));
        }
    }
    catch(Exception e){
        out.print("<br> query question hard Else error sql="+sql);
        out.print("<br>"+e.toString());
    }
}

if(debug){
    out.print("<br>vector number Else="+questIDs.size());
}

switch(testorder){
    case 1:
        sqlorder=" ORDER BY RAND()";
        break;
    case 2:
        sqlorder=" ORDER BY `question`.`PreHard` ASC,`question`.`ID` ASC";
        break;
    case 3:
        sqlorder=" ORDER BY `question`.`PreHard` DESC,`question`.`ID` ASC";
        break;
    default:
        break;
}

StringBuffer sb=new StringBuffer();
for(i=0;i<questIDs.size();i++)
    sb.append(questIDs.elementAt(i)+",");
if(sb.length()>0){
    strQuestIDs=sb.toString().substring(0,sb.toString().length()-1);
}
else
    strQuestIDs="-1";
sb=null;

if(debug)
    out.print("<br>strQuestIDs="+strQuestIDs);


sql="SELECT  `question`.`ID`,`question`.`PreHard` , `question`.`QuestText`,  "+
    " `question`.`Mark`,  `question`.`Answer`"+
    " FROM  `question` "+
    " WHERE `question`.`ID` IN("+strQuestIDs+") "+sqlorder+" LIMIT "+testnumber;

    if(debug)
        out.print("<br>paper sql="+sql);
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    testmark=0;
    testnum=0;
    while(rs.next()){
        testmark+=rs.getInt("Mark");
        testnum++;
        //试题ID@答案@分数@难易度;     一道试题的格式，以#号结束
        testIDs.append(rs.getString("ID")+"@"+rs.getString("Answer")+"@"+rs.getString("Mark")+
            "@"+ rs.getString("PreHard")+"#");

    }

    rs.beforeFirst();

    if(debug){
        out.print("<br>query question sql="+sql);
    }





%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->
<HTML><HEAD><TITLE>考试系统-错题本在线测验</TITLE>
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
  <form  ACTION="free_test_rs.jsp"  method="post" name="viewdatabase" target="_blank">
    <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>&nbsp;</td>
      <td align="right">&nbsp;</td>
    </tr>
  </table>
  <!--begin test -->
  <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="title1" align="center"><font color="#74a8d1" size="+2">
                            <strong><B>
                                考试系统-自由测验
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
        <td align=center width=90 bgcolor=#eaeaea><b>序号</b></td>
        <td width="549" align=middle bgcolor=#eaeaea> <p align=center><b>共<%=testnum%>题,<%=testmark%>分</b></p></td>
      </tr>
	  <%while(rs.next()){%>
      <tr class=trh1 bgcolor="#FFFFFF">
          <td width=90 align=center valign="middle">　
            <table width="100%" border=0>
              <tbody>
                <tr align="center">
                  <td colspan="2">
                    <center>
                      <%=(++testNumber)%> .
                    </center></td>
                </tr>
                <tr>
                  <td colspan="2"> <center>
                      <font size="-1">
                      <%DecimalFormat df=new DecimalFormat("###");
                  String numNF=df.format(rs.getFloat("mark"));
              out.print("("+numNF+"分)");%>
                      </font></center></td>
                </tr>
                <tr>
                  <td width="69%" align="right">
<div align="right"><font size="-1">难度:</font></div></td>
                  <td width="31%" align="left">
<div align="left"><font size="-1"><%=rs.getString("PreHard")%></font></div></td>
                </tr>
                <tr>
                  <td colspan="2"><div align="center"><%if(debug) out.print(rs.getString("ID"));%></div></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
              </tbody>
          </table></td>
        <td align=left>

         <%=jinghua.TransformString.DeleteBR(rs.getString("questtext"))%>

		 </td>
      </tr>

	  <%}
    rs.close();
    stmt.close();
    %>
    </tbody>
  </table>
  <table cellspacing=0 cellpadding=8 width=650 border=0>
    <tbody>
    <tr>
      <td align=center>

            <!--begin botton-->
            <input class=s02 type=submit value=提交 name=submit1>
        &nbsp;&nbsp;
        <input class=s02 type=reset value=重置 name=submit2>

          <input name="studentid" type="hidden" id="studentid2" value="<%=studentID %>">
          <input name="testresult" type="hidden" id="studentid2" value="<%=testIDs.toString()%>">


        <!--end button-->
      </td>
    </tr>
    </tbody>
  </table>
  <!--end test -->
  <!--begin bottom -->
  <!--end bottom --></form></CENTER></BODY></HTML>




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
