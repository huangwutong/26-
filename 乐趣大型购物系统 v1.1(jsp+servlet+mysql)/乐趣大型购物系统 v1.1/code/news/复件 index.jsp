<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="include/config.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT language=JavaScript src="../js/pub.js"></SCRIPT>
<script language=javascript>
 window.open("http://www.2rich.net/html/gonggao/1/gonggao.htm","","height=350,width=400,resizable=NO,scrollbars=NO,status=NO,toolbar=NO,menubar=NO,location=NO");
//window.open("http://www.2rich.net/html/spring/index.html");
</script>
<title>乐趣新闻首页----乐趣工作室</title>
</head>

<body bgcolor="#FFF9E6" leftmargin="0" topmargin="0">
<table width="770" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#DC9F01" bgcolor="#FFFFFF" bordercolordark="#FFF9E6">
  <tr> 
    <td align="center" valign="top">
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
<%@include file="include/board1.jsp"%>              
               </td>
        </tr>

<%
    m_vct = news.getNewsSubType();   
     
%>        
        
        <tr> 
          <td height="25" valign="bottom">&nbsp;&nbsp;
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=760>
  <TR>
    <TD height=20> ※您现在的位置：首页 → 栏目列表 </FONT> </TD>
    <TD height=20 align="right"><font color=#2D56D2> ※
    <%
      if(session.getAttribute("id") == null || session.getAttribute("id") == "")
       {
          %>
           <a href="javascript:issue();" class=list><u>发布自己的稿件</u></a>
          <%
       }
      else
       {
          %>
          <a href="issue.jsp" class=list><u>发布自己的稿件</u></a>
          <%
       }
          
    %>  
   
    </FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </TD>  
  </TR>
</TABLE>          
           </td>
        </tr>
        <tr>
          <td height="13"><hr width="99%" size="1"></td>
        </tr>
        <tr> 
          <td><table width="770" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="560" valign="top">
                <table width="560" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><table width="560" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="180" rowspan="2"><div align="center"> 
                                <table width="160" border="1" cellpadding="0" cellspacing="0" bordercolor="#DC9F01"  bordercolordark="#FFFFFF">
                                  <tr> 
                                    <td><img src="images/toutiao.jpg" width="160" height="103"></td>
                                  </tr>
                                </table>
                              </div></td>
                            <td width="380" height="20"><font color="#A66400" size="2"><strong>个文科强人是怎样跨学校跨专业考研的...</strong></font></td>
                          </tr>
                          <tr> 
                            <td width="380"> <table width="380" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="60">现在跨专业跨学校考研已经是一种趋势。某君学习图书馆学年，也是得发腻。于是决定考个理科的研究生，在广泛的调查和研究之后。他毅然决定考天大的化院来挑战一下自己。看看一个连苯完都不会写的人是否可以大跨度考研成功。他做了一下跨专业跨学校考研已经是一种趋势。</td>
                                </tr>
                                <tr> 
                                  <td height="20" valign="bottom"> <div align="right"><a href="http://www.2rich.net/code/news/newdetail.jsp?boardParentID=1&boardID=5&newid=11" target="_blank">阅读全文 </a> 
                                      &gt;&gt;&nbsp;&nbsp;</div></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="10"><img src="images/tmtp.gif" width="2" height="2"> 
                      </td>
                    </tr> 

           

                    <tr> 
                      <td valign="top">
                      <table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
<%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           
          %>
                        
                          <tr> 
                            <td height="16" valign="bottom" bgcolor="#FFCC00">  
                              <table width="100%">
                              <tr align="left">
                              <td>&nbsp;&nbsp;:: <!--%=new String(((String)t_vct.get(2)).getBytes("gb2312"),"ISO8859_1")%--><%=t_vct.get(2)%> ::
                              </td>                              
                              <td align="right">
                              <a href="list.jsp?boardParentID=<%=t_vct.get(0)%>&boardID=<%=t_vct.get(1)%>">更多>>>&nbsp;&nbsp;&nbsp;</a> 
                              </td>
                              </tr>
                              </table>
                              </td>
                          </tr>  
                          
                                                                           
        <%
              boardParentID =t_vct.get(0).toString();
                  boardID =t_vct.get(1).toString();
                   n_list_vct =news.getList(boardID,boardParentID,"00");// pageCtl.getcurData(news.getList(boardID,boardParentID,"00"),20,1); //分页实现
                 
                    if(n_list_vct!=null&&n_list_vct.size()>0)
                     {
                     
                        %>
                          <tr> 
                            <td height="155" valign="top"> 
                              <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
                          
                        <%
                        int br_judge=0;
                        for(int j=0;j<n_list_vct.size();j++)
                         {
                            Vector t1_vct = (Vector)n_list_vct.get(j);
                            title = (String)t1_vct.get(1);
                            if(title.length()>14)
                             {
                                title = title.substring(0,12)+"...";
                             }
                           //新闻现实换行处理  
                            if(j%2==0)
                             {
                               br_judge=1;
                                %>
                               <tr valign="top"> 
                                  <td width="50%" height="18"><img src="images/xtb.jpg" width="18" height="11"> 
                                    <a  href=newdetail.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>&newid=<%=t1_vct.get(0)%>  target=_blank><!--%=new String(title.getBytes("gb2312"),"ISO8859_1")%--><%=title%></a>(<font color="#31720E"><%=(t1_vct.get(2).toString()).substring(5,16)%>)<br> 
                                    </td>
                                 
                                                                                     
                                <%
                             }
                            else
                             {  
                                  br_judge=0;
                                 %>  
                                    <td width="50%" height="18">
                                    <img src="images/xtb.jpg" width="18" height="11"> 
                                    <a  href=newdetail.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>&newid=<%=t1_vct.get(0)%>  target=_blank><!--%=new String(title.getBytes("gb2312"),"ISO8859_1")%--><%=title%></a>(<font color="#31720E"><%=(t1_vct.get(2).toString()).substring(5,16)%>) 
                                    <br></td>
                                </tr>                               
                                                                                                  
                                 <%
                             }
                         }

                       if(br_judge==1)
                        {
                                 %>  
                                    <td width="50%" height="18"><img src="images/xtb.jpg" width="18" height="11"> &nbsp;                                    
                                    </td>
                                </tr>                               

                                                                                        
                                <%                          
                        }  
                       %>
                                </table></td> 
                               </tr>                          
                       <%  
                     }
        }
    }

%>      
                          
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
                      <td height="180" background="images/jiaodianbg.gif"><table width="140" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
                          </tr>
                          <tr>
                            <td height="16">* 乐趣大型新闻系统1.0版</td>
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
    <br>
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
