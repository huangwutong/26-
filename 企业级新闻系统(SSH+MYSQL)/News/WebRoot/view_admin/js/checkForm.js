//Article Post Form Check
  function checkForm(x){
      x.content.value = editContent.document.body.innerHTML;
      if(x.title.value == ""){
        alert("���������±��⣡");
        return false;
      }
      if(x.classId.selectedIndex == 0){
        alert("��ѡ���������");
        return false;
      }
      if(x.content.value == ""){
        alert("�������������ݣ�");
        return false;
      }
      return true;
  }
