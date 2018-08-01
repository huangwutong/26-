<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html STYLE="background-color:#E8EFFD">
	<head>
		<title></title>
		<link href="<%=request.getContextPath()%>/css/pages.css"
			rel="stylesheet" type="text/css" />
		<s:head theme="ajax" debug="true" />
		 

	</head>

	<body>
	
			<s:tree label="车辆管理系统"  theme="ajax"
				templateCssPath="/struts/tree.css" showRootGrid="true"
				showGrid="true" cssStyle="color:red">
				
			  <!--  	  
				<s:iterator value="listmap" id="id" >
				   <s:treenode label="%{#id.key}"  theme="ajax" >
						<s:iterator value="#id.value" >
							<s:treenode theme="ajax" label="<a href ='%{caction}' target = MainFrame><s:/>%{cname}</a>" />
						</s:iterator>
				   </s:treenode>
				</s:iterator>
				-->
				<s:treenode label="车辆管理"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>车辆信息</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>车辆状态</a>" />
				</s:treenode>
				<s:treenode label="任务管理"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>用车申请</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>审批管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>出车管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>收车管理</a>" />
				</s:treenode>
				<s:treenode label="车辆到期信息查询"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保养到期信息查询</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>年检到期信息查询</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保险到期信息查询</a>" />
				</s:treenode>
				<s:treenode label="车辆日常管理"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>加油管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>维修管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保养管理</a>" />
				    <s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>违章管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>年检管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保险管理</a>" />
				    <s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>规费管理</a>" />
				    
				</s:treenode>
				<s:treenode label="基础数据管理"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>加油卡信息管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>驾驶员信息管理</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>车库登记信息管理</a>" />
				</s:treenode>
				<s:treenode label="系统管理"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/ITSMPM/jsp/usermanger.action target = MainFrame>用户管理</a>" />
					<s:treenode theme="ajax" label="<a href =/ITSMPM/jsp/roleShow.action target = MainFrame>角色管理</a>" />
					<s:treenode theme="ajax" label="<a href =/ITSMPM/jsp/compsShow.action target = MainFrame>权限管理</a>" />
					<s:treenode theme="ajax" label="<a href =/ITSMPM/jsp/resfunShow.action target = MainFrame>资源功能点管理</a>" />
				</s:treenode>
				<s:treenode label="报表打印"  theme="ajax">
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>加油信息打印</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>维修信息打印</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保养信息打印</a>" />
					<s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>违章信息打印</a>" />
				    <s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>年检信息打印</a>" />
				    <s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>保险信息打印</a>" />
				    <s:treenode theme="ajax" label="<a href =/xyerp/loginInsdcdtp.action target = MainFrame>规费信息打印</a>" />
				</s:treenode>
				 
				 
			</s:tree>
	</body>
</html>
