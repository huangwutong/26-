<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%@ page import = "java.util.Vector"%>
<%
	stats=forumName+"��̳�ղؼ�.";
	forumID=ParamUtil.getInt(request,"forumID",0);
	
	
%>
<%@ include file="INC/theme.jsp"%>
<%
out.println(headLine(1,forumName,forumLogo,"",1,stats));
%>
<%
	try{
		if(!foundUser)
			throw new Exception("����û��<a href=login.jsp>��¼</a>��");
		ForumBookMark.addFav(request);
	
		

	
%>
    <table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>><font color="<%=tableFontColor%>">�ɹ��������ղ�</font></td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=<%=tableBodyColor%>><font color="<%=tableContentColor%>"><b>�������Ѿ�����������̳��<a href=favlist.jsp>�ղؼ�</a></b><br><br></font>
      </td>
    </tr>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=tableTitleColor%>>
<a href="javascript:history.go(-1)"> << ������һҳ</a>
      </td>
    </tr>  
    </table>   </td></tr></table>
<%
	}

	
	catch(Exception e){
		e.printStackTrace();
		String errMsg=e.getMessage();
		%>
		<%@include file="INC/error.jsp"%>
		<%
}%>
<%@ include file="foot.jsp"%>
