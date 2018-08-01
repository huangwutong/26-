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
function sub()
 {
     
     document.form1.par.value="update";     
     document.form1.submit();
 }
</script>
</head>
<%
       String par = request.getParameter("par");
       String aid = "test"; //session.getAttribute("aid").toString();
       if(par!=null&&par.equals("update"))
        {
            manageclass.updateClassSort();
        }
       Vector m_vct = manageclass.getShopClass(); //取一级分类
        
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
</SCRIPT>
<form name="form1" method="post"> 
<input type="hidden" name="par">
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 
<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="50%" colspan=3><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;栏目名称</font></td>
                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">顺序</font></td>                        
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>修改</td>     
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>删除</td>
                  </tr>                  
                  
<%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
                 Vector t_vct = (Vector)m_vct.get(i);
                 %>
                 <input type="hidden" name="id" value="<%=t_vct.get(0)%>">
                  <tr valign=center BGCOLOR="#D0ECF9"> 
                    <td align=left height=25 valign=MIDDLE width="50%" colspan=3 ><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td>
                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%" ><font color="#000000"><input type="text" name="sort" value="<%=t_vct.get(2)%>" size=4></input></font></td>                        
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1 >修改</td>     
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3 >删除</td>
                  </tr>  
                 <%
                Vector subclass_vct =  manageclass.getShopSubClass(t_vct.get(0).toString());
                if(subclass_vct!=null&&subclass_vct.size()>0)
                 {
                  
                    for(int j=0;j<subclass_vct.size();j++)
                     {
                        Vector t1_vct = (Vector)subclass_vct.get(j);
                        %>
                        <input type="hidden" name="id" value="<%=t1_vct.get(0)%>">
                        <tr valign=center> 
                        <td align=left height=25 valign=MIDDLE width="50%" colspan=3 ><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t1_vct.get(1)%></font></td>                                          
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000"><input type="text" name="sort" value="<%=t1_vct.get(2)%>" size=4></input></font></td>                        
                        <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>修改</td>     
                        <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>删除</td>
                        </tr>                         
                        <%
                     }   
                 } 
        }
    }
%>                    
                  
                  
                  
                  <tr valign=center> 
                    <td align=center height=25 valign=middle COLSPAN="8">&nbsp;<input type="button" name="button_1" value="更新" onclick="sub()"></td>
                  </tr>                   
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table></form>
</body>
</html>
