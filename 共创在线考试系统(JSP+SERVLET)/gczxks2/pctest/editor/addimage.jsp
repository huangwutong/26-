<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page  import="javazoom.upload.*,java.util.*" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="D:\test\test\testOnline\pic" />
</jsp:useBean>


<%/*
	String fname="";
	String sessionPic;
	String time1=request.getParameter("time1");
        System.out.print("begin upload");
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
        System.out.print("enter upload");
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);


                Hashtable files = mrequest.getFiles();
                if ( (files != null) || (!files.isEmpty()) )
                {
                    System.out.print("begin file");
                     UploadFile file = (UploadFile) files.get("src");
                    //out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
					fname=file.getFileName();
				    int num=fname.lastIndexOf(".");
				    int num1=fname.length();
	    			String extname=fname.substring(num,num1);

		    		fname=time1+extname;
                    file.setFileName(fname);
                    upBean.store(mrequest, "src");

                }
                else
                {
                  System.out.println(" No uploaded files");
                }
      }

    */
%>



<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<STYLE type=text/css>TD {
	FONT-SIZE: 10.8pt
}
BODY {
	FONT-SIZE: 10.8pt
}
BUTTON {
	WIDTH: 6em; HEIGHT: 25px
}
INPUT {
	HEIGHT: 25px
}
TD {
	FONT-SIZE: 9pt
}
</STYLE>
<title>����ͼƬ</title>
</HEAD>
<%
	Date nowtime=new java.util.Date();
	SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	String shijian=sf.format(nowtime);
%>

<SCRIPT event=onclick for=Ok language=JavaScript>
  filename=document.myform.src.value;
  if (filename!="")
  {
	  num=filename.lastIndexOf(".");
num1=filename.length;
  extname=filename.substring(num,num1);
  window.returnValue = "pic/"+<%=shijian%>+extname+"*"+alt.value;

  }
</SCRIPT>
<script>
function checknull()
  {if (document.myform.src.value=="")
     {alert('��ѡ�����ͼƬ��');
     return false;}
   }

</script>
<BODY style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-SIZE: 9pt; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" bgColor=menu>
<DIV align=center>
<CENTER>
<FORM name=myform action=SimpleUpload.jsp?time1=<%=shijian%>  method=post encType=multipart/form-data onsubmit="return checknull();">
<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
  <TBODY>
  <TR>
    <TD height=30>
      <DIV align=left valign="middle">ͼƬ��Դ(<U>P</U>): &nbsp;&nbsp;&nbsp;
	  <INPUT id=src type=file size=25 name=src valign="top">&nbsp;&nbsp;</DIV></TD>


	  <TD align=right>
	  <BUTTON type=submit id=Ok name=button1>�ϴ�</BUTTON></TD>
    </TR>
  <TR>


    <TD height=30>
      <DIV align=left valign="middle">�滻����(<U>T</U>): &nbsp;&nbsp;&nbsp;<INPUT
      style="WIDTH: 260px" align=top name=alt id=alt>&nbsp;&nbsp; </DIV></TD>
    <TD align=right><BUTTON id="close" onclick=window.close();>�ر�</BUTTON> </TD></TR>
  <TR>
    <TD><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width=215>
            <FIELDSET style="HEIGHT: 86px"><LEGEND align=left>����</LEGEND>
            <TABLE>
              <TBODY>
              <TR>
                <TD align=middle height=25>&nbsp;����(<U>A</U>):
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <SELECT
                  name=align> <OPTION>������</OPTION> <OPTION
                    value=left>��</OPTION> <OPTION value=right>��</OPTION> <OPTION
                    value=textTop>�ı��Ϸ�</OPTION> <OPTION
                    value=absMiddle>������</OPTION> <OPTION value=baseline
                    selected>����</OPTION> <OPTION value=absBottom>���·�</OPTION>
                    <OPTION value=bottom>��</OPTION> <OPTION
                    value=middle>��</OPTION> <OPTION
                value=top>��</OPTION></SELECT></TD></TR>
              <TR>
                <TD>&nbsp;�߿���(<U>B</U>):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <INPUT
                  style="WIDTH: 80px"
          name=border></TD></TR></TBODY></TABLE></FIELDSET></TD>
          <TD align=middle width=135>
            <FIELDSET style="HEIGHT: 86px"><LEGEND align=left>���</LEGEND>
            <TABLE>
              <TBODY>
              <TR>
                <TD vAlign=bottom>ˮƽ(<U>H</U>):&nbsp; <INPUT size=5
                  name=hspace></TD></TR>
              <TR>
                <TD vAlign=center>��ֱ(<U>V</U>):&nbsp; <INPUT size=5
                  name=vspace></TD></TR></TBODY></TABLE></FIELDSET></TD></TR></TBODY></TABLE></TD>
    <TD></TD></TR></TBODY></TABLE></FORM></CENTER></DIV></BODY></HTML>
