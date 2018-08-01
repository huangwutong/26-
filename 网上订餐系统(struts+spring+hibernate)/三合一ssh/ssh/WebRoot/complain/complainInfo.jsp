<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <link rel="stylesheet" type="text/css" href="manage/style_css/manage_style.css">
  
	<script type="text/javascript">
		function changebgColor(who){
			if(who.style.backgroundColor==''){
  				who.style.backgroundColor='#dde8ff';
  			}else{
  				who.style.backgroundColor='';
  			}
		}
		function checkAll(th){
			var ciids=document.getElementsByName("ciids");
			for(var i=0;i<ciids.length;i++){
				ciids[i].checked=th.checked;
			}
		}
		function button_delete(){
			if(window.confirm("你真的要删除吗？")){
				window.document.fm.action="deleteComplain.do";
				window.document.fm.submit();
			}
		}
	</script>
	
  </head>
  
  <body>
	 <form action="" method="post" name="fm">
	   <table width="100%" border="0" cellspacing="0" cellpadding="0">
	     <tr>
	       <td height="50" valign="bottom" class="font_style_title"><img src="enterprise/image/client.gif"/>投诉管理：</td>
	     </tr>
	     <tr>
	       <td><hr/></td>
	     </tr>
	     <tr>
	       <td>       </td>
	     </tr>
	     <tr>
	       <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	         <tr class="bg_style_title">
	           <td width="50" height="30" align="center">&nbsp;</td>
	           <td width="120" align="center">编号</td>
	           <td width="120" align="center">投诉人</td>
	           <td align="center">投诉信息</td>
	          </tr>
	          <logic:iterate id="complain" name="ComplainInfo"  length="<%=request.getAttribute("PageSize").toString() %>" offset="<%=request.getAttribute("PageStartRow").toString() %>">
		         <tr class="font_style_normal" onmouseover="changebgColor(this)" onmouseout="changebgColor(this)">
	          		 <td height="25" align="center">
	           	 		 <input type="checkbox" name="ciids" value="${complain.ciId }" />
	         		 </td>
	          		 <td align="center">${complain.ciId }</td>
	          		 <td align="center">${complain.userInfo.UName }</td>
	          		 <td align="center">${complain.ciIdea }</td>
	          	</tr>
	          </logic:iterate>
	         <tr>
	           <td height="40" colspan="3">全选：
	             <input type="checkbox" name="checkbox2" value="checkbox" onclick="checkAll(this);"/>
	             <input type="button" name="Submit" value="删除所选记录" onclick="return button_delete();"/>
	           </td>
	           <td colspan="3" align="right" class="font_style_normal">
	           	 | <a href="findAllComplain.do?page=1" class="menu_font_style">首页</a> 
	             | <a href="findAllComplain.do?page=<%=request.getAttribute("BackPage") %>" class="menu_font_style">上一页</a> 
	             | <a href="findAllComplain.do?page=<%=request.getAttribute("NextPage") %>" class="menu_font_style">下一页</a> 
	             | <a href="findAllComplain.do?page=<%=request.getAttribute("TotalPage") %>" class="menu_font_style">尾页</a> |
	           </td>
	          </tr>
	       </table></td>
	     </tr>
	  </table>
	</form>
  </body>
</html:html>
