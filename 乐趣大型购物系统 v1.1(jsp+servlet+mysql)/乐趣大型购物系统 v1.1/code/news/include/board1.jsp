 <TABLE align=center border=0 cellPadding=0 cellSpacing=0 height=20 width=91% >
       <TBODY>
        <TR align=middle background="images/topbg1.gif">
          <TD><a href=index.jsp>首 页</a></TD>
<%

   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           %>
            <TD><a href=catalog.jsp?boardParentID=<%=t_vct.get(0)%>><!--%=new String(((String)t_vct.get(1)).getBytes("gb2312"),"ISO8859_1")%--><%=t_vct.get(1)%></a></TD>
           <%
        }
    }

%>       
           <TD><a href="http://www.2rich.net/code/myshop/index.jsp" target="_blank">购物中心</a></TD>
            <TD><a href="http://www.2rich.net/bbs/index.jsp" target="_blank">乐趣论坛</a></TD>
         </TR>
        </TBODY>
      </TABLE>  </div></td>
              </tr>
