 var htmlModeFlag = false;
 function InitDocument(){
   editContent.document.designMode = "On";
   editContent.document.open();
   editContent.document.write('<html><head><meta http-equiv=Content-Type content="text/html; charset=gb2312"></head><body></body></html>');
   editContent.document.close();
 }

 function doCommand(comm,value){
   if(comm == "copy" && editContent.document.selection.createRange().text == ""){
    alert("��ѡ�����븴�Ƶ����֣�");
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
    alert("��ѡ��Ҫ��Ϊ�����ӵ����֣�");
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
   alert("��ȡ����ʹ��HTML��ʽ�༭����");
   editContent.focus();
   return false;
 }

 //����Ӵ�
 function strongFont(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("��ѡ��Ҫ�Ӵֵ����֣�");
    return;
   }
   editContent.document.execCommand("bold");
   editContent.focus();
 }

 //����б��
 function italicFont(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("��ѡ��Ҫʹ��б������֣�");
    return;
   }
   editContent.document.execCommand("italic");
   editContent.focus();
 }

 //�����
 function alignLeft(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifyleft");
   editContent.focus();
 }

 //���ж���
 function alignCenter(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifycenter");
   editContent.focus();
 }

 //�Ҷ���
 function alignRight(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("justifyright");
   editContent.focus();
 }

 //���
 function insertOrderList(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("insertorderedlist");
   editContent.focus();
 }

 //��Ŀ����
 function insertUnorderList(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("insertunorderedlist");
   editContent.focus();
 }

 //��������
 function outDent(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("outdent");
   editContent.focus();
 }

 //��������
 function inDent(){
   if(!checkHtmlMode())
    return;
   editContent.document.execCommand("indent");
   editContent.focus();
 }

 //������ɫ
 function setColor(){
   if(!checkHtmlMode())
    return;
   if(editContent.document.selection.createRange().text == ""){
    alert("��ѡ��Ҫ������ɫ�����֣�");
    return;
   }
   var arr = showModalDialog("editorFiles/color.htm", "", "dialogWidth:18.5em; dialogHeight:17em; status:0");
   if (arr != null)
    editContent.document.execCommand("forecolor","",arr);
   else
    editContent.focus();
 }
