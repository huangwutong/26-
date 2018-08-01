<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>My JSP 'meetApply.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="../../styles/1/style.css">
		<script Language="JavaScript">
	
   /**//**
    *本日历选择控件由tiannet根据前人经验完善而得。大部分代码来自meizz的日历控件。
    *tiannet添加了时间选择功能、select,object标签隐藏功能，还有其它小功能。
    *使用方法：
    * (1)只选择日期   <input type="text" name="date"   readOnly onClick="setDay(this);">
    * (2)选择日期和小时  <input type="text" name="dateh"  readOnly onClick="setDayH(this);">
    * (3)选择日期和小时及分钟 <input type="text" name="datehm" readOnly onClick="setDayHM(this);">
    *设置参数的方法
    * (1)设置日期分隔符    setDateSplit(strSplit);默认为"-"
    * (2)设置日期与时间之间的分隔符  setDateTimeSplit(strSplit);默认为" "
    * (3)设置时间分隔符    setTimeSplit(strSplit);默认为":"
    * (4)设置(1),(2),(3)中的分隔符  setSplit(strDateSplit,strDateTimeSplit,strTimeSplit);
    * (5)设置开始和结束年份    setYearPeriod(intDateBeg,intDateEnd)
    *说明：
    * 默认返回的日期时间格式如同：2005-02-02 08:08
    */
   //------------------ 样式定义 ---------------------------//
   //功能按钮同样样式
   var s_tiannet_turn_base = "height:16px;font-size:9pt;color:white;border:0 solid #CCCCCC;cursor:hand;background-color:#2650A6;";
   //翻年、月等的按钮
   var s_tiannet_turn = "width:28px;" + s_tiannet_turn_base;
   //关闭、清空等按钮样式
   var s_tiannet_turn2 = "width:25px;" + s_tiannet_turn_base;
   //年选择下拉框
   var s_tiannet_select = "width:64px;display:none;";
   //月、时、分选择下拉框
   var s_tiannet_select2 = "width:46px;display:none;";
   //日期选择控件体的样式
   var s_tiannet_body = "width:160;background-color:#2650A6;display:none;z-index:9998;position:absolute;" +
     "border-left:1 solid #CCCCCC;border-top:1 solid #CCCCCC;border-right:1 solid #999999;border-bottom:1 solid #999999;";
   //显示日的td的样式
   var s_tiannet_day = "width:21px;height:20px;background-color:#D8F0FC;font-size:10pt;";
   //字体样式
   var s_tiannet_font = "color:#FFCC00;font-size:9pt;cursor:hand;";
   //链接的样式
   var s_tiannet_link = "text-decoration:none;font-size:9pt;color:#2650A6;";
   //横线
   var s_tiannet_line = "border-bottom:1 solid #6699CC";
   //------------------ 变量定义 ---------------------------//
   var tiannetYearSt = 1970;//可选择的开始年份
   var tiannetYearEnd = 2100;//可选择的结束年份
   var tiannetDateNow = new Date();
   var tiannetYear = tiannetDateNow.getFullYear(); //定义年的变量的初始值
   var tiannetMonth = tiannetDateNow.getMonth()+1; //定义月的变量的初始值
   var tiannetDay = tiannetDateNow.getDate();
   var tiannetHour = 8;//tiannetDateNow.getHours();
   var tiannetMinute = 0;//tiannetDateNow.getMinutes();
   var tiannetArrDay=new Array(42);          //定义写日期的数组
   var tiannetDateSplit = "-";     //日期的分隔符号
   var tiannetDateTimeSplit = " ";    //日期与时间之间的分隔符
   var tiannetTimeSplit = ":";     //时间的分隔符号
   var tiannetOutObject;      //接收日期时间的对象
   var arrTiannetHide = new Array();//被强制隐藏的标签
   var m_bolShowHour = false;//是否显示小时
   var m_bolShowMinute = false;//是否显示分钟

   var m_aMonHead = new Array(12);         //定义阳历中每个月的最大天数
    m_aMonHead[0] = 31; m_aMonHead[1] = 28; m_aMonHead[2] = 31; m_aMonHead[3] = 30; m_aMonHead[4]  = 31; m_aMonHead[5]  = 30;
    m_aMonHead[6] = 31; m_aMonHead[7] = 31; m_aMonHead[8] = 30; m_aMonHead[9] = 31; m_aMonHead[10] = 30; m_aMonHead[11] = 31;
   // ---------------------- 用户可调用的函数 -----------------------------//
   //用户主调函数－只选择日期
   function setDay(obj){
    tiannetOutObject = obj;
    //如果标签中有值，则将日期初始化为当前值
    var strValue = tiannetTrim(tiannetOutObject.value);
    if( strValue != "" ){
     tiannetInitDate(strValue);
    }
    tiannetPopCalendar();
   }
   //用户主调函数－选择日期和小时
   function setDayH(obj){
    tiannetOutObject = obj;
    m_bolShowHour = true;
    //如果标签中有值，则将日期和小时初始化为当前值
    var strValue = tiannetTrim(tiannetOutObject.value);
    if( strValue != "" ){
     tiannetInitDate(strValue.substring(0,10));
     var hour = strValue.substring(11,13);
     if( hour < 10 ) tiannetHour = hour.substring(1,2);
    }
    tiannetPopCalendar();
   }
   //用户主调函数－选择日期和小时及分钟
   function setDayHM(obj){
    tiannetOutObject = obj;
    m_bolShowHour = true;
    m_bolShowMinute = true;
    //如果标签中有值，则将日期和小时及分钟初始化为当前值
    var strValue = tiannetTrim(tiannetOutObject.value);
    if( strValue != "" ){
     tiannetInitDate(strValue.substring(0,10));
     var time = strValue.substring(11,16);
     var arr = time.split(tiannetTimeSplit);
     tiannetHour = arr[0];
     tiannetMinute = arr[1];
     if( tiannetHour < 10 ) tiannetHour = tiannetHour.substring(1,2);
     if( tiannetMinute < 10 ) tiannetMinute = tiannetMinute.substring(1,2);
    }
    tiannetPopCalendar();
   }
   //设置开始日期和结束日期
   function  setYearPeriod(intDateBeg,intDateEnd){
    tiannetYearSt = intDateBeg;
    tiannetYearEnd = intDateEnd;
   }
   //设置日期分隔符。默认为"-"
   function setDateSplit(strDateSplit){
    tiannetDateSplit = strDateSplit;
   }
   //设置日期与时间之间的分隔符。默认为" "
   function setDateTimeSplit(strDateTimeSplit){
    tiannetDateTimeSplit = strDateTimeSplit;
   }
   //设置时间分隔符。默认为":"
   function setTimeSplit(strTimeSplit){
    tiannetTimeSplit = strTimeSplit;
   }
   //设置分隔符
   function setSplit(strDateSplit,strDateTimeSplit,strTimeSplit){
    tiannetDateSplit(strDateSplit);
    tiannetDateTimeSplit(strDateTimeSplit);
    tiannetTimeSplit(strTimeSplit);
   }
   //设置默认的日期。格式为：YYYY-MM-DD
   function setDefaultDate(strDate){
    tiannetYear = strDate.substring(0,4);
    tiannetMonth = strDate.substring(5,7);
    tiannetDay = strDate.substring(8,10);
   }
   //设置默认的时间。格式为：HH24:MI
   function setDefaultTime(strTime){
    tiannetHour = strTime.substring(0,2);
    tiannetMinute = strTime.substring(3,5);
   }
   // ---------------------- end 用户可调用的函数 -----------------------------//
   //------------------ begin 页面显示部分 ---------------------------//
   var weekName = new Array("日","一","二","三","四","五","六");
   document.write('<div id="divTiannetDate" style="'+s_tiannet_body+'" style="本日历选择控件由tiannet根据前人经验完善而成！">');
   document.write('<div align="center" id="divTiannetDateText" Author="tiannet" style="padding-top:2px;">');
   document.write('<span id="tiannetYearHead" Author="tiannet" style="'+s_tiannet_font+'" '+
    'onclick="spanYearCEvent();">&nbsp;年</span>');
   document.write('<select id="selTianYear" style="'+s_tiannet_select+'" Author="tiannet"  '+
    ' onChange="tiannetYear=this.value;tiannetSetDay(tiannetYear,tiannetMonth);document.all.tiannetYearHead.style.display=\'\';'+
    'this.style.display=\'none\';">');
   for(var i=tiannetYearSt;i <= tiannetYearEnd;i ++){
    document.writeln('<option value="' + i + '">' + i + '年</option>');
   }
   document.write('</select>');
   document.write('<span id="tiannetMonthHead" Author="tiannet" style="'+s_tiannet_font+'" '+
    'onclick="spanMonthCEvent();">&nbsp;&nbsp;月</span>');
   document.write('<select id="selTianMonth" style="'+s_tiannet_select2+'" Author="tiannet" '+
    'onChange="tiannetMonth=this.value;tiannetSetDay(tiannetYear,tiannetMonth);document.all.tiannetMonthHead.style.display=\'\';'+
    'this.style.display=\'none\';">');
   for(var i=1;i <= 12;i ++){
    document.writeln('<option value="' + i + '">' + i + '月</option>');
   }
   document.write('</select>');
   //document.write('</div>');
   //document.write('<div align="center" id="divTiannetTimeText" Author="tiannet">');
   document.write('<span id="tiannetHourHead" Author="tiannet" style="'+s_tiannet_font+'display:none;" '+
    'onclick="spanHourCEvent();">&nbsp;时</span>');
   document.write('<select id="selTianHour" style="'+s_tiannet_select2+'display:none;" Author="tiannet" '+
    ' onChange="tiannetHour=this.value;tiannetWriteHead();document.all.tiannetHourHead.style.display=\'\';' +
    'this.style.display=\'none\';">');
   for(var i=0;i <= 23;i ++){
    document.writeln('<option value="' + i + '">' + i + '时</option>');
   }
   document.write('</select>');
   document.write('<span id="tiannetMinuteHead" Author="tiannet" style="'+s_tiannet_font+'display:none;" '+
    'onclick="spanMinuteCEvent();">&nbsp;&nbsp;分</span>');
   document.write('<select id="selTianMinute" style="'+s_tiannet_select2+'display:none;" Author="tiannet" '+
    '  onChange="tiannetMinute=this.value;tiannetWriteHead();document.all.tiannetMinuteHead.style.display=\'\';'+
    'this.style.display=\'none\';">');
   for(var i=0;i <= 59;i ++){
    document.writeln('<option value="' + i + '">' + i + '分</option>');
   }
   document.write('</select>');
   document.write('</div>');
   //输出一条横线
   document.write('<div style="'+s_tiannet_line+'"></div>');
   document.write('<div align="center" id="divTiannetTurn" style="border:0;" Author="tiannet">');
   document.write('<input type="button" style="'+s_tiannet_turn+'" value="年↑" title="上一年" onClick="tiannetPrevYear();">');
   document.write('<input type="button" style="'+s_tiannet_turn+'" value="年↓" title="下一年" onClick="tiannetNextYear();">&nbsp;');
   document.write('<input type="button" style="'+s_tiannet_turn+'" value="月↑" title="上一月" onClick="tiannetPrevMonth();">');
   document.write('<input type="button" style="'+s_tiannet_turn+'" value="月↓" title="下一月" onClick="tiannetNextMonth();">');
   document.write('</div>');
   //输出一条横线
   document.write('<div style="'+s_tiannet_line+'"></div>');
   document.write('<table border=0 cellspacing=0 cellpadding=0  bgcolor=white onselectstart="return false">');
   document.write(' <tr style="background-color:#2650A6;font-size:10pt;color:white;height:22px;" Author="tiannet">');
   for(var i =0;i < weekName.length;i ++){
    //输出星期
    document.write('<td width="21" align="center" Author="tiannet">' + weekName[i] + '</td>');
   }
   document.write(' </tr>');
   document.write('</table>');
   //输出天的选择
   document.write('<table border=0 cellspacing=1 cellpadding=0  bgcolor=white onselectstart="return false">');
   var n = 0;
   for (var i=0;i<5;i++) { 
    document.write (' <tr align=center id="trTiannetDay' + i + '" >');
    for (var j=0;j<7;j++){
     document.write('<td align="center" id="tdTiannetDay' + n + '" '+
    'onClick="tiannetDay=this.innerText;tiannetSetValue(true);" ' 
      +' style="' + s_tiannet_day + '">&nbsp;</td>');
     n ++;
    }
    document.write (' </tr>');
   }
   document.write (' <tr align=center id="trTiannetDay5" >');
   document.write('<td align="center" id="tdTiannetDay35" onClick="tiannetDay=this.innerText;tiannetSetValue(true);" ' 
    +' style="' + s_tiannet_day + '">&nbsp;</td>');
   document.write('<td align="center" id="tdTiannetDay36" onClick="tiannetDay=this.innerText;tiannetSetValue(true);" ' 
    +' style="' + s_tiannet_day + '">&nbsp;</td>');
   document.write('<td align="right" colspan="5"><a href="javascript:tiannetClear();" style="' + s_tiannet_link + '">清空</a>'+
    '&nbsp;<a href="javascript:tiannetHideControl();" style="' + s_tiannet_link + '">关闭</a>' +
    '&nbsp;<a href="javascript:tiannetSetValue(true);" style="' + s_tiannet_link + '">确定</a>&nbsp;' +
    '</td>');
   document.write (' </tr>');
   document.write('</table>');
   document.write('</div>');
   //------------------ end 页面显示部分 ---------------------------//
   //------------------ 显示日期时间的span标签响应事件 ---------------------------//
   //单击年份span标签响应
   function spanYearCEvent(){
    hideElementsById(new Array("selTianYear","tiannetMonthHead"),false);
    if(m_bolShowHour) hideElementsById(new Array("tiannetHourHead"),false);
    if(m_bolShowMinute) hideElementsById(new Array("tiannetMinuteHead"),false);
    hideElementsById(new Array("tiannetYearHead","selTianMonth","selTianHour","selTianMinute"),true);
   }
   //单击月份span标签响应
   function spanMonthCEvent(){
    hideElementsById(new Array("selTianMonth","tiannetYearHead"),false);
    if(m_bolShowHour) hideElementsById(new Array("tiannetHourHead"),false);
    if(m_bolShowMinute) hideElementsById(new Array("tiannetMinuteHead"),false);
    hideElementsById(new Array("tiannetMonthHead","selTianYear","selTianHour","selTianMinute"),true);
   }
   //单击小时span标签响应
   function spanHourCEvent(){
    hideElementsById(new Array("tiannetYearHead","tiannetMonthHead"),false);
    if(m_bolShowHour) hideElementsById(new Array("selTianHour"),false);
    if(m_bolShowMinute) hideElementsById(new Array("tiannetMinuteHead"),false);
    hideElementsById(new Array("tiannetHourHead","selTianYear","selTianMonth","selTianMinute"),true);
   }
   //单击分钟span标签响应
   function spanMinuteCEvent(){
    hideElementsById(new Array("tiannetYearHead","tiannetMonthHead"),false);
    if(m_bolShowHour) hideElementsById(new Array("tiannetHourHead"),false);
    if(m_bolShowMinute) hideElementsById(new Array("selTianMinute"),false);
    hideElementsById(new Array("tiannetMinuteHead","selTianYear","selTianMonth","selTianHour"),true);
   }
   //根据标签id隐藏或显示标签
   function hideElementsById(arrId,bolHide){
    var strDisplay = "";
    if(bolHide) strDisplay = "none";
    for(var i = 0;i < arrId.length;i ++){
     var obj = document.getElementById(arrId[i]);
     obj.style.display = strDisplay;
    }
   }
   //------------------ end 显示日期时间的span标签响应事件 ---------------------------//
   //判断某年是否为闰年
   function isPinYear(year){
    var bolRet = false;
    if (0==year%4&&((year%100!=0)||(year%400==0))) {
     bolRet = true;
    }
    return bolRet;
   }
   //得到一个月的天数，闰年为29天
   function getMonthCount(year,month){
    var c=m_aMonHead[month-1];
    if((month==2)&&isPinYear(year)) c++;
    return c;
   }
   //重新设置当前的日。主要是防止在翻年、翻月时，当前日大于当月的最大日
   function setRealDayCount() {
    if( tiannetDay > getMonthCount(tiannetYear,tiannetMonth) ) {
     //如果当前的日大于当月的最大日，则取当月最大日
     tiannetDay = getMonthCount(tiannetYear,tiannetMonth);
    }
   }
   //在个位数前加零
   function addZero(value){
    if(value < 10 ){
     value = "0" + value;
    }
    return value;
   }
   //取出空格
   function tiannetTrim(str) {
    return str.replace(/(^\s*)|(\s*$)/g,"");
   }
   //为select创建一个option
   function createOption(objSelect,value,text){
    var option = document.createElement("OPTION");
    option.value = value;
    option.text = text;
    objSelect.options.add(option);
   }
   //往前翻 Year
   function tiannetPrevYear() {
    if(tiannetYear > 999 && tiannetYear <10000){tiannetYear--;}
    else{alert("年份超出范围（1000-9999）！");}
    tiannetSetDay(tiannetYear,tiannetMonth);
    //如果年份小于允许的最小年份，则创建对应的option
    if( tiannetYear < tiannetYearSt ) {
     tiannetYearSt = tiannetYear;
     createOption(document.all.selTianYear,tiannetYear,tiannetYear + "年");
    }
    checkSelect(document.all.selTianYear,tiannetYear);
    tiannetWriteHead();
   }
   //往后翻 Year
   function tiannetNextYear() {
    if(tiannetYear > 999 && tiannetYear <10000){tiannetYear++;}
    else{alert("年份超出范围（1000-9999）！");return;}
    tiannetSetDay(tiannetYear,tiannetMonth);
    //如果年份超过允许的最大年份，则创建对应的option
    if( tiannetYear > tiannetYearEnd ) {
     tiannetYearEnd = tiannetYear;
     createOption(document.all.selTianYear,tiannetYear,tiannetYear + "年");
    }
    checkSelect(document.all.selTianYear,tiannetYear);
    tiannetWriteHead();
   }
   //选择今天
   function tiannetToday() {
    tiannetYear = tiannetDateNow.getFullYear();
    tiannetMonth = tiannetDateNow.getMonth()+1;
    tiannetDay = tiannetDateNow.getDate();
    tiannetSetValue(true);
    //tiannetSetDay(tiannetYear,tiannetMonth);
    //selectObject();
   }
   //往前翻月份
   function tiannetPrevMonth() {
    if(tiannetMonth>1){tiannetMonth--}else{tiannetYear--;tiannetMonth=12;}
    tiannetSetDay(tiannetYear,tiannetMonth);
    checkSelect(document.all.selTianMonth,tiannetMonth);
    tiannetWriteHead();
   }
   //往后翻月份
   function tiannetNextMonth() {
    if(tiannetMonth==12){tiannetYear++;tiannetMonth=1}else{tiannetMonth++}
    tiannetSetDay(tiannetYear,tiannetMonth);
    checkSelect(document.all.selTianMonth,tiannetMonth);
    tiannetWriteHead();
   }
   //向span标签中写入年、月、时、分等数据
   function tiannetWriteHead(){
    document.all.tiannetYearHead.innerText = tiannetYear + "年";
    document.all.tiannetMonthHead.innerText = tiannetMonth + "月";
    if( m_bolShowHour )  document.all.tiannetHourHead.innerText = " "+tiannetHour + "时";
    if( m_bolShowMinute ) document.all.tiannetMinuteHead.innerText = tiannetMinute + "分";
    tiannetSetValue(false);//给文本框赋值，但不隐藏本控件
   }
   //设置显示天
   function tiannetSetDay(yy,mm) {
     
    setRealDayCount();//设置当月真实的日
    tiannetWriteHead();
    var strDateFont1 = "", strDateFont2 = "" //处理日期显示的风格
    for (var i = 0; i < 37; i++){tiannetArrDay[i]=""};  //将显示框的内容全部清空
    var day1 = 1;
    var firstday = new Date(yy,mm-1,1).getDay();  //某月第一天的星期几
    for (var i = firstday; day1 < getMonthCount(yy,mm)+1; i++){
     tiannetArrDay[i]=day1;day1++;
    }
    //如果用于显示日的最后一行的第一个单元格的值为空，则隐藏整行。
    //if(tiannetArrDay[35] == ""){
    // document.all.trTiannetDay5.style.display = "none";
    //} else {
    // document.all.trTiannetDay5.style.display = "";
    //}
    for (var i = 0; i < 37; i++){ 
     var da = eval("document.all.tdTiannetDay"+i)     //书写新的一个月的日期星期排列
     if (tiannetArrDay[i]!="") { 
      //判断是否为周末，如果是周末，则改为红色字体
      if(i % 7 == 0 || (i+1) % 7 == 0){
      strDateFont1 = "<font color=#f0000>"
      strDateFont2 = "</font>"
      } else {
    strDateFont1 = "";
    strDateFont2 = ""
      }
      da.innerHTML = strDateFont1 + tiannetArrDay[i] + strDateFont2;
      //如果是当前选择的天，则改变颜色
      if(tiannetArrDay[i] == tiannetDay ) {
    da.style.backgroundColor = "#CCCCCC";
      } else {
    da.style.backgroundColor = "#EFEFEF";
      }
      da.style.cursor="hand"
     } else {
      da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"
     }
    }//end for
    tiannetSetValue(false);//给文本框赋值，但不隐藏本控件
   }//end function tiannetSetDay
   //根据option的值选中option
   function checkSelect(objSelect,selectValue) {
    var count = parseInt(objSelect.length);
    if( selectValue < 10 && selectValue.toString().length == 2) {
     selectValue = selectValue.substring(1,2);
    }
    for(var i = 0;i < count;i ++){
     if(objSelect.options[i].value == selectValue){
      objSelect.selectedIndex = i;
      break;
     }
    }//for
   }
   //选中年、月、时、分等下拉框
   function selectObject(){
    //如果年份小于允许的最小年份，则创建对应的option
    if( tiannetYear < tiannetYearSt ) {
     for( var i = tiannetYear;i < tiannetYearSt;i ++  ){
      createOption(document.all.selTianYear,i,i + "年");
     }
     tiannetYearSt = tiannetYear;
    }
    //如果年份超过允许的最大年份，则创建对应的option
    if( tiannetYear > tiannetYearEnd ) {
     for( var i = tiannetYearEnd+1;i <= tiannetYear;i ++  ){
      createOption(document.all.selTianYear,i,i + "年");
     }
     tiannetYearEnd = tiannetYear;
    }
    checkSelect(document.all.selTianYear,tiannetYear);
    checkSelect(document.all.selTianMonth,tiannetMonth);
    if( m_bolShowHour )  checkSelect(document.all.selTianHour,tiannetHour);
    if( m_bolShowMinute ) checkSelect(document.all.selTianMinute,tiannetMinute);
   }
   //给接受日期时间的控件赋值
   //参数bolHideControl - 是否隐藏控件
   function tiannetSetValue(bolHideControl){
    var value = "";
    if( !tiannetDay || tiannetDay == "" ){
     tiannetOutObject.value = value;
     return;
    }
    var mm = tiannetMonth;
    var day = tiannetDay;
    if( mm < 10 && mm.toString().length == 1) mm = "0" + mm;
    if( day < 10 && day.toString().length == 1) day = "0" + day;
    value = tiannetYear + tiannetDateSplit + mm + tiannetDateSplit + day;
    if( m_bolShowHour ){
     var hour = tiannetHour;
     if( hour < 10 && hour.toString().length == 1 ) hour = "0" + hour;
     value += tiannetDateTimeSplit + hour;
    }
    if( m_bolShowMinute ){
     var minute = tiannetMinute;
     if( minute < 10 && minute.toString().length == 1 ) minute = "0" + minute;
     value += tiannetTimeSplit + minute;
    }
    tiannetOutObject.value = value;
    //document.all.divTiannetDate.style.display = "none";
    if( bolHideControl ) {
     tiannetHideControl();
    }
   }
   //是否显示时间
   function showTime(){
    if( !m_bolShowHour && m_bolShowMinute){
     alert("如果要选择分钟，则必须可以选择小时！");
     return;
    }
    hideElementsById(new Array("tiannetHourHead","selTianHour","tiannetMinuteHead","selTianMinute"),true);
    if( m_bolShowHour ){
     //显示小时
     hideElementsById(new Array("tiannetHourHead"),false);
    }
    if( m_bolShowMinute ){
     //显示分钟
     hideElementsById(new Array("tiannetMinuteHead"),false);
    }
   }
   //弹出显示日历选择控件，以让用户选择
   function tiannetPopCalendar(){
    //隐藏下拉框，显示相对应的head
    hideElementsById(new Array("selTianYear","selTianMonth","selTianHour","selTianMinute"),true);
    hideElementsById(new Array("tiannetYearHead","tiannetMonthHead","tiannetHourHead","tiannetMinuteHead"),false);
    tiannetSetDay(tiannetYear,tiannetMonth);
    tiannetWriteHead();
    showTime();
    var dads  = document.all.divTiannetDate.style;
    var iX, iY;
     
    var h = document.all.divTiannetDate.offsetHeight;
    var w = document.all.divTiannetDate.offsetWidth;
    //计算left
    if (window.event.x + h > document.body.offsetWidth - 10    )
     iX = window.event.x - h - 5 ;
    else
     iX = window.event.x + 5;  
    if (iX <0)  
     iX=0;
    //计算top
    iY = window.event.y;
    if (window.event.y + w > document.body.offsetHeight - 10   )
     iY = document.body.scrollTop + document.body.offsetHeight - w - 5 ;
    else
     iY = document.body.scrollTop +window.event.y + 5;  
    if (iY <0)  
     iY=0;
    dads.left = iX;
    dads.top = iY;
    tiannetShowControl();
    selectObject();
   }
   //隐藏日历控件(同时显示被强制隐藏的标签)
   function tiannetHideControl(){
    document.all.divTiannetDate.style.display = "none";
    tiannetShowObject();
    arrTiannetHide = new Array();//将被隐藏的标签对象清空
   }
   //显示日历控件(同时隐藏会遮挡的标签)
   function tiannetShowControl(){
    document.all.divTiannetDate.style.display = "";
    tiannetHideObject("Select");
    tiannetHideObject("OBJECT");
   }
   //根据标签名称隐藏标签。如会遮住控件的select，object
   function tiannetHideObject(strTagName) {
    
    x = document.all.divTiannetDate.offsetLeft;
    y = document.all.divTiannetDate.offsetTop;
    h = document.all.divTiannetDate.offsetHeight;
    w = document.all.divTiannetDate.offsetWidth;
    
    for (var i = 0; i < document.all.tags(strTagName).length; i++)
    {
     
     var obj = document.all.tags(strTagName)[i];
     if (! obj || ! obj.offsetParent)
      continue;
     // 获取元素对于BODY标记的相对坐标
     var objLeft   = obj.offsetLeft;
     var objTop    = obj.offsetTop;
     var objHeight = obj.offsetHeight;
     var objWidth = obj.offsetWidth;
     var objParent = obj.offsetParent;
     
     while (objParent.tagName.toUpperCase() != "BODY"){
      objLeft  += objParent.offsetLeft;
      objTop   += objParent.offsetTop;
      objParent = objParent.offsetParent;
     }
     //alert("控件左端:" + x + "select左端" + (objLeft + objWidth) + "控件底部:" + (y+h) + "select高:" + objTop);
     
     var bolHide = true;
     if( obj.style.display == "none" || obj.style.visibility == "hidden" || obj.getAttribute("Author") == "tiannet" ){
      //如果标签本身就是隐藏的，则不需要再隐藏。如果是控件中的下拉框，也不用隐藏。
      bolHide = false;
     }
     if(  ( (objLeft + objWidth) > x && (y + h + 20) > objTop && (objTop+objHeight) >  y && objLeft < (x+w) ) && bolHide ){
      //arrTiannetHide.push(obj);//记录被隐藏的标签对象
      arrTiannetHide[arrTiannetHide.length] = obj;
      obj.style.visibility = "hidden";
     }
     
     
    }
   }
   //显示被隐藏的标签
   function tiannetShowObject(){
    for(var i = 0;i < arrTiannetHide.length;i ++){
     //alert(arrTiannetHide[i]);
     arrTiannetHide[i].style.visibility = "";
    }
   }
   //初始化日期。
   function tiannetInitDate(strDate){
    var arr = strDate.split(tiannetDateSplit);
    tiannetYear = arr[0];
    tiannetMonth = arr[1];
    tiannetDay = arr[2];
   }
   //清空
   function tiannetClear(){
    tiannetOutObject.value = "";
    tiannetHideControl();
   }
    //任意点击时关闭该控件
   function document.onclick(){ 
     with(window.event.srcElement){ 
    	if (tagName != "INPUT" && getAttribute("Author") != "tiannet"){
    		tiannetHideControl();
    	}
     }
   }
   //按ESC键关闭该控件
   function document.onkeypress(){
    if( event.keyCode == 27 ){
     tiannetHideControl();
    }
   }
   function $(id){
   	return document.getElementById(id);
   }
   //表单检查
   function CheckForm()
	{
		if(checkTitle()&&checkContent()&&checkStartTime1()&&checkEndTime()&&checkStartTime2()&&checkUsers()){
		 form1.submit();
		 }
		 return false;
	}
	function checkTitle(){
	
	 if($("meetingTitle").value=="")
	 {  
	 	$("titleError").innerText="请输入会议标题！";
	    	return (false);	    
	 }
	 $("titleError").innerText="*";
	 return true;
	 }
	 function checkContent(){
	 if($("meetingContent").value=="")
	 {  
	 	$("contentError").innerText="请指定会议内容！";
	    return (false);
	 }
	 $("contentError").innerText="*";
	 return true;
	}
	function checkStartTime1(){
	 if($("startTime").value=="")
	 {  
	 	$("startTimeError").innerText="起始时间不能为空！";
	    return (false);
	 }
	 $("startTimeError").innerText="*";
	 return true;
	}
	function checkEndTime(){
	if($("endTime").value=="")
	 {  
	 $("endTimeError").innerText="结束时间不能为空！";
	    return (false);
	 }
	 $("endTimeError").innerText="*";
	 return true;
	 }
	 function checkStartTime2(){
	 if($("startTime").value>=$("endTime").value)
	 {  
	 	$("startTimeError").innerText="结束时间不能早于开始时间！";
	    return (false);
	 }
	 var date=new Date();
	 var input=$("startTime").value;	 
	 var input1=Date.UTC(input.substr(0,4), input.substr(5,2), input.substr(8,2), input.substr(11,2), input.substr(14,2));
	 var now=Date.UTC(date.getFullYear(),(date.getMonth()+1),date.getDate(),date.getHours(),date.getMinutes());
	 if(input1<now){
	 	$("startTimeError").innerText="开始时间不能早于但前时间！";
	    return (false);
	 }
	 $("startTimeError").innerText="*";
	 return true;
	 }
	 function checkUsers(){
	 if($("ids").value==""){
	 	
	 	$("usersError").innerText="请选择内部会议人员！";
	    return (false);
	 }
	 $("usersError").innerText="*";
	 return true;
	 }
	 
	 function checkStartTime(){
	 	checkStartTime1();
	 	checkStartTime2();
	 }
	
	function clear_user()
	{
	  $("users").value="";
	 $("ids").value="";
	}
	
	
	
