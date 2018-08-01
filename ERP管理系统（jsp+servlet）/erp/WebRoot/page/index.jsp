<%@ page contentType="text/html;charset=utf-8" errorPage="../../error.jsp"%>
<%@ include file="/page/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>::和鼎CRM系统::..</title>
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="js/crm.js"></script>
</head>
<body scroll="no">
<div id="tophead">
  <div class="logo_div"><img src="images/logo.gif" width="273" height="43" /></div>
  <div class="resume">你好！${sessionScope.user.realname } &nbsp;[&nbsp;<a href="exit" class="grayLink">退出</a>&nbsp;]&nbsp;当前日期：&nbsp;${sessionScope.date }</div>
  <div class="profiles">
    <div class="monthObject">本月目标&nbsp;<span class="numberTxt">${sessionScope.user.dept.moneyaim }</span>&nbsp;万RMB</div>
    <div class="finished">已完成&nbsp;<span class="numberTxt">&nbsp;</span>&nbsp;万RMB</div>  
    <div class="remnantDay">本月还剩&nbsp;<span class="numberTxt">&nbsp;${requestScope.da }</span>&nbsp;天</div>
  </div>
  <div class="clearfloat"></div>
</div>
<div class="line_img"><img src="images/line_bg.gif" width="1" height="4" /></div>
<div id="leftSide">
  <div class="menuTitle">CRM控制面板</div>
  <div class="menuContent">
    <ul id="menu">
    <c:if test="${requestScope.menu4!=null }">
      <li class="item_space">&nbsp;</li>
      <li class="item">${requestScope.menu4 }</li>
      <c:forEach items="${requestScope.amenu}" var="str">
      <li class="item_p">${str}</li>
      </c:forEach>
    </c:if>
    <c:if test="${requestScope.menu1!=null }">
      <li class="item_space">&nbsp;</li>  
      <li class="item">${requestScope.menu1 }</li>
      <c:forEach items="${requestScope.menu}" var="str">
      <li class="item_p">${str}</li>
      </c:forEach>
    </c:if>
    <c:if test="${requestScope.menu2!=null }">
      <li class="item_space">&nbsp;</li>
      <li class="item">${requestScope.menu2 }</li>
      <c:forEach items="${requestScope.mymenu}" var="mystr">
      <li class="item_p">${mystr}</li>
      </c:forEach>
    </c:if>
    <c:if test="${requestScope.menu3!=null }">
      <li class="item_space">&nbsp;</li>
      <li class="item">${requestScope.menu3 }</li>
      <c:forEach items="${requestScope.sysmenu}" var="mystr">
      <li class="item_p">${mystr}</li>
      </c:forEach>
    </c:if>
    </ul>
  </div>
</div>
<div id="rightSide">
	<iframe name="main" frameborder="0" scrolling="auto" width="100%" id="rightIframe" src="page/welcomeword.html"></iframe>
</div>
<script language="javascript" type="text/javascript">
	var browser = new dean.Browser(window);
	var iframeWin = new dean.iframeWin("rightIframe","leftSide","rightSide")
	iframeWin.autoResize(browser.height-browser.offisetY-20,63);
</script>
</body>
</html>

