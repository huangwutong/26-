<%@ page language="java" contentType="text/html;charset=GB2312"%>
<html>
	<head>
		<style>   
  a{text-decoration:none}   
  </style>   

  <script>                     
  var   h=null   
  function   hit(path, obj){   
  if(!h)h=obj;   
  h.style.color='';   
  h=obj;   
  h.style.color='red'
  parent.maina.location.href=path;
  }   
  </script>
	</head>
	<form>
<a href="#" onclick="hit('<%=request.getContextPath()%>/login.jsp', this)">��ȫ����</a>
<br><br><a href="#" onclick="hit('<%=request.getContextPath()%>/bookma.do?method=booklist', this)">ͼ��ά��</a>
<br><br><a href="#" onclick="hit('<%=request.getContextPath()%>/doginfo.do?method=doginfolist', this)">���Ǽ���Ϣά��</a>
<br><br>�ۺϲ�ѯ
</form>