//设置表单
$.validator.setDefaults({
	submitHandler: function(form) {form.submit(); }
});

$().ready(function() {
	// validate the comment form when it is submitted
	//$("#commentForm").validate();
	
	// validate signup form on keyup and submit
	$("#commentForm").validate({
		rules: {
			name: {
				required: true
			},
			password: {
				required: true
			},
			confirm_password: {
				required: true,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			}
		 
		},
		messages: {
			name: {
				required: "必须输入！"
			},
			password: {
				required: "密码必须输入！"
			},
			confirm_password: {
				required: "确认密码必须输入！",
				equalTo: "两次输入密码不相同！"
			},
			email: {
				required: "email地址必须输入!",
				email: "请输入正确格式的email地址！"
			}
			
		}
	});
});	
	
	
 
 
 
 function validateEmail(){
    var regex=new RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$");
   var email = document.getElementById("email");
   var param = email.value;
   if(param==""){
      alert("电子邮件必须填写！");
      email.focus();
	  return false;
    }else{
      if(!regex.test(param)){
		        alert("邮箱格式输入不正确!");
				email.focus();
				return false;
		}
     }
  }
  function validateEndDate(){
   alert("aa");
   var begintm = document.getElementById("begintm");
   var endtm = document.getElementById("endtm");
   var param = begintm.value;
   var param1 = endtm.value;
   if(param==""||param1==""){
      alert("服务开始时间 与 服务截至时间 必填！");
      return false;
    }else{
       if(param > param1){
          alert("服务开始时间 不能 晚于服务截至时间！");
          return false;
        }
     }
  }