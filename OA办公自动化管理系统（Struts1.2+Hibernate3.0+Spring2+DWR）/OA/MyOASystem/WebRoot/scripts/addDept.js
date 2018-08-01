  
  window.onload = function() {
       fillTable();
       $("btnSave").onclick = saveDept;
   }
   
   function fillTable() {
   	  DeptService.findAllDept(showDept);
   }
   
   function showDept(list){
   	  dwr.util.removeAllRows("deptbody");
   	  dwr.util.addRows("deptbody",list,cellFuncs);
   }
   
   var cellFuncs = [
   	 function(dept) {return dept.deptName;},
   	 function(dept) {return dept.deptPhone;},
   	 function(dept) {return dept.deptFax;},
   	 function(dept) {return dept.deptRemark;}
   ];
   
   //添加部门信息 LEO
  function saveDept() {
     var dept = {deptName:null,deptPhone:null,deptFax:null,deptRemark:null};
     dwr.util.getValues(dept);
     if(dept.deptName == "" || dept.deptPhone == "" || dept.deptFax == "" ) {
        alert("数据不完整！");
        return;
     }
     DeptService.insertDept(dept,processSaveDept);
  }
  
  function processSaveDept(result) {
     if(result < 0) {
        $("message").innerHTML = "<font color='blue'>添加部门信息失败!</font>";
        //alert(result);
        
     } else {
        //alert(result);
        $("message").innerHTML = "<font color='red'>添加部门信息成功!</font>";
        fillTable();
        clearDept();
     }
  }
  
  function clearDept() {
      var dept = {deptName:null,deptPhone:null,deptFax:null,deptRemark:null};
      dwr.util.setValues(dept);
  }
  