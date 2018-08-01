//<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
// JavaScript Document

//********login.jsp******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("请输入用户名和密码");
		return false;
	}
}
function reg(){
	if(document.form1.button){
	document.location='reg.jsp';
	}
}
//*******reg.jsp||change.jsp***************//

function reg_save(){
	if(document.form1.username.value==""){
		alert("请输入用户名");
		return false;
	}
	if(document.form1.password.value==""){
		alert("请输入密码");
		return false;
	}
	if(document.form1.repassword.value==""){
		alert("请输入密码确认");
		return false;
	}
	if(document.form1.password.value!=document.form1.repassword.value){
		alert("密码与密码确认不符");
		return false;
	}
	if(document.form1.phone.value==""){
		alert("请输入电话号码");
		return false;
	}
	if(document.form1.email.value.indexOf("@")==-1||document.form1.email.value.indexOf(".")==-1){
			alert("您的Email地址错误");
			return false;
	}
	if(document.form1.state.value==""){
		alert("请输入所在省");
		return false;
	}
	if(document.form1.city.value==""){
		alert("请输入所在市");
		return false;
	}
	if(document.form1.zip.value==""){
		alert("请输入邮编");		
		return false;
	}
	if(isNaN(document.form1.zip.value)){
		alert("邮编请输入数字");
		return false;
	}
	if(document.form1.address.value==""){
		alert("请输入具体地址");
		return false;
	}
		return true;
}

//********category_add.jsp******************//
function addcategoryname(){
	if(document.form1.categoryname.value==""){
		alert("请输入图书类别名称");
		return false;
	}else{
		return true;
	}
}

//********category.jsp******************//
function categoryadd(){
	window.open("category_add.jsp","","toolbar=no,memubar=no,scrollbrs=no,width=350,height=220,left=300,top=180,center=yes");
}
function addclose(){
	window.close();
}
function addadd(){
	if(document.form1.categoryname.value==""){
		alert("类别名不允许为空");
		return false;
	}else{
		return true;
	}
}
//********supplier_add.jsp******************//
function suplier_add(){
	if(document.form1.suppliername.value==""){
		alert("出版商名称不允许为空");
		return false;
	}
	if(document.form1.sname.value==""){
		alert("联系人不允许为空");
		return false;
	}
	if(document.form1.phone.value==""){
		alert("电话不允许为空");
		return false;
	}
		return true;
}

//********books_add.jsp******************//
function addbooks(change){
	if(document.form1.idbook.value==""){
		alert("请输入图书编号");
		document.form1.idbook.focus();
		return false;
	}
	if(document.form1.bookname.value==""){
		alert("请输入图书名称");
		document.form1.bookname.focus();
		return false;
	}
	if(document.form1.outday.value==""){
		alert("请输入出版日期");
		document.form1.outday.focus();
		return false;
	}
	if(document.form1.outday.value.indexOf("-")==-1){
		alert("请填写正确出版日期格式");				
		document.form1.outday.focus();
		return false;
	}
	if(document.form1.author.value==""){
		alert("请输入作者");
		document.form1.author.focus();
		return false;
	}
	if(document.form1.cost.value==""){
		alert("请输入进价");
		document.form1.cost.focus();
		return false;
	}
	if(isNaN(document.form1.cost.value)){
		alert("进价请输入数字");
		document.form1.cost.focus();
		return false;
	}
	if(document.form1.stock.value==""){
		alert("请输入进书数量");
		document.form1.stock.focus();
		return false;
	}
	if(isNaN(document.form1.stock.value)){
		alert("数量请输入数字");
		document.form1.stock.focus();
		return false;
	}
	if(document.form1.stock.value.indexOf(".")!=-1){
		alert("数量中不能包含'.'");
		document.form1.stock.focus();
		return false;
	}
	if(document.form1.price.value==""){
		alert("请输入出售价格");
		document.form1.price.focus();
		return false;
	}
	if(isNaN(document.form1.price.value)){
		alert("售价请输入数字");
		document.form1.price.focus();
		return false;
	}
	if(change){
		if(document.form1.sale.value==""){
			alert("请输入出售数量");
			document.form1.sale.focus();
			return false;
		}
		if(isNaN(document.form1.sale.value)){
			alert("数量请输入数字");
			document.form1.sale.focus();
			return false;
		}
		if(document.form1.sale.value.indexOf(".")!=-1){
			alert("数量中不能包含'.'");
			document.form1.sale.focus();
			return false;
		}
	}
	return true;
}

//********sale_select.jsp******************//
function sale_select(){
	if(document.form1.begin.value==""){
		alert("请填写开始日期");
		return false;
	}
	if(document.form1.end.value==""){
		alert("请填写终止日期");
		return false;
	}
	if((document.form1.end.value.indexOf("-")==-1)||(document.form1.begin.value.indexOf("-"))==-1){
		alert("请填写正确日期格式否则查询无效");				
		return false;
	}
		return true;
}

//********customer_select_save.jsp******************//
function back(){
	document.location=history.back();
}

//********trade.jsp******************//
function quantity(tem){
	if(document.tem.quantity.value!=""){
		document.tem.submit();
	}else{
		alert("请填写数量");
		return false;
	}
}

//********top.jsp******************//
function hidd(){
	document.all.div.className='hidd';
}
function show(){
	document.all.div.className='show';
}
function hidd1(){
	document.all.div1.className='hidd';
}
function show1(){
	document.all.div1.className='show';
}

//********vouch.jsp******************//
function vouch(){
	if(document.form2.bookname.value==""){
		alert("请输入推荐书名");
		return false;
	}
	return true;
}
