<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

String subname=""+request.getParameter("subject_name");
String gradenote=""+request.getParameter("grade");
subname=Tools.codestring(subname);
subname=subname.trim();
gradenote=Tools.codestring(gradenote);
gradenote=gradenote.trim();
if(debug){
    out.print("<br>subname="+subname);
    out.print("<br>gradenode="+gradenote);
}
if(subname.equals("") ){

    Tools.showalert("请您输入科目名称",out);
    Tools.goback(out);
}else{
    try{
        Connection con=DBCon.getConnection();
        String sql="select * from subject where name='"+subname.trim()+"' and gradenote='"+gradenote+"'";
        PreparedStatement pstmt=con.prepareStatement(sql);
        ResultSet rs=pstmt.executeQuery();
        if (rs.next()){
            Tools.showalert("该计算机等级的科目信息在数据库中已经存在!",out);
            Tools.goback(out);
            rs.close();
            pstmt.close();
        }else{
            sql="insert into subject(name,gradenote) values('"+subname+"','"+gradenote+"'"+")";
            //Tools.showalert(sql,out);
            rs.close();
            pstmt.close();
            pstmt=con.prepareStatement(sql);
            pstmt.executeUpdate();

            if(debug){
                out.print("<BR>insert="+sql);
            }
            Tools.showalert("成功添加科目信息!",out);
            response.sendRedirect("admin_subject.jsp");
           //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
        }

    }catch(SQLException se){
        out.println(se.toString());
    }
    finally{
    DBCon.dropConnection();
    }
}

%>
