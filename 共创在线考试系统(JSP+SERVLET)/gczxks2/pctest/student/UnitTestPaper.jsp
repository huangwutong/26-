<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*" %>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%! boolean debug=false;%>
<%
String testID=request.getParameter("testID");
String studentID=request.getParameter("stuID");
//http://localhost:8080/jinghua/student/UnitTestPaper.jsp?testID=100&stuID=s11
//String testID="100";
//String studentID="s11";


ResultSet rs=null;
String sql="";
String title="";
int testnum=0;
int testmark=0;
PreparedStatement pstmt=null;
StringBuffer dbmsg=new StringBuffer();
StringBuffer testIDs=new StringBuffer();
//StringBuffer Answer=new StringBuffer();
//StringBuffer Mark=new StringBuffer();
int testNumber=0;
try{
    Connection con=DBCon.getConnection();

    sql="select id,paper,title,testnum from test where id="+testID;
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();

    if(rs.next()){
        //分析试题：试题ID@答案@分数@难易度;     一道试题的格式，以#号结束
        String paper=rs.getString("paper");
        title=rs.getString("title");
        testnum=rs.getInt("testnum");

        if(debug) dbmsg.append("<br>paper="+paper);
        String [] tests=paper.split("#");
        for(int i=0;i<tests.length;i++){
            //取回试题号
            String [] test=tests[i].split("@");
            testIDs.append(test[0]+",");//题号
            //Answer.append(test[1]+"#");//答案
			//Mark.append(test[2]+"#");

            testmark+=Float.parseFloat(test[2]);
        }
        sql=testIDs.toString().substring(0,testIDs.length()-1);
        sql="select id,questtext,mark from question where id in ("+sql+") order by id";
		rs.close();
        pstmt.close();


        pstmt=con.prepareStatement(sql);
        rs=pstmt.executeQuery();



%>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>考试阶段 | <%=title%> | 单项选择题</title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>

<body>
<center>
  <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="71">
    <tr>
      <td width="100%" height="29" style="border-left-style: solid; border-left-width: 0; border-right-style: solid; border-right-width: 0; border-top-style: solid; border-top-width: 0; border-bottom: 1px solid #000000">
        <img src="../images/ksks.gif" width="108" height="28" border="0"></td>
    </tr>
    <tr>
      <td height="21">当前位置：单元测试 &gt; </td>
    </tr>
    <tr>
        <TD class=p2 height=30><center>
                    <font color="#74a8d1" size="+2">
                            <strong><B>
                                <%=title%>
                                    </B>
                            </strong>
                        </font></center></TD>
    </tr>
  </table>
</center>
<center><form  ACTION="unit_sel_rs.jsp"  method="post" name="viewdatabase" target="_blank">
  <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="100%" id="AutoNumber1" height="82">
    <tr class="trh">
      <td width="44" align="center" bgcolor="#799AE1" height="24">
      <font color="#FFFFFF"><b>序号</b></font></td>
      <td align="center" bgcolor="#799AE1" width="592" height="24">
      <p align="center"><font color="#FFFFFF"><b>单项选择题（共<%=testnum%>题,<%=testmark%>分）</b></font></td>
    </tr>
    <%while(rs.next()){%>
    <tr class="trh1">
        <td align="center"   height="35" width="44">　
          <table width="100%" border="0">
            <tr>
              <td><center><%=(++testNumber)%></center></td>
            </tr>
            <tr>
              <td><center><%DecimalFormat df=new DecimalFormat("###");
                  String numNF=df.format(rs.getFloat("mark"));
              out.print("("+numNF+")分");%></center></td>
            </tr>
          </table></td>
      <td align="left" width="592" height="35">
       <br>
        <%=rs.getString("questtext")%>
        <br>
       </td>
    </tr>
    <%}
    rs.close();
    pstmt.close();
    %>
    <tr>
        <td align="center" bgcolor="#FFFFFF" height="16" width="640" colspan="2" bordercolor="#FFFFFF">
          <input class="s02"  type="submit" value="提交" name="submit1">
          &nbsp;&nbsp;
          <input class="s02" type="reset" name="submit2" value="重置">
          <input name="testid" type="hidden" id="testid2" value="<%=testID %>">
          <input name="studentid" type="hidden" id="studentid2" value="<%=studentID %>">
        </td>
      </tr>

  </table>
</form>
</center>


</body>

</html>
<%
}else{
        Tools.showalert("从数据库中取出试题出错，没有找到相应试卷!",out);
        Tools.goback(out);

}
}catch(SQLException e){
    out.print("<br>SQL Error:sql="+sql+"<br>"+e.toString());
}catch(Exception e){
    out.print(e.toString() );
}
finally{
    DBCon.dropConnection();
}
%>
