<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="include/config.jsp"%>
<%@include file="include/bean.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎来到乐趣工作室!</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>

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
    <td height="22" valign="middle" bgcolor="#FCCB05"> <div align="center">  
    <%@include file="include/board1.jsp"%> 
    </div></td>
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
    <td width="150" valign="top"> <table width="150" border="0" cellpadding="0" cellspacing="0">
 <%@include file="include/board3.jsp"%>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">联系方式</font></div></td>
        </tr>
        <tr> 
          <td height="20" valign="bottom" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;电话:64704946</font></td>
        </tr>
        <tr> 
          <td height="18" background="images/hydl.jpg"> <p><font size="2">&nbsp;&nbsp;E-mail:</font></p></td>
        </tr>
        <tr> 
          <td height="18" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;MSN:</font></td>
        </tr>
        <tr> 
          <td height="18" valign="top" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;QQ:</font></td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
<%@include file="include/board2.jsp"%>
        <tr> 
          <td height="5" background="images/hydl.jpg"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">友情链接</font></div></td>
        </tr>
        <tr> 
          <td height="150" background="images/hydl.jpg">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
      </table></td>
    <td width="920" valign="top"><table width="610" border="0" cellspacing="0" cellpadding="0">
  
        <tr> 
          <td valign="top"> 
          <table width="600" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 
                  精品展示</font> </td>
              </tr>   
              
              

                      
                      

<%
 
     boardParentID = request.getParameter("boardParentID");
     m_vct = shop.getRecommandGoodsList1(boardParentID,"03");
    
     if(m_vct!=null&&m_vct.size()>0)
      {
         int br_judge=0;
         for(int i=0;i<m_vct.size();i++)
          {
              
              Vector t_vct = (Vector)m_vct.get(i);    
              
              
                       
              Vector img_vct = shop.getGoodsImage(t_vct.get(0).toString(),"01");
              String img_url = "image/upload/shop/1.jpg";
              if(img_vct!=null&&img_vct.size()>0)
               {
                   img_url = (String)(((Vector)img_vct.get(0)).get(1));
               }
              
              
              
               if(i%2==0)
                {

                    br_judge=1;
                                 %>
              <tr> 
                <td><table width="600" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="140"> 
                      <table width="300" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100"> <div align="center"> 
                              <table width="66" border="0" cellpadding="0" cellspacing="0" bordercolor="#C99803" bordercolordark="#FFFBEC">
                                  <tr> 
                                    <td width="150" height="153"> 
                                    <div align="center">
                                             &nbsp;&nbsp;&nbsp;&nbsp;<a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><img src="../../<%=img_url%>" width="108" height="133" border="0"></a>
                                     </div>
                                   </td>
                                            
                                  </tr>
                                </table>
                              </div></td>
                            <td width="200"><font size="2">
<table width="150" border="0" cellspacing="0" cellpadding="0">
                                                 <tr> 
                                                   <td height="25"><font color="#0386B8" size="2"><strong><%=t_vct.get(1)%></strong></font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td>
                                                   <font size="2">
                                                   <a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><%=t_vct.get(2)%> </a>
                                                   </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">市场价：￥<%=t_vct.get(3)%> </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣价：￥<%=t_vct.get(4)%> </font></td>
                                                 </tr>                                                 
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣会员价： ￥<%=t_vct.get(5)%></font></td>
                                                 </tr>
                                               </table>                              
                            </font></td>
                          </tr>
                        </table> 
                        </td>
                                 <%
                }  
               else
                {

                              br_judge=0;
                                 %>
                         <td>
                         <table width="300" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100"> <div align="center"> 
                              <table width="66" border="0" cellpadding="0" cellspacing="0" bordercolor="#C99803" bordercolordark="#FFFBEC">
                                  <tr> 
                                    <td width="150" height="153"> 
                                    <div align="center">
                                             &nbsp;&nbsp;&nbsp;&nbsp;<a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><img src="../../<%=img_url%>" width="108" height="133" border="0"></a>
                                     </div>
                                   </td>
                                            
                                  </tr>
                                </table>
                              </div></td>
                            <td width="200"><font size="2">
<table width="150" border="0" cellspacing="0" cellpadding="0">
                                                 <tr> 
                                                   <td height="25"><font color="#0386B8" size="2"><strong><%=t_vct.get(1)%></strong></font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td>
                                                   <font size="2">
                                                   <a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><%=t_vct.get(2)%> </a>
                                                   </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">市场价：￥<%=t_vct.get(3)%> </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣价：￥<%=t_vct.get(4)%> </font></td>
                                                 </tr>                                                 
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣会员价： ￥<%=t_vct.get(5)%></font></td>
                                                 </tr>
                                               </table>                              
                             </font></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
                                 <%                
                
                } 
   
          }

        if(br_judge==1)
         {

            %>
                  </table></td>
              </tr>
            <%         
         }  
         

      }
