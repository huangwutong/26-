<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
<!--

.STYLE2 {
	font-size: 16px;
	font-family: "宋体";
	font-weight: bold;
	color:#660000;
}
.STYLE3 {
	font-size: 14px;
	font-family: "宋体";
	color: #663399;
	font-weight: bold;
}
.STYLE4 {
	font-family: "宋体";
	font-weight: bold;
	font-size: 24px;
	color: #003399;
}
.STYLE5 {
	font-size: 12px;
	font-family: "宋体";
	color: #999999;
}
a.day{
	font-family: "宋体";
	font-weight: bold;
	font-size: 24px;
	color:#990000;
	text-decoration:none
}
a.day:hover{
	font-family: "宋体";
	font-weight: bold;
	font-size: 24px;
	color:#FF0000;
	text-decoration:none
}

a.mylink{
	font-family: "宋体";
	font-weight: bold;
	font-size: 24px;
	color: #000099;
	text-decoration:none;
}

a.mylink:hover{
	font-family: "宋体";
	font-weight: bold;
	font-size: 24px;
	color:#FF0000;
	text-decoration:none;
}
-->
</style>
<script type="text/javascript">
window.onload=function(){
	var myyear=document.getElementById("myyear");//年下拉
	var mymonth=document.getElementById("mymonth");//月下拉
	
	var year=document.getElementById("year");//数据库的数据
	var month=document.getElementById("month");
	
	myyear.value=year.value;
	mymonth.value=month.value;
}

function mychange(mytype){
	var year=document.getElementById("myyear").value;//年下拉
	var month=document.getElementById("mymonth").value;//月下拉
	
	
	//alert(year);
	if(mytype=="year" || mytype=="month"){//年的下拉框改变时
		location="scratchpad.do?operate=toAlertInfo&year="+year+"&month="+month;
	}else if(mytype=="yearBefore"){//上一年
		year=year-1;
		if(year!="2008"){
			location="scratchpad.do?operate=toAlertInfo&year="+year+"&month="+month;
		}
	}else if(mytype=="yearAfter"){//下一年
		year=1+parseInt(year);
		//alert(year);
		if(year!="2021"){
			location="scratchpad.do?operate=toAlertInfo&year="+year+"&month="+month;
		}
	}else if(mytype=="monthBefore"){//上一个月
		month=month-1;
		if(month!="0"){
			location="scratchpad.do?operate=toAlertInfo&year="+year+"&month="+month;
		}
	}else if(mytype=="monthAfter"){//下一个月
		month=1+parseInt(month);
		if(month!="13"){
			location="scratchpad.do?operate=toAlertInfo&year="+year+"&month="+month;
		}
	}else if(mytype=="thismonth"){//本月
			location="scratchpad.do?operate=toAlertInfo";
	}
}
	
