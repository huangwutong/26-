<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
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
		function checkAll(who){
			var cids=document.getElementsByName("cids");
			for(var i=0;i<cids.length;i++){
				cids[i].checked=who.checked;
			}
		}
	</script>
  </head>
  <body>
    <form action="" method="post" name="fm">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td height="50" valign="bottom" class="font_style_title"><img src="enterprise/image/client.gif"/>积分管理：</td>
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
           <td width="120" align="center">用户名</td>
           <td width="120" align="center">积分</td>
           <td align="center"></td>
          </tr>
          <logic:iterate id="credit" name="CreditInfo"  length="<%=request.getAttribute("PageSize").toString() %>" offset="<%=request.getAttribute("PageStartRow").toString() %>">
	         <tr class="font_style_normal" onmouseover="changebgColor(this)" onmouseout="changebgColor(this)">
          		 <td height="25" align="center">
           	 		 <input type="checkbox" name="cids" value="${credit.CId }" />
         		 </td>
          		 <td align="center">${credit.userInfo.UName }</td>
          		 <td align="center">${credit.UCount }</td>
          		 <td align="center"></td>
          	</tr>
          </logic:iterate>
         <tr>
           <td height="40" colspan="3">全选：
             <input type="checkbox" name="checkbox2" value="checkbox" onclick="checkAll(this);"/>
             <input type="reset" name="Submit" value="删除所选记录"/>
           </td>
           <td colspan="3" align="right" class="font_style_normal">
           	 | <a href="findAllCredit.do?page=1" class="menu_font_style">首页</a> 
             | <a href="findAllCredit.do?page=<%=request.getAttribute("BackPage") %>" class="menu_font_style">上一页</a> 
             | <a href="findAllCredit.do?page=<%=request.getAttribute("NextPage") %>" class="menu_font_style">下一页</a> 
             | <a href="findAllCredit.do?page=<%=request.getAttribute("TotalPage") %>" class="menu_font_style">尾页</a> |
           </td>
          </tr>
       </table></td>
     </tr>
</table>
</form>
  </body>
</html:html>