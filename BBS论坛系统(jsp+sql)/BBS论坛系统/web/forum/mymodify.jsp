<%@ page contentType="text/html;charset=GBK"%>
<%@include file="INC/const.jsp"%>

<%	stats="�޸ĸ�������";
%>
<%@ include file="INC/theme.jsp"%>
 <%
	out.println(headLine(forumID,forumName,forumLogo,"",1,stats));
 %>
 <%String action=ParamUtil.getString(request,"action");
	
	if(action!=null&&("update").equals(action)){
		if(foundUser){
			try
			{
				UserManager.updateUser(request);
		

%>
<table cellpadding=0 cellspacing=0 border=0 width=95% bgcolor=<%=aTableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=aTableTitleColor%>>�ɹ����޸�����</td>
    </tr>
    <tr> 
      <td width="100%" bgcolor=<%=tableBodyColor%>><b>��ϲ�������������޸ĳɹ�</b><br>
      </td>
    </tr>
    <tr align="center"> 
      <td width="100%" bgcolor=<%=aTableTitleColor%>>
<a href="javascript:history.go(-1)"> << ������һҳ</a>
      </td>
    </tr>  
    </table>   </td></tr></table>
<%
		}
catch(Exception e){
	String errMsg=e.getMessage();
	%>
<%@ include file="INC/error.jsp"%>
	<%
}
}

else{
	String errMsg="<li>�Բ���û�д��û�";
%>

<%
}
	}
	else
	{
 
 %>
 
 <%
	try{
		if(foundUser){
		User theUser=UserManager.findUser(userName);
%>
<form action="mymodify.jsp?action=update" method=POST name="theForm">
<input type="hidden" name="userName" value="<%=userName%>">
<table cellpadding=0 cellspacing=0 border=0 width=<%=tableWidth%> bgcolor=<%=tableBackColor%> align=center>
        <tr>
            <td>
                <table cellpadding=3 cellspacing=1 border=0 width=100%>
    <tr align="center"> 
      <td colspan="2" width="100%" bgcolor=<%=tableTitleColor%> height=25><font color="<%=tableFontColor%>"><b><%=response.encodeURL(userName)%>�޸�����</b></font></td>
    </tr>
      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%"><font color="<%=tableContentColor%>"><B>�Ա�</B>��<BR>��ѡ�������Ա�</font></td>   
        <td width="60%"><input type="radio" value="1"<%if ("1".equals(theUser.getSex())){%> checked <%}%>name="sex">���
      <input type="radio" name="sex"<%if ("0".equals(theUser.getSex())){%> checked <%}%> value="0">����</td>
</td>   
      </tr>   
      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%"><font color="<%=tableContentColor%>"><B>����</B>��<BR>��Ҫ�޸���ֱ������</font></td>   
        <td width="60%">    
          <input type="password" name="userPassword" value="<%=response.encodeURL(theUser.getUserPassword())%>" size=30 maxlength=13>   
        </td>   
      </tr>   
      
      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%"><font color="<%=tableContentColor%>"><B>Email��ַ</B>��<BR>��������Ч���ʼ���ַ���⽫��֤������̳�е�˽�����ϡ�</font></td>   
        <td width="60%">    
          <input type="TEXT" name="userEmail" size=30 maxlength=50 value="<%if(theUser.getUserEmail()!=null&&!theUser.getUserEmail().equals("")) {%><%=response.encodeURL(theUser.getUserEmail())%><%}%>">   
        </td>   
      </tr>   
     
<%if (titleFlag!=null&&titleFlag.equals("1")){%>
<%if (theUser.getUserClass()>5){%>
      <tr bgcolor=<%=tableBodyColor%>> 
        <td width="40%"><font color="<%=tableContentColor%>"><B>ͷ��</B>��</font></td>   
        <td width="60%"> <input type="text" name="title" value="<%if(theUser.getTitle()!=null&&!theUser.getTitle().equals("")){ %><%=response.encodeURL(theUser.getTitle())%><%}%>" size=15 maxlength=13> </td>   
      </tr>   
<%}%>
<%}%>
      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%" valign=top><font color="<%=tableContentColor%>"><B>ͷ��</B>��<BR>
������ѡ��һ������ͼƬ�����㷢��ʱ����ʾ�����������·���<BR>
�������д��������Զ���ͷ�񲿷֣���ô���ͷ�����Զ����Ϊ׼���������������Զ���ͷ���������Ŀ��<BR>
<B>�����Զ���ͷ��</B>��<BR>
��Ҳ����������������Զ���ͷ��� URL ��ַ��ͷ��ĸ߶ȺͿ��(����)�� �������Ҫ�Զ���ͷ���뽫��Ӧ��Ŀ��Ŀȫ�����գ�</font>
		</td>   
        <td width="60%">    <font color="<%=tableContentColor%>">
<select name=face style="font-family:arial" size=1 onChange="document.images['face'].src=options[selectedIndex].value; parent.document.forms[0].myface.value=options[selectedIndex].value"> 
<% 
	
	int startP=(picURL+"Image").length();
	int oldFaceNum=0;
	try{
		oldFaceNum = Integer.parseInt(theUser.getFace().substring(startP,startP+2));
	}
	catch(Exception e){
		try{
			oldFaceNum = Integer.parseInt(theUser.getFace().substring(startP,startP+1));
		}
		catch(Exception e1){
			oldFaceNum=1;
		}
	}
	
	%>
	<%for(i=1;i<61;i++){%>
<option value='<%=picURL%>Image<%=i%>.gif' <%if(i==oldFaceNum){ out.println("selected");}%>>Image<%=i%></option>
<%}%>
                </select>&nbsp;&nbsp;<img id=face src="<%=theUser.getFace()%>" width=<%=theUser.getWidth()%> height=<%=theUser.getHeight()%>><BR><BR>

		
		
		  ͼ��λ�ã�<input type="TEXT" name="myface" size=20 maxlength=100 value=<%=theUser.getFace()%>><br>
	  ��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�<input type="TEXT" name="width" size=2 maxlength=2 value=<%=theUser.getWidth()%>>20---120������<br>
	  ��&nbsp;&nbsp;&nbsp;&nbsp;�ȣ�<input type="TEXT" name="height" size=2 maxlength=2 value=<%=theUser.getHeight()%>>20---120������<br></font>
        </td>   
      </tr>	  
      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%"><font color="<%=tableContentColor%>"><B>��ҳ��ַ</B>��<BR>���������ҳ����������ҳ��ַ�������ѡ</font></td>   
        <td width="60%">    
          <input type="TEXT" name="homePage" value="<%if (theUser.getHomePage()!=null&&!theUser.getHomePage().equals("")){ %><%=response.encodeURL(theUser.getHomePage())%><%}%>" size=30 maxlength=100>   
        </td>   
      </tr>   


      <tr bgcolor=<%=tableBodyColor%>>    
        <td width="40%"><font color="<%=tableContentColor%>"><B>OICQ����</B>��<BR>������� OICQ����������롣�����ѡ</font></td>   
        <td width="60%">    
          <input type="TEXT" name="oicq" value="<%if(theUser.getOicq()!=null&&!("").equals(theUser.getOicq())){%><%=response.encodeURL(theUser.getOicq())%><%}%>" size=30 maxlength=20>   
        </td>   
      </tr>
      
      
      
      <tr bgcolor=<%=tableBodyColor%>>    
        <td valign=top width="40%"><font color="<%=tableContentColor%>"><B>ǩ��</B>��<BR>���ܳ��� 300 ���ַ�   
          <br>   
          ���ֽ�����������������µĽ�β����</font></td>   
        <td width="60%">
		<%
		  String signature="";
		if(theUser.getNoFilterSign()!=null&&!("").equals(theUser.getNoFilterSign()))
			signature=theUser.getNoFilterSign();
		  %>
          <textarea name="sign" rows=5 cols=60 wrap=PHYSICAL><%=signature%></textarea>   
        </td>   
      </tr> 
      
    <tr align="center"> 
      <td colspan="2" width="100%" bgcolor=<%=tableTitleColor%>>
            <input type=Submit value="�� ��" name="Submit"> &nbsp; <input type="reset" name="Submit2" value="�� ��">
      </td>
    </tr>  
    </table>   </td></tr></table> 
</form>  
<%
 }
	else throw new Exception("<li>�Բ�����û�е�½�����߷Ƿ���½��</li>");
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	}%>
<%@ include file="foot.jsp"%>