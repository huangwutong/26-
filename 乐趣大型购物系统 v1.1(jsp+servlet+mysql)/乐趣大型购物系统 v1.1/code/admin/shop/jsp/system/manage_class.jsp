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
     if(document.form1.button_1.value=="新增")
      {
        document.form1.par.value="add";
      }  
     document.form1.submit();
 }
</script>
</head>
<%
       String par = request.getParameter("par");
       String aid = "test"; //session.getAttribute("aid").toString();
       if(par!=null&&par.equals("add"))
        {
            manageclass.addClass(aid);
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
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="7"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
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
                  <tr valign=center BGCOLOR="#D0ECF9"> 
                    <td align=left height=25 valign=MIDDLE width="50%" colspan=3 ><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td>
                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%" ><font color="#000000"><%=t_vct.get(2)%></font></td>                        
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
                        <tr valign=center> 
                        <td align=left height=25 valign=MIDDLE width="50%" colspan=3 ><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t1_vct.get(1)%></font></td>                                          
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000"><%=t1_vct.get(2)%></font></td>                        
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
                    <td align=center height=25 valign=middle COLSPAN="7">&nbsp;</td>
                  </tr>                  
                  
                  
                  <tr valign=center> 
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="13%"><font color="#000000">栏目名称：</font></td>                        
                    <td align=left height=25 valign=MIDDLE 
                        width="20%"><font color="#000000">&nbsp;<INPUT 
            NAME=name STYLE="width:110;background-color: #ffffff; FONT-SIZE: 12px;  border: 1 solid #000000" MAXLENGTH=10></font></td>                        

               <td align=CENTER height=25 valign=MIDDLE 
                        width="20%"><font color="#000000">所属栏目：</font></td>
                     <td align=left height=25 valign=MIDDLE colspan="2">
                     <font color="#000000">&nbsp;
                     <select name=parentid>
                     <option value="0">一级栏目</option>
<%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
                 Vector t_vct = (Vector)m_vct.get(i);
                 %>
                     <option value="<%=t_vct.get(0)%>"><%=t_vct.get(1)%></option>
                 <%
        }
    }
%>                     
                     </select>
                     </font></td>                         

                    <td align=CENTER height=25 valign=MIDDLE colspan="2">
                    &nbsp;<input type="button" name="button_1" value="新增" onclick="sub()">
                    </td>
                  </tr>                  
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table></form>
</body>
</html>
