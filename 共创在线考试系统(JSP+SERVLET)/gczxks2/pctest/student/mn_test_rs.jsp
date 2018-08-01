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
String mn_testID=request.getParameter("mn_testID");
int valid=Integer.parseInt(request.getParameter("valid"));

int old=Integer.parseInt(request.getParameter("old"));

//String testID="62";
//String studentID="1";
if(studentID==null){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);

}
ResultSet rs=null;
String sql="";
String title="";
int testnum=0;
StringBuffer sb=null;
PreparedStatement pstmt=null;
Statement stmt=null;
String name="";//考生姓名

int correct=0;
int error=0;
String correctAns="";
String youAns="";
StringBuffer dbmsg=new StringBuffer();
StringBuffer testIDs=new StringBuffer();
StringBuffer Answer=new StringBuffer();
StringBuffer Mark=new StringBuffer();
StringBuffer SubAns=new StringBuffer();
StringBuffer SubMark=new StringBuffer();
StringBuffer TF=new StringBuffer();
StringBuffer Dif=new StringBuffer();
int sub_num=0;
Vector explain=new Vector();
String [] arrMark=null;
String [] arrAnswer=null;
String [] arrSubAns=null;
String [] arrTestID=null;
String [] arrTF=null;
String temp="";
String subid="";//科目ID
String markPercent="";//百分制的分数
float testmark=0.0f;
float totalmark=0.0f;
int testNumber=0;
try{
    Connection con=DBCon.getConnection();

    sql="select id,paper,title,testnum,subid from test where id="+testID;
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
        subid=rs.getString("subid");

        if(debug) out.print("<br>paper="+paper+"<br>testnum="+testnum);
        String [] tests=paper.split("#");
        for(int i=0;i<testnum;i++){
            //取回试题号
            String [] test=tests[i].split("@");
            if(debug) {
                out.print("<BR>tests["+i+"]="+tests[i]);
            }
            testIDs.append(test[0]+",");//题号
            Answer.append(test[1]+",");//答案
			Mark.append(test[2]+",");
            Dif.append(test[3]+",");
            testmark+=Float.parseFloat(test[2]);//总分数
        }

        arrMark=Mark.toString().split(",");
        arrAnswer=Answer.toString().split(",");
        arrTestID=testIDs.toString().split(",");
        //根据arrTestID提取考生提交的答案信息，不填写的为"空";
        if(debug){
            out.print("<br>Mark="+Mark.toString());
            out.print("<br>Answer="+Answer.toString());
            out.print("<br>TestID="+testIDs.toString());
            out.print("<br>Mark="+Mark.toString() );
            out.print("<br>Dif="+Dif.toString());
        }

        //取回用户提交的答案
        for(int i=0;i<testnum;i++){

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
        for(int i=0;i<testnum;i++)
        {
            if(valid==1 && old==0){
                jinghua.T_Question.addUsedCount(con,Integer.parseInt(arrTestID[i]));
            }
            totalmark+=Float.parseFloat(arrMark[i]);
            if(arrSubAns[i].equals(arrAnswer[i])){
                if(valid==1 && old==0){
                    jinghua.T_Question.addCorrectCount(con,Integer.parseInt(arrTestID[i]));
                }
                TF.append("T,");
                SubMark.append(arrMark[i]+",");
                correct++;
                if(debug){
                    Tools.debugmsg("<br>arrMark["+i+"]="+arrMark[i],out);
                }
                testmark+=Float.parseFloat(arrMark[i]);
            }else {
                error++;
                SubMark.append("0,");
                if(arrSubAns[i].equals(" "))
                    TF.append("@,");
                else
                    TF.append("F,");
            }

        }
        if(debug){
            out.print("<br>TF="+TF.toString() );
            out.print("<br>SubMark="+SubMark.toString() );
            out.print("<br>TF[2]="+TF.toString().charAt(2));
        }
        arrTF=TF.toString().split(",");
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



        //将错题插入错题本
		for(int i=0;i<testnum;i++){
			if(debug) out.println("<BR>question error id="+arrTestID[i]+
            	": result="+arrTF[i] );
			if(!arrTF[i].equals("T")){

			int count=0;
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
					sql=" insert into errorpad(stu_id,question_id,add_date,errorcount,test_id,mn_test_id,sourcetype)"+
						" values('"+studentID+"',"+arrTestID[i]+",CURRENT_TIMESTAMP,1,"+testID+","+mn_testID+",3)	";
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





		//记录考试结果
		if(valid==1 && old==0){
        DecimalFormat df=new DecimalFormat("###.0");//分数换算
        markPercent=df.format(testmark/totalmark*100);
		//将分数记录到mn_scores表：
        //查询mn_scores中是否有相应记录，有则删除
        sql="select * from mn_scores where stu_id='"+studentID+"' and mn_test_id="+mn_testID+" and sub_id="+subid;
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next()){//已经有记录，则不更新
                rs.close();
                stmt.close();

            }else
            {
                rs.close();
                stmt.close();
                //在mn_scores中增加新的记录
                //构造test_rs串：正确答案串#分数串#个人答案串#TF串#难易度串#得分串
                //temp=Answer.toString()+"#"+Mark.toString()+"#"+SubAns.toString()+"#"+
                //TF.toString()+"#"+Dif.toString()+"#"+SubMark.toString();
                temp=SubAns.toString()+"#"+TF.toString()+"#"+SubMark.toString();

                sql=" insert into mn_scores(stu_id,mn_test_id,sub_id,score,tea_id,test_date,test_id,test_rs)"+
                    " values( "+
                     "'"+studentID+"',"+mn_testID+","+subid+","+testmark+",1,CURRENT_DATE,"+testID+",'"+
                     temp+"'"+" )";

                try{
                stmt=con.createStatement();
                stmt.executeUpdate(sql);
                stmt.close();
                if(debug){
                    out.print("<br>insert into mn_scores sql="+sql);
                }

                }catch(SQLException se){
                    out.print("<br> insert into mn_scores error sql="+sql);
                    out.print("<br>"+se.toString());
                }
                catch(Exception e){
                    out.print("<br> insert into mn_scores error sql="+sql);
                    out.print("<br>"+e.toString());
                }

                    //检查这次正式考试的总科目数
        try{
            sql="select sub_num from mn_test where id="+mn_testID;
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next())
                sub_num=rs.getInt("sub_num");
            else
                sub_num=Integer.MAX_VALUE;
            rs.close();
            stmt.close();
            if(debug){
                out.print("<br>select subnum sql="+sql);
            }
        }
        catch(SQLException se){
            out.print("<br> query mn_test error sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> query mn_test error sql="+sql);
            out.print("<br>"+e.toString());
        }
        //查询已经完成的科目数
        int have_test=0;
        try{
            sql="select count(*) as tnum from mn_scores where stu_id='"+studentID+"' and mn_test_id="+mn_testID;
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next()){
                have_test=rs.getInt("tnum");
            }
            rs.close();
            stmt.close();
            if(debug){
                out.print("<br>have test subs="+have_test);
            }
        }
        catch(SQLException se){
            out.print("<br> query mn_scores error sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> query mn_scores error sql="+sql);
            out.print("<br>"+e.toString());
        }


        if(have_test==sub_num){


            //如果完成了正式考试，则在mn_history中增加记录，表明考生完成了这次测试
            sql="select * from mn_history where stu_id='"+studentID+"' and mn_test_id="+mn_testID;
            try{
                stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
                if(rs.next()){
                   rs.close();
                   stmt.close();
                }else{
                    rs.close();
                    stmt.close();
                    //查询这次正式考试的总分及积各科目分数
                     sql=" SELECT  `subject`.`id` AS  `subid`,`subject`.`Name` AS `subname`, "+
                    " FORMAT(`test`.`mark`,0) AS `totalmark`,  FORMAT(`mn_scores`.`score`,0) AS `score` "+
        " FROM  `mn_scores`  LEFT OUTER JOIN `subject` ON (`mn_scores`.`sub_id` = `subject`.`ID`)"+
        " LEFT JOIN `test` ON (`mn_scores`.`test_id` = `test`.`id`)"+
        " WHERE  (`mn_test_id` = "+mn_testID+") AND (`stu_id` = '"+studentID+"')"+
        " ORDER BY `subid`";

                        int his_subnum=0;
                        int hisreal=0;
                        sb=new StringBuffer();//化学:50#物理:20#英语:40#
                        stmt=con.createStatement();
                        rs=stmt.executeQuery(sql);

                        while(rs.next()){
                            his_subnum++;
                            hisreal+=rs.getInt("score");
                            sb.append(rs.getString("subname")+":"+rs.getString("score")+"#");
                        }
                        rs.close();
                        stmt.close();








                    sql="insert into mn_history(stu_id,mn_test_id,test_date,totalmark,submark,sub_num) "+
                    " values('"+studentID+"',"+mn_testID+",CURRENT_DATE,"+hisreal+",'"+sb.toString()+"',"+
                     his_subnum+")";

                    stmt=con.createStatement();
                    stmt.executeUpdate(sql);

                }
                if(debug){
                    out.print("<br>insert into mn_history sql="+sql);
                }
            }
            catch(SQLException se){
                out.print("<br>insert into mn_history sql="+sql);
                out.print("<br>"+se.toString());
            }
            catch(Exception e){
                out.print("<br>insert into mn_history sql="+sql);
                out.print("<br>"+e.toString());
            }
            //增加参加考试的人数

             //获取参加正式考试的总人数,而且必须完成这次正式考试的全部测试
             int testPeople=0;
            sql="SELECT count(*) as tested from mn_history where mn_test_id="+mn_testID;
            try{
                stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
                if(rs.next()){
                    testPeople=rs.getInt("tested");
                }
                else{
                    testPeople=0;
                }
                rs.close();
                stmt.close();
            }
            catch(SQLException se){
                out.print("<br> query mn_history error sql="+sql);
                out.print("<br>"+se.toString());
            }
            catch(Exception e){
                out.print("<br> query mn_history error sql="+sql);
                out.print("<br>"+e.toString());
            }


            //有人做完正式考试
            //将参加正式考试的总人数写入数据库
            try{
            sql="update mn_test set testpeople="+testPeople+" where id="+mn_testID;
            stmt=con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            }
            catch(SQLException se){
                out.print("<br> update mn_test.testpeople error sql="+sql);
                out.print("<br>"+se.toString());
            }
            catch(Exception e){
                out.print("<br> update mn_test.testpeople error sql="+sql);
                out.print("<br>"+e.toString());
            }

            if(debug){
                out.print("<br>mn_test totalpeople sql="+sql);
                out.print("<br>mn_test totalpeople="+testPeople);
            }


        }//end if(have_test==sub_num)



        }
        }catch(SQLException se){
            out.print("<br> query mn_scores error sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> query mn_scores error sql="+sql);
            out.print("<br>"+e.toString());
        }


        }//end if(valid=1)

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
<script>
function goLogin()
{
top.location="/pctest/login.jsp";

}
</script>
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
              <INPUT class="s02" onClick="window.close()" type=button value=返回 name=close2> 
              <span lang="en-us"> </span>
              &nbsp; 
              <INPUT class="s02" onClick="goLogin" type=button value=重新登录 name=close22>
            
          </td>

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
			<center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td> <div align="center">
                    <%out.print(testNumber+1);%>.
                  </div></td>
              </tr>
              <tr>
                <td><div align="center">(<%=arrMark[testNumber]%>分)</div></td>
              </tr>
            </table>
          </center>&nbsp;</td>
        <td align="left" width="592" height="35"><br>
		<%

			out.print("正确答案是"+arrAnswer[testNumber]+",&nbsp;&nbsp;");

                        if(arrTF[testNumber].equals("T")){
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
      <INPUT class="s02" onClick="window.close()" type=button value=返回 name=close>

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
