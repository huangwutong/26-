<%@ page language="java" contentType="text/html;charset=GB2312"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/product.tld" prefix="product" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
   <head>
   	<script language="javascript">
   		<!--
   		function save(){
   			document.bookmaForm.action="<%=request.getContextPath()%>/bookma.do?method=updbooksave";
   			document.bookmaForm.submit();	
   		}
   		function del(){
   			document.bookmaForm.action="<%=request.getContextPath()%>/bookma.do?method=delbook";
   			document.bookmaForm.submit();	
   		}
   		function pdqx(){

    	  var lxid = document.all("fileobj.filelx").value;
    		var murl="<%=request.getContextPath()%>/pubmodule/officerc.do?method=pdyhfilelxbxqx&id=" + lxid;
    		var str = httpGet(murl);
        if(str!="true"){
        	alert("�㵱ǰǩ����ɫû��Ȩ�ޱ�д�������ļ���");
        	return false;
        }
        else
        	return true;
     }
    function httpGet(murl){	
    		var context="";
    		try{
    			var xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    			xmlhttp.open("post", murl, false);
    			xmlhttp.send();
    			context = xmlhttp.responseText;
    			return context
    		}catch(ee){
    			alert("����" + ee)
    		}
    	}	
   		-->
   		</script>
   	  <link rel="stylesheet" href="<%=request.getContextPath()%>\css\laodong.css" type="text/css">
   </head>
   <body>
   	<html:form action="/bookma.do?method=updbzfile">
   		<div style="LINE-HEIGHT: 29px;" align=center><font size=2>�޸��鱾��Ϣ</font><div>
   	 <html:hidden property="bookinfoobj.id"/>
   	 <table width="90%" align="center" cellpadding="1" cellspacing="1" class="tab-1" border="0">
       <tr class="tab-5">
          <td align="right" class="tab-3" width="10%">���</td>  <td>
          	<c:out value="${bookmaForm.bookinfoobj.id}"/>
          		 </td>
       </tr>
       <tr class="tab-5">
          <td align="right" class="tab-3">����</td>  <td><html:text property="bookinfoobj.name"/></td>
       </tr>
       <tr class="tab-5"> 	
   	 	 	 	<td align="center" colspan="2">
   	 	 	 		<input type="button" value="����" onclick="save()">
   	 	 	 		<input type="button" value="ɾ��" onclick="del()"></td>
   	 	 </tr>
     </table> 
     	</html:form> 	
   </body>
<html>