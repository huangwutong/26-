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
          managebulletin.addBulletin(aid);
        }
        
       int curpage = request.getParameter("jumpPage")==null?1:Integer.parseInt(request.getParameter("jumpPage"));   
         
       Vector m_vct = pageCtl.getcurData(managebulletin.getListBulletin(),10,curpage);  //取公告列表
        
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
<!--tr>
<td align="left" valign="middle" height="2">
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                  <tr valign=center>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">名    称：</FONT></B></td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" width="25%">                  
                  <FONT SIZE="2">
                  <input type="text" name="name">
                  </FONT>
                  </td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">状    态：</FONT></B></td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" width="25%">
                  <FONT SIZE="2">
                  <select name="status">
                  <option value="10">初始</option>
                  <option value="all">不限</option>                  
                  <option value="00">已发布</option>
                  </select>
                  </FONT>
                  </td>
                </tr>       
                
                <tr valign=center>
                  <td align=center height=25 valign=MIDDLE COLSPAN="4" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2"><input type="button" value="查 询" onclick="query()"></input></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></td>
                </tr>                                            
</table>                  
</td>
</tr--> 
<tr valign=center > 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
                </tr>  
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
                         colspan=3><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;公告标题</font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">发布人</font></td>
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">有效日期</font></td>                   
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
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000"><a href="#"><%=t_vct.get(1)%></a></font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000"><%=t_vct.get(2)%></font></td>
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="20%"><font color="#000000"><%=t_vct.get(3)%>至<%=t_vct.get(4)%></font></td>                   
                    
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>&nbsp;
                   <%
                      if(status.equals("00"))
                       {
                          %>已发布<%
                       }
                      else
                       {
                           %>未发布<% 
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
<form name="form1" method="post"> 
<input type="hidden" name="par">
<input type="hidden" name="op"><!--操作---> 
<tr>
<td align="left" valign="middle" height="2">&nbsp;</td>
</tr> 
<tr>
<td align="left" valign="middle" height="2">&nbsp;</td>
</tr> 
<tr>
<td align="left" valign="middle" height="2">
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                  <tr valign=center>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">公告标题：</FONT></B></td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" width="25%">                  
                  <FONT SIZE="2">
                  <input type="text" name="title">
                  </FONT>
                  </td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">状    态：</FONT></B></td>
                  <td align=left height=25 valign=MIDDLE COLSPAN="" width="25%">&nbsp;&nbsp;
                  <FONT SIZE="2">
                  <select name="status">
                  <option value="00">已发布</option>
                  <option value="10">未发始</option>
                  </select>
                  </FONT>
                  </td>
                </tr>  
                  <tr valign=center>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="1" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">有 效 期：</FONT></B></td>
                  <td align=left height=25 valign=MIDDLE COLSPAN="3" width="25%">&nbsp;&nbsp;                   
                  <FONT SIZE="2">
                  <input type="text" name="low_valid_date"> 
                   <A  onclick=event.cancelBubble=true;  href="javascript:ShowCalendar(document.form1.dimg3,document.form1.low_valid_date,null,0,330)"> 
                    <img id=dimg3 src="../../../../image/public/images/button.gif" width="34" height="21" align="middle" border=0> 
                    </A>
                  
                  至 <input type="text" name="hight_valid_date">
                  <A  onclick=event.cancelBubble=true;  href="javascript:ShowCalendar(document.form1.dimg4,document.form1.hight_valid_date,null,0,330)"> 
                    <img id=dimg4 src="../../../../image/public/images/button.gif" width="34" height="21" align="middle" border=0> 
                    </A>
                  </FONT>
                  </td>                  
                </tr>                 
                  <tr valign=center>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">公告内容：</FONT></B></td>
                  <td align=left height=25 valign=MIDDLE width="25%" colspan="3">&nbsp;&nbsp;                  
                  <FONT SIZE="2">
                  <textarea name="content" cols="65" rows="20" maxlength="4000" maxchar=4000></textarea>
                  </FONT>
                  </td>
                  
                </tr>                     
                
                <tr valign=center>
                  <td align=center height=25 valign=MIDDLE COLSPAN="4" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2"><input type="button" value="添 加" onclick="addsub()"></input></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></td>
                </tr>                                            
</table>                  
</td>
</tr> 

<tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>
</form>
</body>
</html>
