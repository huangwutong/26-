window.onload=function(){
	$("dept").onchange=changeDept;
	$("btn").onclick=addUser;
}
function changeDept(){
	var deptId=$("dept").value;
	alert(deptId);
	if(deptId=="0"){
		$("position").value="0";
	}else{
		dwr.util.removeAllOptions("position");
		PositionService.loadPositions(deptId,processPositions);
	}
}

function processPositions(positions){
	for(i=0;i<positions.length;i++){
		var option = new Option(positions[i].positionName,positions[i].positionId);
		$("position").options.add(option);
	}
}

function addUser(){
	if(clickUser){
	   form1.submit();
		}
	
}

function clickUser(){
	var pstmt=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if($("dept").value=="0"){
		alert("请选择所属部门");
		return false;
	}
	else if($("position").value=="0"){
		alert("请选择所属部门");
		return false;
	}
	else if($("loginName").value==""){
		alert("登录名格式不正确");
		return false;
	}
	 else if($("userName").value=="0" || !isNaN($("userName").value)){
		alert("真实姓名格式不正确");
		return false;
	}
	else if($("age").value=="" || $("age").value<18 || !isNaN($("age").value)){
		alert("年龄格式不正确");
		return false;
	}
	else if($("address").value==""){
		alert("地址格式不正确");
		return false;
	}
	else if($("mobilePhone").value==""){
		alert("联系电话格式不正确");
		return false;
	}
	else if($("email").value=="" || patmt.test(email)==false){
		alert("电子邮件格式不正确");
		return false;
	}else{
		return true;
	}
}

