<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ include file="include/config.jsp"%>
<%@include file="include/bean.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<title>欢迎来到乐趣工作室!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>
<%
  if(session.getAttribute("id") == null || session.getAttribute("id") == "")
   {        
          response.sendRedirect("../user/login.jsp?nextpage=../myshop/orderlist.jsp");  
   }   

 String userid = (String)session.getAttribute("id"); 
%>
<body leftmargin="0">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td width="150"><img src="images/logo.gif" width="150" height="42"></td>
          <td width="500"> <div align="center"><img src="images/bannar.gif" width="458" height="60"></div></td>
          <td width="110"><table width="110" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
  <tr> 
    <td height="22" valign="middle" bgcolor="#FCCB05"> 
    <div align="center">
<%@include file="include/board1.jsp"%>    
        </div>
        </td>
  </tr>
  <tr> 
    <td height="17" bgcolor="#FC9803">&nbsp;</td>
  </tr>
  <tr> 
    <td height="10"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20" align="center" bgcolor="#FFCC00"><font size="2">个人订单管理</font></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
      
        <tr> 
          <td> <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
              <tr bgcolor="#FFFBEC"> 
                <td width="20%" height="25"> <div align="center"><font size="2">订单编号</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">产品名称</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">订单总金额</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">订单状态</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">删除</font></div></td>
              </tr>
<%
   //System.out.println(order.getOrderList(userid));
    m_vct = order.getOrderList(userid);
  // m_vct = pageCtl.getcurData(order.getOrderList(userid),3,1);
    
    if(m_vct!=null&&m_vct.size()>0)
     {
         for(int i=0;i<m_vct.size();i++)
          {  
             Vector t_vct = (Vector)m_vct.get(i);
             String status = (String)t_vct.get(6);
               %>
                  <tr> 
                   <td width="20%" height="25"> <div align="center"><a href="orderdetail1.jsp?ordernum=<%=t_vct.get(0)%>" target="_blank"><%=t_vct.get(0)%></a></div></td>
                   <td width="20%" height="25"> <div align="center"><font size="2"><%=t_vct.get(1)%></font></div></td>
                   <td width="20%" height="25"> <div align="center"><font size="2"><%=t_vct.get(4)%></font></div></td>
                   <td width="20%" height="25"> <div align="center">
                   <font size="2">
                   <%
                      if(status!=null&&status.equals("01"))
                       {
                          %>
                          已发货
                          <%
                       }
                      else
                       {
                          %>
                          <%=t_vct.get(5)%>
                          <%
                       } 
                   %>
                   </font></div></td>
                   <td width="20%" height="25"> <div align="center"><font size="2">删除</font></div></td>
                  </tr>        
               <%
          }  
     }
    
%>                

            </table></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
      </table> </td>
  </tr>
  <tr> 
    <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 合作伙伴</font></td>
  </tr>
  <tr> 
    <td height="60" bgcolor="#FFFBEC"> <table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
        </tr>
        <tr> 
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="10"><hr size="1"></td>
  </tr>
  <tr> 
    <td height="10"><div align="center"><font size="2">公司简介 | 公司简介 | 公司简介 | 公司简介 
        | 公司简介 | 公司简介 | 公司简介 | 公司简介 </font></div></td>
  </tr>
  <tr> 
    <td height="30"> <div align="center"><font size="2">Copyright &copy;乐趣工作室2rich.net 
        客户服务中心信箱：2rich@2rich.net </font></div></td>
  </tr>
</table>
</body>
</html>
