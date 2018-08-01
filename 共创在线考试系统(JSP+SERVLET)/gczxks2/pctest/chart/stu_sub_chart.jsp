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
     String subName=null;
     long mn_testID=0;
    try{
        studentID=request.getParameter("stuID");
        mn_testID=Long.parseLong(request.getParameter("mntestID"));
        subName=Tools.codestring(request.getParameter("subName"));

        testDate=request.getParameter("testDate");
        if(debug){
            out.print("<br>stuID="+studentID+"<br>mn_testID="+mn_testID+
                "<br>subName="+subName);
        }
        if( studentID==null )
            throw new Exception("login error");
    }catch(Exception e){
        Tools.showalert("����û�е�¼�������ӳ�ʱ�������µ�¼!",out);
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
String filenamestu = WebHitChart.generateStu_Sub_HisXYChart(studentID,subName, mn_testID,session, new PrintWriter(out));
	String graphURLstu = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenamestu;
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
  <td><p align="center"><img src="<%= graphURLstu %>" width=500 height=300 border=0 usemap="#<%= filenamestu %>">
  </p></td>
  </tr>
</table>

</body>
</html>
