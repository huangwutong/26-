<jsp:useBean id="news" scope="page" class="com.rich.project.News.News" />
<jsp:setProperty name="news" property="*" />
<jsp:useBean id="pageCtl" scope="page" class="com.rich.project.pub.PageControl" />
<html>
<head>
<title>乐趣工作室</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>
<BODY leftMargin=5 topMargin=5>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 class=unnamed1 height=90 width=762>
  <TR>
   <TD width=193><IMG align=top src="images/guolian.gif"></TD>
   <TD width="490" align=center><IMG border=0 height=60 src="../images/public/guanggao.gif" width=468></TD>
   <TD align="center">
     <br><A href="#" onclick='this.style.behavior="url(#default#homepage)";this.setHomePage("http://www.2rich.net")'>设为首页</A>
      <p><A href="javascript:window.external.AddFavorite('http://www.2rich.net','乐趣工作室（www.2rich.net）')">加入收藏</A></p>
   </TD>
  </TR>
</TABLE>
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=760>
  <TR><TD bgColor=#000000 height=1></TD></TR>
  <TR>
    <!--change color #85b866 to #FFCC99-->
    <TD height=18 width=100% bgColor=#FFCC99>
      <TABLE align=center border=0 cellPadding=0 cellSpacing=0 height=20 width=91% bgColor=#FFFFc6>
       <TBODY>
        <TR align=middle>
          <TD><a href=index.jsp>首 页</a></TD>
<%
    Vector m_vct = news.getBanner();
    Vector n_list_vct=null;
    int flag =0;
    String boardParentID ="0";
    String boardID ="0";
    String newid="0";
    String title = null;
    String createdate = null;
    Vector position=null;
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           %>
            <TD><a href=catalog.jsp?newscatalog=<%=t_vct.get(0)%>><%=new String(((String)t_vct.get(1)).getBytes("gb2312"),"ISO8859_1")%><!--%=t_vct.get(1)%--></a></TD>
           <%
        }
    }

%>

          <TD><a href="../bbs/index.jsp" target="_blank">乐趣论坛</a></TD>
         </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR><TD bgColor=#000000 height=1></TD></TR>
  <TR><TD height=1></TD></TR>
</TABLE>