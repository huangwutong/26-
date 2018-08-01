<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'BillInfoByID.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
	 <%
    		//获取后台传来的货票信息集合
			OptBillInfoForm bi = (OptBillInfoForm)request.getAttribute("BillByID");
			
			String json = "{totalProperty:1,root:[";
			json+="{";
			json+="BillID:'"+ bi.getBillid() +"',";
			json+="SendID:'"+ bi.getSendid() +"',";
			json+="SendName:'"+ bi.getSendname() +"',";
			json+="SendBranchID:'"+ bi.getSendbranchid() +"',";
			json+="SendBranchName:'"+ bi.getSendbranchname() +"',";
			json+="PayerName:'"+ bi.getPayername() +"',";
			json+="TruckLine:'"+ bi.getTruckline() +"',";
			json+="BillData:'"+ bi.getBilldata() +"',";
			json+="ReceiveID:'"+ bi.getReceiveid() +"',";
			json+="ReceiveName:'"+ bi.getReceivename() +"',";
			json+="ReceiveBranchID:'"+ bi.getReceivebranchid() +"',";
			json+="ReceiveBranchName:'"+ bi.getReceivebranchname() +"',";
			json+="UserID:'"+ bi.getUserid() +"',";
			json+="BillStateID:'"+ bi.getBillstateid() +"',";
			json+="BillMemo:'"+ bi.getBillmemo() +"',";
			
			json+="CargoIDs:[";
			String[] array = bi.getCargoids();
			for(int i=0;i<array.length;i++){
				json+="'"+ array[i] +"'";
				if(i!=array.length-1){
					json+=",";
				}
			}
			json+="]";
			json+="}";
			json += "]}";

			response.getWriter().write(json);
			response.getWriter().close();	
     %>
	</body>
</html>
