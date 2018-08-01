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
    
    <title>My JSP 'FreeTruck.jsp' starting page</title>
    
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
		//获取当前登陆用户所在分公司的编号
		OptUserInfoForm uif = (OptUserInfoForm)request.getSession(true).getAttribute("loginer");
	
		String branchid = uif.getBranchid();	
	
		//获取车辆信息集合
	    Vector truckvc = (Vector)application.getAttribute("Opttruckvc");
	    
		String truckJson = "[";
		for(int i=0;i<truckvc.size();i++){
			OptTruckInfoForm tf=(OptTruckInfoForm)truckvc.get(i); 
		
			//条件判断：如果车辆状态为空闲并且该车辆属于当前登陆公司，则加入到JSON数组
			if(tf.getTruckisvacancy().equals("0")&&tf.getBranchid().equals(branchid)){
				truckJson+="{'TruckID':'"+tf.getTruckid()+"','TruckNum':'"+tf.getTrucknum()+"'}";
				if(i!=truckvc.size()-1){
					truckJson+=",";
				}
			}
		}
		truckJson+="]";
		
		response.getWriter().write(truckJson);
		response.getWriter().close();
    %>
  </body>
</html>
