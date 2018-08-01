<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.struts.form.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'BillInCustomer.jsp' starting page</title>
    
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
    	String start = request.getAttribute("bill_start").toString();
    	String limit = request.getAttribute("bill_limit").toString();
    	int index=Integer.parseInt(start);
    	int pageSize = Integer.parseInt(limit);
    	
    	Vector vcbill = (Vector)request.getAttribute("vcbill");
    	String json = "{totalProperty:"+vcbill.size()+",root:[";
    		if(vcbill.size()-index<pageSize){
    			for(int i=index;i<vcbill.size();i++){
    				Yasak_BillInfoForm ybf = (Yasak_BillInfoForm)vcbill.get(i);
    				json += "{billId:'" + ybf.getBillId()
							+ "',sendId:'" + ybf.getSendId()
							+ "',sendName:'" + ybf.getSendName()
							+ "',receiveId:'" + ybf.getReceiveId()
							+ "',receiveName:'" + ybf.getReceiveName()
							+ "',userId:'" + ybf.getUserId()
							+ "',userName:'" + ybf.getUserName()
							+ "',billData:'" + ybf.getBillData()
							+ "',billDataId:'" + ybf.getBillDataId()
							+ "',billDataName:'" + ybf.getBillDataName()
							+ "',sendBranchId:'" + ybf.getSendBranchId()
							+ "',sendBranchName:'" + ybf.getSendBranchName()
							+ "',receiveBranchId:'" + ybf.getReceiveBranchId()
							+ "',receiveBranchName:'" + ybf.getReceiveBranchName() + "'}";
					if (i != vcbill.size() - 1) {
						json += ",";
					}
    			}
    			json+="]}";
    		}else{
    			for(int i=index;i<pageSize+index;i++){
    				Yasak_BillInfoForm ybf = (Yasak_BillInfoForm)vcbill.get(i);
    				json += "{billId:'" + ybf.getBillId()
							+ "',sendId:'" + ybf.getSendId()
							+ "',sendName:'" + ybf.getSendName()
							+ "',receiveId:'" + ybf.getReceiveId()
							+ "',receiveName:'" + ybf.getReceiveName()
							+ "',userId:'" + ybf.getUserId()
							+ "',userName:'" + ybf.getUserName()
							+ "',billData:'" + ybf.getBillData()
							+ "',billDataId:'" + ybf.getBillDataId()
							+ "',billDataName:'" + ybf.getBillDataName()
							+ "',sendBranchId:'" + ybf.getSendBranchId()
							+ "',sendBranchName:'" + ybf.getSendBranchName()
							+ "',receiveBranchId:'" + ybf.getReceiveBranchId()
							+ "',receiveBranchName:'" + ybf.getReceiveBranchName() + "'}";
    				if (i != pageSize + index - 1) {
						json += ",";
					}
    			}
    			json+="]}";
    		}
    		System.out.println("数据------->"+json);
    		response.getWriter().write(json);
			response.getWriter().close();
     %>
  </body>
</html>
