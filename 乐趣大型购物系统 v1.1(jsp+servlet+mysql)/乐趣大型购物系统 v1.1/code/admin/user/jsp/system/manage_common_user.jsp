<%@ page contentType="text/html;charset=gb2312"%>
<%@ page errorPage="errorPage.jsp" session="true" %>
<%@ page import="java.util.*" %>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>新闻栏目维护</title>
<link rel="stylesheet" href="../../../../css/style.css" type="text/css">
<script language=javascript src="../../../../js/date.js"></script>
<SCRIPT language=JavaScript src="../../../../js/JSDateFunction.js"></SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function sub()
 {    
     document.form1.par.value="auditing";       
     document.form1.op.value="pass"; 
     document.form1.submit();
 }
 
function subdel()
 {
     if(confirm("是否确定删除所选新闻？"))
      {
         document.form1.par.value="auditing";       
         document.form1.op.value="del"; 
         document.form1.submit();
      }   
} 
function addsub()
 {    
     document.form1.par.value="add";  
     document.form1.submit();
 }
function query()
 {    
     document.form1.par.value="query";            
     document.form1.submit();
 } 
</script>
</head>
<%
       String par = request.getParameter("par");
       String aid = "hjx";//(String)session.getAttribute("aid");
       
       if(par!=null&&par.equals("add"))
        {
        
        }
        
       int curpage = request.getParameter("jumpPage")==null?1:Integer.parseInt(request.getParameter("jumpPage"));   
         
       //Vector m_vct = pageCtl.getcurData(mangeuser.getListUser(),10,curpage);  //取公告列表  //分页查询
       Vector m_vct =  mangeuser.getListUser();  //未分页
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
<IFRAME id=CalFrame style="DISPLAY: none; Z-INDEX: 100; WIDTH: 148px; POSITION: absolute; HEIGHT: 194px; left: 10px; top: 353px" 
			marginWidth=0 
			marginHeight=0 
			src="../../../../html/calendar.htm"
			frameBorder=0 
			noResize 
			scrolling=no>
</IFRAME> 
<SCRIPT event=onclick() for=document>
<!--
document.all.CalFrame.style.display="none";
//-->
</SCRIPT>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr valign=center > 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
                </tr>  
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
                    <td align=left height=25 valign=MIDDLE 
                         colspan=3><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;用户ID</font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">用户昵称</font></td>
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">Email</font></td>                        
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">注册日期</font></td> 
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">最后登录时间</font></td>                                            
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>状态</td>
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>
                    选择<input type="checkbox" name="allsel" value="all">
                    </td>
                  </tr>                  
                  
<%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
            Vector t_vct = (Vector)m_vct.get(i);
            String status = (String)t_vct.get(5);
            %>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE width="10%"
                        colspan=3><font color="#000000"><a href="#"><%=t_vct.get(1)%></a></font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        ><font color="#000000"><%=t_vct.get(2)%></font></td>
<td align=CENTER height=25 valign=MIDDLE 
                        width="15%"><font color="#000000"><%=t_vct.get(3)%></font></td>                        
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="15%"><font color="#000000"><%=t_vct.get(6)%></font></td>      
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="15%"><font color="#000000"><%=t_vct.get(4)==null?t_vct.get(6):t_vct.get(4)%></font></td>                                       
                    
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>&nbsp;
                   <%
                      if(status.equals("00"))
                       {
                          %>正常<%
                       }
                      else
                       {
                           %>注销<% 
                       } 
                   %>
                   </td>
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><input type="checkbox" name="id" value="<%=t_vct.get(0)%>"></td>
                  </tr>               
            <%
        }
    }
%>    


                
                  
                  
                  
                  <tr valign=center> 
                    <td align=center height=25 valign=middle COLSPAN="9">&nbsp;</td>
                  </tr>   

                                          <%
							if(pageCtl.getmaxPage()>1)
							{
					  %>
                  <tr valign=top> 
                    <td align=center height=16 valign="top" COLSPAN="9">
<table>					  
							<form name="PageForm"  action="manage_bulletin.jsp" method="post">
 						        <tr>
							<td colspan="9" width="100%" align="left" valign="top"> 
							<div align="center"><br>&nbsp;&nbsp;
							<%if(pageCtl.getcurPage()==1){ out.print(" 首页 上一页");   }else{  %>
							<A HREF="javascript:gotoPage(1)">首页</A>
							<A HREF="javascript:gotoPage(<%=pageCtl.getcurPage()-1%>)">上一页</A>
							<%}%>
							<%if(pageCtl.getcurPage()==pageCtl.getmaxPage()){ out.print("下一页 尾页");
							   }else{  %>   
							<A HREF="javascript:gotoPage(<%=pageCtl.getcurPage()+1%>)">下一页</A>
							<A HREF="javascript:gotoPage(<%=pageCtl.getmaxPage()%>)">尾页</A>
							<%}%>
							转到第<SELECT name="jumpPage" onchange="Jumping()">
							     <% for(int j=1;j<=pageCtl.getmaxPage();j++)  {
							     if (j== pageCtl.getcurPage()){
							     %>
							     <OPTION selected value=<%=j%>><%=j%></OPTION>
							     <%}else{%>
							     <OPTION value=<%=j%>><%=j%></OPTION>
							     <%}}%>   
							     </SELECT>页
						    </div>
						</td>
						</tr>
					</form> 
</td>
					 </table>                    
                    </td>
                  </tr> 
                   <tr valign=center> 
                    <td align=center height=25 valign=middle COLSPAN="9">&nbsp;</td>
                  </tr>  											  
					<%		}%>                   
                  
              </table>
              
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;<input type="button" name="button_1" value="批准" onclick="sub()">&nbsp;<input type="button" name="button_1" value="删除" onclick="subdel()">&nbsp;&nbsp;</p></td></tr> 
</table></td></tr>

                
                                        
</table>                  
</td>
</tr> 

<tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>
</form>
</body>
</html>
