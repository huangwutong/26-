  function saveUnit() {
     var unit = {unitName:null,unitPhone:null,unitFax:null,unitPost:null,unitAddress:null,unitNet:null,unitEmail:null,unitBank:null,nuitBankNo:null};
     dwr.util.getValues(unit);
     if(unit.unitName == "" || unit.unitPhone == "" || unit.unitFax == "" || unit.unitPost == "" || unit.unitAddress == "" ) {
        alert("数据不完整！");
        return;
     }
     if (unit.unitEmail == "" || !IsValidEmail(unit.unitEmail))
   	 { alert("请输入有效的电子信箱！");
     		return (false);
   	 }
   	 //alert("a");
     UnitService.insertUnit(unit,processSaveUnit);
  }
  
  function processSaveUnit(result) {
     //alert(result);
     if(result > 0) {
        $("message").innerHTML = "<font color='blue'>添加单位信息失败!</font>";
        
     } else {
        $("message").innerHTML = "<font color='red'>添加单位信息成功!</font>";
        clearUnit();
     }
  }
  
  function clearUnit() {
      var unit = {unitName:null,unitPhone:null,unitFax:null,unitPost:null,unitAddress:null,unitNet:null,unitEmail:null,unitBank:null,nuitBankNo:null};
      dwr.util.setValues(unit);
  }
  
  window.onload = function() {
      $("btnSave").onclick = saveUnit;
  }
  
  function IsNumber(str)
  {
  	  return str.match(/^[0-9]*$/)!=null;
  }

  function IsValidEmail(email)
  {
   	  var re = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9])+((\.[a-zA-Z]{2,3}){1,2})$/;   //   \w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
   	  //alert(email);
      return re.test(email);
  }