//<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
// JavaScript Document

//********login.jsp******************//
function login(){
	if(document.form1.id.value!=""&&document.form1.password.value!=""){
		return true;
	}else{
		alert("�������û���������");
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
		alert("�������û���");
		return false;
	}
	if(document.form1.password.value==""){
		alert("����������");
		return false;
	}
	if(document.form1.repassword.value==""){
		alert("����������ȷ��");
		return false;
	}
	if(document.form1.password.value!=document.form1.repassword.value){
		alert("����������ȷ�ϲ���");
		return false;
	}
	if(document.form1.phone.value==""){
		alert("������绰����");
		return false;
	}
	if(document.form1.email.value.indexOf("@")==-1||document.form1.email.value.indexOf(".")==-1){
			alert("����Email��ַ����");
			return false;
	}
	if(document.form1.state.value==""){
		alert("����������ʡ");
		return false;
	}
	if(document.form1.city.value==""){
		alert("������������");
		return false;
	}
	if(document.form1.zip.value==""){
		alert("�������ʱ�");		
		return false;
	}
	if(isNaN(document.form1.zip.value)){
		alert("�ʱ�����������");
		return false;
	}
	if(document.form1.address.value==""){
		alert("����������ַ");
		return false;
	}
		return true;
}

//********category_add.jsp******************//
function addcategoryname(){
	if(document.form1.categoryname.value==""){
		alert("������ͼ���������");
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
		alert("�����������Ϊ��");
		return false;
	}else{
		return true;
	}
}
//********supplier_add.jsp******************//
function suplier_add(){
	if(document.form1.suppliername.value==""){
		alert("���������Ʋ�����Ϊ��");
		return false;
	}
	if(document.form1.sname.value==""){
		alert("��ϵ�˲�����Ϊ��");
		return false;
	}
	if(document.form1.phone.value==""){
		alert("�绰������Ϊ��");
		return false;
	}
		return true;
}

//********books_add.jsp******************//
function addbooks(change){
	if(document.form1.idbook.value==""){
		alert("������ͼ����");
		document.form1.idbook.focus();
		return false;
	}
	if(document.form1.bookname.value==""){
		alert("������ͼ������");
		document.form1.bookname.focus();
		return false;
	}
	if(document.form1.outday.value==""){
		alert("�������������");
		document.form1.outday.focus();
		return false;
	}
	if(document.form1.outday.value.indexOf("-")==-1){
		alert("����д��ȷ�������ڸ�ʽ");				
		document.form1.outday.focus();
		return false;
	}
	if(document.form1.author.value==""){
		alert("����������");
		document.form1.author.focus();
		return false;
	}
	if(document.form1.cost.value==""){
		alert("���������");
		document.form1.cost.focus();
		return false;
	}
	if(isNaN(document.form1.cost.value)){
		alert("��������������");
		document.form1.cost.focus();
		return false;
	}
	if(document.form1.stock.value==""){
		alert("�������������");
		document.form1.stock.focus();
		return false;
	}
	if(isNaN(document.form1.stock.value)){
		alert("��������������");
		document.form1.stock.focus();
		return false;
	}
	if(document.form1.stock.value.indexOf(".")!=-1){
		alert("�����в��ܰ���'.'");
		document.form1.stock.focus();
		return false;
	}
	if(document.form1.price.value==""){
		alert("��������ۼ۸�");
		document.form1.price.focus();
		return false;
	}
	if(isNaN(document.form1.price.value)){
		alert("�ۼ�����������");
		document.form1.price.focus();
		return false;
	}
	if(change){
		if(document.form1.sale.value==""){
			alert("�������������");
			document.form1.sale.focus();
			return false;
		}
		if(isNaN(document.form1.sale.value)){
			alert("��������������");
			document.form1.sale.focus();
			return false;
		}
		if(document.form1.sale.value.indexOf(".")!=-1){
			alert("�����в��ܰ���'.'");
			document.form1.sale.focus();
			return false;
		}
	}
	return true;
}

//********sale_select.jsp******************//
function sale_select(){
	if(document.form1.begin.value==""){
		alert("����д��ʼ����");
		return false;
	}
	if(document.form1.end.value==""){
		alert("����д��ֹ����");
		return false;
	}
	if((document.form1.end.value.indexOf("-")==-1)||(document.form1.begin.value.indexOf("-"))==-1){
		alert("����д��ȷ���ڸ�ʽ�����ѯ��Ч");				
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
		alert("����д����");
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
		alert("�������Ƽ�����");
		return false;
	}
	return true;
}
