<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>My JSP 'alertInfoShowAndAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script language="javascript" src="dwr/engine.js"></script>
	<script language="javascript" src="dwr/util.js"></script>
	<script language="javascript" src="dwr/interface/ScratchpadService.js"></script>
	<style type="text/css">
	.STYLE2 {
	font-size: 16px;
	font-family: "宋体";
	font-weight: bold;
	color:#660000;
	}
	
  .STYLE9 {font-family: "宋体"; font-size: 14px; color: #333333; }
  .STYLE19 {font-family: "宋体"; font-size: 15px; color: #663399; }
  .mytd{
  	 border:1px #000000 solid
  }
  .hid{
  	display:none;
  }
  .show{
  	display:inline;
  }
</style>
<script language="javascript">
  window.onload = function() {
	
	//alert(${id});
	loadTable();
	
	}
	function loadTable(){
		ScratchpadService.getScratchpadByDay(${year},${month},${day},${id},callBack);
	}
	function callBack(list){
		//alert(callBack.length);
		dwr.util.removeAllRows("mybody");
		// dwr.util.addRows("mybody",list,cellFuncs);
		 
		   for(var i = 0; i < list.length; i++) {//查询第一条数据，然后添加行
		   //alert(list[i].scratchpadId);
		   var date=new Date(list[i].scratchpadDate);
		   var hour=new String(date.getHours());
		   
		   if(hour.length==1){
		   		hour="0"+hour;
		   }
		   var minute=new String(date.getMinutes());
		   if(minute.length==1){
		   		minute="0"+minute;
		   }
		   
		   	 var row=createRow(hour+":"+minute,list[i].scratchpadTitle,list[i].scratchpadContent,list[i].scratchpadId);
		   	 $("mybody").appendChild(row);//把生成的行加到表中
		   }
		   
	}
	//生成行
	 function createRow(scratchpadDate,scratchpadTitle,scratchpadContent,scratchpadId) {//添加行
     	 var row = document.createElement("tr");
     	 row.setAttribute("style","border:1px #000000 solid");
     	 var cell = createCenterCell(scratchpadDate);//时间
    	 row.appendChild(cell);
    	 var cell = createLeftCell(scratchpadTitle);//标题
    	 row.appendChild(cell);
    	 var cell = createLeftCell(scratchpadContent);//内容
    	 row.appendChild(cell);
    	 var cell= createRightCell(scratchpadId);//操作
    	 row.appendChild(cell);
    	 return row;
	}
	//生成单元格(居中)
	function createCenterCell(mydata){
		 var cell = document.createElement("td");
		 cell.setAttribute("height","22");
		 cell.setAttribute("align","center");
		 cell.setAttribute("valign","middle");
		 cell.setAttribute("bgcolor","#FFFFFF");
		 cell.className="mytd";
		 cell.innerHTML="<span class='STYLE9'>"+mydata+"</span>";
		 return cell;
	}
	//生成单元格(左对齐)
	function createLeftCell(mydata){
		 var cell = document.createElement("td");
		 cell.setAttribute("align","left");
		 cell.setAttribute("valign","middle");
		 cell.setAttribute("bgcolor","#FFFFFF");
		 cell.className="mytd";
		 cell.innerHTML="<span class='STYLE9'>"+mydata+"</span>";
		 return cell;
	}
	
	//生成最右边的单元格(修改和删除按钮)
	function createRightCell(mydata){
		//alert(mydata);
		var cell = document.createElement("td");
		 cell.setAttribute("align","center");
		 cell.setAttribute("valign","middle");
		 cell.setAttribute("bgcolor","#FFFFFF");
		 cell.className="mytd";
		 cell.innerHTML="<input type='button' value='修改' onclick='UpdateScratpad("+mydata+")' style='border:0px #999999 solid; font:宋体;font-weight: bold; font-size:12px; width:35px; background:url(image/btnbg.jpg)'/>&nbsp;"+
   	  "<input type='button' value='删除' onclick=javascript:if(confirm('确定要删除？')){DeleteRow("+mydata+");} style='border:0px #999999 solid; font:宋体;font-weight: bold; font-size:12px; width:35px; background:url(image/btnbg.jpg)'/>";
		 
		 
		 return cell;
	}
	
	//删除
	function DeleteRow(scrid){
		ScratchpadService.delScratchpadByDate(scrid,callBackDEL);
		
		
	}
	function callBackDEL(){
		loadTable();
	}
	
	//添加
	function addScratchpad(){
		if(check()==false){
			return;
		}
		var scratchpad={user:null,scratchpadTitle:null,scratchpadContent:null}; 
		scratchpad.user={userId:${id}};
		scratchpad.scratchpadTitle=$("scratchpadTitle").value;
		scratchpad.scratchpadContent=$("scratchpadContent").value;
		var date=${year}+"-"+${month}+"-"+${day}+" "+$("hour").value+":"+$("minute").value;
	    //alert(date);
		ScratchpadService.addScratchpad(scratchpad,date,callBackAdd);
	}
	
	function callBackAdd(flag){
		if(flag){
			alert("添加成功！");
			clear();
			loadTable();
		}else{
			alert("添加失败！");
		}
	}
	//修改
	function UpdateScratpad(rowid){
		$("scratchpadId").value=rowid;
		//alert(rowid);
		$("save").className="show";
		$("add").className="hid";
		$("back").className="show";
		ScratchpadService.get(rowid,callBackGet);
	}
	//返回
	function back(){
		$("save").className="hid";
		$("add").className="show";
		$("back").className="hid";
		clear();
	}
	
	function callBackGet(scratchpad){
		//alert(scratchpad.scratchpadDate);
		
		var date=scratchpad.scratchpadDate;//时间对象
		
		//alert("分"+date.getMinutes());
		//alert("时"+date.getHours());
		//
		$("hour").value=date.getHours();
		$("minute").value=date.getMinutes();
		$("scratchpadTitle").value=scratchpad.scratchpadTitle;
		$("scratchpadContent").value=scratchpad.scratchpadContent;
	}
	
	//保存
	function updateScratchpad(){
		if(check()==false){
			return;
		}
		var scratchpad={scratchpadId:null,user:null,scratchpadTitle:null,scratchpadContent:null,scratchpadDate:null}; 
		scratchpad.scratchpadId=$("scratchpadId").value;
		scratchpad.user={userId:${id}};
		scratchpad.scratchpadTitle=$("scratchpadTitle").value;
		scratchpad.scratchpadContent=$("scratchpadContent").value;
		
		var date=new Date();
		date.setFullYear(${year});
		date.setMonth(${month-1});
		date.setDate(${day});
		date.setHours($("hour").value);
		date.setMinutes($("minute").value);
		
		scratchpad.scratchpadDate=date;
		//var date=${year}+"-"+${month}+"-"+${day}+" "+$("hour").value+":"+$("minute").value;
	    //alert(date);
	    //alert(date.getMonth());
		ScratchpadService.updateScratchpad(scratchpad,callBackUpdate);
	}
	function callBackUpdate(flag){
	 	if(flag){
	 		alert("修改成功！");
	 		$("add").className="show";
	 		$("save").className="hid";
	 		clear();
	 		loadTable();
	 	}else{
	 		alert("修改失败！");
	 	}
	}
	
	//清空
	function clear(){
		$("hour").value="0";
		$("minute").value="0";
		$("scratchpadTitle").value="";
		$("scratchpadContent").value="";
	}
	//检查是否为空
	function check(){
		if($("scratchpadTitle").value==""){
			alert("工作不能为空!");
			return false;
		}
		if($("scratchpadContent").value==""){
			alert("工作内容不能为空!");
			return false;
		}
		return true;
	}
	
</script>
  </head>
  
  <body>
  <br>
   <table width="500" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td><img src="image/calendar.gif" width="23px" border="0"  height="23px" />&nbsp;<span class="STYLE2">
    	日程管理(${year }年${month }月${day }日)&nbsp;&nbsp;<a href="scratchpad.do?operate=toAlertInfo&year=${year}&month=${month }">返回</a>
    </span>
    </td>
    <td>&nbsp;</td>
  </tr>
</table>




<table width="748"  style="border-collapse:collapse; border:0px "   cellspacing="0" cellpadding="4">
  <tr>
    <td align="left" valign="middle">
    <!-- 用来保存修改数据时的id -->
    <input type="hidden" name="scratchpadId">
    </td>
    <td align="right" valign="middle" bgcolor="#FFFFFF">&nbsp;</td>
    <td align="left" valign="middle" bgcolor="#FFFFFF" style="">&nbsp;</td>
  </tr>
  <tr>
    <td width="96" align="left" valign="middle">&nbsp;</td>
    <td width="99" align="right" valign="middle" bgcolor="#FFFFFF" style="border:1px #999999 dashed">提醒时间</td>
    <td width="521" align="left" valign="middle" bgcolor="#FFFFFF" style="border:1px #999999 dashed">
    <select name="hour">
    	<option value="0">00</option>
        <option value="1">01</option>
        <option value="2">02</option>
        <option value="3">03</option>
        <option value="4">04</option>
        <option value="5">05</option>
        <option value="6">06</option>
        <option value="7">07</option>
        <option value="8">08</option>
        <option value="9">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>
    时
           <select name="minute">
    	<option value="0">00</option>
        <option value="1">01</option>
        <option value="2">02</option>
        <option value="3">03</option>
        <option value="4">04</option>
        <option value="5">05</option>
        <option value="6">06</option>
        <option value="7">07</option>
        <option value="8">08</option>
        <option value="9">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
        <option value="32">32</option>
        <option value="33">33</option>
        <option value="34">34</option>
        <option value="35">35</option>
        <option value="36">36</option>
        <option value="37">37</option>
        <option value="38">38</option>
        <option value="39">39</option>
        <option value="40">40</option>
        <option value="41">41</option>
        <option value="42">42</option>
        <option value="43">43</option>
        <option value="44">44</option>
        <option value="45">45</option>
        <option value="46">46</option>
        <option value="47">47</option>
        <option value="48">48</option>
        <option value="49">49</option>
        <option value="50">50</option>
        <option value="51">51</option>
        <option value="52">52</option>
        <option value="53">53</option>
        <option value="54">54</option>
        <option value="55">55</option>
        <option value="56">56</option>
        <option value="57">57</option>
        <option value="58">58</option>
        <option value="59">59</option>
    </select>
    分</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="top" bgcolor="#FFFFFF" style="border:1px #999999 dashed">工作</td>
    <td bgcolor="#FFFFFF" style="border:1px #999999 dashed"><input type="text" name="scratchpadTitle"  size="64" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right" valign="top" bgcolor="#FFFFFF" style="border:1px #999999 dashed">内容</td>
    <td bgcolor="#FFFFFF" style="border:1px #999999 dashed">
    <textarea  rows="10" cols="50" name="scratchpadContent"></textarea>    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td bgcolor="#FFFFFF" style="border:1px #999999 dashed">&nbsp;</td>
    <td bgcolor="#FFFFFF" style="border:1px #999999 dashed">
    <input type="button" name="add" onclick="addScratchpad()" class="show"  value="添加" />
    <input type="button" name="save" class="hid" onclick="updateScratchpad()" value="保存" />
    <input type="button" name="back"  class="hid" onclick="back()" value="返回" />
    </td>
  </tr>
</table>

<br />
<table width="983" cellpadding="0"  cellspacing="0"  style=" border-collapse:collapse; border:1px #000000 solid">

  <tr>
    <td width="116" height="25" align="center" valign="middle"  background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE19">时间</span></td>
    <td  width="268" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE19">标题</span></td>
    <td  width="429" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE19">内容</span></td>
    <td  width="168" align="center" valign="middle" background="image/headerbg.gif" bgcolor="#FFFFFF"  style="border:1px #000000 solid"><span class="STYLE19">操作</span></td>
  </tr>
<tbody id="mybody" >
   		
   </tbody>
   
</table>
<table border="1">

</table>

    
    
    
    
  </body>
</html>
