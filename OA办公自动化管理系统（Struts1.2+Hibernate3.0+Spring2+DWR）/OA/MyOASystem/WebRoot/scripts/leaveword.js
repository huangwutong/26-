
function userChange() {
	var id = $("userList").value;
	if (id == "0") {
		return;
	} else {
		leaveWordService.getLeaveWordsByUserId(id, processLeaveWord);
	}
}
function processLeaveWord(list) {
	dwr.util.removeAllRows("leaveHistory");
	if (list.length != 0) {
		dwr.util.addRows("leaveHistory", list, cellFunHistory);
	}
}
var cellFunHistory = [function (leaveWord) {
	var div1 = document.createElement("div");
	div1.style.className = "divWidth";
	div1.innerHTML = "<font color='blue'>" + leaveWord.user.userName + "&nbsp;&nbsp;" + leaveWord.leaveWordDate.toLocaleString() + "</font>&nbsp;&nbsp;<br/>";
	return div1;
}, function (leaveWord) {
	return leaveWord.leaveWordContent;
}];
//添加留言
function add() {
	if($("leaveWordContent").value==""){
	  alert("发送内容不能为空");
	  return false;
	 }else if($("leaveWordContent").value.length>200){
	 	alert("发送内容过多，请分条发送");
	 	return false;
	 }else{
	var leaveWord = {leaveWordContent:null, user:null, leaveWordDate:new Date()};
	dwr.util.getValues(leaveWord);
	leaveWord.user = {userId:$("user").value};
	leaveWordService.add(leaveWord, callFun);
	//2009年5月22日晚新加了这一句
	location="leaveWord.do?operate=toLeaveWord";
	}
}
//留言回调函数
function callFun() {
	$("leaveWordContent").value = "";
	loadList();
}
//加载留言内容
function loadList() {
	leaveWordService.loadList(null, processList);
}
//加载内容回调函数
function processList(list) {
	dwr.util.removeAllRows("leaveWordContentInfo");
	dwr.util.addRows("leaveWordContentInfo", list, cellFun);
}
//创建表格
var cellFun = [function (leaveWord) {
	var div1 = document.createElement("div");
	div1.style.className="divWidth";	
	div1.innerHTML = "<font color='blue'>" + leaveWord.user.userName + "&nbsp;&nbsp;" + leaveWord.leaveWordDate.toLocaleString() + "</font>&nbsp;&nbsp;<br/>";
	return div1;
}, function (leaveWord) {
	return leaveWord.leaveWordContent;
}];

