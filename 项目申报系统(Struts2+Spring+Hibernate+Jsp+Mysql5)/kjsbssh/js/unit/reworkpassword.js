function check(form){
	alert("");
	if(form.oldpassword.value==""){
		alert("密码不能为空！");
		return false;
	}
	if(form.oldpassword.value.length()>6&&form.oldpassword.value.length()<4){
		alter("您输入的密码长度不对！");
		form.newPassword.focus();
		return false;
		
	}
	return true;
}
