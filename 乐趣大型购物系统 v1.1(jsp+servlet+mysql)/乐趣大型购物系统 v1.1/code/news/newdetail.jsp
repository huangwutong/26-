<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="include/config.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT language=JavaScript src="../js/pub.js"></SCRIPT>
<title>欢迎试用乐趣新闻发布系统!</title>
</head>

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
                <td height="25" background="images/topbg1.gif"> <div align="center">    
                <div align="center">
                <%@include file="include/board1.jsp"%>     
                </div></td>
              </tr>
            </table></td>
        </tr>
<%
  boardParentID = request.getParameter("boardParentID");
  boardID =   request.getParameter("boardID");   
  m_vct = news.getSubTypeList(boardParentID);
  position = news.getPosition(boardID,boardParentID);
  
%>        
        <tr> 
          <td height="25" valign="bottom">&nbsp;&nbsp;
您现在的位置：<A href="index.jsp">首 页</A> 
      <%
       if(boardParentID!=null&&!boardParentID.equals(""))
       {
         %>
         → <A href="catalog.jsp?boardParentID=<%=boardParentID%>"><!--%=new String(((String)((Vector)position.get(0)).get(0)).getBytes("gb2312"),"ISO8859_1")%--><%=((Vector)position.get(0)).get(0)%></A> 
         → <A href="list.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>"><!--%=new String(((String)((Vector)position.get(0)).get(1)).getBytes("gb2312"),"ISO8859_1")%--> <%=((Vector)position.get(0)).get(1)%></A>
         → 发布文章 
         <%
       } 
      else
      {
         %>
           → 发布文章 
         <%      
      }  
      %>  
      
<%
      newid = request.getParameter("newid");
      m_vct = news.getNewsContent(newid);
      
     Vector t1_vct = (Vector)m_vct.get(0);
      
%>       
           </td>
        </tr> 
        <tr> 
          <td><table width="770" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="560" valign="top"><table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td height="15">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="30"> <div align="center"><font color="#9E7301" size="3"><strong><%=t1_vct.get(5)%><!--%=new String(((String)t1_vct.get(5)).getBytes("gb2312"),"ISO8859_1")%--></strong></font></div></td>
                    </tr>
                    <tr> 
                      <td height="10">
                      <table width="530" border="1" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bordercolordark="#FFFFFF" bgcolor="#FFFDF7">
                          <tr> 
                            <td valign="top"> <table width="510" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr> 
                                  <td align="center">&nbsp;</td>
                                </tr> 
                                <tr> 
                                  <td align="center">&nbsp;作者：<!--%=new String(((String)t1_vct.get(2)).getBytes("gb2312"),"ISO8859_1")%--><%=t1_vct.get(2)%>&nbsp;&nbsp;<a href="http://www.2rich.net" target="_blank">http://www.2rich.net</a></td>
                                </tr>
                                <tr> 
                                  <td align="center">&nbsp;</td>
                                </tr>                                
                                <tr> 
                                  <td height="360" valign="top">&nbsp;&nbsp;
                                  <!--%=new String(((String)t1_vct.get(4)).getBytes("gb2312"),"ISO8859_1")%--><%=t1_vct.get(4)%>          
                                  </td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="10" valign="bottom"> <div align="right"></div></td>
                    </tr>
                    <tr> 
                      <td valign="bottom"><table width="530" border="1" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bordercolordark="#FFFFFF" bgcolor="#FFFDF7">
                          <tr> 
                            <td width="106" height="20"> <div align="center">发布人：<!--%=new String(((String)t1_vct.get(1)).getBytes("gb2312"),"ISO8859_1")%--><%=t1_vct.get(1)%></div></td>
                            <td width="418" height="20">如果您觉得不错的话，请通过QQ,MSN,Mail发送给您的朋友吧！</td>
                          </tr>
                          <tr> 
                            <td height="20"> <div align="center">摘 自： <!--%=new String(((String)t1_vct.get(6)).getBytes("gb2312"),"ISO8859_1")%--><%=t1_vct.get(6)%></div></td>
                            <td height="20"> <div align="right"><a href="comment.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>&newid=<%=newid%>"><u>评  论</u></a> &nbsp;&nbsp;&nbsp;</div></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="10" valign="bottom"><img src="images/tmtp.gif" width="2" height="2"></td>
                    </tr>
                    <tr>
                      <td valign="bottom"><table width="530" border="1" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bordercolordark="#FFFFFF" bgcolor="#FFFDF7">
                          <tr> 
                            <td width="106" height="20" bgcolor="#DC9F01"> <div align="left">&nbsp;相关文章</div></td>
                          </tr>
                          <tr> 
                            <td height="20"> <div align="left">\</div></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
                <td width="10" valign="top" background="images/shuxian.gif">&nbsp;</td>
                <td width="200" valign="top"> 
                  <table width="180" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#DC9F01"  bordercolordark="#FFFFFF">
                    <tr> 
                      <td><img src="images/sousuo.jpg" width="180" height="20"></td>
                    </tr>
                    <tr> 
                      <td height="95" background="images/shousuo.gif"> <table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr valign="bottom"> 
                            <td width="68" height="28"> <div align="center"><font size="2">分　类:</font></div></td>
                            <td width="97" height="28"><strong><font size="2"> 
                              </font></strong> <select name="select">
                                <option>全部文章</option>
                              </select> <strong><font size="2"> </font></strong></td>
                          </tr>
                          <tr> 
                            <td height="28"> <div align="center"><font size="2">关键字:</font></div></td>
                            <td height="28"><strong><font size="2"> 
                              <input name="textfield3" type="password" size="10">
                              </font></strong></td>
                          </tr>
                          <tr valign="bottom"> 
                            <td height="20" colspan="2"> <div align="center"><img src="images/dis06.gif" width="84" height="17"></div></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="12"><img src="images/tmtp.gif" width="2" height="2"></td>
                    </tr>
                    <tr> 
                      <td><img src="images/huiyuan.jpg" width="180" height="20"></td>
                    </tr>
                    <tr> 
                      <td height="95" background="images/shousuo.gif">
                      <%@include file="include/board2.jsp"%>  
                      </td>
                    </tr>
                    <tr> 
                      <td height="12"><img src="images/tmtp.gif" width="2" height="2"></td>
                    </tr>
                    <tr> 
                      <td><img src="images/jiaodian.jpg" width="180" height="20"></td>
                    </tr>
                    <tr> 
                      <td height="180" background="images/jiaodianbg.gif">
                      <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="16">&nbsp;</td>
                          </tr>
<%@include file="include/board3.jsp"%>
                          <tr>
                            <td height="16">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td valign="top">&nbsp;</td>
                <td valign="top">&nbsp;</td>
                <td width="200" valign="top">&nbsp;</td>
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
