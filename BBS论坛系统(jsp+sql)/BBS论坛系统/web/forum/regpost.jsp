<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.acai.forum.util.*"%>
<%@ include file="INC/const.jsp"%>

<%
	stats="�û�ע��";
%>
<%@ include file="INC/theme.jsp"%>
<%
	userName=ParamUtil.getString(request,"userName","");
	try
	{
		ForumFactory.addUser(request,wealthReg,epReg,cpReg);	

%>
<table cellpadding=0 cellspacing=0 border=0 width=500 bgcolor=<%=aTableBackColor%> align=center>
<tr> 
<td> 
      <table cellpadding=3 cellspacing=1 border=0 width=500>
        <TBODY> 
        <TR align=middle bgcolor=<%=aTableTitleColor%>> 
          <TD colSpan=2 height=24><b>�û�ע��ɹ�</b></TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD colspan=2><center><b> 

      <%if (emailFlag==0) {%><center>
            <b>��ӭʹ�ñ�ϵͳ�����κ����⣬��������(<a href=mailto:<%=systemEmail%>><%=systemEmail%></A>)��ϵ!</b> 
            <%}else if (emailFlag==1) {
    out.println( "<center><b> һ��ע�����Ѿ����͵�����ע��ʱ��д�����䣬����գ�</b>");
  	}
  	%>
        
          </TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD width=35% height="32">ע �� ��**</TD>
          <TD><%=userName%></TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">�� ��</TD>
          <TD> 
            <%if (ParamUtil.getInt(request,"sex",0)==1) {%>
            �� 
            <%} else {%>
            Ů 
            <%}%>
          </TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">��&nbsp;&nbsp;&nbsp;&nbsp;��**</TD>
          <TD><%=ParamUtil.getString(request,"userPassword","")%> </TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height=32 width="150">Email��ַ **</TD>
          <TD><%=ParamUtil.getString(request,"userEmail","")%></TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height=32 width="150">����**</TD>
          <TD><img src="<%=ParamUtil.getString(request,"face","")%>"> 
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">�� ��</TD>
          <TD><%=wealthReg%> 
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">����ֵ</TD>
          <TD><%=epReg%> 
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">����ֵ</TD>
          <TD><%=cpReg%> 
        </TR>
        <tr bgcolor=<%=tableBodyColor%>> 
          <td height="32" width="150">�л���ʱ�Ƿ���ʾ</td>
          <td> 
<%if (ParamUtil.getInt(request,"showRe",0)==1)
out.println( "��ʾ");
else
out.println("����ʾ");

%>
        </tr>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD height="32" width="150">OICQ����</TD>
          <TD> 
            <%if (ParamUtil.getString(request,"oicq","").equals("")){%>
            δע�� 
            <% }else {%>
            <%=ParamUtil.getString(request,"oicq","")%> 
            <%}%>
          </TD>
        </TR>
        <TR bgcolor=<%=tableBodyColor%>> 
          <TD width=150>ǩ ��<BR>
            <BR>
            ���ֽ�����������������µĽ�β�����������ĸ��ԡ� </TD>
          <TD> 
            <%if (ParamUtil.getString(request,"sign","").equals("")) {%>
            δ��д 
            <%} else {%>
            <%=(new String(ParamUtil.getString(request,"sign","").getBytes("ISO-8859-1"),"GBK"))%> 
            <%}%>
          </TD>
        </TR>
        
        <TR align=middle bgcolor=<%=aTableTitleColor%>> 
          <TD colSpan=2 align=center> <a href=login.jsp>���½��̳</a> </TD>
        </TR>
        </TBODY> 
      </TABLE>
</td>
</tr>
</table>
<%

	}
	catch(Exception e){
		e.printStackTrace();
		out.print(e.getMessage());
	}
	
%>
<%@ include file="foot.jsp"%>
