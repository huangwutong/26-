<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
Connection con=null;
String sql=null;
StringBuffer sb=null;
ResultSet rs=null;
Statement stmt=null;

%>
<%
String mn_testID=request.getParameter("mn_testID");
String mntotalmark=request.getParameter("mntotalmark");

if(debug){
    out.print("<br>mn_testID="+mn_testID+
			"<br>mntotalmark="+mntotalmark);
}
if(mn_testID==null || mntotalmark==null)
	throw new Exception("调用参数不足!");

try{
    con=DBCon.getConnection();
	con.setAutoCommit(false);
	sql="update mn_test set mntotalmark="+mntotalmark+
		" where id="+mn_testID;
    stmt=con.createStatement();
    stmt.executeUpdate(sql);
	stmt.close();
	if(debug)
		out.print("<br>update mn_test sql="+sql);

	//Tools.showalert("设置分数成功!",out);
	//Tools.goback(out);

	response.sendRedirect("modify_test_mn.jsp?mnID="+mn_testID);

        //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
}
catch(SQLException se){
	out.println(se.toString());
	out.print("<br>sql="+sql);
}
catch(Exception e){
	out.print("<br>"+e.toString());
}
finally{
	DBCon.dropConnection();
}

%>
