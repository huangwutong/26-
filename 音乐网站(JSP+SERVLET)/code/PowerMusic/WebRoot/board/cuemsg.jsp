
<%@ page import="model.MessageModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageGuestBook"%>
<jsp:useBean id="showmsg" class="control.bean.ManageGuestBook" scope="page"></jsp:useBean>
<jsp:useBean id="gmodel" class="model.MessageModel" scope="page"></jsp:useBean>


<%!

    Vector msgvector;
%>
<%
	msgvector = showmsg.displayQuery(5,1,"* from MessageInfo order by MessageID","MessageID");
%>
<% 
	for(int i=0;i<msgvector.size();i++){
		gmodel.setMessageID(((MessageModel)msgvector.get(i)).getMessageID());
		gmodel.setMessageTitle(((MessageModel)msgvector.get(i)).getMessageTitle());
	%><TR >
	<td align="left" nowrap width="25%">
	<a href="<%=request.getContextPath()%>/show/guestbook.jsp?action=show&msgid=<%=gmodel.getMessageID()%>&position=<%=i%>"><%=gmodel.getMessageTitle()%></a>
	</td>
	</TR>
<%}%>

