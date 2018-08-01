<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*" %>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>新增商品维护</title>
<link rel="stylesheet" href="../../../../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function sub()
 {     
     
     document.form1.action="goods_images_2.jsp";
     document.form1.submit();
 }
</script>
</head>
<%       
       String aid = "test"; //session.getAttribute("aid").toString();
       String inc = request.getParameter("inc");        
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
</SCRIPT>
<form method="post" name="form1" encType=multipart/form-data method=post> 
<input type="hidden" name="inc" value="<%=inc%>">
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;<img src="../../../../image/upload/shop/2s10412803020.jpg" width="300" height="300"></FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;上传图片路径：</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;&nbsp;<input type="file" name="name" />&nbsp;&nbsp;</font></td>
                    <!--td align=left height=25 valign=MIDDLE 
                        colspan=1><font color="#000000">&nbsp;</font></td-->
                                          
                  </tr> 
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;上传图片简介：</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;
                        <textarea rows="6" cols="66" name="brief"></textarea></font></td>
                   
                                          
                  </tr>  
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" name="button_1" value="上传" onclick="sub()"></font></td>
             
                   
                                          
                  </tr>                                     
               </tbody>   
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>

</form>
</body>
</html>
