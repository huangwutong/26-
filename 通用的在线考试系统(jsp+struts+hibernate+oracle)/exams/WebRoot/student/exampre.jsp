<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:include flush="true" page="/student/examttop.jsp"></jsp:include>
<br>
<center>
<img src="../image2/ba_goriyo-annai3.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image2/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font><br>
<table width="600" height="300"  border="1" bordercolor="#3D7BA3" align="center" cellpadding="30" cellspacing="0">
 <tr bgcolor="FFFFFF" align="left" valign="top">
      <td>
      	<center>
      		��${subject.name}��
      	</center>
      	<br><br>
      	����ʱ�䣺${subject.time}����<br><br>
      	����������${subject.totalnum}��<br><br>   	
      	���Է�����${subject.totalscore}��<br><br>      	      	
      	���Խ��ܣ�${subject.intro}<br><br>
      	����Ҫ�󣺽�ֹ���ף����Բ�Ҫ��������ҳ�棬����Ӱ�쿼����������<br><br><br><br>
		<center>	
			<html:form action="/student/exam/start" method="post">
				<input type="submit" value="��ʼ����">
			</html:form>
		</center>
      </td>
 </tr>    
</table>
</center>  
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>