</script>
  </head>
  
  <body>
  <%--获取服务器传过来的数据--%>
  <input type="hidden" value="${year}" name="year">
  <input type="hidden" value="${month}" name="month">
  <br>
   <table width="200" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td><img src="image/calendar.gif" width="23px" border="0"  height="23px" />&nbsp;<span class="STYLE2">日程安排</span></td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="middle"><p>
      <input type="button" value="&lt;" onclick="mychange('yearBefore')" style="border:0px #999999 solid; font:'宋体';font-weight: bold; font-size:14px;  width:35px; background:url(image/btnbg.jpg)"/>
      <select onchange="mychange('year')" name="myyear" style="font:'宋体';font-weight: bold; font-size:14px; ">
  
        <option value="2009">2009</option>
        <option value="2010">2010</option>
        <option value="2011">2011</option>
        <option value="2012">2012</option>
        <option value="2013">2013</option>
        <option value="2014">2014</option>
        <option value="2015">2015</option>
        <option value="2016">2016</option>
        <option value="2017">2017</option>
        <option value="2018">2018</option>
        <option value="2019">2019</option>
        <option value="2020">2020</option>
        </select>
    <input type="button" value="&gt;" onclick="mychange('yearAfter')" style="border:0px #000000; font:'宋体';font-weight: bold; font-size:14px;  width:35px; background:url(image/btnbg.jpg)"/>&nbsp;<span class="STYLE2">年</span> 
    
        <input type="button" value="&lt;" onclick="mychange('monthBefore')" style="border:0px #999999 solid; font:'宋体';font-weight: bold; font-size:14px; 
          width:35px; background:url(image/btnbg.jpg)"/>
      <select name="mymonth" onchange="mychange('month')" style="font:'宋体';font-weight: bold; font-size:14px; ">
        <option value="1">01</option>
        <option value="2">02</option>
        <option value="3">03</option>
        <option value="4">04</option>
        <option value="5">05</option>
        <option value="6">06</option>
        <option value="7">07</option>
        <option value="8">08</option>
        <option value="9">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
      </select>
    <input type="button" value="&gt;" onclick="mychange('monthAfter')" style="border:0px #000000; font:'宋体';font-weight: bold; font-size:14px;  width:35px; background:url(image/btnbg.jpg)"/>&nbsp;<span class="STYLE2">月</span> 
    &nbsp;&nbsp;&nbsp;
    <input type="button" value="本月" onclick="mychange('thismonth')" style="border:0px #000000; font:'宋体'; font-size:14px;  width:35px; background:url(image/btnbg.jpg)"/>
    </td>
  </tr>
</table>

<%--设置变量 --%>
<c:set var="count" value="1"></c:set><%--已写的天数--%>
<c:set var="countBehide" value="1"></c:set><%--下层已写的天数--%>
<c:set var="divcount" value="5"></c:set><%--共分层数--%>
<c:if test="${daycount eq '30' && firstDayWeek gt '6'}">
	<c:set var="divcount" value="6"></c:set>
</c:if>
<c:if test="${daycount eq '31' && firstDayWeek gt '5'}">
	<c:set var="divcount" value="6"></c:set>
</c:if>
<c:if test="${daycount eq '28' && firstDayWeek eq '1'}">
	<c:set var="divcount" value="4"></c:set>
</c:if>

<!-- 测试和信息 -->
	
<!--下面为主内容-->
<table align="center" border="0px" cellspacing="0" cellpadding="0">
<tr><td height="10"></td></tr>
<tr><td>
<table  style=" border-collapse:collapse; border:1px #000000 solid"  cellspacing="0" cellpadding="0">
  <tr>
    <td width="110" height="31" align="center" valign="middle"  background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">日</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">一</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">二</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">三</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">四</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">五</span></td>
    <td  width="110" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE3">六</span></td>
  </tr>
  
  <%--第一层上--%>
 
  <tr>
  	<c:forEach begin="1" end="${firstDayWeek-1}"><!-- 没显示日期 -->
  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid; border-bottom:opx; ">
        </td>
  	</c:forEach>
  	
  	<c:forEach begin="1" end="${8-firstDayWeek}"><!-- 有显示日期 -->
  	  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  		</c:forEach>
			  		<c:if test="${flag eq count}"><!-- 今天有记录时，加链接 -->
			  			<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a>
			  		</c:if>
			  			
			  		<c:if test="${flag ne count}"><!-- 今天没有记录时，没链接 -->
			  			<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${day}" class="mylink">${count}</a>
			  		</c:if>
		        	
		        	</span>
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no') }"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  		<c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  </tr>
  
   <%--第一层下--%>
  <tr>
  	<c:forEach begin="1" end="${firstDayWeek-1}">
  		<td align="left"   bgcolor="#FFFFFF" style=" border-top:0px #000000 solid; border-left:1px #000000 solid;"></td>
  	</c:forEach>
  	
  	
  	<c:forEach begin="1" end="${8-firstDayWeek}">
  		<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
  		<c:forEach var="scratchpad" items="${list}">
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
  			</c:if>	
  				
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
  			</c:if>
  			
  			<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
  				 <span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
  			</c:if>
  		</c:forEach>
  		<c:set var="countBehide" value="${countBehide+1}"></c:set>
  		</td>
  	</c:forEach>
  </tr>
  
  <!-- 生成二三四层 -->
  <c:forEach begin="1" end="3">
  <%--上--%>
 <tr>
  	<c:forEach begin="1" end="7"><!-- 全部是有显示日期 -->
  	  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        	
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no')}"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  <c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  </tr>
 <!-- 下 -->
 
 <tr>
  	<c:forEach begin="1" end="7">
  		<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
  		<c:forEach var="scratchpad" items="${list}">
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
  			</c:if>	
  				
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
  			</c:if>
  			
  			<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
  				 <span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
  			</c:if>
  	</c:forEach>
  		<c:set var="countBehide" value="${countBehide+1}"></c:set>
  		</td>
  	</c:forEach>
  </tr>
 </c:forEach>
 
 
 
 
 
   <%--第五层,有第六层的时候--%>
  <c:if test="${divcount eq '6'}">
  	 <%--(五)上--%>
 <tr>
  	<c:forEach begin="1" end="7"><!-- 全部是有显示日期 -->
  	  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        	
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no')}"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  <c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  </tr>
 <!-- 下 -->
 <tr>
  	<c:forEach begin="1" end="7">
  		<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
  		<c:forEach var="scratchpad" items="${list}">
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
  			</c:if>	
  				
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
  			</c:if>
  			
  			<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
  				 <span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
  			</c:if>
  	</c:forEach>
  		<c:set var="countBehide" value="${countBehide+1}"></c:set>
  		</td>
  	</c:forEach>
  </tr>