</script>

		<script language="javascript" src="dwr/engine.js"></script>
		<script language="javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/EmailService.js"></script>
		<script type="text/javascript">
		
window.onload = function()
{
		//加部门信息
	EmailService.getDept(callBack);	
}
	function callBack(list){
		
		dwr.util.addOptions("mydept",list,"deptId","deptName");
	}
	//部门下拉改变时
	function deptChange(){
		var id=$("mydept").value;
		EmailService.getUserByDeptId(id,callBackDeptChange)
	}
	function callBackDeptChange(list){
		dwr.util.removeAllOptions("canselect");
		
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		
		for(var i=0;i<list.length;i++){
			list[i].userId
			var flag=true;
			for(var y=0;y<haveselect.childNodes.length ;y++) {
					if(haveselect.childNodes[y].value==list[i].userId){
						flag=false;
					}
      		}
      		if(flag==true){
      			 var newOption = new Option(list[i].userName,list[i].userId);
        	  	canselect.options.add(newOption);
      			
      		}
		}
		//dwr.util.addOptions("canselect",list,"userId","userName");
	}	
	function changeSelectsDisplay(bool){
		if(bool){
			$("boardRoomId").style.display="none";
			$("userId").style.display="none";
		}
		else{
			$("boardRoomId").style.display="block";
			$("userId").style.display="block";
		}
	}
	//收件人
	function getUser(){
		deptChange();
		changeSelectsDisplay(true);
		 //显示内容层
		   var top=Math.round(document.body.clientHeight/2)-200;
		   var left=Math.round(document.body.clientWidth/2)-250;
			document.getElementById("divuser").style.top=top;
			document.getElementById("divuser").style.left=left;
			document.getElementById("divuser").style.display="block";
			
		  //显示背景层
		  var bodyBack = document.createElement("div");
			bodyBack.setAttribute("id","bodybg");
			bodyBack.style.position = "absolute";
			bodyBack.style.width = "100%";
			bodyBack.style.height ="100%";
			bodyBack.style.zIndex = 98;
			bodyBack.style.top = 0;
			bodyBack.style.left = 0;
			bodyBack.style.filter = "alpha(opacity=50)";
			bodyBack.style.opacity = 0.5;
			bodyBack.style.background = "#ddf";
			bodyBack.style.display="block";
			//把新创建的背景层插入到body
			var parent = document.getElementById("divuser").parentNode;
			parent.appendChild(bodyBack);
	}
	//关闭层
	function closediv(){
		changeSelectsDisplay(false);
		document.getElementById("divuser").style.display="none";
		document.getElementById("divuser").parentNode.removeChild(document.getElementById("bodybg"));
	}
	//添加收件人
	function myselect(){
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		//alert(canselect.value);
		if(canselect.value!=""){
			//alert("value:"+canselect.value+"innerHTML:"+canselect.options[canselect.selectedIndex].innerHTML);
			//添加
			var myoption=document.createElement("option");
	      	myoption.setAttribute("value",canselect.value);
	     	myoption.innerHTML=canselect.options[canselect.selectedIndex].innerHTML;
	     	haveselect.appendChild(myoption);
			//删除
			canselect.options[canselect.selectedIndex].removeNode(true);
		}
	}
	//删除收件人
	function unselect(){
		var canselect=document.getElementById("canselect");
		var haveselect=document.getElementById("haveselect");
		if(haveselect.value!=""){
			//alert("value:"+haveselect.value+"innerHTML:"+haveselect.options[haveselect.selectedIndex].innerHTML);
			//添加
			var myoption=document.createElement("option");
	      	myoption.setAttribute("value",haveselect.value);
	     	myoption.innerHTML=haveselect.options[haveselect.selectedIndex].innerHTML;
	     	canselect.appendChild(myoption);
			//删除
			haveselect.options[haveselect.selectedIndex].removeNode(true);
		}
	}
	
	//确定
	function addSend(){
		var mystr="";//放值
		var	mycontent="";//放显示的内容
		var haveselect=document.getElementById("haveselect");
		for(var y=0;y<haveselect.childNodes.length ;y++) {
					if(y==haveselect.childNodes.length-1){
						mystr+=haveselect.childNodes[y].value;
						mycontent+=haveselect.childNodes[y].innerHTML;
					}else{
						mystr+=haveselect.childNodes[y].value+";";
						mycontent+=haveselect.childNodes[y].innerHTML+";";
					}
					
      	}
      	$("ids").value=mystr;
      	$("users").value=mycontent;
      	closediv();
      	
	}
	
	</script>

	</head>

	<body topmargin="5" bgcolor="#D3DBEE" style="height: 500px">
		<div id="divuser"
			style="height: 400; position: absolute; z-index: 99; display: none; width: 500">
			<table id="__01" width="500" height="400" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<img src="image/sendemail_01.jpg" width="9" height="30" alt="">
					</td>
					<td background="image/sendemail_02.jpg" valign="bottom"
						style="font-family: 宋体; font-weight: bold; font-size: 14px;"
						width="460" height="30">
						<img src="image/se.gif" align="absmiddle">
						选择出席人员
					</td>
					<td colspan="2">
						<img src="image/sendemail_03.jpg" onClick="closediv()" width="31"
							height="30" alt="">
					</td>
				</tr>
				<tr>
					<td background="image/sendemail_04.jpg" width="9" height="*">
					</td>
					<td align="left" bgcolor="#FFFFFF" valign="top">
						<!-- 层里面内容 -->
						<br>
						部门
						<select id="mydept" onChange="deptChange()"></select>
						<hr color="#CCCCFF">
						<table align="center">
							<tr>
								<td>
									可选择
								</td>
								<td></td>
								<td>
									已选择
								</td>
							</tr>
							<tr>
								<td>
									<select id="canselect" multiple="true"
										style="border: 1px #CCCCCC solid; width: 100px; height: 300px">
									</select>
								</td>
								<td align="center">
									<input type="button" onClick="myselect()" value="&gt;&gt;&gt;" />
									<br>
									<input type="button" onClick="unselect()" value="&lt;&lt;&lt;" />
									<br>
									<br>
									<br>
									<input type="button" onClick="addSend()" value="确定" />
								</td>
								<td>
									<select id="haveselect" multiple="true"
										style="border: 1px #CCCCCC solid; width: 100px; height: 300px">
									</select>
								</td>
							</tr>
						</table>

					</td>
					<td colspan="2" background="image/sendemail_06.jpg" width="31"
						height="*">
					</td>
				</tr>
				<tr>
					<td>
						<img src="image/sendemail_07.jpg" width="9" height="7" alt="">
					</td>
					<td background="image/sendemail_08.jpg" width="*" height="7">
						<img src="image/sendemail_08.jpg" width="175" height="7" alt="">
					</td>
					<td>
						<img src="image/sendemail_09.jpg" width="16" height="7" alt="">
					</td>
					<td>
						<img src="image/sendemail_10.jpg" width="15" height="7" alt="">
					</td>
				</tr>
			</table>

		</div>
		<form action="meeting.do" method="post" name="form1">
			<input type="hidden" name="operate" value="doMeetAdd">
			<table border="0" width="100%" cellspacing="0" cellpadding="3"
				class="small">
				<tr>
					<td class="Big">
						<span class="big3"> 会议申请(<font size="2">申请之前,请查询"进行中"状态的会议,以避免时间冲突</font>)</span>
					</td>
				</tr>
			</table>

			<table align="center" border="0" width="620" cellpadding="2"
				cellspacing="1" align="center" class="small">


				<tr>
					<td nowrap width="100">
						标 题：
					</td>
					<td colspan="3">
						<input type="text" id="meetingTitle" name="meeting.meetingTitle"
							size="40" maxlength="100" class="BigInput" value="" onchange="checkTitle()">
						<br>
						<span id="titleError" style="color: red">*</span>
					</td>
				</tr>

				<tr>
					<td nowrap>
						内 容：
					</td>
					<td colspan="3">
						<textarea id="meetingContent" name="meeting.meetingContent"
							class="BigInput" cols="50" rows="3"  onchange="checkContent()"></textarea>
						<br />
						<span id="contentError" style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td nowrap>
						出席人员：
						<br>
						(外部)
					</td>
					<td colspan="3">
						<textarea name="meeting.outUser" class="BigInput" cols="50"
							rows="3"></textarea>

					</td>
				</tr>
				<tr>
					<td nowrap>
						出席人员：
						<br>
						(内部)
					</td>
					<td colspan="3">
						<input type="hidden" id="ids" name="ids" value="">
						<textarea id="users" name="users" class="BigStatic" cols="50"
							rows="3" class="BigStatic" wrap="yes" readonly
							onClick="getUser()"  onchange="checkUsers()"></textarea>
						<br />
						<input type="button" value="清 空" class="SmallButton"
							onClick="clear_user()" title="清空出席人员" name="button">
						<input type="button" value="添 加" class="SmallButton"
							onClick="getUser()" title="添加出席人员" name="button">
						<span id="usersError" style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td>
						<div id="userDiv" style="display: none">
							<table align="center">
								<tr>
									<td>
										<input type="button" onclick="changeInDiv(true)" value="按部门" />
									</td>
								</tr>
								<tr>
									<td>
										<div id="depDiv" style="display: none">
											部门
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input type="button" onclick="changeInDiv(false)" value="按职位" />
									</td>
								</tr>
								<tr>
									<td>
										<div id="posDiv" style="display: none">
											职位
										</div>
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="button" onclick="writeMeetReader()" value="添加" />
										<input type="button" onclick="changeDiv(false)" value="关闭" />
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td nowrap>
						会 议 室：
					</td>
					<td>
						<select name="meeting.boardRoom.boardRoomId" id="boardRoomId"
							class="BigSelect">
							<c:forEach var="boardRoom" items="${boardRooms}">
								<option value="${boardRoom.boardRoomId }">
									${boardRoom.boardRoomName }
								</option>
							</c:forEach>
						</select>
					</td>

					<td nowrap width="120">
						会议室管理员：
					</td>
					<td>
						<select id="userId" name="meeting.userByExaminer.userId"
							class="BigSelect">
							<c:forEach var="user" items="${users}">
								<option value="${user.userId }">
									${user.userName }
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td nowrap>
						开始时间：
					</td>
					<td>
						<input type="text" id="startTime" name="meeting.startTime"
							readOnly onClick="setDayHM(this);"  onchange="checkStartTime()">
						<br>
						<span id="startTimeError" style="color: red">*</span>
					</td>
					<td nowrap width="100">
						结束时间：
					</td>
					<td>
						<input type="text" id="endTime" name="meeting.endTime" readOnly
							onClick="setDayHM(this);"  onchange="checkEndTime()">
						<br>
						<span id="endTimeError" style="color: red">*</span>
					</td>
				</tr>
				<tr>
					<td nowrap colspan="4" align="center">
						<input type="button" value="确定" class="BigButton"
							onclick="CheckForm();">
						<input type="hidden" name="meeting.meetingstate.meetingStateId"
							value="1">
						<input type="hidden" name="meeting.examineState.examineStateId"
							value="1">
						<input type="hidden" name="meeting.userByUserId.userId"
							value="${user.userId }">

					</td>
				</tr>
				<tr>
					<td nowrap colspan="4" align="center">
						${msg }

					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
