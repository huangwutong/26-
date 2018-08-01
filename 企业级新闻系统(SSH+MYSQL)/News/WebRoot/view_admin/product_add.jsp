<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*,com.xh369.dto.ProductSmallClass,com.xh369.dto.ProductBigClass" %>
<%@ include file="/view_admin/inc/publictag.jsp" %>
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="fck" %>
<html>
<head>
  <title>product_add</title>
  <html:base/>
  <style>
  .prog-border {
  height: 15px;
  width: 205px;
  background: #fff;
  border: 1px solid #000;
  margin: 0;
  padding: 0;
  }
  .prog-bar {
  height: 11px;
  margin: 2px;
  padding: 0px;
  background: #178399;
  font-size: 9pt;
  }
  body{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 9pt;
  }
  </style>
  <LINK href="/News/css/css.css" rel="stylesheet" type="text/css">
</head>
 <script src="/News/view_admin/js/prototype.js" language="JavaScript" type="text/javascript"></script>
  <script type="text/javascript" language="JavaScript">
  //以下属于客户端请求处理
  var updater = null;
  function startStatusCheck(){
    //设置上传按钮为不可用状态,避免多次提交
    $('submitButton').disabled = true;
    //创建周期性发送请求的Ajax对象
    updater = new Ajax.PeriodicalUpdater('status',
								                            '/News/upload',
                                							{asynchronous:true, frequency:1, method: 'get', parameters: 'c=status', onFailure: reportError}
                                						   );
    return true;
  }
  //出错时处理方法
  function reportError(request){
    $('submitButton').disabled = false;
    $('status').innerHTML = '<div class="error"><b>上传文件时出现错误,请重试!!!</b></div>';
  }
  //上传完毕后,取消周期性获取进度状态,将最终的状态显示在客户端
  function killUpdate(message){
    $('submitButton').disabled = false;
    //停止刷新获取进度
    updater.stop();
    if(message != ''){//如果有错误信息,则显示出来
      $('status').innerHTML = '<div class="error"><b>上传文件时出现错误: ' + message + '</b></div>';
    }else{//如果没有错误信息
      //获取上传文件的完成状态,显示到客户端
      new Ajax.Updater('status',
				                 '/News/upload',
			                     {asynchronous:true, method: 'get', parameters: 'c=status', onFailure: reportError}
			                    );
    }
  }
 var onecount;
 subcat = new Array();
 <%
   int count = 0;
   List list = (ArrayList) request.getAttribute("aList");
   //遍历所有小类
   for(int i = 0; i < list.size(); i++){
     ProductBigClass productBigClass = (ProductBigClass) list.get(i);
     Iterator it = productBigClass.getProductsmallclass().iterator();
     ProductSmallClass productSmallClass = null;
     while(it.hasNext()){
       productSmallClass = (ProductSmallClass) it.next();
       pageContext.setAttribute("productSmallClass", productSmallClass);
 %>
       //数组(小类ID值、小类中大类的外键值、小类名)
       subcat[<%= count%>] = new Array("<%=productSmallClass.getId()%>", "<%=productSmallClass.getProductbigclass().getId()%>", "<%=productSmallClass.getSmallclassname()%>");
 <%
       count += 1;
     }
   }
 %>
 //共有多少个小类
 onecount = <%= count%>;
 function changelocation(locationid){
   var locationid = locationid;
   var j;
   for(j = 0; j < onecount; j++){
     if(subcat[j][1] == locationid){
       //当第一次循环时，document.myform.SmallClassName.length为1，第二次则自动取值得到列表框的组数，注意不要忘记“不指定小类”是0
       document.forms[0].smallclassid.options[document.forms[0].smallclassid.length] = new Option(subcat[j][2], subcat[j][0]);
     }
   }
 }
</script>
<body bgcolor="#d4d0c8">
  <table class="tableBorder" width="90%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#183789">
     <tr>
       <td background="images/admin_bg_1.gif"><div align="center">产品添加</div></td>
     </tr>
     <tr bgcolor="#FFFFFF">
      <td align="left" height="22">
      	<iframe id='target_upload' name='target_upload' src='' style='display: none'></iframe>
        <form enctype="multipart/form-data" method="post" action="/News/upload" onsubmit="return startStatusCheck();" target="target_upload">
          &nbsp;产品名称：<input type="text" name="productname"><br>
          &nbsp;产品类别：<SELECT name="bigclassid" onchange="changelocation(document.forms[0].bigclassid.options[document.forms[0].bigclassid.selectedIndex].value)">
          								<c:forEach items="${aList}" var="productBigClass" varStatus="statusCount">
                         					<c:if test="${statusCount.count == 1}">
					                           <c:set scope="page" var="smallclass" value="${productBigClass.productsmallclass}"></c:set>
                    					    </c:if>
		          								<OPTION value="${productBigClass.id}">${productBigClass.bigclassname}</OPTION>
        	  							</c:forEach>
            						 </SELECT>
            						 <SELECT name="smallclassid">
          								<c:forEach items="${smallclass}" var="SmallClass">
		          							<OPTION value="${SmallClass.id}">${SmallClass.smallclassname}</OPTION>
        	  							</c:forEach>
            						 </SELECT>
            						 <br>
		  &nbsp;产品预览：<input type="file" name="productpic"><br>
		<!-- 这里显示进度条 -->
		  <div id="status"></div><br>
		  &nbsp;生产厂家：<input type="text" name="producefactory"><br>
		  &nbsp;产品型号：<input type="text" name="productmodel"><br>
		  &nbsp;市场价格：<input type="text" name="marketprice" value=""><br>
		  &nbsp;优惠价格：<input type="text" name="preferentialprice" value=""><br>
		  &nbsp;推　　荐：<INPUT type="checkbox" name="vouch" value="true">&nbsp;&nbsp;新　　品：<INPUT type="checkbox" name="newproduct" value="true"><br>
		  <TABLE>
		  	<tr>
              <td valign="middle" align="right">简介：</td>
              <td>
                <fck:editor
                  id="introduct"
                  basePath="/News/"
                  height="350"
                  width="650"
                  skinPath="/News/editor/skins/default/"
                  toolbarSet="Default"
                  imageBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
                  linkBrowserURL="/News/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
                  flashBrowserURL="/News/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
                  imageUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Image"
                  linkUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=File"
                  flashUploadURL="/News/editor/filemanager/upload/simpleuploader?Type=Flash">
                </fck:editor>
              </td>
            </tr>
		  </TABLE>
        <div align="center">
        <input type="submit" name="submitButton" value="提交" style="btn"/>&nbsp;<input type="reset" value="取消" style="btn"/>
        </div>
      <form>
    </td>
  </tr>
 </table>
</body>
</html>
