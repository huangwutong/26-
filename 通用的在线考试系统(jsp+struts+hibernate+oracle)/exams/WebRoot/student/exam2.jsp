<%@ page language="java" pageEncoding="GB18030" import="java.util.*,com.xdf.exams.bean.*,com.xdf.exams.web.form.*,com.xdf.exams.util.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%
	response.setHeader("pragma","no-cache");
	response.setHeader("cache-control","no-cache");
	response.setHeader("expires","0");
 %>
<jsp:include flush="true" page="/student/examttop.jsp"></jsp:include>
<center>
<br>
<font color="red">${message}</font>
<br>
<logic:present name="question">
��${subject.name }�����ڿ���,ʣ��ʱ��:<span id="tttt" style="color: red">&nbsp;</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="��  ��" onclick="jiaojuan()">
<br><br><font color='red'>
<span id="message" style="font-size: 150%">&nbsp;</span>
</font>
<br><br>
<html:form action="/student/exam/go" method="post">
<html:hidden property="oldid"/>
<html:hidden property="nowid"/>
<table width="600"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3" style="WORD-BREAK: break-all; WORD-WRAP: break-word">
    <tr bgcolor="94C9E7" align="center">
      <td width="10%" >���</td>
      <td width="20%" bgcolor="FFFFFF">��${examForm.nowid+1}/${subject.totalnum}��</td>
      <td width="15%">����</td>
      <td width="20%" bgcolor="FFFFFF">${question.score}��</td>
      <td width="15%">����</td>
      <td width="20%" bgcolor="FFFFFF">${question.qtype==0?"��ѡ��":"��ѡ��"}</td>
    </tr>
	<tr bgcolor="ffffff" align="center">
	  <td colspan="6" align="left" valign="top" height="100">
	  ��Ŀ��<br><br>&nbsp;&nbsp;
	  <%
	  	Question q = (Question)request.getAttribute("question"); 
	  	out.print(Tools.filtHTML(q.getContent()));
	  %>
	  </td>
	</tr>     
	<%
		ExamForm ef = (ExamForm)(request.getAttribute("examForm"));
		Question ques = (Question)request.getAttribute("question");
		Set opts = ques.getOptionses();
		char indx = 'A';
		for (Object o:opts){
		Options opt = (Options)o;
		
	 %>
 	<tr bgcolor="ffffff" >
 	  <td align="right" valign="top" width="10%"><input type="checkbox"  name="answers" value="<%=indx+""%>" onclick="checkm(this)" <%
 	  String str = "";
 	  if(ef.getAnswers()!=null){
 	  	for (String s:ef.getAnswers()){
 	  		if(s!=null&&s.equals(indx+"")){
 	  			str = "checked";
 	  		}
 	  	}
 	  }
 	  out.print("checked");
 	  %>/>&nbsp;<%=indx%>&nbsp;</td>
      <td colspan="5" align="left" valign="middle"><%=Tools.filtHTML(opt.getContent())%>&nbsp; </td>
     </tr>
	<%
		indx++;
	}%>
</table><br>
	<div align="center" >
		<input type="submit" value="��һ��" ${examForm.nowid<=0?"disabled":""} onclick="this.form.nowid.value=${examForm.nowid-1}">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="��һ��" ${examForm.nowid>=subject.totalnum-1?"disabled":""} onclick="this.form.nowid.value=${examForm.nowid+1}">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select onchange="document.examForm.nowid.value=this.value;document.examForm.submit()">
		<%
		//ExamForm ef = (ExamForm)request.getAttribute("examForm");
		int nid = ef.getNowid();
		List examinglist =(List)session.getAttribute("examinglist");
		for(int i=0;i<examinglist.size();i++){ 
			Examrecord er = (Examrecord)examinglist.get(i);
		%>
		<option value="<%=i%>"	<%if(i==nid)out.print("selected");%>>
	��<%=i+1%>��&nbsp;&nbsp;<%=er.getAnswer()!=null&&!er.getAnswer().equals("")?"����":"δ��"%></option>
		<%}%>
		</select>

		
	</div>
</html:form>
</logic:present>
</center>  
<script>
	function checkm(ck){
		var t = ${question.qtype};
		if (t==0){
			var a = 0;
			for (i=0;i<document.examForm.answers.length;i++){
				if(document.examForm.answers[i].checked){
					a++;
					if(a>=2){
						alert("��ѡ��ֻ����һ����!");
						ck.checked=false;
						document.examForm.submit();
						return;
					}
				}
			}
		}
	}

     var remainsec = ${remainsec};
     function goclock(){
       remainsec -= 1;
       if(remainsec<=0){
         document.examForm.action = '<html:rewrite page="/student/exam/end.do" />';
         document.examForm.submit();
         return;
       }
       var min = Math.floor(remainsec/60);
       var sec = remainsec%60;
       var secs = sec<10?"0"+sec:sec;
       var st = min+"���� "+secs+"��";
       if(remainsec<300)
       {
         document.getElementById("message").innerHTML = "ʱ���Ҫ������ע��!";
       }
       document.getElementById("tttt").innerHTML = st;
       window.setTimeout("goclock()",1000);
     }
      goclock();
      
      function jiaojuan(){
      if(window.confirm("�Ƿ񽻾���������޸�!")&&window.confirm("���ٴ�ȷ���Ƿ񽻾���������޸�!")){
		document.examForm.action='<html:rewrite page="/student/exam/end.do" />';
		document.examForm.submit();      
      }else{
      	document.examForm.submit();      
      }
      }
</script>
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>