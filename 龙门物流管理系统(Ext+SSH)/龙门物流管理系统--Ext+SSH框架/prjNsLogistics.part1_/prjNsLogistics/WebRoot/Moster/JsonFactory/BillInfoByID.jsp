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
			MosterBillInfoForm bi = (MosterBillInfoForm)request.getAttribute("moBillByID");
			
			String json = "{totalProperty:1,root:[";
			json+="{";
			json+="BillID:'"+ bi.getBillID() +"',";
			json+="SendID:'"+ bi.getSendID() +"',";
			json+="SendName:'"+ bi.getSendName() +"',";
			json+="SendBranchID:'"+ bi.getSendBranchID() +"',";
			json+="SendBranchName:'"+ bi.getSendBranchName() +"',";
			json+="PayerName:'"+ bi.getPayerName() +"',";
			json+="TruckLine:'"+ bi.getTruckLine() +"',";
			json+="BillData:'"+ bi.getBillData() +"',";
			json+="ReceiveID:'"+ bi.getReceiveID() +"',";
			json+="ReceiveName:'"+ bi.getReceiveName() +"',";
			json+="ReceiveBranchID:'"+ bi.getReceiveBranchID() +"',";
			json+="ReceiveBranchName:'"+ bi.getReceiveBranchName() +"',";
			json+="UserID:'"+ bi.getUserID() +"',";
			json+="BillStateID:'"+ bi.getBillStateID() +"',";
			json+="BillMemo:'"+ bi.getBillMemo() +"',";
			
			json+="CargoIDs:[";
			String[] array = bi.getCargoIDs();
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
