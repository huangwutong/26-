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
<script language="javascript" src="../../js/shop.js"></script>
<script language="javascript" src="../../../../js/JsInclude.js"></script>
<script language="javascript">
function sub()
 {
    if(recommand())
    {        
        document.form1.par.value="query";     
        document.form1.submit();        
    }    
 }
//tuijianshangping 
function recom()
 {
    document.form1.par.value="recommand";
    document.form1.submit();
 } 
</script>
<script language="javascript">
var arrayboardID=new Array();
var arrayboardName=new Array();
var arrayboardParentID=new Array();
<%
Vector type_vct = manageclass.getShopAllSubClass();
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
	   setBoard(document.form1.parentid.value);
}
function setBoard(parentid)
{
	
/**
*@设置二级拦目
*/		
document.form1.catalog_id.options.length=0;
var count=0;
document.form1.catalog_id.add(document.createElement('OPTION'));
document.form1.catalog_id.options[count].text="请选择子类";
document.form1.catalog_id.options[count].value="all";
count++; 
if(parentid!="all"){
	for(var i=0; i<arrayboardParentID.length; ++i)
	{
	    if(arrayboardParentID[i]==parentid)
	    {
	         document.form1.catalog_id.add(document.createElement('OPTION'));
	         document.form1.catalog_id.options[count].text=arrayboardName[i];
	         document.form1.catalog_id.options[count].value=arrayboardID[i];
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
       String aid = session.getAttribute("aid").toString();
       String manufacturer = managegoods.getManufacturer()==null?"":managegoods.getManufacturer();
       String name = managegoods.getName()==null?"":managegoods.getName();
       String parentid = managegoods.getParentid()==null?"all":managegoods.getParentid();
       String catalog_id = managegoods.getCatalog_id()==null?"all":managegoods.getCatalog_id();
       Vector m_vct =null;
       Vector com_vct = null;
       Vector com1_vct = null;
       if(par!=null&&par.equals("recommand"))
        {
           ManageCommandGoods.updateRecommand();
           com_vct = ManageCommandGoods.getCommandGoodsSList("03");//精品推荐
           com1_vct = ManageCommandGoods.getCommandGoodsSList("04");//特价商品
           m_vct = ManageCommandGoods.getGoodSList(); //取一级分类商品列表               
        }
       if(par!=null&&par.equals("query"))
        {
           com_vct = ManageCommandGoods.getCommandGoodsSList("03");//精品推荐
           com1_vct = ManageCommandGoods.getCommandGoodsSList("04");//精品推荐
           m_vct = ManageCommandGoods.getGoodSList(); //取一级分类商品列表            
        }
         
               
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
</SCRIPT>
<form name="form1" method="post"> 
<input type="hidden" name="par">
<!--input type="hidden" name="id"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 BGCOLOR="#D0ECF9">
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        商品名称：
                        </font>
                        </td>                                          
                    <td align=left height=25 valign=MIDDLE width="10%">
                    &nbsp;&nbsp;<font color="#000000">
                    <input type="text" name="name"></name>
                    </font>
                    </td>                        
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1 BGCOLOR="#D0ECF9">
                   厂商
                   </td>     
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>
                    <input type="text" name="manufacturer"></name>
                    </td>
                  </tr>  
                  
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 BGCOLOR="#D0ECF9">
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        商品类型：
                        </font>
                        </td>                                          
                    <td align=left height=25 valign=MIDDLE width="10%" colspan=2>
                    &nbsp;&nbsp;<font color="#000000">
                        <select name="parentid" onChange=changeBoardParent()>
                        <option value="all">请选择大类</option>
<%
   Vector shop_class = manageclass.getShopClass();
    if(shop_class!=null && shop_class.size()>0)
     {
          for(int i=0;i<shop_class.size();i++)
           {
             Vector t_vct = (Vector)shop_class.get(i);
             %>
              <option value="<%=t_vct.get(0)%>"><%=t_vct.get(1)%></option>
             <% 
           }
     }
%> 
                        </select>
                        <select name="catalog_id">
                        <option value="all">请选择子类</option>
                        </select>
                    </font>
                    </td> 
                         <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 >
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" name="button_1" value="查询" onclick="sub()">
                        </font>
                        </td>                      
                  </tr>                    
                </tbody>                     
              </table>
              </td>
              </tr> 
</table></td></tr> 

<tr>
<td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td>
</tr> 
</table>
<br>
<!--table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr>
<td align="left" valign="top" background="../../../image/line_hor.jpg" height="1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4"><b><a href="goods_add.jsp">新增商品</a></b></font>
</td>
</tr> 
</table-->
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;精品推荐</FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;编号</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;商品名称</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>类型</td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;推荐类型</font></td>                                            
                   
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>删除</td>
                  </tr>                      
                  
   <%
   if(com_vct!=null&&com_vct.size()>0)
    {
       for(int i=0;i<com_vct.size();i++)
        {         
           Vector t_vct = (Vector)com_vct.get(i);
           %>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(0)%></font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><%=t_vct.get(2)%>--><%=t_vct.get(3)%></td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;精品推荐</font></td>                                            
                 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3><input type="checkbox" name="recomid1" value="<%=t_vct.get(0)%>" >删除</input></td>
                  </tr>            
           <%
        }
    }

%>           
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table>
</td>
</tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;特价商品</FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;编号</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;商品名称</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>类型</td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;推荐类型</font></td>                                            
                   
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>删除</td>
                  </tr>                      
                  
   <%
   if(com1_vct!=null&&com1_vct.size()>0)
    {
       for(int i=0;i<com1_vct.size();i++)
        {         
           Vector t_vct = (Vector)com1_vct.get(i);
           %>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(0)%></font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><%=t_vct.get(2)%>--><%=t_vct.get(3)%></td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;特价推荐</font></td>                                            
                    
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3><input type="checkbox" name="recomid1" value="<%=t_vct.get(0)%>" >删除</input></td>
                  </tr>            
           <%
        }
    }

%>           
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table>
</td>
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
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;编号</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;商品名称</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>类型</td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;推荐类型</font></td>                                            
                   
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>推荐</td>
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
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(0)%></font></td>
 <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td>                     
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font coloER valign=MIDDLE colspan=1><%=t_vct.get(2)%>--><%=t_vct.get(3)%></td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1>
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="type">
                        <option value="03">精品推荐</option>
                        <option value="04">特价商品</option>
                        </select>
                        </font>
                        </td>    
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>
                    <input type="checkbox" name="recomid" value="<%=t_vct.get(0)%>">推荐</input>
                    </td>
                  </tr>            
           <%
        }
    }

%>           
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" value="推荐" onclick="recom()"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table>
</td>
</tr> 
<tr> 
<td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td>
</tr> 
</table>

</form>

<script language="javascript">
document.form1.name.value='<%=name%>';
document.form1.manufacturer.value='<%=manufacturer%>';
document.form1.parentid.value='<%=parentid%>';
changeBoardParent();
document.form1.catalog_id.value='<%=catalog_id%>';
</script>
</body>
</html>
