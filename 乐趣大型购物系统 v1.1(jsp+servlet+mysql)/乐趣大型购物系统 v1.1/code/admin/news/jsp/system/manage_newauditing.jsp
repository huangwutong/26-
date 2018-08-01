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
function query()
 {    
     document.form1.par.value="query";            
     document.form1.submit();
 } 
</script>

<script language="javascript">
var arrayboardID=new Array();
var arrayboardName=new Array();
var arrayboardParentID=new Array();
<%
Vector type_vct = manageclass.getAllType();
for(int i=0; i<type_vct.size(); i++)
{
    Vector atype_vct =(Vector)type_vct.get(i);
    %>
    arrayboardID[<%=i%>]=<%=atype_vct.get(0)%>; arrayboardName[<%=i%>]='<%=atype_vct.get(1)%>'; arrayboardParentID[<%=i%>]='<%=atype_vct.get(2)%>';
    <%
}
%>
function changeBoardParent()
{
/**
*@设置一级拦目
*/	   
	   setBoard(document.form1.new_type.value);
}
function setBoard(province)
{
	
/**
*@设置二级拦目
*/		
document.form1.new_sub_type.options.length=0;
var count=0;
document.form1.new_sub_type.add(document.createElement('OPTION'));
document.form1.new_sub_type.options[count].text="不限";
document.form1.new_sub_type.options[count].value="all";
count++; 
if(province!="all"){
	for(var i=0; i<arrayboardParentID.length; ++i)
	{
	    if(arrayboardParentID[i]==province)
	    {
	         document.form1.new_sub_type.add(document.createElement('OPTION'));
	         document.form1.new_sub_type.options[count].text=arrayboardName[i];
	         document.form1.new_sub_type.options[count].value=arrayboardID[i];
	         count++;
	    }
	}
    }   
}
//-->
</script>
</head>
<%
       String par = request.getParameter("par");
       
       if(par!=null&&par.equals("auditing"))
        {
            manageauditing.updateNewSta();
        }
        
       int curpage = request.getParameter("jumpPage")==null?1:Integer.parseInt(request.getParameter("jumpPage"));   
       //out.println(manageauditing.getNewList());  
       //Vector m_vct = pageCtl.getcurData(manageauditing.getNewList(),20,curpage);  //取新闻列表 
       Vector m_vct =manageauditing.getNewList();  //取新闻列表 
       // out.println(m_vct.toString());  
        
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
<form name="form1" method="post"> 
<input type="hidden" name="par">
<input type="hidden" name="op"><!--操作--->
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr>
<td align="left" valign="middle" height="2">
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                  <tr valign=center>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">名&nbsp;&nbsp;&nbsp;&nbsp;称：</FONT></B></td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" width="25%">                  
                  <FONT SIZE="2">
                  <input type="text" name="name">
                  </FONT>
                  </td>
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">状&nbsp;&nbsp;&nbsp;&nbsp;态：</FONT></B></td>
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
                  <td align=center height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">发布时间：</FONT></B></td>
                  <td align=left height=25 valign=MIDDLE COLSPAN="3" width="25%">&nbsp;&nbsp;                 
                  <FONT SIZE="2">
                  <input type="text" name="start_date"> 
                   <A  onclick=event.cancelBubble=true;  href="javascript:ShowCalendar(document.form1.dimg3,document.form1.start_date,null,0,330)"> 
                    <img id=dimg3 src="../../../../image/public/images/button.gif" width="34" height="21" align="middle" border=0> 
                    </A>
                  
                  至 <input type="text" name="end_date">
                   <A  onclick=event.cancelBubble=true;  href="javascript:ShowCalendar(document.form1.dimg4,document.form1.end_date,null,0,330)"> 
                    <img id=dimg4 src="../../../../image/public/images/button.gif" width="34" height="21" align="middle" border=0> 
                    </A>                  
                  </FONT>
                  </td>
                </tr> 
                
                  <tr valign=center>
                  <td align=center height=25 valign=MIDDLE COLSPAN="" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2">所属栏目：</FONT></B></td>
                  <td align=left height=25 valign=MIDDLE COLSPAN="3" width="25%">&nbsp;&nbsp;                 
                  <FONT SIZE="2">
                  <select name=new_type onChange=changeBoardParent()>               
                  <option value="all">不限</option>
<%
   Vector new_type = manageclass.getNewClass();
    if(new_type!=null && new_type.size()>0)
     {
          for(int i=0;i<new_type.size();i++)
           {
             Vector t_vct = (Vector)new_type.get(i);
             %>
              <option value="<%=t_vct.get(0)%>"><%=t_vct.get(1)%></option>
             <% 
           }
     }
%>                  
                  </select>
                  <select name=new_sub_type>               
                  <option value="all">不限</option>
                  </select>
                  </FONT>
                  </td>
                </tr>                 
                    
                
                <tr valign=center>
                  <td align=center height=25 valign=MIDDLE COLSPAN="4" BGCOLOR="#D0ECF9" width="25%"><B><FONT SIZE="2"><input type="button" value="查 询" onclick="query()"></input></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B></td>
                </tr>                                            
</table>                  
</td>
</tr> 
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
                        width="25%" colspan=3><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;新闻名称</font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="25%"><font color="#000000">所属栏目</font></td>
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">顺序</font></td>
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>作者</td>     
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>状态</td>
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>选择</td>
                  </tr>                  
                  
<%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
            Vector t_vct = (Vector)m_vct.get(i);
            %>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="25%" colspan=3><font color="#000000"><a href="#"><%=t_vct.get(1)%></a></font></td>                                          
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="25%"><font color="#000000"><%=t_vct.get(7)%>--><%=t_vct.get(9)%></font></td>
                        <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000"><input type="text" name="sort" value="<%=t_vct.get(3)%>" size="4"></font></td>
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><%=t_vct.get(2)%></td>     
                    
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>&nbsp;
                   <%
                   
                        if(t_vct.get(5).equals("00"))
                         {
                           %>
                             已发布
                           <%
                         }
                        if(t_vct.get(5).equals("10"))
                         {
                           %>
                             初始
                           <%
                         }                         
                        if(t_vct.get(5).equals("20"))
                         {
                           %>
                             已删除
                           <%
                         }                                                  
                         
                   %>                   
                   </td>
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><input type="checkbox" name="id" value="<%=t_vct.get(0)%>"></td>
                  </tr>               
            <%
        }
    }

%>                    
                  
 </form>                 
                  
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
							<form name="PageForm"  action="manage_newauditing.jsp" method="post">
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
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>
</body>
</html>
