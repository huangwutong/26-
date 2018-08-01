<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import = "jinghua.chart.servlet.WebHitChart" %>
<%@ page import = "jinghua.chart.servlet.WebHitDataSet" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.ParseException" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.util.Locale" %>
<%@ page import="jinghua.*" %>
<%

    //session.setMaxInactiveInterval(60*60*2);
    String studentID=null;
    long mn_testID=0;
    try{
        studentID=request.getParameter("stuID");
	    mn_testID=Long.parseLong(request.getParameter("mn_testID"));
        if( studentID==null )
            throw new Exception("login error");
    }catch(Exception e){
        Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
        Tools.showJS("window.open('../login.jsp','_self')",out);
    }
	//Tools.debugPrintln("temp");


	String filenamemn = WebHitChart.generateMnBarChart(mn_testID, session, new PrintWriter(out));
	String graphURLmn = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenamemn;

    String filenamestu = WebHitChart.generateStuHisXYChart(studentID, mn_testID,session, new PrintWriter(out));
	String graphURLstu = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenamestu;



%>
<html>
<head>

<title>Bar Chart Example</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
</head>
<body>

<table border=0 align="center">

  <tr>
    <td>
      <p align="center"><img src="<%= graphURLmn %>" width=500 height=350 border=0 usemap="#<%= filenamemn %>"></p></td>
  </tr>
  <tr><td><p><br><p></td></tr>
  <tr>
    <td>
      <p align="center"><img src="<%= graphURLstu %>" width=500 height=300 border=0 usemap="#<%= filenamestu %>"></p></td>
  </tr>
</table>
</body>
</html>
