<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*" %>
<%@ include file="../include/config.jsp"%>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>新闻栏目维护</title>
<link rel="stylesheet" href="../../../../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function sub(str)
 {
    
     document.form1.id.value=str;
     document.form1.par.value="get";   
     document.form1.submit();
 }
</script>

</head>
<%
       String par = request.getParameter("par");
       String aid = session.getAttribute("aid").toString();
       Vector m_vct = ManageOrder.getOrderGetList(aid); 
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">

<form name="form1" method="post"> 
<input type="hidden" name="par">
<input type="hidden" name="id">
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="9"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=center height=25 valign=MIDDLE 
                        width="10%" colspan=1><font color="#000000">订单编号</font></td>
                    <td align=center height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;商品名称</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>预定人姓名</td> 
                     <td align=center height=25 valign=MIDDLE 
                        width="10%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;手机</font></td>                                            
                    <td align=CENTER height=25 valign=MIDDLE                                                                     
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;联系电话</font></td>                                            
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">总价格</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>操作</td>   
                  </tr>                      
                  
   <%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           %>
                  <tr valign=center> 
                    <td align=center height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;<a href="orderdetail.jsp?id=<%=t_vct.get(0)%>" target="_blank"><%=t_vct.get(0)%></a></font></td>
                    <td align=center height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;<%=t_vct.get(2)%></font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><%=t_vct.get(3)%></td>   
 <td align=center height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(4)%></font></td>                                                                                                              
                    <td align=center height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(5)%></font></td>                                            
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000"><%=t_vct.get(7)%></font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3><a href="procc_order.jsp?id=<%=t_vct.get(0)%>" target="_blank">处理</a></td>                    
                  </tr>            
           <%
        }
    }

%>           
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>

</form>
</body>
</html>
