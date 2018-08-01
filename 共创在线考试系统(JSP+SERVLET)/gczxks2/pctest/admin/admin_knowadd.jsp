<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
%>
<%

String name=""+request.getParameter("name");
String gradenote=""+request.getParameter("selgrade");
String subject=""+request.getParameter("selsubject");
name=Tools.codestring(name);
name=name.trim();
gradenote=Tools.codestring(gradenote);
gradenote=gradenote.trim();

if(debug){
    out.print("<br>subname="+name);
    out.print("<br>gradenode="+gradenote);
}
if(name.equals("") ){

    Tools.showalert("请您输入知识点名称",out);
    Tools.goback(out);
}else{
    try{
        Connection con=DBCon.getConnection();
        String sql="select * from knowpoint where name='"+name+"' and gradenote='"+gradenote+
                    "' and subid="+subject;
        PreparedStatement pstmt=con.prepareStatement(sql);
        ResultSet rs=pstmt.executeQuery();
        if (rs.next()){
            rs.close();
            pstmt.close();
            Tools.showalert("该知识点信息在数据库中已经存在!",out);
            Tools.goback(out);

        }else{
            rs.close();
            pstmt.close();
            sql="insert into knowpoint(name,gradenote,subid) values('"+name+"','"+gradenote+"'"+","+subject+")";
            //Tools.showalert(sql,out);

            pstmt=con.prepareStatement(sql);
            pstmt.executeUpdate();
            if(debug){
                out.print("<BR>insert="+sql);
            }
            Tools.showalert("成功添加知识点信息!",out);
            response.sendRedirect("admin_knowpoint.jsp");
           //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
        }
    }catch(SQLException se){
        out.println(se.toString());
    }catch(Exception e){
        out.print(e.toString());
    }finally{
        DBCon.dropConnection();
    }
}

%>
