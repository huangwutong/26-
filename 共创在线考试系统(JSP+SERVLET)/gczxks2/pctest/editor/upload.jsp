<%@ page contentType="text/html; charset=gb2312" language="java"  errorPage="" %>

<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>





<%--


   // if ( (todo != null) && (todo.equalsIgnoreCase("upload")) ){
   //int i=mySmartUpload.getFiles().getCount();
   //if(i>0){
      Date nowtime=new java.util.Date();
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
                    strJS=strJS+"   var strhtml=\"<img src='"+pathname+"' border=0>\";\n";
                    strJS=strJS+"    var win=parent.Composition.document;" +"\n";
                    strJS=strJS + "    parent.Composition.focus();" +"\n";
                    strJS=strJS+"    win.selection.createRange().pasteHTML(strhtml)"+"\n";
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
--%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
BODY{
BACKGROUND-COLOR: #C0C0C0;
font-size:9pt
}
.tx1 { height: 20px;font-size: 9pt; border: 1px solid; border-color: #000000; color: #0000FF}
-->
</style>

<SCRIPT language=javascript>
function check()
{
	var strFileName=form1.FileName.value;
	var FileType;
	var ImgWH;
	if (strFileName=="")
	{
    	alert("请选择要上传的文件");
    	return false;
  	}
  	else
  	{
		FileType=strFileName.substr(strFileName.length-3)
		FileType=FileType.toLowerCase();
		if (!(FileType=="jpg" || FileType=="bmp" || FileType=="gif" || FileType=="png" ))
		{
                  alert("请上传图片文件!");
                  return false
		}

  	}
}
function insertHtml(HtmlCode)
{
  var win=parent.Composition.document;//其中编辑区域是gledit.jsp中的一个iframe，id是idEditbox
  parent.Composition.focus();//是编辑器获得焦点，防止代码插入在编辑器外地方
win.selection.createRange().pasteHTML(HtmlCode)//在光标的位置插入html代码
}

-->
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0">

<form action="SimpleUpload.jsp" method="post" name="form1" onSubmit="return check()" enctype="multipart/form-data">
  <input name="FileName" type="FILE" class="tx1" size="27">
   <input type="hidden" name="todo" value="upload">
  <input type="submit" name="Submit" value="上传" style="border:1px double rgb(88,88,88);font:9pt">

</form>

</body>
</html>
