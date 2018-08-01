// JavaScript Document
//var GetValue=document.getElementById;
var This_State=false;
var ajax=new AJAXRequest;
ajax.setcharset("GB2312");
//alert(ajax);
//错误提示语句
var This_Content= new Array();
This_Content[0]="<span class='newstate'>错误! 请填写您的姓名!</span>";
This_Content[1]="<span class='newstate'>错误! 请填写您的用户名!</span>";
This_Content[2]="<span>正在检测,请稍后!</span>";
This_Content[3]="<span class='newstate'>抱歉!用户名已被注册,请重新选择!</span>";
This_Content[4]="<span class='newstate'>抱歉!手机号码的长度必须是11位,请重新填写!</span>";
This_Content[5]="<span class='newstate'>抱歉!手机号码必须全是数字,请重新填写!</span>";
This_Content[7]="<span class='newstate'>抱歉!手机号码已被注册,请重新选择!</span>";
This_Content[8]="<span class='newstate'>抱歉!邮箱地址已被注册,请重新选择!</span>";
This_Content[9]="<span class='newstate'>错误! 请填写您的密码!</span>";
This_Content[10]="<span class='newstate'>错误! 请填写确认密码!</span>";
This_Content[11]="<span class='newstate'>错误! 两次输入密码不一致,请重新输入!</span>";
This_Content[13]="<span class='newstate'>错误! 请输入您的邮箱!</span>";
This_Content[14]="<span class='newstate'>邮箱地址有误,请重新输入!</span>";
This_Content[15]="<span class='newstate'>错误! 请填写您的手机号!</span>";
This_Content[16]="<span class='newstate'>错误! 用户名不符合长度(3-20位),请重新输入!</span>";
This_Content[17]="<span class='newstate'>错误! 密码不符合长度(6-20位),请重新输入!</span>";
This_Content[18]="<span class='newstate'>错误! 请填写国籍!</span>";
This_Content[19]="<span class='newstate'>错误! 请填写所在城市!</span>";
This_Content[20]="<span class='newstate'>错误! 请选择您的生日,可只填写月份,日期!</span>";
This_Content[21]="<span class='newstate'>错误! 请完善您的证件号码!</span>";

//正确提示语句
var True_Content= new Array();
True_Content[0]="<span class='okstate'>正确!</span>";
True_Content[1]="<span class='okstate'>当前用户名可用!</span>";
True_Content[2]="<span class='okstate'>成功!</span>";
True_Content[3]="<span class='okstate'>当前手机号码可用!</span>";
True_Content[4]="<span class='okstate'>当前邮箱地址可用!</span>";
//定义错误类型
var On_Xing="<span class='newstate'>错误!  请填写您的姓名!!</span>";
var On_User_Name="<span class='newstate'>错误!  请填写您的用户名!!</span>";
var On_User_Password="<span class='newstate'>错误!  请填写您的密码!!</span>";
var On_user_Password2="<span class='newstate'>错误!  请再确认一遍密码!!</span>";
var On_User_Mobile="<span class='newstate'>错误!  请填写您的手机号!!</span>";
var On_User_Email="<span class='newstate'>错误!  请输入您的邮箱!!</span>";
var On_User_Country="<span class='newstate'>错误! 请填写国籍!!</span>";
var On_User_City="<span class='newstate'>错误! 请填写所在城市!!</span>";
var On_User_Birthday="<span class='newstate'>错误! 请选择您的生日,可只填写月份,日期!!</span>";
var On_User_Card="<span class='newstate'>错误! 请完善您的证件号码!!</span>";
//定义错误显示内容
var Err_Content="";
//验证用户姓名
function Check_User_Xing(){
	var User_Xing=ReplaceStr(document.getElementById("User_Xing").value);
	document.getElementById("User_Xing").value=User_Xing;
	if (User_Xing==""||User_Xing==null){
		document.getElementById("U_Name").innerHTML=This_Content[0];
		This_State=true;
		On_Xing=This_Content[0];
		}
	//alert(User_Xing);
	}
function Check_User_Ming(){
	var User_Ming=ReplaceStr(document.getElementById("User_Ming").value);
	var User_Xing=ReplaceStr(document.getElementById("User_Xing").value);
	document.getElementById("User_Ming").value=User_Ming;	
	if (User_Ming==""||User_Ming==null){
		document.getElementById("U_Name").innerHTML=This_Content[0];
		This_State=true;
		On_Xing=This_Content[0];
		}else if(User_Xing!=""&&User_Xing!=null&&User_Ming!=""&&User_Ming!=null){
			document.getElementById("U_Name").innerHTML=True_Content[0];
			On_Xing="OK";
			}
	}
