<%@ page contentType="text/html;charset=utf-8"
	errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>广告位预定</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" language="JavaScript">
		var v_request;
		function sendRequest()
		{
    		v_request=new ActiveXObject("Msxml2.XMLHTTP");
    		v_request.onreadystatechange=getResult;
    		//确定url
    		var url="companyList?company="+form1.company.value;
    		v_request.open("POST",url,true);
    		//发送请求
    		v_request.send(null);
		}
		function getResult()
		{
    		if(v_request.readyState==4)//如果结束
    		{
        		if(v_request.status==200) //如果成功
        		{
            		document.getElementById('companyList').innerHTML=v_request.responseText
        		}
    		}
		}
		function chick()
		{
			var companyid='';
			if(document.form1.destime.value=='')
			{
				document.getElementById("derror").innerHTML='请选择你要预定的天数';
				return false;
			}
			else
			{
				document.getElementById("derror").innerHTML='';
			}
			if(document.form1.company.value=='')
			{
				document.getElementById("cerror").innerHTML='请选择预定该广告位的客户';
				return false;
			}
			else
			{
				document.getElementById("cerror").innerHTML='';
				for(var i = companeyTable.rows.length-1; i > 0; i--)
				{
					if(companeyTable.rows[i].getElementsByTagName("input").length!=0)
					{
						if(companeyTable.rows[i].getElementsByTagName("input").item(0).checked)
						{
							companyid = companeyTable.rows[i].getElementsByTagName("input").item(0).value;
						}
					}
				}
			}
			if(companyid != "")
			{
				form1.action = form1.action+"&companyid="+companyid; 
				document.form1.submit();
			}
		}
		</script>
	</head>
	<body>
		<div class="title">
			<h2>
				广告位预定
			</h2>
		</div>
		<table width="100%" border="0" cellpadding="8" cellspacing="1"
			class="contentArea">
			<tr>
				<td class="contentList">
				<form action="destine?billid=${requestScope.id }" name="form1" method="post">
					<table width="100%" border="0" cellspacing="1" cellpadding="8"
						class="contentListTable2">
						<tr>
							<td width="16%" class="contentListTdColName">
								预定天数
							</td>
							<td width="84%" class="contentListTd">
								&nbsp;
								<select name="destime" id="destime">
									<option value="" selected="selected">
										--请选择--
									</option>
									<option value="1">
										1天
									</option>
									<option value="2">
										2天
									</option>
									<option value="3">
										3天
									</option>
								</select><span id="derror">
							</td>
						</tr>
						<tr>
							<td width="16%" class="contentListTdColName">
								预定客户
							</td>
							<td width="84%" class="contentListTd">
								&nbsp;
								<input type="text" name="company" onchange="sendRequest();" /><span id="cerror"/>
							</td>
						</tr>
						<tr>
							<td width="16%" colspan=2 class="contentListTd">
								<a href="javascript:void chick();" class="pagenum">添加</a>
							</td>
						</tr>
					</table>
					</form>
					<span id="companyList" />
				</td>
			</tr>
		</table>
	</body>
</html>
