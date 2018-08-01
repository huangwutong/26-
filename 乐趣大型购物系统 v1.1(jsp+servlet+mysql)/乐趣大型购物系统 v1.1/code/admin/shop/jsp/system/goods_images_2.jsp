<%@ page contentType="text/html;charset=gb2312"%>
<%@ page errorPage="errorPage.jsp" session="true" %>
<%@ page import="java.util.*" %>
<%@ include file="../include/head.jsp"%>
<%
    
    String aid =(String)session.getAttribute("aid");
    Date d1 = new Date();
    String d_int=d1.getYear()+""+d1.getMonth()+""+d1.getDate()+ ""+d1.getHours()+""+d1.getMinutes()+""+d1.getSeconds();                
    com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();

    mySmartUpload.initialize(pageContext); 
    //设置上载的最大值
    mySmartUpload.setMaxFileSize(500 * 1024*1024);
    //上载文件
    mySmartUpload.upload();
    com.jspsmart.upload.Request req = mySmartUpload.getRequest();
    String inc = req.getParameter("inc");
    String brief=req.getParameter("brief");;
    d_int = inc + "s" + d_int;
    String pic_url="image/upload/shop/"+d_int;     
    //循环取得所有上载的文件
    for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
	   //取得上载的文件
	   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
	   
	   if (!myFile.isMissing())
	    {
	   //取得上载的文件的文件名
	    String myFileName=myFile.getFileName();	    
	    	    
	//    out.println("filename---------------->"+myFileName);
	//    out.println("<br>");
	    
	    //取得不带后缀的文件名
	    String  suffix=myFileName.substring(0,myFileName.lastIndexOf('.'));
	 //   out.println("suffix---------------->"+suffix);
	//    out.println("<br>");
	    
	    //取得后缀名
	    String  ext= mySmartUpload.getFiles().getFile(0).getFileExt();  
	    pic_url += "."+ext;
	    myFileName = d_int+"."+ext;
	    out.println("ext---------------->"+myFileName);
	   // out.println("<br>");
	    boolean is_image = ext.equals("gif")||ext.equals("jpg")||ext.equals("GIF")||ext.equals("JPG");
	    if(!is_image)
	    {
	       //out.println("not image!!");
	       throw new Exception("上传图片类型只能是gif或jpg文件，请检您的图片路径和文件类型!");
	    }
	    //取得文件的大小  
	    int fileSize=myFile.getSize();
	   // out.println("fileSize---------------->"+fileSize);
	   // out.println("<br>");
	    
	    if(fileSize>1*1024*1024 )
	    {
	       throw new Exception("上传图片不能大于1M!!");
	    }
	    
	    if(fileSize==0)
	    {
	       throw new Exception("上传图片不存在，请确定您选择的图片路径是否正确!!");
	    }	    
	    //保存路径
	    String aa=getServletContext().getRealPath("/")+"/"+"image/upload/shop/";
	    String trace=aa+myFileName;
	    System.out.println("path----------->"+trace);
	   // out.println("<br>");
	    //将文件保存在服务器端 
	    myFile.saveAs(trace,mySmartUpload.SAVE_PHYSICAL);   
	    managegoods.createImages(inc,pic_url,brief,aid); 
            response.sendRedirect("goods_images.jsp?inc="+inc+"");   
	    //out.println(("上载成功！！！").toString());
	   }
	  } 	
%>