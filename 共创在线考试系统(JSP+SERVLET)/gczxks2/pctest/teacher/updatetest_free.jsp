<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<script language="javascript">

</script>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<jsp:useBean id="transString" class="jinghua.TransformString" scope="page">
</jsp:useBean>
<%!
String questTypeID=null;

boolean debug=false;

int subjectID=-1;
String gradeID=null;
String JH_Tools=null;
String difficulty=null;
String knowPointID1=null;
String knowPointID2=null;
String knowPointID3=null;
String answer=null;
StringBuffer msgsb=new StringBuffer("OK");
Statement stmt=null;
String sql="";
String temp="";
int teaID=-1;
int ID=-1;//新提交试题或试卷的ID
Connection con=null;

//生成试题分类编号
public String QuestClassCode(Connection con,int SubjectID,String gradeID,
        String KnowPointID,String testpoint,String QuestType,  String PostHard){
  int num=0;
  StringBuffer bs=new StringBuffer();
  String sql="";
  try{
  Statement stmt=con.createStatement();
  sql="select count(*) as num from question where subjectid="+SubjectID+
            " and knowpointid1="+KnowPointID+
            " and questtype="+ QuestType+
            " and prehard='" +PostHard+"'";
  ResultSet rs=stmt.executeQuery(sql);
  if(rs.next()){
    num=rs.getInt(1);
  }
  num++;
  //格式化第几道题

  DecimalFormat df=new DecimalFormat("00000");
  String numNF=df.format(num);
  //NumberFormat nf = NumberFormat.getNumberInstance ();
 // nf.
  //nf.setMinimumIntegerDigits(5);//整数部分最小的长度不能少于2，如果少了则补另.
  //String numNF=nf.format(num);

  rs.close();
  stmt.close();
  sql="select subject.note as sn, knowpoint.note as kn,grade.note as gn "+
    " from subject,knowpoint,grade "+
      "  where subject.id="+SubjectID+
      " and knowpoint.id="+KnowPointID+" and grade.id="+"'"+gradeID+"'";
  stmt=con.createStatement();

  rs=stmt.executeQuery(sql);
  if (rs.next()){
    String temp;
    temp=rs.getString("sn");
    bs.append(temp);
    bs.append(rs.getString("gn") );
	df=new DecimalFormat("00");
	temp=df.format(Integer.valueOf(testpoint));
    bs.append(temp);
    bs.append(QuestType);
    bs.append(PostHard);
    bs.append(numNF);
    temp=rs.getString("kn");
    bs.append(temp);
    rs.close();
    stmt.close();
  }
  }catch(Exception se){

    msgsb.append(se.toString());
	msgsb.append("<br>"+"SQL="+sql);
  }
  return bs.toString();

}


