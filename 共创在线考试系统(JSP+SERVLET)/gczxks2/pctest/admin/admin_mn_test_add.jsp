<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

String testname=""+request.getParameter("testname");
String gradenote=""+request.getParameter("selgrade");
testname=Tools.codestring(testname);
testname=testname.trim();
gradenote=Tools.codestring(gradenote);
gradenote=gradenote.trim();

String begindate=request.getParameter("dateyear")+"-"+
    request.getParameter("datemonth")+"-"+request.getParameter("dateday");
String enddate=request.getParameter("dateyear1")+"-"+
    request.getParameter("datemonth1")+"-"+request.getParameter("dateday1");


if(debug){
    out.print("<br>testname="+testname);
    out.print("<br>gradenode="+gradenote);
    out.print("<br>begindate="+begindate);
    out.print("<br>enddate="+enddate);
}

if(testname.equals("") ){

    Tools.showalert("请您输入科目名称",out);
    Tools.goback(out);
}else{
    try{
        Connection con=DBCon.getConnection();
        String sql="select * from mn_test where name='"+testname.trim()+"' and grade_note='"+gradenote+"'";
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);

        if (rs.next()){
            Tools.showalert("该计算机等级的此次正式考试信息在数据库中已经存在!",out);
            Tools.goback(out);
            rs.close();
            stmt.close();
        }else{


            rs.close();
            stmt.close();
                //status=有效
            sql="insert into mn_test(name,grade_note,begin_date,end_date,test_num,sub_num,status) "+
           " values('"+testname+"','"+gradenote+"','"+begindate+"','"+enddate+"',0,0,"+"2"+")";

            stmt=con.createStatement();

            stmt.executeUpdate(sql);

            if(debug){
                out.print("<BR>insert="+sql);
            }
            Tools.showalert("成功添加科目信息!",out);
            response.sendRedirect("admin_mn_test.jsp");
           //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
           //Tools.showJS("history.back(1)",out);
        }

    }catch(SQLException se){
        out.println(se.toString());
    }
    finally{
    DBCon.dropConnection();
    }
}

%>
