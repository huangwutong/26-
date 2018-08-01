<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<html:html locale="true">
  <head>    
    <title>left.jsp</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
    	function change_style(who){
    		if(who==1){
    			document.all("tblAddManage").className="table_border2";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==2){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="table_border2";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==3){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="table_border2";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==4){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="table_border2";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==5){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="table_border2";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==6){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="table_border2";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==7){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="table_border2";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="";
    		}else if(who==8){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="table_border2";
    			document.all("tblFoodBigType").className="";
    		}else if(who==9){
    			document.all("tblAddManage").className="";
    			document.all("tblSelectManage").className="";
    			document.all("tblUser").className="";
    			document.all("tblEnterprise").className="";
    			document.all("tblFood").className="";
    			document.all("tblFoodType").className="";
    			document.all("tblCredit").className="";
    			document.all("tblOrder").className="";
    			document.all("tblFoodBigType").className="table_border2";
    		}
    	}
    	
    	var isCoalition=false;
    	function coalition(who,img){
    		if(isCoalition==false){
    			document.all(who).style.display="none";
    			img.src="image/ico-2.gif";
    			isCoalition=true;
    		}else{
    			document.all(who).style.display="";
    			img.src="image/ico-1.gif";
    			isCoalition=false;
    		}
    	}
    	
    </script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-right: 0px;
}
-->
</style>
<link rel="stylesheet" href="style_css/frame_style.css" type="text/css"></link>
</head>
<body class="left_bg">
<table width="185" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td>
	 <table width="160" height="50" border="0" align="center" class="table_border" cellpadding="0" cellspacing="0">
     	 <tr>
        	<td align="center" class="font_style_normal"><marquee direction="left" scrollamount="1" width="100">欢迎<span style="color: red;font-weight: bold;">${MANAGE.MName}</span>登陆后台管理</marquee></td>
      	</tr>
    </table><br>
	 <table width="160" border="0" align="center" cellpadding="10" cellspacing="0" class="table_border">
        <tr>
          <td valign="top">
          	<table width="90%" height="18" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top" class="font_style_title"><a href="javascript:coalition('tbl',myarrow)"><img id="myarrow" name="myarrow" src="image/ico-1.gif" width="11" height="11" border="no"/></a>　管理员管理</td>
              </tr>
            </table>
            <table width="96%" id="tbl">
            	<tr>
            		<td>
            			<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblAddManage">
           					 <tr>
              					<td width="50" align="center"></td>
              					<td class="font_style_normal"><a href="<%=request.getContextPath() %>/preAddManage.do" onclick="change_style(1)" target="mainFrame" class="menu_font_style">新增管理员</a></td>
           					 </tr>
       				  </table>
           				 <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblSelectManage">
            				  <tr>
               					 <td width="50" align="center"></td>
               					 <td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllManage.do" onclick="change_style(2)" target="mainFrame" class="menu_font_style">查看管理员</a></td>
             				 </tr>
           			  </table>
            		</td>
            	</tr>
            </table>
          </td>
        </tr>
      </table>
	  <br>
	  <table width="160" border="0" align="center" cellpadding="10" cellspacing="0" class="table_border">
        <tr>
          <td valign="top">
          	<table width="90%" height="18" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top" class="font_style_title"><a href="javascript:coalition('tbl2',myarrow2)"><img id="myarrow2" name="myarrow2" src="image/ico-1.gif" width="11" height="11" border="no"/></a>　客户管理</td>
              </tr>
            </table>
            <table width="96%" id="tbl2">
            	<tr>
            		<td>
            			<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblUser">
           					 <tr>
              					<td width="50" align="center"></td>
              					<td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllUser.do" onclick="change_style(3)" target="mainFrame" class="menu_font_style">个人信息管理</a></td>
           					 </tr>
       				  </table>
           				 <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblEnterprise">
            				  <tr>
               					 <td width="50" align="center"></td>
               					 <td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllEnterprise.do" onclick="change_style(4)" target="mainFrame" class="menu_font_style">企业信息管理</a></td>
             				 </tr>
           			  </table>
           			  <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblCredit">
            				  <tr>
               					 <td width="50" align="center"></td>
               					 <td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllCredit.do" onclick="change_style(7)" target="mainFrame" class="menu_font_style">积分管理</a></td>
             				 </tr>
           			  </table>
            		</td>
            	</tr>
            </table>
          </td>
        </tr>
      </table>
      <br/>
       <table width="160" border="0" align="center" cellpadding="10" cellspacing="0" class="table_border">
        <tr>
          <td valign="top">
          	<table width="90%" height="18" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top" class="font_style_title"><a href="javascript:coalition('tbl3',myarrow3)"><img id="myarrow3" name="myarrow3" src="image/ico-1.gif" width="11" height="11" border="no"/></a>　餐饮管理</td>
              </tr>
            </table>
            <table width="96%" id="tbl3">
            	<tr>
            		<td>
            			<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblFoodBigType">
           					 <tr>
              					<td width="50" align="center"></td>
              					<td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllFoodBigType.do" onclick="change_style(9)" target="mainFrame" class="menu_font_style">餐饮大分类管理</a></td>
           					 </tr>
       				  </table>
            			<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblFood">
           					 <tr>
              					<td width="50" align="center"></td>
              					<td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllFoodType.do" onclick="change_style(5)" target="mainFrame" class="menu_font_style">餐饮小分类管理</a></td>
           					 </tr>
       				  </table>
           				 <table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblFoodType">
            				  <tr>
               					 <td width="50" align="center"></td>
               					 <td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllFoods.do" onclick="change_style(6)" target="mainFrame" class="menu_font_style">餐饮信息管理</a></td>
             				 </tr>
           			  </table>
           			  
            		</td>
            	</tr>
            </table>
          </td>
        </tr>
      </table>
      <br/>
       <table width="160" border="0" align="center" cellpadding="10" cellspacing="0" class="table_border">
        <tr>
          <td valign="top">
          	<table width="90%" height="18" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="top" class="font_style_title"><a href="javascript:coalition('tbl4',myarrow4)"><img id="myarrow4" name="myarrow4" src="image/ico-1.gif" width="11" height="11" border="no"/></a>　定单管理</td>
              </tr>
            </table>
            <table width="96%" id="tbl4">
            	<tr>
            		<td>
            			<table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" id="tblOrder">
           					 <tr>
              					<td width="50" align="center"></td>
              					<td class="font_style_normal"><a href="<%=request.getContextPath() %>/findAllOrder.do" onclick="change_style(8)" target="mainFrame" class="menu_font_style">查看定单</a></td>
           					 </tr>
       				  </table>
    			  
            		</td>
            	</tr>
            </table>
          </td>
        </tr>
      </table>
	</td>
  </tr>
</table>
</body>
</html:html>