synchronized public int submitOne(String strHtml,String answer,float mark,String difficulty,Connection con,boolean commit){
//commit=true则需要在一道题提交完后，使用commit


    strHtml=strHtml.trim();
    int tipPos=-1;
    String tip="";
    //检查格式：
    if(strHtml.startsWith("@@")){
        msgsb.append("<BR>单个试题的数据格式错误，请检查!");
        return -1;
    }else{
	//检查是否包含了文件
		
    }
    //检查答案：
    if(answer.trim()==""){
        msgsb.append("<BR>试题答案为空，请检查!"+"原试题为:<br>"+strHtml);
        return -1;
    }else if (answer.trim().length()!=1){
        msgsb.append("<BR>试题答案长度不为1，请检查!"+"原试题为:<br>"+strHtml);
        return -1;
    }else{
        String strAnswer="ABCDEFGH";
        if(strAnswer.indexOf(answer)<0){
            msgsb.append("<BR>单选试题的答案长度不为“ABCDEFGH”中的字符，请检查!"+"原试题为:<br>"+strHtml);
            return -1;
        }
    }
    //检查难易度
    if(difficulty.trim()==""){
        msgsb.append("<BR>试题难易度为空，请检查!"+"原试题为:<br>"+strHtml);
        return -1;
    }else if (difficulty.trim().length()!=1){
        msgsb.append("<BR>试题难易度长度不为1，请检查!"+"原试题为:<br>"+strHtml);
        return -1;
    }else{
        String strAnswer="ABCDE";
        if(strAnswer.indexOf(difficulty)<0){
            msgsb.append("<BR>单选难易度的答案长度不为“ABCDE”中的字符，请检查!"+"原试题为:<br>"+strHtml);
            return -1;
        }
    }

    tipPos=strHtml.indexOf("#tip");
    if(tipPos>0){
        tip=strHtml.substring(tipPos+4);//取提示
        strHtml=strHtml.substring(0,tipPos);
        tip=Tools.toSql(tip);
        strHtml=Tools.toSql(strHtml);
    }


	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now=df.format(new java.util.Date());
	answer=answer.toUpperCase();
        int newID=-1;
        if(!strHtml.equals("")){
	try{
        answer.toUpperCase();
        difficulty.toUpperCase();
		//String QuestClassType=QuestClassCode(con,subjectID, gradeID, knowPointID1,1,
        //        questTypeID,   difficulty);
        String QuestClassType="";

	    if(QuestClassType==null){
		    msgsb.append(" Error：试题编号生成错误\n"+""+QuestClassType+strHtml);
	    }
		else
	    {
            //source=1为自由测试
		    sql="insert into question(QuestID,Mark,Answer,TeacherID, `question`.`Source`,"+
		        "PubDate,QuestType,SubjectID,gradenote, "+
				"KnowPointID1,KnowPointID2,KnowPointID3,PreHard,Tip) "+ "values("+
			    "'"+QuestClassType+"',"+mark+",'"+answer+"',"+teaID+",1,'"+now+"',"+
				questTypeID+","+subjectID+","+"'"+gradeID+"'"+","+knowPointID1+","+knowPointID2+","+knowPointID3+
				",'"+difficulty+"','"+tip+"'"+")";


		    con.setAutoCommit(!commit);
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
		    stmt.close();

		    stmt=con.createStatement();
		    ResultSet rs=stmt.executeQuery("select LAST_INSERT_ID() as newid from question");
		    if(rs.next()){
			    newID=rs.getInt("newID");
                rs.close();
			    stmt.close();
		    }
		}
	}//end try
	catch(SQLException se){
	    System.out.print(se);
            System.out.print(sql);
            msgsb.append("试题入库出错：SQL="+sql+"\n"+se.toString());
	}catch(Exception e){
            msgsb.append("试题格式可能出错 strHtml=："+strHtml);
	}
	if(newID!=-1 && msgsb.toString().equals("OK")  ) {
		try{//修改题干
			temp=jinghua.TransformString.TransformSelction(strHtml,newID);
			temp=Tools.toSql(temp);
            if(temp==null)
                throw new Exception("题目没有数据");

			stmt=con.createStatement();
			sql="update question set QuestText='"+temp+"' where ID="+newID;
			stmt.executeUpdate(sql);
            stmt.close();

		}
		catch(SQLException se){
		    System.out.print(se);
			msgsb.append("试题入库出错：SQL="+sql+"\n"+se.toString());

	    }
        catch(Exception se){
		    System.out.print(se);
			msgsb.append("试题入库出错："+se.toString());
        }

	}//end if
    }else{
        msgsb.append("提交试题出错：试题为空");
    }
    return newID;
}//end submitOne

