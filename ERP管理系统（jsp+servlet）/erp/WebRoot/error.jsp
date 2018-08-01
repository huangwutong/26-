<%@ page contentType="text/html;charset=utf-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Untitled Document</title>
		<link href="css/inside.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
	</head>
	<body>
		<div class="title">
			&nbsp;
		</div>
		<div id="helpContent">
			<div class="title">
				<h2>
					出错啦!错误提示：
				</h2>
			</div>
			<div class="Content">
				${requestScope.error }
			</div>
		</div>
	</body>
</html>
