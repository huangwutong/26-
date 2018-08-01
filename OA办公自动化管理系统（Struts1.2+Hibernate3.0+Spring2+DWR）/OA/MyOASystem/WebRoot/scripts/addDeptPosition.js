  //添加部门职位（角色） LEO
  function saveDeptPosition() {
     var deptPosition = {deptName:null,deptPhone:null,deptFax:null,deptRemark:null};
     dwr.util.getValues(dept);
     if(deptPosition.deptName == "" || deptPosition.deptPhone == "" || deptPosition.deptFax == "" ) {
        alert("数据不完整！");
        return;
     }
     DeptPositionService.insertDept(deptPosition,processSaveDeptPosition);
  }
  
  function processSaveDeptPosition(result) {
     if(result > 0) {
        $("message").innerHTML = "<font color='blue'>添加部门信息成功!</font>";

     } else {
        $("message").innerHTML = "<font color='red'>添加部门信息失败!</font>";
        clearDeptPosition();
     }
  }
  
  function clearDeptPosition() {
      var deptPosition = {deptName:null,deptPhone:null,deptFax:null,deptRemark:null};
      dwr.util.setValues(deptPosition);
  }
  
  window.onload = function() {
      $("btnSave").onclick = saveDeptPosition;
  }