//Article Post Form Check
  function checkForm(x){
      x.content.value = editContent.document.body.innerHTML;
      if(x.title.value == ""){
        alert("请输入文章标题！");
        return false;
      }
      if(x.classId.selectedIndex == 0){
        alert("请选择文章类别！");
        return false;
      }
      if(x.content.value == ""){
        alert("请输入文章内容！");
        return false;
      }
      return true;
  }