</c:if>
 
 <%--第五层,没有第六层的时候--%>
  <c:if test="${divcount eq '5'}">
  <tr>
  	<c:if test="${(daycount-29+firstDayWeek) eq '7'}"><!-- 刚好第五层全部有日期时 -->
  		<%--上--%>
 
  	<c:forEach begin="1" end="7"><!-- 全部是有显示日期 -->
  	  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        	
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no')}"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  <c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  </tr>
 <!-- 下 -->
 <tr>
  	<c:forEach begin="1" end="7">
  		<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
  		<c:forEach var="scratchpad" items="${list}">
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
  			</c:if>	
  				
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
  			</c:if>
  			
  			<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
  				 <span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
  			</c:if>
  	</c:forEach>
  		<c:set var="countBehide" value="${countBehide+1}"></c:set>
  		</td>
  	</c:forEach>
  </tr>
 	</c:if>	
 	
 	<!-- 第五层不是全部有日期时 -->
 	
 
 	<c:if test="${(daycount-29+firstDayWeek) ne '7'}">
 	<!-- 上面 -->
 		<tr>
 		<c:forEach begin="1" end="${daycount-29+firstDayWeek}">
  	  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        	
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no')}"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		          		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  <c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  	<!--（上）没日期-->
  		<c:forEach begin="1" end="${7-(daycount-29+firstDayWeek)}"><!-- 空白 -->
	 		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
        	</td>
	 	</c:forEach>
  </tr>
 <!-- 下 -->
 	<tr>
  	<c:forEach begin="1" end="${daycount-29+firstDayWeek}">
  		<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
  		<c:forEach var="scratchpad" items="${list}">
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
  			</c:if>	
  				
  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
  			</c:if>
  			
  			<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
  				 <span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
  			</c:if>
  	    </c:forEach>
  		<c:set var="countBehide" value="${countBehide+1}"></c:set>
  		</td>
  	</c:forEach>
  	<!-- （下）没日期 -->
  	<c:forEach begin="1" end="${7-(daycount-29+firstDayWeek)}"><!-- 空白 -->
	 	<td align="left"   bgcolor="#FFFFFF" style=" border-top:0px #000000 solid; border-left:1px #000000 solid;"></td>	
	</c:forEach>
  	
 		</tr>
 		
 </c:if>
 	
  
