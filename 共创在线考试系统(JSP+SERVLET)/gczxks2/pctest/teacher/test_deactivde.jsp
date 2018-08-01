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

String sql;
StringBuffer sb=new StringBuffer();

for(int i=0;i<ids.length;i++){
    sb.append(ids[i]+",");
}
sql=sb.toString().substring(0,sb.length()-1);
if(test_testtype.equals("2") || test_testtype.equals("1"))
    //单元测试
    sql="update test set status=5 where id in ("+sql+")";
else if(test_testtype.equals("3"))
    //正式考试
    sql="update mn_test set status=5 where id in ("+sql+")";


try{
    Connection con=DBCon.getConnection();
    PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.executeUpdate();
    pstmt.close();
    if(debug){
        out.print("<BR>sql="+sql);
    }
    else{
        response.sendRedirect("modify_test.jsp");
    }
        //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
    }
    catch(SQLException se){
        out.println(se.toString());
    }
    catch(Exception e){
        out.print(e.toString());
    }
    finally{
        DBCon.dropConnection();
    }
}

%>
