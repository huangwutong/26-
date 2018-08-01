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
int ID=-1;//���ύ������Ծ��ID
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
//commit=true����Ҫ��һ�����ύ���ʹ��commit


    strHtml=strHtml.trim();
    int tipPos=-1;
    String tip="";
    //����ʽ��
    if(strHtml.startsWith("@@")){
        msgsb.append("<BR>������������ݸ�ʽ��������!");
        return -1;
    }else{
	//����Ƿ�������ļ�
		if((strHtml.indexOf("src=")>0) || (strHtml.indexOf("SRC=")>0)){
			msgsb.append("<BR>������������ݸ�ʽ���󣬿��ܰ�����ͼƬ������!");
        	return -1;
		}
    }
    //���𰸣�
    if(answer.trim()==""){
        msgsb.append("<BR>�����Ϊ�գ�����!"+"ԭ����Ϊ:<br>"+strHtml);
        return -1;
    }else if (answer.trim().length()!=1){
        msgsb.append("<BR>����𰸳��Ȳ�Ϊ1������!"+"ԭ����Ϊ:<br>"+strHtml);
        return -1;
    }else{
        String strAnswer="ABCDEFGH";
        if(strAnswer.indexOf(answer)<0){
            msgsb.append("<BR>��ѡ����Ĵ𰸳��Ȳ�Ϊ��ABCDEFGH���е��ַ�������!"+"ԭ����Ϊ:<br>"+strHtml);
            return -1;
        }
    }
    //������׶�
    if(difficulty.trim()==""){
        msgsb.append("<BR>�������׶�Ϊ�գ�����!"+"ԭ����Ϊ:<br>"+strHtml);
        return -1;
    }else if (difficulty.trim().length()!=1){
        msgsb.append("<BR>�������׶ȳ��Ȳ�Ϊ1������!"+"ԭ����Ϊ:<br>"+strHtml);
        return -1;
    }else{
        String strAnswer="ABCDE";
        if(strAnswer.indexOf(difficulty)<0){
            msgsb.append("<BR>��ѡ���׶ȵĴ𰸳��Ȳ�Ϊ��ABCDE���е��ַ�������!"+"ԭ����Ϊ:<br>"+strHtml);
            return -1;
        }
    }

    tipPos=strHtml.indexOf("#tip");
    if(tipPos>0){
        tip=strHtml.substring(tipPos+4);//ȡ��ʾ
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
		    msgsb.append(" Error�����������ɴ���\n"+""+QuestClassType+strHtml);
	    }
		else
	    {
            //source=1Ϊ���ɲ���
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
            msgsb.append("����������SQL="+sql+"\n"+se.toString());
	}catch(Exception e){

            msgsb.append("�����ʽ���ܳ��� strHtml=��"+strHtml);
	}
	if(newID!=-1 && msgsb.toString().equals("OK")  ) {
		try{//�޸����
			temp=jinghua.TransformString.TransformSelction(strHtml,newID);
			temp=Tools.toSql(temp);
            if(temp==null)
                throw new Exception("��Ŀû������");

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
				msgsb.append("����������SQL="+sql+"\n"+se.toString());
			}

	    }
        catch(Exception se){
			try{
				con.rollback();
			}catch(Exception e){
			    System.out.print(se);
				msgsb.append("����������"+se.toString());
			}
        }

	}//end if
    }else{
		try{
		con.rollback();
		}catch(Exception se)
		{
			msgsb.append("����������"+se.toString());
		}
        msgsb.append("�ύ�����������Ϊ��");
    }
    return newID;
}//end submitOne

//@@2. My pain _____apparent the moment I walked into the room. for the first man I met asked
//sympathetically: "Are you feeling all right?"
// A. must be  B. had  C. must have been  D. had to be
//##A ##B  ##C  ##D
//@A@5@E@ :@��@����@�Ѷ�@

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
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
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
	throw new Exception("���ò�������!");
Test t=new Test();
t.id=Long.parseLong(testID);

if (msgsb.toString().equals("OK"))
{
questTypeID=""+request.getParameter("QuestType");//��������ID
subjectID=Integer.parseInt(request.getParameter("Subject"));//��ĿID
gradeID=""+request.getParameter("Grade");//�꼶ID
difficulty=""+request.getParameter("Difficulty");//�Ѷ�
knowPointID1=""+request.getParameter("KnowPoint1");//֪ʶ��ID
knowPointID2=""+request.getParameter("KnowPoint2");//֪ʶ��ID
knowPointID3=""+request.getParameter("KnowPoint3");//֪ʶ��ID
answer=request.getParameter("Answer");//��
answer=Tools.codestring(answer);
answer=answer.toUpperCase();
difficulty.toUpperCase();
float mark=Float.parseFloat(request.getParameter("Mark"));//����
String strHtml=""+request.getParameter("Content");//��ȡ�ύ�������HTML
strHtml=Tools.codestring(strHtml);//ת���ַ���
String group=request.getParameter("group");
con=DBCon.getConnection();
con.setAutoCommit(false);
if(group.equals("single")){//�ύ��������
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
//�ύ�ɹ�
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





if(group.equals("single")){//�ύ��������
	Tools.showalert(" �����ύ�ɹ�,�µ�����IDΪ��"+ID,out);
    Tools.goback(out);

}

}
else{
	out.print("<br>"+msgsb.toString());
%>
		<SCRIPT language="javascript">
			alert("����δ���ύ�ɹ��������ύ��Ϣ����ϵͳ����Ա��ϵ");
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