//@@2. My pain _____apparent the moment I walked into the room. for the first man I met asked
//sympathetically: "Are you feeling all right?"
// A. must be  B. had  C. must have been  D. had to be
//##A ##B  ##C  ##D
//@A@5@E@ :@答案@分数@难度@
synchronized public int submitAll(String strHtml,String Title,Connection con,javax.servlet.jsp.JspWriter out){
        if(debug){
            try{
            out.print("<br> submitAll input:<BR>"+ strHtml);
            }catch(Exception e){}
        }
	String [] strArray=strHtml.split("@@");
	String [] ansMark;
	String temp=null;
	StringBuffer bs=new StringBuffer();//试题ID#答案A#分数;
	int newID=-1,bin=-1,end=0;
	int newtestID=-1;
        int i=-1;
	String ans="";
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now=df.format(new java.util.Date());
	//先将所有试题提交
	//debug
	//out.println(now);
//        out.print("strArray.length="+String.valueOf(strArray.length));
//        if (debug){
//            for(i=0;i<strArray.length;i++){
//                Tools.debugmsg("<br>strArray["+i+"]="+strArray[i]+"<br>",out);
//            }
//        }

	try{
            con.setAutoCommit(false);
            int mark=0;
            for( i=1;i<strArray.length;i++){//提交每一道试题
                if(debug){
            	    out.println("<br>test("+i+"):<br>"+strArray[i]);
                }

            	bin=strArray[i].indexOf("@");
                end=strArray[i].lastIndexOf("@");
        		temp=strArray[i].substring(bin+1,end+1);//答案
                ansMark=temp.split("@");
                int tippos=strArray[i].indexOf("#tip");
                String t1=strArray[i].substring(0,bin)+strArray[i].substring(tippos).trim();
                //将答案串从试题文本中删除，因为单个试题文本中没有这些信息
                //提交单个试题
                mark+=Float.parseFloat(ansMark[1]);
                try{
                    newID=submitOne(t1,ansMark[0],Float.parseFloat(ansMark[1]),ansMark[2],con,true);
                    if(debug && newID!=-1){
                        out.println("<br>database submit success:newID="+newID);
                    }

                    if(newID!=-1){
                        //试题ID@答案@分数@难易度;     一道试题的格式，以#号结束
                        temp=String.valueOf(newID)+"@"+ansMark[0].trim() +"@"+ansMark[1].trim() +"@"+ansMark[2].trim() +"#";
                	    bs.append(temp);
                    }else
                        {
                        throw new Exception("试题格式可能出错");
                        }

                }catch(IllegalArgumentException ie)
                    {
                        msgsb.append("试题格式可能出错 test("+i+")=："+t1+temp+"<br>"+ie);
                        out.print("<br>"+msgsb.toString());
                    }




	        }

    	    //提交试卷
	        if(msgsb.toString().equals("OK")){
		    try{
         //   sql="insert into test(id,date,testtypeid,paper,title,subid,gradeid,status,teaid,validtime,testnum) values(38,'2003-09-18 14:10:44',1,'117@A@5@A#118@B@6@B#119@C@7@C#120@D@8@E#','',1,1,2,1,3,4)";
         //   con.setAutoCommit(false);
         //   stmt=con.createStatement();
         //   stmt.executeUpdate(sql);
         //   stmt.close();

			//status=4:自由组题
    	    sql="insert into test(date,testtypeid,paper,title,subid,gradenote,status,teaid,validtime,testnum,"+
                "knowpointid1,knowpointid2,knowpointid3,mark) "+
	            "values('"+now+"',"+"1"+",'"+bs.toString() +"','"+Title+"',"+subjectID+","+"'"+gradeID+"'"+
		    	","+"4"+","+teaID+","+"3"+","+(strArray.length-1) +","+
                knowPointID1+","+knowPointID2+","+knowPointID3+","+mark+")";

	    	    //缺省testtypeid=1:单一的选择题；statue=2：已经发布；validtiem=3:有效期为3年
            Statement stmt=con.createStatement();

            stmt.executeUpdate(sql);

            stmt.close();
            if(debug){
                Tools.debugmsg("<br>insert into test:SQL="+sql,out);
            }
            stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select LAST_INSERT_ID() as newid from question");

            if(rs.next()){
                newtestID=rs.getInt("newID");
                rs.close();
                stmt.close();
            }

            con.commit();
            if(debug){
                out.print("<br> new test ID is:"+newtestID);



                stmt=con.createStatement();
                rs=stmt.executeQuery("select id,paper,title from test where id="+newtestID);

                if (rs.next()){
                    Tools.debugmsg("<br> the newest paper is:"+rs.getString("paper"),out);
                    Tools.debugmsg("<br> the title of the paper is:"+rs.getString("title"),out);
                }
                rs.close();
                stmt.close();
            }

        }
	    catch(SQLException e){
            try{
		        con.rollback();
            }catch(Exception e1){
                msgsb.append("<BR>rollbackcbd：SQL="+sql+"\n"+e1.toString());
            }
            msgsb.append("insert Error：SQL="+sql+"\n"+e.toString());

	    }

	}else{
            try{
            con.rollback();
            }catch(Exception e2){
                msgsb.append("rollback：SQL="+sql+"\n"+e2.toString());
            }
            msgsb.append("Single test is error i="+i);
	}

	}catch(Exception e){
            try{
		        con.rollback();
            }catch(Exception e1){
                msgsb.append("<BR>rollbackcbd：SQL="+sql+"\n"+e1.toString());
            }
            msgsb.append("<br>Batch submit Error\n"+
                "<br>strArray["+i+"]="+strArray[i]+"<br>"+e.toString() );
           Tools.debugmsg("<br>i="+i,out);

	}
	return newtestID;

}
%>





