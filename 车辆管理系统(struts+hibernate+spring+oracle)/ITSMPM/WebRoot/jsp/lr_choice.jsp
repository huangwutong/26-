<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>My JSP 'YHadd.jsp' starting page</title>
	 <style type="text/css">
		body  {  margin:0px; font:normal 12px 宋体;background-color: #ABC4F5; }
		table  { border:0px; }
		td  { font:normal 12px 宋体; }
		img  { vertical-align:bottom; border:0px; }
		a  { font:normal 12px 宋体; color:#215DC6; text-decoration:none; }
		a:hover  { color:#428EFF }
		.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#D6DFF7; }
		.menu_title  { }
		.menu_title span  { position:relative; top:2px; left:8px; color:#215DC6; font-weight:bold; }
		.menu_title2  { }
		.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; }
</style>
	</head>
 
<script type="text/javascript">
function menuShow(obj,maxh,obj2)
{
  if(obj.style.pixelHeight<maxh)
  {
    obj.style.pixelHeight+=maxh/20;
    obj.filters.alpha.opacity+=5;
    obj2.background="../img/title_bg_hide.gif";
    if(obj.style.pixelHeight==maxh/10)
      obj.style.display='block';
    myObj=obj;
    myMaxh=maxh;
    myObj2=obj2;
    setTimeout('menuShow(myObj,myMaxh,myObj2)','5');
  }
}
function menuHide(obj,maxh,obj2)
{
  if(obj.style.pixelHeight>0)
  {
    if(obj.style.pixelHeight==maxh/20)
      obj.style.display='none';
    obj.style.pixelHeight-=maxh/20;
    obj.filters.alpha.opacity-=5;
    obj2.background="../img/title_bg_show.gif";
    myObj=obj;
    myMaxh=maxh
    myObj2=obj2;
    setTimeout('menuHide(myObj,myMaxh,myObj2)','5');
  }
  else
    if(whichContinue)
      whichContinue.click();
}
function menuChange(obj,maxh,obj2)
{
  if(obj.style.pixelHeight)
  {
    menuHide(obj,maxh,obj2);
    whichOpen='';
    whichcontinue='';
  }
  else
    if(whichOpen)
    {
      whichContinue=obj2;
      whichOpen.click();
    }
    else
    {
      menuShow(obj,maxh,obj2);
      whichOpen=obj2;
      whichContinue='';
    }
}
</script>
  
 <BODY leftMargin=0 topMargin=0 rightMargin=0>
   
<!--================================================================================-->
<div align="left">
 
  <table border="0" cellpadding="0" cellspacing="0" width="158" height="100%">
    <tr>
      <td width="100%" bgcolor="#ABC4F5" valign="top">
   
   <%int i=10; %>
   <s:iterator value="listmap" id="id" >
   <div align="center">
          <center>
          <table border="0" cellpadding="0" cellspacing="0" width="140">
            <tr style="cursor:pointer;">
              <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background=../img/title_bg_show.gif id=menuTitle<%=i %> onClick="menuChange(menu<%=i %>,160,menuTitle<%=i %>);">
              <span><s:property value="#id.key"/></span></td>
            </tr>
            <tr>
              <td width="156" height="2" valign="top">
                <div align="center" class=sec_menu style="width:140px;height:0px;filter:alpha(Opacity=0);display:none;" id=menu<%=i %>>
                  <table border="0" cellpadding="0" cellspacing="0" width="122">
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <s:iterator value="#id.value" >
                    <tr>
                      <td height="22"><A href=<s:property value="caction"/> target="MainFrame"  ><s:property value="cname"/></A></td>
                    </tr>
					 </s:iterator>
                    <tr>
                      <td height="10"></td>
                    </tr>
                  </table>
                </div>
              </td>
            </tr>
          </table>
          </center>
        </div>
        <%i++; %>
   </s:iterator>  
<script type="text/javascript">
  var whichOpen=menuTitle1;
  var whichContinue='';
</script>      
      </td>
    </tr>
  </table>
</div>
</BODY>
</html>
