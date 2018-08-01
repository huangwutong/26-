<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>
<%@ page  import="javazoom.upload.*,java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>

<%@ page import="jinghua.JinghuaConn" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="D:\\Develop\\Tomcat55\\webapps\\pctest\\editor\\pic" />
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">

<%    Date nowtime=new java.util.Date();
      SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
      String time1=sf.format(nowtime);
      String fname="";
      String pathname="";

     // mySmartUpload.initialize(pageContext);
     // mySmartUpload.setTotalMaxFileSize(500000);
      //mySmartUpload.upload();
      String msg=null;
      String strJS=null;
      boolean show=false;
      strJS="<SCRIPT language=javascript>" +"\n";


        //com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
        //fname="pic/"+time1+"."+myFile.getFileExt();
        //myFile.saveAs(fname, mySmartUpload.SAVE_VIRTUAL);
    if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = mrequest.getParameter("todo");
	 if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	 {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) || (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("FileName");
                    fname=file.getFileName();
                    String exn=fname.substring(fname.length()-3);
                    file.setFileName(time1+"."+exn);
                    upBean.store(mrequest);
                    file.reset();

                     //生成JS脚本

                    pathname="pic/"+time1+"."+exn;
                   // strJS=strJS+"function tempfun(){\n";
                    strJS=strJS+"    var strhtml=\"<img src='"+pathname+"' border=0>\";\n";
                    strJS=strJS+"    var win=parent.Composition.document;" +"\n";
                    strJS=strJS + "    parent.Composition.focus();" +"\n";
                    strJS=strJS+"    win.selection.createRange().pasteHTML(strhtml)"+"\n";
                    strJS=strJS+"    history.go(-1);" +"\n";
		    strJS=strJS+ "    parent.Composition.focus();\n";
                   // strJS=strJS+"}";
                    msg="文件上传成功!";
                    show=true;

                  }
                else
	        {
                  msg="文件上传失败"+"No uploaded files";
	        }
	 }else
         {
           msg="文件上传失败"+"todo="+todo;
         }
      }

      strJS=strJS + "alert('" + msg + "');" +"\n";
      strJS=strJS + "parent.Composition.focus();" +"\n";
      strJS=strJS + "</script>";
      out.print(strJS);
      //response.sendRedirect("upload.jsp");

%>


</body>
</html>

