<%@ page contentType="text/html;charset=GB2312"%>
<%@ include file="include/config.jsp"%>
<%@include file="include/control.jsp"%>
<% request.setCharacterEncoding("gb2312"); %>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<title>新闻发布----乐趣工作室</title>
<script language="JavaScript">  
function sub()
 {
     document.issueform.par.value="addnews";
     document.issueform.action="issueout.jsp"
     document.issueform.submit();
 }  
</script>
</head>
<% 
      boardParentID = request.getParameter("boardParentID");
      boardID = request.getParameter("boardID");   
      par = request.getParameter("par");
      if(boardParentID!=null&&!boardParentID.equals(""))
       {
          position = news.getPosition(boardID,boardParentID);
           if(par!=null&&!par.equals("")&&!par.equals("null"))
           {
              issuance.createNews(inc,boardID,boardParentID);
           }
       }
      
      m_vct = news.getBanner(); 
      
      
%>
<body bgcolor="#FFF9E6" leftmargin="0" topmargin="0">
<table width="770" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bgcolor="#FFFFFF" bordercolordark="#FFF9E6">
  <tr> 
    <td valign="top">
<table width="770" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="80"><img src="images/tou.jpg" width="770" height="80"></td>
        </tr>
        <tr> 
          <td><table width="770" border="0" cellspacing="0" cellpadding="0">
              <tr bgcolor="#838383"> 
                <td width="755" height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
              </tr>
              <tr> 
                <td height="25" background="images/topbg1.gif"> <div align="center">首 
                    页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;心灵驿站 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小资生活 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乐趣娱乐 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乐趣论坛 
                  </div></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="25" valign="bottom">&nbsp;&nbsp;
您现在的位置：<A href="index.jsp" >首 页</A> 
      <%
       if(boardParentID!=null&&!boardParentID.equals(""))
       {
         %>
         → <A href="catalog.jsp?boardParentID=<%=boardParentID%>"><!--%=new String(((String)((Vector)position.get(0)).get(0)).getBytes("gb2312"),"ISO8859_1")%--><%=((Vector)position.get(0)).get(0)%></A> 
         → <A href="list.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>" ><!--%=new String(((String)((Vector)position.get(0)).get(1)).getBytes("gb2312"),"ISO8859_1")%--> <%=((Vector)position.get(0)).get(1)%></A>
         → 发布文章 
         <%
       }  
      %>             
           </td>
        </tr>
        <tr>
          <td height="13"><hr width="99%" size="1"></td>
        </tr>
        <tr> 
          <td><table width="770" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="200" valign="top"><table width="180" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#DC9F01"  bordercolordark="#FFFFFF">
                    <tr> 
                      <td><img src="images/fabu.jpg" width="180" height="20"></td>
                    </tr>
                    <tr> 
                      <td><img src="images/bg1.jpg" width="180" height="22"></td>
                    </tr>
                    <tr> 
                      <td background="images/bg2.jpg"><table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                          <%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);           
           %>
                   <TR>
                   <TD align=left>&nbsp;&nbsp;<!--%=new String(((String)t_vct.get(1)).getBytes("gb2312"),"ISO8859_1")%--><%=t_vct.get(1)%></td> 
                   </tr>
           <%
          
          n_list_vct = news.getSubTypeList(t_vct.get(0).toString());
          if(n_list_vct!=null&&n_list_vct.size()>0)
           {
                for(int j=0;j<n_list_vct.size();j++) 
                 {
                    Vector t1_vct = (Vector)n_list_vct.get(j);
                     %>
                      <tr>
                      <td align=left>&nbsp;&nbsp;&nbsp;&nbsp;
                      <a href="issue.jsp?boardParentID=<%=t1_vct.get(0)%>&boardID=<%=t1_vct.get(1)%>"><!--%=new String(((String)t1_vct.get(2)).getBytes("gb2312"),"ISO8859_1")%--><%=t1_vct.get(2)%></a>
                      </td>
                      </tr>
                     <%
                 }    
           } 
           
        }
    }

%>  
                          <tr> 
                            <td height="17"><div align="left"><a href="index.jsp">返回首页</a></div></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td><img src="images/bg3.jpg" width="180" height="24"></td>
                    </tr>
                  </table></td>
                <td width="10" valign="top" background="images/shuxian.gif">&nbsp;</td>
                <td width="560" valign="top"><table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>
                          
                      <table width="530" border="1" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bordercolordark="#FFFFFF" bgcolor="#FFFDF7">
                    
                          <tr> 
                            <td valign="top"> <table width="510" border="0" align="center" cellpadding="0" cellspacing="0">
                                             
              <tr> 
                <td width=80% align="center" valign="center">&nbsp;<font color="red">发布成功，请等待乐趣工作室审批！</font></td> 
                
              </tr> 
              <tr> 
                <td width=80% align="center" valign="center">&nbsp;</td> 
                
              </tr>                           
              <tr> 
                <td width=80% align="center" valign="center">&nbsp;<a href="issue.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>">继续发布</a>  <a href="index.jsp">返回首页</a></td>                 
              </tr>                                          
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table> </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
                <td valign="top">&nbsp;</td>
                <td width="560" valign="top">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<div align="center">
  <table width="760" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="10"><img src="images/tmtp.gif" width="2" height="2"></td>
    </tr>
    <tr>
      <td><div align="center">&copy;中文版权所有： 乐趣工作室『2rich』 &copy;Copyright 2003-2004 
        </div></td>
    </tr>
    <tr>
      <td><div align="center">本新闻系统部分内容摘自Internet，与 乐趣工作室『2rich』 立场无关 </div></td>
    </tr>
  </table>
</div>
</body>
</html>
