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
<%@ page import = "jinghua.*" %>
<%! boolean debug=false;%>
<%
    //session.setMaxInactiveInterval(60*60*2);

     String studentID=null;
     String testDate=null;

    try{
        studentID=request.getParameter("stuID");

        testDate=request.getParameter("testDate");
        if(debug){
            out.print("<br>stuID="+studentID+"<br>testDate="+testDate);
        }
        if( studentID==null )
            throw new Exception("login error");
    }catch(Exception e){
        Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
        Tools.showJS("window.open('../login.jsp','_self')",out);
    }



	//SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy",Locale.UK);
	//String sDate = request.getParameter("hitDate");
	//if (sDate == null) sDate = "All";
	//Date dDate = null;
	//try {
	//	dDate = sdf.parse(sDate);
	//} catch (ParseException e) {
		//  Leave at null
//	}
	String filename = WebHitChart.generateStuMnPieChart(studentID,testDate, session, new PrintWriter(out));
	String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;

%>
<html>
<head>
<link rel="stylesheet" href="sample.css" type="text/css"/>
<title>Pie Chart Example</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
</head>
<body>

<table border=0 align="center">
  <tr>
    <td align="center" valign="middle"> <img src="<%= graphURL %>" width=500 height=350 border=0 usemap="#<%= filename %>"></td>
  </tr>
</table>

</body>
</html>
