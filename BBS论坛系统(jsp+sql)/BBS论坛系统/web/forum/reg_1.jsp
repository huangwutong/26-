<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="INC/const.jsp"%>
<%
	stats="�û�ע��";
%>
<%@ include file="INC/theme.jsp"%>
<%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
%>
<FORM name=theForm action=regpost.jsp method=post>
<table cellpadding=0 cellspacing=0 border=0 width=500 bgcolor=<%=aTableBackColor%> align=center>
        <tr>
            <td>
                
<table cellpadding=3 cellspacing=1 border=0 width=100%>
<TBODY> 
<TR align=middle bgcolor=<%=aTableTitleColor%>> 
<TD colSpan=2 height=24><b>���û�ע��</b></TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>ע �� ��**</TD>
<TD> 
<INPUT maxLength=8 size=12 name=userName>
(����ʹ����Ӣ������)</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>�� ��</TD>
<TD> 
<INPUT type=radio CHECKED value="1" name=sex>
<IMG 
      height=27 src="pic/Male.gif" width=25 align=absMiddle>�к� &nbsp;&nbsp;&nbsp;&nbsp; 
<INPUT type=radio value="0" name=sex>
<IMG 
      height=27 src="pic/Female.gif" width=27 align=absMiddle>Ů��</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>��&nbsp;&nbsp;&nbsp;&nbsp;��**</TD>
<TD> 
<INPUT type=password maxLength=16 size=13 name=psw>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>����ȷ�� **</TD>
<TD> 
<INPUT type=password maxLength=16 size=13 name=pswc>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 height=32>Email��ַ **</TD>
<TD height=32> 
<INPUT maxLength=50 size=27 name=userEmail>
(�磺abc@SuperSpace.net) </TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 height=32>���� <img id=face src="<%=picURL%>Image1.gif" alt=�����������>**</TD>
<TD height=15> 
<select name=face size=1 onChange="document.images['face'].src=options[selectedIndex].value;" style="BACKGROUND-COLOR: #99CCFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">
<%for(i=1;i<61;i++){%>
<option value='<%=picURL%>Image<%=i%>.gif'>Image<%=i%></option>
<%}%>
</select>
</TR>
<tr bgcolor=<%=tableBodyColor%>> 
<td width=150 height=32>�����лظ�ʱ�Ƿ���ʾ</td>
<td height=16>
<input type="radio" name="showRe" value="1" checked>
��ʾ��
<input type="radio" name="showRe" value="0">
����ʾ
</tr>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150 valign=top>�Զ���ͷ��<br>
���ͼ��λ����������ͼƬ�����Զ����Ϊ��</TD>
<TD> 
<% if ("1".equals(uploadFlag)){ %>
<iframe name="ad" frameborder=0 width=300 height=40 scrolling=no src=reg_upload.jsp></iframe> 
<br>
<% } %>
ͼ��λ�ã� 
<input type="TEXT" name="myface" size=20 maxlength=100>
����Url��ַ<br>
��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ� 
<input type="TEXT" name="width" size=2 maxlength=2>
20---80������<br>
��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ� 
<input type="TEXT" name="height" size=2 maxlength=2>
20---80������<br>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>OICQ����</TD>
<TD> 
<INPUT maxLength=20 size=44 name=oicq>
</TD>
</TR>
<TR bgcolor=<%=tableBodyColor%>> 
<TD width=150>ǩ ��<BR>
<BR>
���ֽ�����������������µĽ�β�����������ĸ��ԡ� </TD>
<TD> 
<TEXTAREA name=sign rows=5 wrap=PHYSICAL cols=42></TEXTAREA>
</TD>
</TR>
<TR align=middle bgcolor=<%=aTableTitleColor%>> 
<TD colSpan=2> 
<DIV align=center> 
<INPUT value="ע ��" name=Submit type=submit>
<INPUT type=reset value="�� д" name=Submit2>
</DIV>
</TD>
</TR>
</TBODY> 
</TABLE>
</td></tr></table>
</FORM>

<%@ include file="foot.jsp"%>