</c:if>
 
 <!-- 第六层 -->
  <c:if test="${divcount eq '6'}">
  	<!-- 上面 -->
  	<tr>
  	<c:forEach begin="1" end="${daycount-36+firstDayWeek}">
  		<!--(第六层上面) 有日期 -->
  		<c:if test="${count eq day && isToday eq 'is'}"><!-- 是今天 -->
  	  			<td align="center" valign="middle" bgcolor="#6699CC" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
		        	<span class="STYLE4">
		        	<!-- 这天有没有数据 -->
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        	
		        	
	       		</td>
  	  		</c:if>
  	  		
  	  		<c:if test="${count ne day || (count eq day && isToday eq 'no')}"><!-- 不是今天 -->
	  	  		<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid;border-top:1px #000000 solid; border-bottom:opx; ">
		        	<span class="STYLE4">
		        	
		        	<c:set var="have" value="0"/><!-- 记录是否有数据库的 -->
		        	<c:forEach var="scratchpad" items="${list}">
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
			  			</c:if>	
			  				
			  			<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
			  				<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
			  			</c:if>
			  			
			  			<c:if test="${flag eq count}"><!-- 这天有记录时 -->
			  				<c:set var ="have" value="${have+1}"/>
			  			</c:if>
		        	</c:forEach>
		        	
		        	<c:if test="${have eq '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="mylink">${count}</a>
		        	</c:if>
		        	<c:if test="${have ne '0'}">
		        		<a href="scratchpad.do?operate=toGetScratchpad&year=${year}&month=${month}&day=${count}" class="day">${count}</a><!-- 有记录时的日期链接，在这里加 -->
		        	</c:if>
		        	</span>
		        </td>
  	  		</c:if>
  	  <c:set var="count" value="${count+1}"></c:set>
  	</c:forEach>
  		<!-- 第六层上面没日期 -->
  		<c:forEach begin="1" end="${7-(daycount-36+firstDayWeek)}">
  			<td align="center" valign="middle" bgcolor="#FFFFFF" style="border-left:1px #000000 solid; border-bottom:opx;border-top:1px #000000 solid; ">
        	</td>
  		</c:forEach>
  	</tr>
  	
  	<!-- 第六层下面 -->
  	<tr>
  			<!-- 第六层下面有日期 -->
  			<c:forEach begin="1" end="${daycount-36+firstDayWeek}">
	  			<td align="left" width="110" bgcolor="#FFFFFF" style="WORD-WRAP: break-word;border-top:0px #000000 solid ;border-left:1px #000000 solid;">
	  				<c:forEach var="scratchpad" items="${list}">
	  					<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) eq '0'}"><!-- 一位数时01,02 -->
	  						<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 9, 10)}"/>
	  					</c:if>	
	  				
	  					<c:if test="${fn:substring(scratchpad.scratchpadDate, 8, 9) ne '0'}"><!-- 两位数时10,11 -->
	  						<c:set var ="flag" value="${fn:substring(scratchpad.scratchpadDate, 8, 10)}"/>
	  					</c:if>
	  			
	  					<c:if test="${flag eq countBehide}"><!-- 这个日期有记录时 -->
	  				 		<span class="STYLE5">工作：${scratchpad.scratchpadTitle }<br></span>
	  					</c:if>
	  				</c:forEach>
	  				<c:set var="countBehide" value="${countBehide+1}"></c:set>
	  			</td>
  			</c:forEach>
  			<!-- 第六层下面没日期 -->
  			<c:forEach begin="1" end="${7-(daycount-36+firstDayWeek)}">
  				<td align="left"   bgcolor="#FFFFFF" style="border-top:0px #000000 solid; border-left:1px #000000 solid;"></td>
  			</c:forEach>
  			
  	</tr>
  </c:if>

</table>
</td></tr>
</table>
  </body>
</html>
