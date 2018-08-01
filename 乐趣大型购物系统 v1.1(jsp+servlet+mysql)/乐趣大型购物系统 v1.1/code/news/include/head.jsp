<jsp:useBean id="news" scope="page" class="com.rich.project.News.News" />
<jsp:setProperty name="news" property="*" />
<jsp:useBean id="issuance" scope="page" class="com.rich.project.News.Issuance" />
<jsp:setProperty name="issuance" property="*" />
<jsp:useBean id="bulletin" scope="page" class="com.rich.project.News.Bulletin" />
<jsp:useBean id="pageCtl" scope="page" class="com.rich.project.pub.PageControl" />
<jsp:useBean id="comment" scope="page" class="com.rich.project.News.Comment" />
<jsp:setProperty name="comment" property="*" />
<%
    Vector m_vct = news.getBanner();
    Vector n_list_vct=null;  //文章子分类
    int flag =0;
    String boardParentID ="0";
    String boardParentName=null; //新闻大类名称
    String boardID ="0";
    String newid="0";
    String title = null;
    String par=null;
    String createdate = null;    
    Vector position=null;
%>