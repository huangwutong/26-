<!--
*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@系统名称：　　乐趣大型购物系统（２ｒｉｃｈ）              @
@开　　发：　　乐趣工作室（２ｒｉｃｈ．ｎｅｔ）            @
@版权所有：    乐趣工作室（２ｒｉｃｈ．ｎｅｔ）            @
@主页地址：　　http://www.2rich.net/                       @
@电子邮件：　　２ｒｉｃｈ＠２ｒｉｃｈ．ｎｅｔ              @
@ＱＱ　　：　　１０７７４００４６　　　　　　              @
@                                                          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-->


<%
          m_vct = news.getCommendNewsList("01");
          
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           boardParentID = t_vct.get(2).toString();
           boardID = t_vct.get(1).toString();
           title = (String)t_vct.get(3);
           if(title.length()>11) title = title.substring(0,10)+"...";
          %>
                          <tr>
                            <td height="16"  align="left">*<a href="newdetail.jsp?boardParentID=<%=boardParentID%>&boardID=<%=boardID%>&newid=<%=t_vct.get(0)%>  " target="_blank"><%=title%></a></td>
                          </tr>          
          <%
          if(i==8) break;
         }
    }  
%>   

