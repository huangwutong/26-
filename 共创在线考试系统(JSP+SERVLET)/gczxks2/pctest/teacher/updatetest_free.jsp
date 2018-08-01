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
int ID=-1;//���ύ������Ծ��ID
Connection con=null;

//�������������
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
  //��ʽ���ڼ�����

  DecimalFormat df=new DecimalFormat("00000");
  String numNF=df.format(num);
  //NumberFormat nf = NumberFormat.getNumberInstance ();
 // nf.
  //nf.setMinimumIntegerDigits(5);//����������С�ĳ��Ȳ�������2�������������.
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
		    msgsb.append(" Error�����������ɴ���\n"+""+QuestClassType+strHtml);
	    }
		else
	    {
            //source=1Ϊ���ɲ���
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
		    System.out.print(se);
			msgsb.append("����������SQL="+sql+"\n"+se.toString());

	    }
        catch(Exception se){
		    System.out.print(se);
			msgsb.append("����������"+se.toString());
        }

	}//end if
    }else{
        msgsb.append("�ύ�����������Ϊ��");
    }
    return newID;
}//end submitOne

//@@2. My pain _____apparent the moment I walked into the room. for the first man I met asked
//sympathetically: "Are you feeling all right?"
// A. must be  B. had  C. must have been  D. had to be
//##A ##B  ##C  ##D
//@A@5@E@ :@��@����@�Ѷ�@
synchronized public int submitAll(String strHtml,String Title,Connection con,javax.servlet.jsp.JspWriter out){
        if(debug){
            try{
            out.print("<br> submitAll input:<BR>"+ strHtml);
            }catch(Exception e){}
        }
	String [] strArray=strHtml.split("@@");
	String [] ansMark;
	String temp=null;
	StringBuffer bs=new StringBuffer();//����ID#��A#����;
	int newID=-1,bin=-1,end=0;
	int newtestID=-1;
        int i=-1;
	String ans="";
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String now=df.format(new java.util.Date());
	//�Ƚ����������ύ
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
            for( i=1;i<strArray.length;i++){//�ύÿһ������
                if(debug){
            	    out.println("<br>test("+i+"):<br>"+strArray[i]);
                }

            	bin=strArray[i].indexOf("@");
                end=strArray[i].lastIndexOf("@");
        		temp=strArray[i].substring(bin+1,end+1);//��
                ansMark=temp.split("@");
                int tippos=strArray[i].indexOf("#tip");
                String t1=strArray[i].substring(0,bin)+strArray[i].substring(tippos).trim();
                //���𰸴��������ı���ɾ������Ϊ���������ı���û����Щ��Ϣ
                //�ύ��������
                mark+=Float.parseFloat(ansMark[1]);
                try{
                    newID=submitOne(t1,ansMark[0],Float.parseFloat(ansMark[1]),ansMark[2],con,true);
                    if(debug && newID!=-1){
                        out.println("<br>database submit success:newID="+newID);
                    }

                    if(newID!=-1){
                        //����ID@��@����@���׶�;     һ������ĸ�ʽ����#�Ž���
                        temp=String.valueOf(newID)+"@"+ansMark[0].trim() +"@"+ansMark[1].trim() +"@"+ansMark[2].trim() +"#";
                	    bs.append(temp);
                    }else
                        {
                        throw new Exception("�����ʽ���ܳ���");
                        }

                }catch(IllegalArgumentException ie)
                    {
                        msgsb.append("�����ʽ���ܳ��� test("+i+")=��"+t1+temp+"<br>"+ie);
                        out.print("<br>"+msgsb.toString());
                    }




	        }

    	    //�ύ�Ծ�
	        if(msgsb.toString().equals("OK")){
		    try{
         //   sql="insert into test(id,date,testtypeid,paper,title,subid,gradeid,status,teaid,validtime,testnum) values(38,'2003-09-18 14:10:44',1,'117@A@5@A#118@B@6@B#119@C@7@C#120@D@8@E#','',1,1,2,1,3,4)";
         //   con.setAutoCommit(false);
         //   stmt=con.createStatement();
         //   stmt.executeUpdate(sql);
         //   stmt.close();

			//status=4:��������
    	    sql="insert into test(date,testtypeid,paper,title,subid,gradenote,status,teaid,validtime,testnum,"+
                "knowpointid1,knowpointid2,knowpointid3,mark) "+
	            "values('"+now+"',"+"1"+",'"+bs.toString() +"','"+Title+"',"+subjectID+","+"'"+gradeID+"'"+
		    	","+"4"+","+teaID+","+"3"+","+(strArray.length-1) +","+
                knowPointID1+","+knowPointID2+","+knowPointID3+","+mark+")";

	    	    //ȱʡtesttypeid=1:��һ��ѡ���⣻statue=2���Ѿ�������validtiem=3:��Ч��Ϊ3��
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
                msgsb.append("<BR>rollbackcbd��SQL="+sql+"\n"+e1.toString());
            }
            msgsb.append("insert Error��SQL="+sql+"\n"+e.toString());

	    }

	}else{
            try{
            con.rollback();
            }catch(Exception e2){
                msgsb.append("rollback��SQL="+sql+"\n"+e2.toString());
            }
            msgsb.append("Single test is error i="+i);
	}

	}catch(Exception e){
            try{
		        con.rollback();
            }catch(Exception e1){
                msgsb.append("<BR>rollbackcbd��SQL="+sql+"\n"+e1.toString());
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
<title>�����ύ</title>
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
    Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
    //response.sendRedirect("../login.jsp");
    msgsb.append("teacherID Error\n");
    Tools.showJS("window.open('../login.jsp','_self')",out);
    //response.sendRedirect("../login.jsp");
//    Tools.goback(out);
}


if (msgsb.toString().equals("OK"))
{
questTypeID=""+request.getParameter("QuestType");//��������ID
subjectID=Integer.parseInt(request.getParameter("Subject"));//��ĿID
gradeID=""+request.getParameter("Grade");//������ȼ�ID
//difficulty=""+request.getParameter("Difficulty");//�Ѷ�
knowPointID1=""+request.getParameter("KnowPoint1");//֪ʶ��ID
knowPointID2=""+request.getParameter("KnowPoint2");//֪ʶ��ID
knowPointID3=""+request.getParameter("KnowPoint3");//֪ʶ��ID
//answer=""+request.getParameter("Answer");//��
//answer=Tools.codestring(answer);

float mark=0;//Float.parseFloat(request.getParameter("Mark"));//����

String strHtml=""+request.getParameter("Content");//��ȡ�ύ�������HTML
//debug

con=DBCon.getConnection();

//
strHtml=Tools.codestring(strHtml);//ת���ַ���

String group=""+request.getParameter("group");


if(group.equals("single")){//�ύ��������
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
		//�ύ�ɹ�
        if(group.equals("single")){//�ύ��������
            Tools.showalert(" �����ύ�ɹ�,�µ�����IDΪ��"+ID,out);
            Tools.goback(out);

        }else if(group.equals("suit")){
            Tools.showalert(" �Ծ��ύ�ɹ�,�µ��Ծ�IDΪ��"+ID,out);
            Tools.goback(out);

        }



%>

<%
	}
	else{
		System.out.print(msgsb.toString());
%>
		<SCRIPT language="javascript">
			alert("����δ���ύ�ɹ��������ύ��Ϣ����ϵͳ����Ա��ϵ");
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
