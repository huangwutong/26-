<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

String test_grade=request.getParameter("Grade");
String test_sub=request.getParameter("Subject");
String test_knowpoint=request.getParameter("KnowPoint");
String test_testtype=request.getParameter("testtype");
if(debug){
    out.print("<br>grade="+test_grade+
    "<br>sub="+test_sub+
    "<br>knowpoint="+test_knowpoint+
    "<br>testtype="+test_testtype);

}
String [] ids=request.getParameterValues("id");
if(ids==null){
     Tools.showalert("请您选择欲删除的知识点!",out);
    Tools.goback(out);
}else
{
String [] question=null;

String sql=null;
String paper=null;
Connection con=null;
StringBuffer sb=null;
Statement stmt=null;
ResultSet rs=null;
try{
    con=DBCon.getConnection();
    con.setAutoCommit(false);
    if(test_testtype.equals("2") || test_testtype.equals("1") ){
    //单元测试
    for(int i=0;i<ids.length;i++)

    if(debug) out.print("<br>delete 单元测试:");

    for(int i=0;i<ids.length;i++){
        //取回试题
                if(debug) out.print("<br> test id="+ids[i]);

        sql="SELECT  `test`.`paper` FROM  `test` WHERE  (`test`.`id` = "+ids[i]+")";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);

        if(rs.next())
            paper=rs.getString("paper");
        rs.close();
        stmt.close();
                if(debug) out.print("<br>test paer="+paper);
        //delete question
		if(!(paper==null || paper.equals(""))){
         question=paper.split("#");
         sb=new StringBuffer();
         //585@A@5@A#586@B@6@B#587@C@7@C#588@D@8@E#
        for(int j=0;j<question.length;j++){
            //delete question ID
            sb.append(question[j].substring(0,question[j].indexOf("@"))+",");
        }
        paper=sb.toString().substring(0,sb.toString().length()-1);
        if(debug) out.print("<br>delete question id="+paper);

        sql="delete from question where id in ("+paper+")";
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
		}//end if paper not null
        //delete scores
        sql="delete from scores where test_id="+ids[i];
        if(debug) out.print("<br>delete scores sql="+sql);

        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
         //delete errorpad
        sql="delete from errorpad where test_id="+ids[i];
        if(debug) out.print("<br>delete errorpad sql="+sql);
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
        //delete test
        sql="delete from test where id="+ids[i];
        if(debug) out.print("<br>delete test sql="+sql);

        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
        con.commit();

    }//end for delete test
    }//end if
    else if(test_testtype.equals("3")){
     //delete mn_test
        if(debug) out.print("<br>delete 正式考试:");
        for(int k=0;k<ids.length;k++){
        //取回试题
        sql="SELECT  `mn_test`.`test_paper` FROM  `mn_test` WHERE  (`mn_test`.`id` = "+ids[k]+")";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next())
            paper=rs.getString("test_paper");
        rs.close();
        stmt.close();
        if(debug) out.print("<br>mn_test: test_paper="+paper);
        if(!(paper==null || paper.equals(""))){
        //delete test
        String [] testIDs=paper.split(",");


        //单元测试
        if(debug) out.print("<br>delete 单元测试:");
        for(int i=0;i<testIDs.length;i++){
            //取回试题
            sql="SELECT  `test`.`paper` FROM  `test` WHERE  (`test`.`id` = "+testIDs[i]+")";
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next())
                paper=rs.getString("paper");
            rs.close();
            stmt.close();
            if(debug) out.print("<br>test paer="+paper);
            if(!(paper==null || paper.equals(""))){
            //delete question
            question=paper.split("#");
            sb=new StringBuffer();
            //585@A@5@A#586@B@6@B#587@C@7@C#588@D@8@E#
            for(int j=0;j<question.length;j++){
                //delete question ID
                sb.append(question[j].substring(0,question[j].indexOf("@"))+",");
            }
            paper=sb.toString().substring(0,sb.toString().length()-1);
            if(debug) out.print("<br>delete question id="+paper);
            sql="delete from question where id in ("+paper+")";
            stmt=con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
            }//end if paper not null

            //delete test
            sql="delete from test where id="+testIDs[i];
            if(debug) out.print("<br>delete test sql="+sql);
            stmt=con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        }//end for delete test
        }//end if paper not null
        //delete mn_scores
        sql="delete from mn_scores where mn_test_id="+ids[k];
        if(debug) out.print("<br>delete mn_scores sql="+sql);
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
        //delete mn_history
        sql="delete from mn_history where mn_test_id="+ids[k];
        if(debug) out.print("<br>delete mn_history sql="+sql);
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
        //delete errorpad
        sql="delete from errorpad where mn_test_id="+ids[k];
        if(debug) out.print("<br>delete errorpad sql="+sql);
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
         //delete mn_test
        sql="delete from mn_test where id="+ids[k];
        if(debug) out.print("<br>delete mn_test sql="+sql);
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        stmt.close();
        con.commit();

        }//end for delete mn_test


    }//end if
     if(!debug)
             response.sendRedirect("modify_test.jsp");
    }//end try
    catch(SQLException se){
        out.println("<br>sql="+sql);
        out.println("<br>"+se.toString());
    }
    catch(Exception e){
        out.println("<br>sql="+sql);
        out.print(e.toString());

    }
    finally{
        DBCon.dropConnection();
    }

}
%>
