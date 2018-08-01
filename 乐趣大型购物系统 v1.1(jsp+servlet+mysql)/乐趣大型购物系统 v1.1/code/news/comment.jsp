<%@ page contentType="text/html;charset=GB2312"%>
<%@ include file="include/config.jsp"%>
<%@include file="include/head.jsp"%>
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<SCRIPT language=JavaScript src="../js/page.js"></SCRIPT>
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
                <td height="25" background="images/topbg1.gif"> 
                <div align="center">
                <%@include file="include/board1.jsp"%>               
                </div></td>
              </tr>
            </table></td>
        </tr>
<%
    newid = request.getParameter("newid");
    boardParentID = request.getParameter("boardParentID");
    boardID = request.getParameter("boardID");
    Vector name_vct = comment.getNewName(newid);
    int curpage = request.getParameter("jumpPage")==null?1:Integer.parseInt(request.getParameter("jumpPage"));    

    
    String anonymity = request.getParameter("anonymity");
    String username = request.getParameter("username");
    
    String password = request.getParameter("password");
    par = request.getParameter("par");
  
     if(par!=null&&par.equals("add"))
      {   
              String ip = request.getRemoteAddr();
              if((session.getAttribute("id") == null || session.getAttribute("id") == "")&&(anonymity==null||anonymity.equals("")))
               {   
                    Vector username_vct = user.login(username,password);      
                    if(username_vct!=null&&username_vct.size()>0)
                     {
                         Vector t_vct =(Vector)username_vct.get(0);                         
                         session.setAttribute("inc",t_vct.get(0));                         
                         session.setAttribute("id",t_vct.get(1));                         
                         session.setAttribute("nickname",t_vct.get(2));
                         issuance.createComment(t_vct.get(0).toString(),newid,(String)t_vct.get(2),ip);                                
                     }
                    else
                     {
                          throw new Exception("输入的用户名或密码不正确，请重新输入！");
                     }   
                     
              }
             else
              {
                 if(anonymity!=null&&!anonymity.equals("")&&anonymity.equals("anonymity"))
                  {                   
                    // issuance.createComment("-1",newid,new String(("乐趣网友").getBytes("gb2312"),"ISO8859_1"),ip);
                     issuance.createComment("-1",newid,"乐趣网友",ip);
                  }
                 else
                  {
                     issuance.createComment(session.getAttribute("inc").toString(),newid,username,ip); session.getAttribute("id") ;
                     
                  } 
                  
                  
              }   
        
      } 

    //m_vct = pageCtl.getcurData(comment.getComment(newid),20,curpage);                  
    m_vct = comment.getComment(newid); 
    
%>        
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr>
          <td height="3">
          <table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="25" bgcolor="#D59F00">&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href="newdetail.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>&newid=<%=newid%>"><font size="3"><b><u><!--%=new String(((String)((Vector)name_vct.get(0)).get(0)).getBytes("gb2312"),"ISO8859_1")%--><%=((Vector)name_vct.get(0)).get(0)%></font></u></b></a></font></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td><table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="10"><table width="750" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                    <tr> 
                      <td bgcolor="#FFCC00"><font size="2">本新闻所有评论共 <%=pageCtl.getmaxRowCount()%>  条 　 　
                        </font></td>
                    </tr>
                    
<%


   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           //Sting ip = t_vct.get(4);
           %>
                    <tr> 
                      <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
                    </tr>
                    <tr> 
                      <td height="25" bgcolor="#FFFBEC"> &nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
                        <font size="2"><!--%=new String(((String)(t_vct.get(1))).getBytes("gb2312"),"ISO8859_1")%--><%=t_vct.get(1)%>&nbsp;&nbsp;&nbsp;&nbsp;<%=(t_vct.get(2).toString()).substring(0,19)%><!--%=t_vct.get(2)%--> IP:<%=((String)t_vct.get(4)).substring(0,((String)t_vct.get(4)).lastIndexOf("."))%>.*  
                        </font></td>
                    </tr>  
                    <tr> 
                      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!--%=new String(((String)(t_vct.get(3))).getBytes("gb2312"),"ISO8859_1")%--> <%=t_vct.get(3)%> 
                      </td>
                    </tr>                             
           <%
        }
    }

%>    
<tr>
 <td>&nbsp;    <table>
                                          <%
							if(pageCtl.getmaxPage()>1)
							{
					  %>
							<form name="PageForm"  action="comment.jsp" method="post">
							<input type="hidden" name="newid" value="<%=newid%>">
							<input type="hidden" name="boardParentID" value="<%=boardParentID%>">
							<input type="hidden" name="boardID" value="<%=boardID%>">
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
					<%		}%></td>
					 </table>
 </tr>
      </table></td>
  </tr>

                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                    
                  </table></td>
              </tr>
              
              <tr> 
                <td height="10">&nbsp;</td>
              </tr>
              <tr> 
      <td>   
      <form name="form1" method="post" action="comment.jsp">
     <input type="hidden" name="newid" value="<%=newid%>">
     <input type="hidden" name="boardParentID" value="<%=boardParentID%>">
     <input type="hidden" name="boardID" value="<%=boardID%>"> 						           
    <input type="hidden" name="par" value="add">
    <table width="760" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
        <tr> 
          <td width="50%" bgcolor="#FFFBEC">&nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
            <font size="2"> 
<%
  if(session.getAttribute("id") == null || session.getAttribute("id") == "")
  {
     %>
            <input type="checkbox" name="anonymity" value="anonymity">
            匿名 会员名: 
            <input name="username" type="text" size="10">
            密码: 
            <input name="password" type="password" size="10">     
     <%
  } 
 else
  {
    %>
会员名: <input name="username" type="text" size="20" value="<%=session.getAttribute("nickname")%>"> <!--%=new String(((String)session.getAttribute("nickname")).getBytes("gb2312"),"ISO8859_1")%>"-->   
<input name="password" type="hidden" size="10">     
    <% 
  } 
%>            

            </font> </td>
                      <td width="50%" bgcolor="#FFFBEC">&nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
                        <font size="2"><strong>相关产品 </strong></font></td>
                    </tr>
                    <tr> 
                      <td width="50%" height="130"> <div align="center"> 
                          <table width="375" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td height="130"> <div align="center"> 
                                   <textarea name="content" cols="45" rows="7"></textarea>
                                </div></td>
                            </tr>
                            <tr> 
                              <td height="30" valign="top"> <div align="center"> 
                                  <input type="submit" name="Submit" value="提交">
                                </div></td>
                            </tr>
                          </table>
                        </div></td>
                      <td width="50%" valign="top"> <br> <table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                          <tr> 
                            <td height="20"><font size="2">· 布什将宣布成立调查委员会调查美对伊武器情报</font></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td> <div align="left"> &nbsp;&nbsp;&nbsp;&nbsp; </div></td>
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
