<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<base href="<%=basePath%>">
		<LINK href="http://localhost:8080/S2SH/backstage/CSS/list.css"
			type=text/css rel=stylesheet>

		<script type="text/javascript"
			src="http://localhost:8080/S2SH/backstage/JS/list.js"></script>
	</head>
	<body onselectstart="return false;">
		<center>
			<h2>
				会员列表
			</h2>
		</center>
		<hr>
		<div>
			<ul>
				<font color="#FFFFFF">
					<table border=0 style="align: center;">
						<tr>
							<th>
								学&nbsp;号
							</th>
							<th>
								姓&nbsp;名
							</th>
							<th>
								登录密码
							</th>
							<th>
								性&nbsp;别
							</th>
							<th>
								电&nbsp;话
							</th>
							<th>
								Q&nbsp;Q
							</th>
							<th>
								状&nbsp;态
							</th>
							<th  colspan="2">
								操&nbsp;作
							</th>
						</tr>
						<s:iterator value="vips" var="v">
							<tr>
								<td id="id">
									<s:property value="#v.id" />
								</td>
								<td id="name">
									<s:property value="#v.name" />
								</td>
								<td id="password">
									<s:property value="#v.password" />
								</td>
								<td id="sex">
									<s:property value="#v.sex" />
								</td>
								<td id="telephonw">
									<s:property value="#v.telephone" />
								</td>
								<td id="qq">
									<s:property value="#v.qq" />
								</td>
								<td id="status">
									<s:property value="#v.status" />
								</td>
								<td>
									<a href='backstage/Vip/Vip-deleteById?id=<s:property value="#v.id"/>'
									onclick="return(confirm('确定删除'))">
										删除
									 </a>
								</td>
								<td>
									<a href="backstage/Vip/Vip-updateInput?id=<s:property value="#v.id"/>">
										更新
									 </a>
								</td>
							</tr>
						</s:iterator>
					</table> </font>
			</ul>


			<span class="tip"> <a
				href="backstage/Vip/Vip-loadVips?requestedPage=1">首页</a>
				&nbsp;&nbsp;&nbsp; <a
				href="backstage/Vip/Vip-loadVips?requestedPage=${page.pageNow-1}">上一页</a>
				&nbsp;&nbsp;&nbsp; 第
				&nbsp;${page.pageNow}&nbsp;/&nbsp;${page.pageCount}&nbsp;页
				&nbsp;&nbsp;&nbsp; <a
				href="backstage/Vip/Vip-loadVips?requestedPage=${page.pageNow%page.pageCount+1} ">下一页</a>
				&nbsp;&nbsp;&nbsp; <a
				href="backstage/Vip/Vip-loadVips?requestedPage=${page.pageCount}">尾页</a>

			</span>

		</div>

	</body>
</html>