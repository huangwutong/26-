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
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);

}
ResultSet rs=null;
String sql="";
String title="";
int testnum=0;
StringBuffer sb=null;
PreparedStatement pstmt=null;
Statement stmt=null;
String name="";//��������

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
String subid="";//��ĿID
String markPercent="";//�ٷ��Ƶķ���
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
        //�������⣺����ID@��@����@���׶�;     һ������ĸ�ʽ����#�Ž���
        if(debug) out.print("<br>begin:");
        String paper=rs.getString("paper");
        title=rs.getString("title");
        testnum=rs.getInt("testnum");//����������
        subid=rs.getString("subid");

        if(debug) out.print("<br>paper="+paper+"<br>testnum="+testnum);
        String [] tests=paper.split("#");
        for(int i=0;i<testnum;i++){
            //ȡ�������
            String [] test=tests[i].split("@");
            if(debug) {
                out.print("<BR>tests["+i+"]="+tests[i]);
            }
            testIDs.append(test[0]+",");//���
            Answer.append(test[1]+",");//��
			Mark.append(test[2]+",");
            Dif.append(test[3]+",");
            testmark+=Float.parseFloat(test[2]);//�ܷ���
        }

        arrMark=Mark.toString().split(",");
        arrAnswer=Answer.toString().split(",");
        arrTestID=testIDs.toString().split(",");
        //����arrTestID��ȡ�����ύ�Ĵ���Ϣ������д��Ϊ"��";
        if(debug){
            out.print("<br>Mark="+Mark.toString());
            out.print("<br>Answer="+Answer.toString());
            out.print("<br>TestID="+testIDs.toString());
            out.print("<br>Mark="+Mark.toString() );
            out.print("<br>Dif="+Dif.toString());
        }

        //ȡ���û��ύ�Ĵ�
        for(int i=0;i<testnum;i++){

           temp=request.getParameter("radio"+arrTestID[i]);
           if (temp==null){
               SubAns.append("��"+",") ;
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
        //����
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
        //������Ϣ
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



        //�����������Ȿ
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
				if(count==0){//�����¼�¼
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





		//��¼���Խ��
		if(valid==1 && old==0){
        DecimalFormat df=new DecimalFormat("###.0");//��������
        markPercent=df.format(testmark/totalmark*100);
		//��������¼��mn_scores��
        //��ѯmn_scores���Ƿ�����Ӧ��¼������ɾ��
        sql="select * from mn_scores where stu_id='"+studentID+"' and mn_test_id="+mn_testID+" and sub_id="+subid;
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next()){//�Ѿ��м�¼���򲻸���
                rs.close();
                stmt.close();

            }else
            {
                rs.close();
                stmt.close();
                //��mn_scores�������µļ�¼
                //����test_rs������ȷ�𰸴�#������#���˴𰸴�#TF��#���׶ȴ�#�÷ִ�
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

                    //��������ʽ���Ե��ܿ�Ŀ��
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
        //��ѯ�Ѿ���ɵĿ�Ŀ��
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


            //����������ʽ���ԣ�����mn_history�����Ӽ�¼�����������������β���
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
                    //��ѯ�����ʽ���Ե��ּܷ�������Ŀ����
                     sql=" SELECT  `subject`.`id` AS  `subid`,`subject`.`Name` AS `subname`, "+
                    " FORMAT(`test`.`mark`,0) AS `totalmark`,  FORMAT(`mn_scores`.`score`,0) AS `score` "+
        " FROM  `mn_scores`  LEFT OUTER JOIN `subject` ON (`mn_scores`.`sub_id` = `subject`.`ID`)"+
        " LEFT JOIN `test` ON (`mn_scores`.`test_id` = `test`.`id`)"+
        " WHERE  (`mn_test_id` = "+mn_testID+") AND (`stu_id` = '"+studentID+"')"+
        " ORDER BY `subid`";

                        int his_subnum=0;
                        int hisreal=0;
                        sb=new StringBuffer();//��ѧ:50#����:20#Ӣ��:40#
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
            //���Ӳμӿ��Ե�����

             //��ȡ�μ���ʽ���Ե�������,���ұ�����������ʽ���Ե�ȫ������
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


            //����������ʽ����
            //���μ���ʽ���Ե�������д�����ݿ�
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

    //�����¼��
		sql=testIDs.toString().substring(0,testIDs.length()-1);
        sql="select id,questtext,tip,mark from question where id in ("+sql+") order by id";
		pstmt=con.prepareStatement(sql);
        rs=pstmt.executeQuery();
     }
%>






<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ɼ���ѯ | ���Գɼ� |  | ����ѡ����</title>
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
      <p align="center"><b>&nbsp;<font color="#FFFFFF">�ɼ���</font></b></td>
    </tr>
    <tr>
      <td width="100%" height="160" bgcolor="#FFFDE8" bordercolor="#799AE1">

        <p align="center">��</p>
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" height="202">
              <tr>
                <td width="8%" height="28"> <p align="right">������ţ�</td>
                <td height="28" colspan="4">��<%=studentID%></td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">��&nbsp;&nbsp;&nbsp;
                    ����</td>
                <td height="29" colspan="4"><%=name%>&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�֣�</td>
                <td width="13%" height="29">����֣�</td>
                <td width="23%"><%=testmark%>&nbsp;</td>
                <td width="15%">�ٷ��ƣ�</td>
                <td width="41%">
                <% DecimalFormat df=new DecimalFormat("###");
                    String r=df.format(testmark/totalmark*100);
                    out.print(r);
                %>
            &nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
                <td height="29" colspan="4"><%=error%>&nbsp;</td>
              </tr>
              <tr>
                <td width="8%" height="29"> <p align="right">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ԣ�</td>
                <td height="29" colspan="4"><%=correct%>&nbsp;</td>
              </tr>
              <tr>
                <td height="29"> <p align="right">��ȷ�𰸣�</p></td>
                <td height="29" colspan="4"><%=Answer.toString() %>&nbsp;</td>
              </tr>
              <tr>
                <td height="29"><p align="right">���Ĵ𰸣�</p></td>
                <td height="29" colspan="4"><%=SubAns.toString()%>&nbsp;</td>
              </tr>
            </table>
        <p align="center">��</p>

      </td>
    </tr>
    <tr>
          <td width="100%" height="25" bgcolor="#FFFFFF" bordercolor="#799AE1"> <p align="center">
              <INPUT class="s02" onClick="window.close()" type=button value=���� name=close2> 
              <span lang="en-us"> </span>
              &nbsp; 
              <INPUT class="s02" onClick="goLogin" type=button value=���µ�¼ name=close22>
            
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
      <font color="#FFFFFF"><b>���</b></font></td>
        <td align="center" bgcolor="#799AE1" width="592" height="24"> <p align="center"><font color="#FFFFFF">
			<b>����ѡ���⣨��<%=testnum%>&nbsp;��,<%=totalmark%>�֣�</b></font></td>
    </tr>
	<%	testNumber=0;
		while(rs.next()){%>
    <tr class="trh1">
        <td align="center"   height="35" width="44">��
			<center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td> <div align="center">
                    <%out.print(testNumber+1);%>.
                  </div></td>
              </tr>
              <tr>
                <td><div align="center">(<%=arrMark[testNumber]%>��)</div></td>
              </tr>
            </table>
          </center>&nbsp;</td>
        <td align="left" width="592" height="35"><br>
		<%

			out.print("��ȷ����"+arrAnswer[testNumber]+",&nbsp;&nbsp;");

                        if(arrTF[testNumber].equals("T")){
                            out.print("���Ĵ���"+arrSubAns[testNumber] +"<br>");
                        }else{
                            out.print("<font color=Red>���Ĵ���"+arrSubAns[testNumber] +"</font><br>");
                        }

			out.print("ԭ��Ŀ:<br>"+rs.getString("questtext"));
			out.print("<br>��ʾ��<br>"+""+rs.getString("tip"));
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
      <INPUT class="s02" onClick="window.close()" type=button value=���� name=close>

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
        <p>��</td>
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