%>                 


            </table>
            </td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="142" valign="top"> <div align="right"> 
              <table width="600" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr> 
                  <td height="18" colspan="2" bgcolor="#FFCC00"><font size="2"> 
                    &nbsp;&gt;&gt; 产品展示</font></td>
                </tr>
                
<%
 
     boardParentID = request.getParameter("boardParentID");

     m_vct = shop.getCatlogGoodsList(boardParentID);

     if(m_vct!=null&&m_vct.size()>0)
      {
         int br_judge=0;
         for(int i=0;i<m_vct.size();i++)
          {

              Vector t_vct = (Vector)m_vct.get(i);             
              Vector img_vct = shop.getGoodsImage(t_vct.get(0).toString(),"01");
              
               if(i%2==0)
                {

                    br_judge=1;
                                 %>
                                     <tr> 
                                       <td width="300"> <table width="300" border="0" cellspacing="0" cellpadding="0">
                                           <tr> 
                                             <td width="150" height="153"> <div align="center"><a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><img src="../../<%=((Vector)img_vct.get(0)).get(1)==null?"image/shop/1.jpg":((Vector)img_vct.get(0)).get(1)%>" width="108" height="133" border="0"></a></div></td>
                                             <td width="150" height="153" valign="top">
                                             <table width="150" border="0" cellspacing="0" cellpadding="0">
                                                 <tr> 
                                                   <td height="25"><font color="#0386B8" size="2"><strong><%=t_vct.get(1)%></strong></font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td>
                                                   <font size="2">
                                                   <a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><%=t_vct.get(2)%> </a>
                                                   </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">市场价：￥<%=t_vct.get(3)%> </font></td>
                                                 </tr>
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣价：￥<%=t_vct.get(4)%> </font></td>
                                                 </tr>                                                 
                                                 <tr> 
                                                   <td height="20"><font size="2">乐趣会员价： ￥<%=t_vct.get(5)%></font></td>
                                                 </tr>
                                               </table></td>
                                           </tr>
                                         </table></td>          
          
                                 <%
                }  
               else
                {

                              br_judge=0;
                                 %>
                                        <td width="305"  valign="top"><table width="300" border="0" cellspacing="0" cellpadding="0">
                                          <tr> 
                                            <td width="150" height="153"> <div align="center"><a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><img src="../../<%=((Vector)img_vct.get(0)).get(1)==null?"image/shop/1.jpg":((Vector)img_vct.get(0)).get(1)%>" width="108" height="133" border=0></a></div></td>
                                            <td width="150" height="153"  valign="top">
                                            
                                            <table width="150" border="0" cellspacing="0" cellpadding="0">
                                                <tr> 
                                                  <td height="25"><font color="#0386B8" size="2">
                                                  <strong>
                                                  <%=t_vct.get(1)%>
                                                    </strong></font></td>
                                                </tr>
                                                <tr> 
                                                  <td><font size="2">
                                                 <a href="shopdetail.jsp?id=<%=t_vct.get(0)%>"><%=t_vct.get(2)%></a>
                                                  </font></td>
                                                </tr>
                                                <tr> 
                                                  <td height="20"><font size="2">市场价： ￥<%=t_vct.get(3)%> </font></td>
                                                </tr>                                                 
                                                <tr> 
                                                  <td height="20"><font size="2">乐趣价： ￥<%=t_vct.get(4)%></font></td>
                                                </tr>
                                                <tr> 
                                                  <td height="20"><font size="2">乐趣会员价： ￥<%=t_vct.get(5)%></font></td>
                                                </tr>
                                              </table>
                                             
                                              </td>
                                          </tr>
                                        </table></td>
                                       </tr> 
                                 <%                
                
                } 
   
          }

        if(br_judge==1)
         {

            %>
                                        <td width="305">&nbsp;

                                          </td>
                                      </tr>                
            
            <%         
         }  
         

      }
%>                 



              </table>
              <br>
            </div></td>
        </tr>
        <tr>
          <td valign="top">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr bgcolor="#FFCC00"> 
    <td height="20" colspan="2"><font size="2">&nbsp;&gt;&gt; 合作伙伴</font></td>
  </tr>
  <tr bgcolor="#FFFBEC"> 
    <td height="60" colspan="2"><table width="750" border="0" cellspacing="0" cellpadding="0">
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
<%@include file="include/foot.jsp"%>  
</table>
</body>
</html>
