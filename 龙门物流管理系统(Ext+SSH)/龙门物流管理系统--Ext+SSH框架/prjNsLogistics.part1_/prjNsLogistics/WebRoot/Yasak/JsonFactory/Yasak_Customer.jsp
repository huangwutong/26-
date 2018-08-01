<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'Yasak_Customer.jsp' starting page</title>

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
			//获取分页参数
			String start = request.getAttribute("yasak_start").toString();
			String limit = request.getAttribute("yasak_limit").toString();
			System.out.println(start);
			System.out.println(limit);
			int index = Integer.parseInt(start);
			int pageSize = Integer.parseInt(limit);
			//获取后台传回的yasak_vccus集合
			Vector vccus = (Vector) request.getAttribute("yasak_vccus");
			String json = "{totalProperty:" + vccus.size() + ",root:[";
			if (vccus.size() - index < pageSize) {
				for (int i = index; i < vccus.size(); i++) {
					Yasak_CustomerForm ycf = (Yasak_CustomerForm) vccus.get(i);
					json += "{customerId:" + ycf.getCustomerId()
							+ ",customerName:'" + ycf.getCustomerName()
							+ "',customerLinkMan:'" + ycf.getCustomerLinkMan()
							+ "',customerSex:'" + ycf.getCustomerSex()
							+ "',customerPhone:'" + ycf.getCustomerPhone()
							+ "',customerFax:'" + ycf.getCustomerFax()
							+ "',customerPostId:'" + ycf.getCustomerPostId()
							+ "',customerEmail:'" + ycf.getCustomerEmail()
							+ "',customerRegData:'" + ycf.getCustomerRegData()
							+ "',branchId:'" + ycf.getBranchId()
							+ "',branchName:'" + ycf.getBranchName() + "'}";
					if (i != vccus.size() - 1) {
						json += ",";
					}
				}
				json += "]}";
			} else {
				for (int i = index; i < pageSize + index; i++) {
					Yasak_CustomerForm ycf = (Yasak_CustomerForm) vccus.get(i);
					json += "{customerId:" + ycf.getCustomerId()
							+ ",customerName:'" + ycf.getCustomerName()
							+ "',customerLinkMan:'" + ycf.getCustomerLinkMan()
							+ "',customerSex:'" + ycf.getCustomerSex()
							+ "',customerPhone:'" + ycf.getCustomerPhone()
							+ "',customerFax:'" + ycf.getCustomerFax()
							+ "',customerPostId:'" + ycf.getCustomerPostId()
							+ "',customerEmail:'" + ycf.getCustomerEmail()
							+ "',customerRegData:'" + ycf.getCustomerRegData()
							+ "',branchId:'" + ycf.getBranchId()
							+ "',branchName:'" + ycf.getBranchName() + "'}";
					if (i != pageSize + index - 1) {
						json += ",";
					}
				}
				json += "]}";
			}
			System.out.println("数据------->"+json);
			response.getWriter().write(json);
			response.getWriter().close();
		%>
	</body>
</html>
