
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%! boolean debug=false;%>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%
String testID=request.getParameter("testid");
String studentID=request.getParameter("studentid");
//String testID="62";
//String studentID="1";
ResultSet rs=null;
Statement stmt=null;

String sql="";
String title="";
int testnum=0;
int i=0;
StringBuffer sb=new StringBuffer();
PreparedStatement pstmt=null;
String name="";//考生姓名

int correct=0;
int error=0;
int count=0;
String correctAns="";
StringBuffer dbmsg=new StringBuffer();
StringBuffer testIDs=new StringBuffer();
StringBuffer Answer=new StringBuffer();
StringBuffer Mark=new StringBuffer();
StringBuffer SubAns=new StringBuffer();
StringBuffer TF=new StringBuffer();
StringBuffer Dif=new StringBuffer();
Vector explain=new Vector();
String [] arrMark=null;
String [] arrAnswer=null;
String [] arrSubAns=null;
String [] arrTestID=null;
String arrTF="";
String temp="";
float testmark=0.0f;
float totalmark=0.0f;
int testNumber=0;
try{
    Connection con=DBCon.getConnection();

    sql="select id,paper,title,testnum from test where id="+testID;
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();
   // pstmt.close();

    if(debug){
        out.print("<br>sql="+sql);
    }
    if(rs.next()){
        //分析试题：试题ID@答案@分数@难易度;     一道试题的格式，以#号结束
        if(debug) out.print("<br>begin:");
        String paper=rs.getString("paper");
        title=rs.getString("title");
        testnum=rs.getInt("testnum");//总试题数量

        if(debug) out.print("<br>paper="+paper+"<br>testnum="+testnum);
        String [] tests=paper.split("#");
        for(i=0;i<testnum;i++){
            //取回试题号
            String [] test=tests[i].split("@");
            if(debug) {
                out.print("<BR>tests["+i+"]="+tests[i]);
            }
            testIDs.append(test[0]+",");//题号
            Answer.append(test[1]+",");//答案
			Mark.append(test[2]+"#");
            Dif.append(test[3]+"#");
            testmark+=Float.parseFloat(test[2]);//总分数





        }

        arrMark=Mark.toString().split("#");
        arrAnswer=Answer.toString().split(",");
        arrTestID=testIDs.toString().split(",");
        //根据arrTestID提取考生提交的答案信息，不填写的为"空";
        if(debug){
            out.print("<br>Mark="+Mark.toString());
            out.print("<br>Answer="+Answer.toString());
            out.print("<br>TestID="+testIDs.toString());
        }

        for( i=0;i<testnum;i++){

           temp=request.getParameter("radio"+arrTestID[i]);
           if (temp==null){
               SubAns.append("空"+",") ;
               //arrSubAns[i]=new String("@");
           }else{
               SubAns.append(temp+",");
               //arrSubAns[i]=new String(temp);
           }
        }
        if(debug){
            out.print("<br>Mark="+Mark.toString());
            out.print("<br>Answer="+Answer.toString());
            out.print("<br>TestID="+testIDs.toString());
            out.print("<br>SubAns="+SubAns.toString());

        }
        arrSubAns=SubAns.toString().split(",");
        //评分
        correct=0;
        error=0;
        testmark=0;
        totalmark=0.0f;
        for(i=0;i<testnum;i++)
        {
            totalmark+=Float.parseFloat(arrMark[i]);
            if(arrSubAns[i].equals(arrAnswer[i])){
                TF.append("T");
                correct++;
                if(debug){
                    Tools.debugmsg("<br>arrMark["+i+"]="+arrMark[i],out);
                }
                testmark+=Float.parseFloat(arrMark[i]);
            }else {
                error++;
                if(arrSubAns[i].equals(" "))
                    TF.append("@");
                else
                    TF.append("F");
            }

        }
        arrTF=TF.toString();
        //考生信息
        rs.close();
        pstmt.close();
        sql="select vcUserNo,vcName from UserInfo where vcUserNo="+"'"+studentID+"'";
        pstmt=con.prepareStatement(sql);
        rs=pstmt.executeQuery();
        if(rs.next()){

            name=""+rs.getString("vcName");
        }
        rs.close();
        pstmt.close();
        //记录考试结果

        DecimalFormat df=new DecimalFormat("###.0");//分数换算
        String r=df.format(testmark/totalmark*100);


        jinghua.T_score t_score=new jinghua.T_score(studentID,Integer.parseInt(testID) ,testmark ,"2",1);    //2:自由单元测试 1:系统判分
        r=t_score.storeMark(2);
        if(debug){
            out.print("<br>t_score:"+r);
        }
        if(!r.equals("OK")){
            throw new Exception("自由单元测试成绩入库错误！cbd");
        }

		//将错题插入错题本
		for(i=0;i<testnum;i++){
			if(debug) out.println("<BR>question error id="+arrTestID[i]+
            	": result="+arrTF.charAt(i) );
			if(arrTF.charAt(i)!='T'){

			count=0;
			sql=" select count(*) as errcount from errorpad where stu_id='"+studentID+"'"+
				" and question_id="+arrTestID[i];
			try{
    			stmt=con.createStatement();
    			rs=stmt.executeQuery(sql);
    			if(rs.next()){
					count=rs.getInt("errcount");
    			}
				rs.close();
				stmt.close();
				if(debug){
            		out.print("<br>errorpad question_id="+arrTestID[i]+
							"<br>count="+count);
        		}
				if(count==0){//插入新记录
					sql=" insert into errorpad(stu_id,question_id,add_date,errorcount,test_id,sourcetype)"+
						" values('"+studentID+"',"+arrTestID[i]+",CURRENT_TIMESTAMP,1,"+testID+",2)	";
					stmt=con.createStatement();
					stmt.executeUpdate(sql);
					stmt.close();
				}else{
					sql=" update errorpad set errorcount=errorcount+1 where stu_id='"+studentID+"'"+
						" and question_id="+arrTestID[i];
					stmt=con.createStatement();
					stmt.executeUpdate(sql);
					stmt.close();
				}


			}
    		catch(SQLException se){
            	out.print("<br> query errorpad info error sql="+sql);
        		out.print("<br>"+se.toString());
    		}
		    catch(Exception e){
        		out.print("<br> query errorpad info error sql="+sql);
		        out.print("<br>"+e.toString());
		    }
			}//end_if
		}//end for errorpad

	    //试题记录集
		sql=testIDs.toString().substring(0,testIDs.length()-1);
        sql="select id,questtext,tip,mark from question where id in ("+sql+") order by id";
		pstmt=con.prepareStatement(sql);
        rs=pstmt.executeQuery();
     }
%>






<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>成绩查询 | 考试成绩 |  | 单项选择题</title>
<link rel="stylesheet" type="text/css" href="../css.css">
</head>

<body>
<center>
  <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="25">
    <tr>
      <td width="100%" height="29" style="border-left-style: solid; border-left-width: 0; border-right-style: solid; border-right-width: 0; border-top-style: solid; border-top-width: 0; border-bottom: 1px solid #000000">
        <img border="0" src="../images/cxcj.gif"></td>
    </tr>
    <tr>
      <p>&nbsp;</p>
    </tr>
  </table>
  <p>&nbsp;</p>
</center>
<div align="center">
  <center>
  <table cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="469" id="AutoNumber2" border="1">
      <form method="POST" action=""><tr>
      <td width="100%" height="25" bgcolor="#6699CC" background="images/admin_bg_1.gif" bordercolor="#799AE1">
      <p align="center"><b>&nbsp;<font color="#FFFFFF">成绩单</font></b></td>
    </tr>
    <tr>
      <td width="100%" height="160" bgcolor="#FFFDE8" bordercolor="#799AE1">

        <p align="center">　</p>
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" height="202">
              <tr>
                <td width="8%" height="28"> <p align="right">考生编号：</td>
                <td height="28" colspan="4">　<%=studentID%></td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">姓&nbsp;&nbsp;&nbsp;
                    名：</td>
                <td height="29" colspan="4"><%=name%>&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">得&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
                <td width="13%" height="29">卷面分：</td>
                <td width="23%"><%=testmark%>&nbsp;</td>
                <td width="15%">百分制：</td>
                <td width="41%">
                <% DecimalFormat df=new DecimalFormat("###");
                    String r=df.format(testmark/totalmark*100);
                    out.print(r);
                %>
            &nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;错：</td>
                <td height="29" colspan="4"><%=error%>&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对：</td>
                <td height="29" colspan="4"><%=correct%>&nbsp;</td>
              </tr>
              <tr>
                <td height="29"> <p align="right">正确答案：</p></td>
                <td height="29" colspan="4"><%=Answer.toString() %>&nbsp;</td>
              </tr>
              <tr>
                <td height="29"><p align="right">您的答案：</p></td>
                <td height="29" colspan="4"><%=SubAns.toString()%>&nbsp;</td>
              </tr>
            </table>
        <p align="center">　</p>

      </td>
    </tr>
    <tr>
          <td width="100%" height="25" bgcolor="#FFFFFF" bordercolor="#799AE1"> <p align="center">
              <INPUT class="s02" onclick="window.close()" type=button value=返回 name=close2>
              <span lang="en-us"> </span></td>

 </tr>
 </form>
  </table>
  </center>
</div>
<center><form name="viewdatabase"  ACTION=""  method="post">
  <table border="1" cellspacing="1" style="border-collapse: collapse" bordercolor="#799AE1" width="100%" id="AutoNumber1" height="82">
    <tr class="trh">
      <td width="44" align="center" bgcolor="#799AE1" height="24">
      <font color="#FFFFFF"><b>序号</b></font></td>
        <td align="center" bgcolor="#799AE1" width="592" height="24"> <p align="center"><font color="#FFFFFF">
			<b>单项选择题（共<%=testnum%>&nbsp;题,<%=totalmark%>分）</b></font></td>
    </tr>
	<%	testNumber=0;
		while(rs.next()){%>
    <tr class="trh1">
        <td align="center"   height="35" width="44">　
			<center><%out.print(testNumber+1);%></center>&nbsp;</td>
        <td align="left" width="592" height="35"><br>
		<%
			out.print("正确答案是"+arrAnswer[testNumber]+",&nbsp;&nbsp;");
                        if(arrTF.charAt(testNumber)=='T'){
                            out.print("您的答案是"+arrSubAns[testNumber] +"<br>");
                        }else{
                            out.print("<font color=Red>您的答案是"+arrSubAns[testNumber] +"</font><br>");
                        }

			out.print("原题目:<br>"+rs.getString("questtext"));
			out.print("<br>提示：<br>"+""+rs.getString("tip"));
			testNumber++;
		%>
		</td>
    </tr>
	<%}
    rs.close();
    pstmt.close();
    %>
    <tr>
      <td align="center" bgcolor="#FFFFFF" height="16" width="640" colspan="2" bordercolor="#FFFFFF">
      <p align="center">
      <INPUT class="s02" onclick="window.close()" type=button value=返回 name=close>

      </p>
      </td>

      </tr>


  </table>
</form>
 </center>
 <center> <form ACTION="" METHOD="GET">
    <table style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
      <tr>
        <td width="576">
        <p ALIGN="center">&nbsp;</p>
        <p>　</td>
      </tr>
    </table>
  </form>
 </center>
</body>

</html>
<%}
catch (Exception e){
    if(debug){
       Tools.debugmsg("<BR>Exception:"+e.toString() ,out);
    }
}
finally{
    DBCon.dropConnection();
}
%>
