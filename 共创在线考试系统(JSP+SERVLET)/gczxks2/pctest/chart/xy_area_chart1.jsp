<%@ page import = "jinghua.chart.servlet.WebHitChart" %>
<%@ page import = "jinghua.chart.servlet.WebHitDataSet" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.Iterator" %>
<%
	String filename = WebHitChart.generateXYAreaChart(session, new PrintWriter(out));
	//String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
	String graphURL = request.getContextPath()+"/chart/temp/"+filename;
%>

<html>
<head>

<title>Timeseries Stacked Area Chart Example</title>
</head>
<body>
<img src="images/top_bar.png" width=1004 height=75 border=0>
<%out.print("<br>image file name="+filename+
    "<br>graphURL="+graphURL);%>

<table border=0>
	<tr>
	<td width=170><img src="images/spacer.png" width=170 height=1></td>
	<td>
	<h2>Timeseries Stacked Area Chart Example</h2>
	Date [All dates], Section [All sections]<br>
    <br><br>

	<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#<%= filename %>">

	<p>The chart shown above has tooltips and drilldown enabled.</p>

	<table border=0 cellpadding=2 width=400>
		<tr>
		<td align=left><a href="xy_area_chart_code.jsp">Show me the code!</a></td>
		<td align=right><a href="index.html">Back to the home page</a></td>
		</tr>
	</table>
	</td>
	</tr>
</table>
</body>
</html>
