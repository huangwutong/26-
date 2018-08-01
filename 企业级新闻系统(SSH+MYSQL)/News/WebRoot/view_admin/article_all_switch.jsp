<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
  	<html:base/>
	<title>article_all_switch</title>
	<style type="text/css" media="">
.hotibox{font-size:12px;color:#000;line-height:18px;}
.hotibox nobr{padding:0px 0px 0px 10px;width:100%}
.hotibox a{text-transform:none;text-decoration:none;color:#000;}
.hotibox a:hover{color:#555;text-decoration:none;}
.i203cmenu {width:100%;height:23px;font-size:12px;font-family:Arial;}
.i203cmenu div a {text-decoration:none;color:#000000;height:100%;width:100%;display:block}
.i203cmenuon0, .i203cmenuon1, .i203cmenuon2, .i203cmenuon3, .dummy {
 float:left;margin:0 1px 0 1px;
 position:relative;top:1px;
 width:50px;height:23px;padding:2px 6px 0 6px;line-height:19px;text-align:center;
 border: 1px solid black; border-bottom:0;
 cursor:hand;cursor:pointer;
}
.i203cmenuoff {
 cursor:hand;cursor:pointer;
 float:left;margin:2px 1px 0 1px;width:50px;height:21px;padding:4px 6px 0 6px;line-height:16px;text-align:center;
 border:1px solid black; border-bottom:0;
}
.dc {
 cursor:hand;cursor:pointer;
 float:left;margin:2px 1px 0 1px;width:50px;height:21px;padding:4px 6px 0 6px;line-height:16px;text-align:center;
 border:1px solid black; border-bottom:0;background:#F7FADE;
}
.cd {
 cursor:hand;cursor:pointer;
 float:left;margin:2px 1px 0 1px;width:50px;height:21px;padding:4px 6px 0 6px;line-height:16px;text-align:center;
 border:1px solid black; border-bottom:0;background:#FEEFB6;
}
.i203c0, .i203c1, .i203c2, .i203c3, .dummy {width:100%;border:1px solid;clear:both;}
.i203cmenuoff {color:#666666;background:url(/school/UploadFiles/200602/20060214092618928.gif) repeat-x top center #f8f8f8;border-color: #cccccc}
.i203cmenuon0 {background:url(/school/UploadFiles/200602/20060214092618854.gif) repeat-x top center #FEEFB6;border-color:#F3B75C;color:#CC5B00;}
.i203cmenuon1 {background:url(/school/UploadFiles/200602/20060214092618824.gif) repeat-x top center #F7FADE;border-color:#C8CF65;color:#009999;}
.i203cmenuon2 {background:url(/school/UploadFiles/200602/20060214092618280.gif) repeat-x top center #F1F3F5;border-color:#B9C2D0;color:#5C80BA;}
.i203cmenuon3 {background:url(/school/UploadFiles/200602/20060214092618280.gif) repeat-x top center #F1F3F5;border-color:#B9C2D0;color:#5C80BA;}
.i203c0,.i203c1,.i203c2,.i203c3, {border:0;padding-top:5px;}
.i203c0 {background:#FEEFB6;border:1px solid #F3B75C;}
.i203c1 {background:#F7FADE;border:1px solid #C8CF65;}
.i203c2 {background:#F1F3F5;border:1px solid #B9C2D0;}
.i203c3 {background:#F1F3F5;border:1px solid #B9C2D0;}
</style>

<script type="text/javascript">
function iboxActive(id, key, num, max) {
 var menu = document.getElementById(id + "menu");
 (menu.getElementsByTagName("INPUT")[0]||{}).value = key;
 var main = menu.parentNode;
 var applyfilter;
 var menudivs = menu.getElementsByTagName("DIV");
 for (var i = 0; i < menudivs.length; i ++) {
  menudivs[i].className = id+"menuoff";
  (menudivs[i].getElementsByTagName("A")[0]||{}).className = "";
 }
 menudivs[num].className = id+"menuon"+(num % max);
 (menudivs[num].getElementsByTagName("A")[0]||{}).className = "active";
 try {
  applyfilter = main.filters && main.filters[0];
  if (applyfilter) {
   main.filters[0].apply();
  }
 } catch(e) {}

 var parent = menu.parentNode;
 var childs = parent.childNodes;
 var divs = [];
 for (var i = 0, c = childs.length; i < c; i ++) {
  if (childs[i].tagName == 'DIV') {
   if (divs.length) childs[i].style.display = 'none';
   divs[divs.length] = childs[i];
  }
 }
 divs[num+1].style.display = 'block';
 try {
  if (applyfilter) {
   main.filters[0].play();
  }
 } catch(e) {}
}
</script>
</head>
<body>

<%
	List articlesviewsList = request.getAttribute("articlesviewsList") != null ? (List) request.getAttribute("articlesviewsList") : null;
	if(articlesviewsList == null){
		articlesviewsList = (List) session.getAttribute("articles");
	}
	request.setAttribute("articlesviewsList", articlesviewsList);
	String pages = request.getParameter("d-5394226-p") == null ? "" : request.getParameter("d-5394226-p");
	if(!pages.equals("")){
		request.setAttribute("play", "none");
        request.setAttribute("noplay", "");
    }
%>

<div class="i203cmenu" id="i203cmenu">
<div class="cd" onclick="iboxActive('i203c', '0', 0, 4);return false"><nobr>常规</nobr></div>
<div class="dc" onclick="iboxActive('i203c', '1', 1, 4);return false"><nobr>详细</nobr></div>
</div>


<div class="i203c1"  style="display:${play}">
<div class="hotibox">
	<jsp:include page="article_all.jsp"/>
</div>
</div>


<div class="i203c0" style="display:${noplay}">
<div class="hotibox">
	<jsp:include page="article_all_detail.jsp"/>
</div>
</div>

</body>
</html:html>
