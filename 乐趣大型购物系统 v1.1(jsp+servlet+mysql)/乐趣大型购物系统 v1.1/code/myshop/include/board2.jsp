        <tr> 
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">产品分类</font></div></td>
        </tr>
<%
    catlog_vct = shop.getCatalog();
    
    if(catlog_vct!=null&&catlog_vct.size()>0)
     {
         for(int i=0;i<catlog_vct.size();i++)
          {
          
             Vector t_vct = (Vector)catlog_vct.get(i);
             %>
        <tr> 
          <td height="1" background="images/hydl.jpg">
           <font size="2">&nbsp;   
          <img src="images/xtb.jpg" width="18" height="18">
          <a href="catalog.jsp?boardParentID=<%=t_vct.get(0)%>"><%=t_vct.get(1)%></a>
            </font>
          </td>
        </tr>             
             <% 
              
              subcatlog_vct = shop.getSubCatalog(t_vct.get(0).toString());
              if(subcatlog_vct!=null&&subcatlog_vct.size()>0)
               {
                      for(int j=0;j<subcatlog_vct.size();j++)
                      {
                      
                      %>
                      
           <tr> 
          <td height="1" background="images/hydl.jpg"><font color="#8F6A07" size="1">&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&gt; </font><font size="2">
          <a href="goodslist.jsp?boardParentID=<%=((Vector)subcatlog_vct.get(j)).get(2)%>&boardID=<%=((Vector)subcatlog_vct.get(j)).get(0)%>"><%=((Vector)subcatlog_vct.get(j)).get(1)%></a>
          </td>
          </tr>     
                      <%
                      }
              }
              
          }
     }

%>     