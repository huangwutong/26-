<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

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
sql="delete from knowpoint where id in ("+sql+")";

if(debug){
    out.print("<br>sql="+sql);
}
    try{
        Connection con=DBCon.getConnection();
        PreparedStatement pstmt=con.prepareStatement(sql);
        pstmt.executeUpdate();
        pstmt.close();
        if(debug){
            out.print("<BR>insert="+sql);
        }
        Tools.showalert("成功删除知识点信息!",out);
        response.sendRedirect("admin_knowpoint.jsp");
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
