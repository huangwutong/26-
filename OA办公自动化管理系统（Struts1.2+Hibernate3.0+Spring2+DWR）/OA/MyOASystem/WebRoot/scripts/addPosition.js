   
   window.onload = function() {
       fillTable();
       $("btnSave").onclick = savePosition;
   }
   
   function fillTable() {
   	  PositionService.findAllPosition(showPosition);
   }
   
   function showPosition(list){
   	  dwr.util.removeAllRows("positionbody");
   	  dwr.util.addRows("positionbody",list,cellFuncs);
   }
   
   var cellFuncs = [
   	 function(position) {return position.positionName;},
   	 function(position) {return position.positionRemark;}
   ];
   
   
   //添加职位信息 LEO
  function savePosition() {
     var position = {positionName:null,positionRemark:null};
     dwr.util.getValues(position);
     if(position.positionName == "" || position.positionRemark == "" ) {
        alert("数据不完整！");
        return;
     }
     PositionService.insertPosition(position,processSavePosition);
  }
  
  function processSavePosition(result) {
     if(result > 0) {
        $("message").innerHTML = "<font color='blue'>添加职位信息失败!</font>";
        //alert(result);
        
     } else {
     	//alert(result);
        $("message").innerHTML = "<font color='red'>添加职位信息成功!</font>";
        fillTable();
        clearPosition();
     }
  }
  
  function clearPosition() {
      var position = {positionName:null,positionRemark:null};
      dwr.util.setValues(position);
  }