//验证用户名
function Check_User_Name(txt){
	var this_type=txt;
	var User_Name=ReplaceStr(document.getElementById("User_Name").value);
	document.getElementById("User_Name").value=User_Name;
	if (User_Name==""||User_Name==null){
		document.getElementById("U_ID").innerHTML=This_Content[1];
		This_State=true;
		On_User_Name=This_Content[1];
	}else if(User_Name.length<3||User_Name.length>20){
		document.getElementById("U_ID").innerHTML=This_Content[16];
		This_State=true;
		On_User_Name=This_Content[16];
		}else{
		document.getElementById("U_ID").innerHTML=This_Content[2];
		//alert(User_Name);
		if (txt=="0"){
		Send_value(User_Name,'1','0');
		}else{
		Send_value(User_Name,'1',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}
//验证密码
function Check_User_Password(){
	var User_Password=ReplaceStr(document.getElementById("User_Password").value);
	document.getElementById("User_Password").value=User_Password;
	
	//alert(User_Password);
	if (User_Password==""||User_Password==null){
		document.getElementById("U_Pwd").innerHTML=This_Content[9];
		This_State=true;
		On_User_Password=This_Content[9];
		}else if(User_Password.length<6||User_Password.length>20){
		document.getElementById("U_Pwd").innerHTML=This_Content[17];
		This_State=true;
		On_User_Password=This_Content[17];
		}else{
			document.getElementById("U_Pwd").innerHTML="";
			On_User_Password="OK";
			}
	}
function Check_User_Password2(){
	var User_Password=ReplaceStr(document.getElementById("User_Password").value);
	var User_Password2=ReplaceStr(document.getElementById("User_Password2").value);
	document.getElementById("User_Password2").value=User_Password2;
	if (User_Password2==""||User_Password2==""){
		document.getElementById("U_Cpwd").innerHTML=This_Content[10];
		On_user_Password2=This_Content[10];
		}else if(User_Password!=User_Password2){
		document.getElementById("U_Cpwd").innerHTML=This_Content[11];
		On_user_Password2=This_Content[11];
		This_State=true;
		}else{
			document.getElementById("U_Cpwd").innerHTML=True_Content[2];
			On_user_Password2="OK";
			}
	}
//验证手机
function Check_User_Mobile(txt){
	var this_type=txt;
	var User_Mobile=ReplaceStr(document.getElementById("User_Mobile").value);
	document.getElementById("User_Mobile").value=User_Mobile;
	//alert(User_Mobile.length);
	if (User_Mobile==""||User_Mobile==null){
		document.getElementById("U_Phone").innerHTML=This_Content[15];
		This_State=true;
		On_User_Mobile=This_Content[15];
		
	}else if(User_Mobile.length!=11){
		document.getElementById("U_Phone").innerHTML=This_Content[4];
		This_State=true;
		On_User_Mobile=This_Content[4];
		}else if(Check_Digital(User_Mobile)==false){
			document.getElementById("U_Phone").innerHTML=This_Content[5];
			On_User_Mobile=This_Content[5];
			This_State=true;
			}else{
		document.getElementById("U_Phone").innerHTML=This_Content[2];
		//alert(User_Name);
		if (txt=="0"){
		Send_value(User_Mobile,'2','0');
		}else{
		Send_value(User_Mobile,'2',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}	
//验证邮箱
function Check_User_Email(txt){
	var this_type=txt;
	var User_Email=ReplaceStr(document.getElementById("User_Email").value);
	document.getElementById("User_Email").value=User_Email;
	if (User_Email==""||User_Email==null){
		document.getElementById("U_Email").innerHTML=This_Content[13];
		This_State=true;
		On_User_Email=This_Content[13];
	}else if(Check_Email(User_Email)==false){
		document.getElementById("U_Email").innerHTML=This_Content[14];
		This_State=true;
		On_User_Email=This_Content[14];
		}else{
		document.getElementById("U_Email").innerHTML=This_Content[2];
		//alert(User_Name);
				if (txt=="0"){
		Send_value(User_Email,'3','0');
		}else{
		Send_value(User_Email,'3',this_type);
			}
		//results=document.getElementById("postresults").value;
		//alert(results);		
	}
}	
//验证国籍
function Check_User_Country(){
	var User_Country=ReplaceStr(document.getElementById("User_Country").value);
	document.getElementById("User_Country").value=User_Country;
	
	//alert(User_Password);
	if (User_Country==""||User_Country==null){
		document.getElementById("U_Country").innerHTML=This_Content[18];
		This_State=true;
		On_User_Country=This_Content[18];
		}else{
			document.getElementById("U_Country").innerHTML=True_Content[2];
			On_User_Country="OK";
			}
	}
//验证城市
function Check_User_City(){
	var User_City=ReplaceStr(document.getElementById("User_City").value);
	document.getElementById("User_City").value=User_City;
	
	//alert(User_Password);
	if (User_City==""||User_City==null){
		document.getElementById("U_City").innerHTML=This_Content[19];
		This_State=true;
		On_User_City=This_Content[19];
		}else{
			document.getElementById("U_City").innerHTML=True_Content[2];
			On_User_City="OK";
			}
	}	
//验证生日
function Check_User_Birthday(){
	
	var Check_User_Birthday_YY=ReplaceStr(document.getElementById("User_Birthday_YY").value);
	var Check_User_Birthday_MM=ReplaceStr(document.getElementById("User_Birthday_MM").value);
	var Check_User_Birthday_DD=ReplaceStr(document.getElementById("User_Birthday_DD").value);
	document.getElementById("User_Birthday_YY").value=Check_User_Birthday_YY;
	document.getElementById("User_Birthday_MM").value=Check_User_Birthday_MM;
	document.getElementById("User_Birthday_DD").value=Check_User_Birthday_DD;	
	//alert(User_Password);
	if (Check_User_Birthday_MM==""||Check_User_Birthday_MM==null||Check_User_Birthday_DD==""||Check_User_Birthday_DD==null){
		document.getElementById("U_Birthday").innerHTML=This_Content[20];
		This_State=true;
		On_User_Birthday=This_Content[20];
		}else{
			document.getElementById("U_Birthday").innerHTML=True_Content[2];
			On_User_Birthday="OK";
			}
	}
//验证省份证号
function Check_User_Card(){
	
	var Check_User_Card_Class=ReplaceStr(document.getElementById("User_Card_Class").value);
	var Check_User_Card_Number=ReplaceStr(document.getElementById("User_Card_Number").value);
	document.getElementById("User_Card_Number").value=Check_User_Card_Number;	
	//alert(User_Password);
	if (Check_User_Card_Class=="0"||Check_User_Card_Number==""||Check_User_Card_Number==null){
		document.getElementById("U_Card").innerHTML=This_Content[21];
		This_State=true;
		On_User_Card=This_Content[21];
		}else{
			document.getElementById("U_Card").innerHTML=True_Content[2];
			On_User_Card="OK";
			}
	}	
	
	
//替换全角数字函数
function ReplaceStr(val){
		var Str=val;
	for(var i=0; i<Str.length; i++){
		Str=Str.replace("０","0");
		Str=Str.replace("１","1");
		Str=Str.replace("２","2");
		Str=Str.replace("３","3");
		Str=Str.replace("４","4");
		Str=Str.replace("５","5");
		Str=Str.replace("６","6");
		Str=Str.replace("７","7");
		Str=Str.replace("８","8");
		Str=Str.replace("９","9");
		}
		return Str
	}
//验证内容是否全是数字函数
function Check_Digital(txt){
	var allValid=true;
	var content=txt;
	var checkOK = "0123456789";
		for (i = 0;  i < content.length;  i++)
		{
		   ch = content.charAt(i);
		   for (j = 0;  j < checkOK.length;  j++)
		     if (ch == checkOK.charAt(j))
		      break;
			  if (j == checkOK.length)
			   {
			     allValid = false;
			      break;
			    }
		}
	return allValid;
	}
//验证邮箱地址函数
function Check_Email(txt){
	var allValid=true;
	var content=txt;
	var	checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_@.-";
	for (i = 0;  i < content.length;  i++)
		{
		   ch = content.charAt(i);
		   for (j = 0;  j < checkOK.length;  j++)
		     if (ch == checkOK.charAt(j))
		      break;
			  if (j == checkOK.length)
			   {
			     allValid = false;
			      break;
			    }
		}
	if (content.indexOf("@")==-1){
		allValid = false;
		}
	if (content.indexOf(".")==-1){
		allValid = false;
		}
	return allValid;
	}
//AJAX验证手机号码,用户名,邮箱函数
function Send_value(chr,type,uid){
	var this_value=chr;
	var this_type=type;
	var this_uid=uid;
	var this_user_name=document.getElementById("U_ID");
	var this_user_mobile=document.getElementById("U_Phone");
	var this_user_email=document.getElementById("U_Email");
	var varchr;
	//alert("/member/Check_All.asp?this_type="+this_type+"&this_value="+chr+"&this_uid"+this_uid);
	//alert("Check_All.asp?this_type="+this_type+"&this_value="+chr);
	ajax.get("/member/Check_All.asp?this_type="+this_type+"&this_value="+chr+"&this_uid="+this_uid,
			 function(obj) {
				//alert(this_type);
				//document.getElementById("postresults").value=obj.responseText;
				  varchr=obj.responseText;
				  //alert (this_user_name.value);	
				 if (varchr=="true"){	 
					switch(this_type){
						case "1":
						//this_user_name.innerHTML=True_Content[4];
						document.getElementById("U_ID").innerHTML=True_Content[1];
						On_User_Name="OK";
						break;
						case "2":
						document.getElementById("U_Phone").innerHTML=True_Content[3];
						On_User_Mobile="OK";
						break;
						case "3":
						document.getElementById("U_Email").innerHTML=True_Content[4];
						On_User_Email="OK";
						break;
						}
						//修改全局变量为真
					}else{
					switch(this_type){
						case "1":
						document.getElementById("U_ID").innerHTML=This_Content[3];
						On_User_Name=This_Content[3];
						break;
						case "2":
						document.getElementById("U_Phone").innerHTML=This_Content[7];
						On_User_Mobile=This_Content[7];
						break;
						case "3":
						document.getElementById("U_Email").innerHTML=This_Content[8];
						On_User_Email=This_Content[8];
						break;
						}
						//修改全局变量为假
					}
				
			});
	}
//验证表单
function This_Submit(){
	//this_txt=document.getElementById("Err_Content");
 if (On_Xing=="OK"&&On_User_Name=="OK"&&On_User_Password=="OK"&&On_user_Password2=="OK"&&On_User_Mobile=="OK"&&On_User_Email=="OK"){
		  document.form1.submit();
		 }else{
	Err_Content="<p class='tstitle'>提示</p>";
	if (On_Xing!="OK"){
		Err_Content=Err_Content+"<p>"+On_Xing+"</p>";
		}	 
	if (On_User_Name!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Name+"</p>";
		}
	if (On_User_Password!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Password+"</p>";
		}
	if (On_user_Password2!="OK"){
		Err_Content=Err_Content+"<p>"+On_user_Password2+"</p>";
		}
	if (On_User_Mobile!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Mobile+"</p>";
		}
	if (On_User_Email!="OK"){
		Err_Content=Err_Content+"<p>"+On_User_Email+"</p>";
		}
		//alert(document.getElementById("Err_Content").innerHTML);
		document.getElementById("Err_Content").style.display="block";
		document.getElementById("Err_Content").innerHTML=Err_Content;
		return (false);
	 }	//alert(On_Xing+On_User_Name+On_User_Password+On_user_Password2+On_User_Mobile+On_User_Email);
	
	}
//验证表单
function Check_Submit(){
	//this_txt=document.getElementById("Err_Content");
	Err_Content="<p class='tstitle'>提示</p>";
	if (!(On_Xing=="OK"||On_Xing=="<span class='newstate'>错误!  请填写您的姓名!!</span>")){
		Err_Content=Err_Content+"<p>"+On_Xing+"</p>";
		}	 
	if (!(On_User_Name=="OK"||On_User_Name=="<span class='newstate'>错误!  请填写您的用户名!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Name+"</p>";
		}
	if (!(On_User_Password=="OK"||On_User_Password=="<span class='newstate'>错误!  请填写您的密码!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Password+"</p>";
		}
	if (!(On_user_Password2=="OK"||On_user_Password2=="<span class='newstate'>错误!  请再确认一遍密码!!</span>")){
		Err_Content=Err_Content+"<p>"+On_user_Password2+"</p>";
		}
	if (!(On_User_Mobile=="OK"||On_User_Mobile=="<span class='newstate'>错误!  请填写您的手机号!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Mobile+"</p>";
		}
	if (!(On_User_Email=="OK"||On_User_Email=="<span class='newstate'>错误!  请输入您的邮箱!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Email+"</p>";
		}
		Check_User_Country();
	if (!(On_User_Country=="OK"||On_User_Country=="<span class='newstate'>错误! 请填写国籍!!</span>")){
		
		Err_Content=Err_Content+"<p>"+On_User_Country+"</p>";
		}
		Check_User_City();
	if (!(On_User_City=="OK"||On_User_City=="<span class='newstate'>错误! 请填写所在城市!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_City+"</p>";
		}
		Check_User_Birthday();
	if (!(On_User_Birthday=="OK"||On_User_Birthday=="<span class='newstate'>错误! 请选择您的生日,可只填写月份,日期!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Birthday+"</p>";
		}
		Check_User_Card();
	if (!(On_User_Card=="OK"||On_User_Card=="<span class='newstate'>错误! 请完善您的证件号码!!</span>")){
		Err_Content=Err_Content+"<p>"+On_User_Card+"</p>";
		}
 	if (Err_Content=="<p class='tstitle'>提示</p>"){
		  document.form1.submit();
		 }else{
		//alert(document.getElementById("Err_Content").innerHTML);
		document.getElementById("Err_Content").style.display="block";
		document.getElementById("Err_Content").innerHTML=Err_Content;
		return (false);
	 }	//alert(On_Xing+On_User_Name+On_User_Password+On_user_Password2+On_User_Mobile+On_User_Email);
	
	}