<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>试题提交</title>
</head>

<body>`


<%
try{
//UN_debug
msgsb.delete(0,msgsb.length() );
msgsb.append("OK");


try{
    String TeacherID=(String)session.getAttribute("teacherID");
    //Tools.showalert("teaID="+TeacherID,out);
    //Tools.showalert("msgdb="+msgsb.toString(),out);
    //Tools.showalert(TeacherID,out);
    teaID=Integer.parseInt(TeacherID);
}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    //response.sendRedirect("../login.jsp");
    msgsb.append("teacherID Error\n");
    Tools.showJS("window.open('../login.jsp','_self')",out);
    //response.sendRedirect("../login.jsp");
//    Tools.goback(out);
}


if (msgsb.toString().equals("OK"))
{
questTypeID=""+request.getParameter("QuestType");//试题类型ID
subjectID=Integer.parseInt(request.getParameter("Subject"));//科目ID
gradeID=""+request.getParameter("Grade");//计算机等级ID
//difficulty=""+request.getParameter("Difficulty");//难度
knowPointID1=""+request.getParameter("KnowPoint1");//知识点ID
knowPointID2=""+request.getParameter("KnowPoint2");//知识点ID
knowPointID3=""+request.getParameter("KnowPoint3");//知识点ID
//answer=""+request.getParameter("Answer");//答案
//answer=Tools.codestring(answer);

float mark=0;//Float.parseFloat(request.getParameter("Mark"));//分数

String strHtml=""+request.getParameter("Content");//获取提交的试题的HTML
//debug

con=DBCon.getConnection();

//
strHtml=Tools.codestring(strHtml);//转换字符集

String group=""+request.getParameter("group");


if(group.equals("single")){//提交单个试题
	ID=submitOne(strHtml,answer,mark,difficulty,con,false);

}else{
	if(group.equals("suit")	){
	    String Title=""+request.getParameter("suit_title");
            Title=Tools.codestring(Title);
            ID=submitAll(strHtml,Title,con,out);
	}
}

%>
<%temp=msgsb.toString();
if(debug){
    out.print("<br><br><br>New Information");
    out.print(temp);
}


	if(temp.equals("OK")){
		//提交成功
        if(group.equals("single")){//提交单个试题
            Tools.showalert(" 试题提交成功,新的试题ID为："+ID,out);
            Tools.goback(out);

        }else if(group.equals("suit")){
            Tools.showalert(" 试卷提交成功,新的试卷ID为："+ID,out);
            Tools.goback(out);

        }



%>

<%
	}
	else{
		System.out.print(msgsb.toString());
%>
		<SCRIPT language="javascript">
			alert("试题未能提交成功，请检查提交信息或与系统管理员联系");
			//history.go(-1);
		</SCRIPT>
<%
	}
%>





</body>
</html>
<%
}
%>

<%}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
