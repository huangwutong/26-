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
.pwdfont {
	font-family: "宋体";
	font-size: 14px;
	color: #000000;
}
.emailheader {
	font-size: 14px;
	font-weight: bold;
	font-family: "宋体";
	
}

.tabletd{
border-left:0px; border-right:0px; border-top:0px; border-bottom:1px #CCCCCC solid; font-size: 13px; font-family: "宋体"; 
}
.STYLE5 {
	font-size: 14px;
	font-family: "宋体";
	color: #000066;
}
.STYLE8 {
	font-size: 14px;
	font-weight: bold;
	font-family: "宋体";
	color: #000066;
}
.STYLE12 {color: #FF6600}
.STYLE20 {font-size: 14px; font-family: "宋体"; }
.STYLE22 {color: #999999}
.STYLE23 {
	color: #333333;
	font-family: "宋体";
	font-size: 12px;
}
-->
</style>
<script language="javascript">
window.onload=function (){
	var divbottom=document.getElementById("divbottom");
	var he=document.body.clientHeight;//页面高度
	//alert(he);
	document.getElementById("divbottom").style.top=he-30;
	
	}
	
	
	function rowOver(myrow){
		myrow.style.backgroundColor="#FFFFCC";
		//#FFFFCC  #CCCCCC
	}
	function rowOut(myrow){
		myrow.style.backgroundColor="white";
	}


	function getCheck(checkall,flag){
	
		var items=document.getElementsByTagName("input");
		
		for(i=0;i<items.length;i++){
		
			if(items[i].type=="checkbox"){
				//alert(items[i].name.substring(0,2));
				if(items[i].name.substring(0,3)==flag){
				
					items[i].checked=checkall.checked;
				}
				
			}
		}
	}
	
	//删除
	function emaildelete(page){
		var count=0;
		var name="";
		var id="";
		if(confirm("确定要删除？")){
			var items=document.getElementsByTagName("input");
			var address="email.do?operate=doFalseDelete&page="+page+"&id=";
			for(i=0;i<items.length;i++){
				if(items[i].type=="checkbox"){
				//alert(items[i].name.substring(0,2));
					if(items[i].name.substring(0,3)=="the" || items[i].name.substring(0,3)=="las" || items[i].name.substring(0,3)=="ear"){
						if(items[i].checked==true){
							count=count+1;
							name=items[i].name;
							id=name.substring(3);
							if(count==1){
								address=address+id;
							}else{
								address=address+";"+id;
							}
						}
					}
				}
			}
			
			if(count==0){
				alert("没用要删除的邮件");
				return;
			}
			//alert(address);
			location=address;
		}
		
	}
	
	//彻底删除
	function emailtruedelete(page){
		var count=0;
		var name="";
		var id="";
		if(confirm("确定要彻底删除？")){
			var items=document.getElementsByTagName("input");
			var address="email.do?operate=doTrueDelete&flag=tr&page="+page+"&id=";
			for(i=0;i<items.length;i++){
				if(items[i].type=="checkbox"){
				//alert(items[i].name.substring(0,2));
					if(items[i].name.substring(0,3)=="the" || items[i].name.substring(0,3)=="las" || items[i].name.substring(0,3)=="ear"){
						if(items[i].checked==true){
							count=count+1;
							name=items[i].name;
							id=name.substring(3);
							if(count==1){
							  
								address=address+id;
							}else{
							address=address+";"+id;
							}
						}
					}
				}
			}
			
			if(count==0){
				alert("没用要彻底删除的邮件");
				return;
			}
			//alert(address);
			location=address;
		}
	}
	
	//查看已删除
	function showdelete(){
		//alert(id);
		location="email.do?operate=toDeleteEmail";
	}
	
	//查看邮件内容
	function showcontent(id,cur){
		//alert(id);
		location="email.do?operate=toShowEmail&flag=em&id="+id+"&page="+cur;
	}
</script>
  </head>
  
  <body leftmargin="10" marginwidth="10" style="overflow:hidden;">
  <c:if test="${curPage gt maxPage}">
  	<c:set var="curPage" value="${maxPage}" scope="request" ></c:set>
  	</c:if>
  <!-- 做循环获取每种的邮件数 -->
  <c:set var="thisWeekCount" value="0"></c:set>
  <c:set var="lastWeekCount" value="0"></c:set>
  <c:set var="otherCount" value="0"></c:set>
  <c:forEach var="email" items="${listemail}">
  	<c:if test="${email.email.emailDate gt thisweek}">
  		<c:set var="thisWeekCount" value="${thisWeekCount+1}"></c:set>
  	</c:if>
  	<c:if test="${email.email.emailDate gt lastweek && email.email.emailDate lt thisweek}">
  		<c:set var="lastWeekCount" value="${lastWeekCount+1}"></c:set>
  	</c:if>
  </c:forEach>
  <c:set var="otherCount" value="${count-thisWeekCount-lastWeekCount}"></c:set>
  <table style="border:0px  none; border-collapse:collapse; border-left:0px none" width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center" valign="middle" bordercolor="#999999" >
    <td height="28" colspan="2" background="image/emailheader.jpg" class="emailheader" style="border:0" >&nbsp;收件箱</td>
    <td height="28" colspan="3" align="left" background="image/emailheader.jpg" style="border:0;" class="STYLE5" >(共 <span class="STYLE12">${count }</span> 封，其中未读邮件<span class="STYLE12">${unread }</span> 封)</td>
  </tr>
  <c:set var="thiscount" value="0"/>
  <c:set var="lastcount" value="0"/>
  <c:set var="earlycount" value="0"/>
  <!-- 这一周 -->
  <c:forEach var="email" items="${listemail}">
  	
  <c:if test="${email.email.emailDate gt thisweek}">
  	<c:if test="${thiscount eq '0'}"> 
  	<c:set var="thiscount" value="1"/>
  	<tr >
 	<td height="27" colspan="2" align="center" valign="middle" style="border:0"><span class="STYLE8">这一周</span></td>
    <td colspan="3" style="border:0"><span class="STYLE5">(<u>${thisWeekCount }封</u>)</span></td>
   </tr>
 
  <tr bordercolor="#999999" bgcolor="#CCCCCC">
 	<td width="22" height="27" style="border:0" background="image/emailtitle.jpg"><input type="checkbox" onClick="getCheck(this,'the')" name="selectall"></td>
    <td width="45" align="center" valign="middle"style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;<img src="image/emailall.jpg"  />&nbsp;<img src="image/emailtip.jpg" align="absmiddle"  /></span></td>
   
    <td width="100" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20">发件人</span></td>
    <td width="*" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;标题</span></td>
    <td width="150" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />时间</span></td>
  </tr>
  
  </c:if>
  <!-- 这一周内容 -->
	<tr  onMouseOver="rowOver(this)" onMouseOut="rowOut(this)" bordercolor="#999999">
    <td class="tabletd"><input type="checkbox" name="the${email.emailReceivceId}"></td>
    <td align="center" class="tabletd" valign="middle">
	    <c:if test="${email.emailState eq '0'}">
	    <img src="image/emailclose.jpg"> 
	    </c:if>
	    <c:if test="${email.emailState eq '1'}">
	    <img src="image/emailopen.jpg"> 
	    </c:if>
	</td>
   
    <td class="tabletd">${email.email.user.userName }</td>
    <td class="tabletd"   >&nbsp;<a href="javascript:showcontent(${email.email.emailId},${curPage })">
    ${fn:substring(email.email.emailTitle,0,15)}</a>&nbsp;
    </td>
    <td class="tabletd">
    &nbsp;<fmt:formatDate  pattern="yyyy-MM-dd HH:mm"  value='${email.email.emailDate }'/></td>
  </tr>
  </c:if>
  </c:forEach>
  
  
  <!-- 上一周 -->
  <c:forEach var="email" items="${listemail}">
  <c:if test="${email.email.emailDate gt lastweek && email.email.emailDate lt thisweek}">
  <c:if test="${lastcount eq '0'}">
  		<c:set var="lastcount" value="1"/>
  	<tr >
 	<td height="27" colspan="2" align="center" valign="middle" style="border:0"><span class="STYLE8">上一周</span></td>
    <td colspan="3" style="border:0"><span class="STYLE5">(<u>${lastWeekCount }封</u>)</span></td>
   </tr>
 
  <tr bordercolor="#999999" bgcolor="#CCCCCC">
 	<td width="22" height="27" style="border:0" background="image/emailtitle.jpg"><input type="checkbox" onClick="getCheck(this,'las')" name="selectall"></td>
    <td width="45" align="center" valign="middle"style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;<img src="image/emailall.jpg"  />&nbsp;<img src="image/emailtip.jpg" align="absmiddle"  /></span></td>
   
    <td width="100" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20">发件人</span></td>
    <td width="*" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;标题</span></td>
    <td width="150" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />时间</span></td>
  </tr>
   </c:if>
  	<!-- 上一周email内容 -->
	<tr onMouseOver="rowOver(this)" onMouseOut="rowOut(this)" bordercolor="#999999">
    <td class="tabletd"><input type="checkbox" name="las${email.emailReceivceId}"></td>
    <td align="center" class="tabletd" valign="middle">
	    <c:if test="${email.emailState eq '0'}">
	    <img src="image/emailclose.jpg"> 
	    </c:if>
	    <c:if test="${email.emailState eq '1'}">
	    <img src="image/emailopen.jpg"> 
	    </c:if>
	</td>
   
    <td class="tabletd">${email.email.user.userName }</td>
    <td class="tabletd">&nbsp;<a href="javascript:showcontent(${email.email.emailId},${curPage })">
    ${fn:substring(email.email.emailTitle,0,15)}</a>&nbsp;
    </td>
    <td class="tabletd">
    &nbsp;<fmt:formatDate  pattern="yyyy-MM-dd HH:mm"  value='${email.email.emailDate }'/></td>
  </tr>
  </c:if>
  </c:forEach>
  
  <!-- 更早 -->
  <c:forEach var="email" items="${listemail}">
 <c:if test="${email.email.emailDate lt lastweek}">
 <c:if test="${earlycount eq '0'}">
 	<c:set var="earlycount" value="1"/>
 	<tr >
 	<td height="27" colspan="2" align="center" valign="middle" style="border:0"><span class="STYLE8">更早</span></td>
    <td colspan="3" style="border:0"><span class="STYLE5">(<u>${otherCount }封</u>)</span></td>
   </tr>
 
  <tr bordercolor="#999999" bgcolor="#CCCCCC">
 	<td width="22" height="27" style="border:0" background="image/emailtitle.jpg"><input type="checkbox" onClick="getCheck(this,'ear')" name="selectall"></td>
    <td width="45" align="center" valign="middle"style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;<img src="image/emailall.jpg"  />&nbsp;<img src="image/emailtip.jpg" align="absmiddle"  /></span></td>
   
    <td width="100" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20">发件人</span></td>
    <td width="*" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />&nbsp;标题</span></td>
    <td width="150" style="border:0" background="image/emailtitle.jpg"><span class="STYLE20"><img src="image/emailtip.jpg" align="absmiddle"  />时间</span></td>
  </tr>
 </c:if>
 	<!-- 更早email内容 -->
	<tr onMouseOver="rowOver(this)" onMouseOut="rowOut(this)" bordercolor="#999999">
    <td class="tabletd"><input type="checkbox" name="ear${email.emailReceivceId}"></td>
    <td align="center" class="tabletd" valign="middle">
	    <c:if test="${email.emailState eq '0'}">
	    <img src="image/emailclose.jpg"> 
	    </c:if>
	    <c:if test="${email.emailState eq '1'}">
	    <img src="image/emailopen.jpg"> 
	    </c:if>
	</td>
   
    <td class="tabletd">${email.email.user.userName }</td>
    <td class="tabletd">&nbsp;<a href="javascript:showcontent(${email.email.emailId},${curPage })">
    ${fn:substring(email.email.emailTitle,0,15)}</a>&nbsp;
    </td>
    <td class="tabletd">
    &nbsp;<fmt:formatDate  pattern="yyyy-MM-dd HH:mm"  value='${email.email.emailDate }'/></td>
  </tr>
  </c:if>
  </c:forEach>
  
  
</table>
  
  

<div id="divbottom" style="position:absolute">
<table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
  <tr bgcolor="#999900">
    <td width="313" height="24" align="left" valign="middle" bgcolor="#E0F0D3">
    	<input type="button" value="删除" onclick="emaildelete('${curPage}')" style="font:'宋体'; font-size:10px" />
        <input type="button" value="彻底删除" onclick="emailtruedelete('${curPage}')" style="font:'宋体'; font-size:10px"  />
        <input type="button" value="查看已删除" onclick="showdelete()" style="font:'宋体'; font-size:10px"  />
    </td>
    <td width="469" align="center" valign="middle" bgcolor="#E0F0D3">&nbsp;</td>
    <td width="200" align="right" valign="middle" bgcolor="#E0F0D3"><span class="STYLE23">${curPage }/${maxPage}页&nbsp;
    
    <c:if test="${maxPage gt curPage || maxPage eq curPage}">
    	<c:if test="${curPage ne '1'}">
    		   <a href="email.do?operate=toGiveMail"+ target="main">首页</a>&nbsp;<a href="email.do?operate=toGiveMail&page=${curPage-1}" target="main">上一页</a>
    	</c:if>
    </c:if>
    <c:if test="${curPage lt maxPage}">
   	 <a href="email?operate=toGiveMail&page=${curPage+1}" target="main">下一页</a>&nbsp;<a href="email.do?operate=toGiveMail&page=${maxPage}"+ target="main">末页</a>
    </c:if>
    
    </span></td>
  </tr>
</table>
</div>

</body>
</html>
