<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page import="java.sql.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>

<%!
boolean debug=false;
String questTypeID=null;
int subjectID=-1;
String gradeID=null;
String difficulty=null;
String knowPointID1=null;
String knowPointID2=null;
String knowPointID3=null;
String answer=null;
StringBuffer msgsb=new StringBuffer("OK");
Statement stmt=null;
ResultSet rs=null;
String sql="";
String temp="";
int teaID=-1;
int ID=-1;//新提交试题或试卷的ID
Connection con=null;
class Test{
    long id;
    String name;
    String grade;
    String time;
    float mark;
    String paper;
	int testnum;

    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name;
        return temp;
   }
};
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
		if((strHtml.indexOf("src=")>0) || (strHtml.indexOf("SRC=")>0)){
			msgsb.append("<BR>单个试题的数据格式错误，可能包含有图片，请检查!");
        	return -1;
		}
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
			    "'"+QuestClassType+"',"+mark+",'"+answer+"',"+teaID+",1,NOW(),"+
				questTypeID+","+subjectID+","+"'"+gradeID+"'"+","+knowPointID1+","+knowPointID2+","+knowPointID3+
				",'"+difficulty+"','"+tip+"'"+")";



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
			try{
				con.rollback();
			}catch(Exception e){
				System.out.print(se);
				msgsb.append("试题入库出错：SQL="+sql+"\n"+se.toString());
			}

	    }
        catch(Exception se){
			try{
				con.rollback();
			}catch(Exception e){
			    System.out.print(se);
				msgsb.append("试题入库出错："+se.toString());
			}
        }

	}//end if
    }else{
		try{
		con.rollback();
		}catch(Exception se)
		{
			msgsb.append("试题入库出错："+se.toString());
		}
        msgsb.append("提交试题出错：试题为空");
    }
    return newID;
}//end submitOne

//@@2. My pain _____apparent the moment I walked into the room. for the first man I met asked
//sympathetically: "Are you feeling all right?"
// A. must be  B. had  C. must have been  D. had to be
//##A ##B  ##C  ##D
//@A@5@E@ :@答案@分数@难度@

%>


<%
try{
//UN_debug
msgsb.delete(0,msgsb.length() );
msgsb.append("OK");


try{
    String TeacherID=request.getParameter("teacherID");

    teaID=Integer.parseInt(TeacherID);
}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    //response.sendRedirect("../login.jsp");
    msgsb.append("teacherID Error\n");
    Tools.showJS("window.open('../login.jsp','_self')",out);
    //response.sendRedirect("../login.jsp");
//    Tools.goback(out);
}
String testID=request.getParameter("testID");

if(debug){
    out.print("<br>testID="+testID);
}

if(testID==null)
	throw new Exception("调用参数不足!");
Test t=new Test();
t.id=Long.parseLong(testID);

if (msgsb.toString().equals("OK"))
{
questTypeID=""+request.getParameter("QuestType");//试题类型ID
subjectID=Integer.parseInt(request.getParameter("Subject"));//科目ID
gradeID=""+request.getParameter("Grade");//年级ID
difficulty=""+request.getParameter("Difficulty");//难度
knowPointID1=""+request.getParameter("KnowPoint1");//知识点ID
knowPointID2=""+request.getParameter("KnowPoint2");//知识点ID
knowPointID3=""+request.getParameter("KnowPoint3");//知识点ID
answer=request.getParameter("Answer");//答案
answer=Tools.codestring(answer);
answer=answer.toUpperCase();
difficulty.toUpperCase();
float mark=Float.parseFloat(request.getParameter("Mark"));//分数
String strHtml=""+request.getParameter("Content");//获取提交的试题的HTML
strHtml=Tools.codestring(strHtml);//转换字符集
String group=request.getParameter("group");
con=DBCon.getConnection();
con.setAutoCommit(false);
if(group.equals("single")){//提交单个试题
	if(debug) out.print("<br>submitone param: strHtml="+strHtml+
    	"<br>answer="+answer+"<br>mark="+mark+"<br>diff="+difficulty);
	ID=submitOne(strHtml,answer,mark,difficulty,con,false);

}
temp=msgsb.toString();
if(debug){
    out.print("<br><br><br>New Information=");
    out.print(temp);
	out.print("<br>New quest ID="+ID);
}


if(temp.equals("OK")){
//提交成功
sql="SELECT  `test`.`paper`,`test`.`testnum`,`test`.`mark` "+
		" FROM  `test` WHERE  (`test`.`id` = "+t.id+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);

    if(rs.next()){
    	t.paper=rs.getString("paper");
		t.mark=rs.getFloat("mark");
		t.testnum=rs.getInt("testnum");
    }
    rs.close();
    stmt.close();
	if(debug) out.print("<br>test paper="+t.paper+
				"<br>testnum="+t.testnum+
				"<br>mark="+t.mark);
	t.testnum++;
	t.mark+=mark;
	//1574@A@10@A#
	t.paper=t.paper+String.valueOf(ID)+"@"+answer.toUpperCase()+
			"@"+mark+"@"+difficulty+"#";

	sql="update test set paper='"+t.paper+"',testnum="+t.testnum+",mark="+t.mark+
	" where id="+t.id;
	stmt=con.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	con.commit();
	if(debug)
		out.print("<br>update test sql="+sql);





if(group.equals("single")){//提交单个试题
	Tools.showalert(" 试题提交成功,新的试题ID为："+ID,out);
    Tools.goback(out);

}

}
else{
	out.print("<br>"+msgsb.toString());
%>
		<SCRIPT language="javascript">
			alert("试题未能提交成功，请检查提交信息或与系统管理员联系");
			//history.go(-1);
		</SCRIPT>
<%
	}

}
}
catch(Exception e){
   out.print("<br>"+e.toString());
}
finally{
    DBCon.dropConnection();
}
%>
