 var htmlModeFlag = false;
 function InitDocument(){
   editContent.document.designMode = "On";
   editContent.document.open();
   editContent.document.write('<html><head><meta http-equiv=Content-Type content="text/html; charset=gb2312"></head><body></body></html>');
   editContent.document.close();
 }

 function doCommand(comm,value){
   if(comm == "copy" && editContent.document.selection.createRange().text == ""){
    alert("请选择你想复制的文字！");
    return;
   }
   if (value == null || value == "")
    editContent.document.execCommand(comm);
   else
    editContent.document.execCommand(comm,"",value);
   editContent.focus();
 }

 function doCommandAfterCheck(comm,value){
   if(!checkHtmlMode())
    return;
  else
    doCommand(comm,value);
 }

 function htmlMode(flag){
   if(flag){
    var cont = editContent.document.body.innerHTML;
    editContent.document.body.innerText = cont;
    htmlModeFlag = true;
   }
   else{
    var cont = editContent.document.body.innerText;
    editContent.document.body.innerHTML = cont;
    htmlModeFlag = false;
   }
 }

 function insertLink(){
   if (!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("请选择要作为超链接的文字！");
    return;
   }
   editContent.document.execCommand('CreateLink');
   htmlModeFlag = false;
   editContent.focus();
 }

 function insertImage(){
   var arr = showModalDialog("ImageUploadForm.jsp", window, "dialogWidth:420px;dialogHeight:160px;status:no;");
   if(arr != null)
    editContent.document.execCommand('InsertImage','',arr);
   editContent.focus();
   return;
 }

 function checkHtmlMode(){
   if(!htmlModeFlag)
    return true;
   alert("请取消“使用HTML方式编辑”！");
   editContent.focus();
   return false;
 }

 //字体加粗
 function strongFont(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("请选择要加粗的文字！");
    return;
   }
   editContent.document.execCommand("bold");
   editContent.focus();
 }

 //字体斜体
 function italicFont(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("请选择要使用斜体的文字！");
    return;
   }
   editContent.document.execCommand("italic");
   editContent.focus();
 }

 //左对齐
 function alignLeft(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifyleft");
   editContent.focus();
 }

 //居中对齐
 function alignCenter(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifycenter");
   editContent.focus();
 }

 //右对齐
 function alignRight(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifyright");
   editContent.focus();
 }

 //编号
 function insertOrderList(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("insertorderedlist");
   editContent.focus();
 }

 //项目符号
 function insertUnorderList(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("insertunorderedlist");
   editContent.focus();
 }

 //减少缩进
 function outDent(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("outdent");
   editContent.focus();
 }

 //增加缩进
 function inDent(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("indent");
   editContent.focus();
 }

 //字体颜色
 function setColor(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("请选择要设置颜色的文字！");
    return;
   }
   var arr = showModalDialog("editorFiles/color.htm", "", "dialogWidth:18.5em; dialogHeight:17em; status:0");
   if (arr != null)
    editContent.document.execCommand("forecolor","",arr);
   else
    editContent.focus();
 }
