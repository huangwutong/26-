// 涓昏皟鐢ㄥ嚱鏁版槸 setday(this,[object])鍜宻etday(this)锛孾object]鏄帶浠惰緭鍑虹殑鎺т欢鍚嶏紝涓句袱涓緥瀛愶細
// 涓��<input name=txt><input type=button value=setday onclick="setday(this,document.all.txt)">
// 浜屻�<input onfocus="setday(this)">
var bMoveable=true;
var strFrame;

document.writeln('<iframe id=endDateLayer frameborder=0 width=162 height=211 style="position: absolute; z-index: 9998; display: none"></iframe>');
strFrame='<style>';
strFrame+='INPUT.button{BORDER-RIGHT: #63A3E9 1px solid;BORDER-TOP: #63A3E9 1px solid;BORDER-LEFT: #63A3E9 1px solid;';
strFrame+='BORDER-BOTTOM: #63A3E9 1px solid;BACKGROUND-COLOR: #63A3E9;font-family:瀹嬩綋;}';
strFrame+='TD{FONT-SIZE: 9pt;font-family:瀹嬩綋;}';
strFrame+='</style>';
strFrame+='<scr' + 'ipt>';
strFrame+='var datelayerx,datelayery;';
strFrame+='var bDrag;';
strFrame+='function document.onmousemove()';
strFrame+='{if(bDrag && window.event.button==1)';
strFrame+=' {var DateLayer=parent.document.all.endDateLayer.style;';
strFrame+=' DateLayer.posLeft += window.event.clientX-datelayerx;';
strFrame+=' DateLayer.posTop += window.event.clientY-datelayery;}}';
strFrame+='function DragStart()';
strFrame+='{var DateLayer=parent.document.all.endDateLayer.style;';
strFrame+=' datelayerx=window.event.clientX;';
strFrame+=' datelayery=window.event.clientY;';
strFrame+=' bDrag=true;}';
strFrame+='function DragEnd(){';
strFrame+=' bDrag=false;}';
strFrame+='</scr' + 'ipt>';
strFrame+='<div style="z-index:9999;position: absolute; left:0; top:0;" onselectstart="return false">';
strFrame+='<span id=tmpSelectYearLayer style="z-index: 9999;position: absolute;top: 3; left: 19;display: none"></span>';
strFrame+='<span id=tmpSelectMonthLayer style="z-index: 9999;position: absolute;top: 3; left: 78;display: none"></span>';
strFrame+='<span id=tmpSelectHourLayer style="z-index: 9999;position: absolute;top: 188; left: 35px;display: none"></span>';
strFrame+='<span id=tmpSelectMinuteLayer style="z-index:9999;position:absolute;top: 188; left: 77px;display: none"></span>';
strFrame+='<span id=tmpSelectSecondLayer style="z-index:9999;position:absolute;top: 188; left: 119px;display: none"></span>';
strFrame+='<table border=1 cellspacing=0 cellpadding=0 width=142 height=160 bordercolor=#63A3E9 bgcolor=#63A3E9 >';
strFrame+='    <tr><td width=142 height=23 bgcolor=#FFFFFF>';
strFrame+='        <table border=0 cellspacing=1 cellpadding=0 width=158 height=23>';
strFrame+='            <tr align=center >';
strFrame+='                <td width=16 align=center bgcolor=#63A3E9 style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='        onclick="parent.meizzPrevM()" title="鍚戝墠缈�1 鏈� ><b >&lt;</b></td>';
strFrame+='       <td width=60 align="center" bgcolor="#63A3E9" style="font-size:12px;cursor:hand" ';
strFrame+='           onmouseover="style.backgroundColor=\'#aaccf3\'"';
strFrame+='        onmouseout="style.backgroundColor=\'#63A3E9\'" ';
strFrame+='        onclick="parent.tmpSelectYearInnerHTML(this.innerText.substring(0,4))" ';
strFrame+='        title="鐐瑰嚮杩欓噷閫夋嫨骞翠唤"><span id=meizzYearHead></span></td>';
strFrame+='       <td width=48 align="center" style="font-size:12px;font-color: #ffffff;cursor:hand" ';
strFrame+='        bgcolor="#63A3E9" onmouseover="style.backgroundColor=\'#aaccf3\'" ';
strFrame+='        onmouseout="style.backgroundColor=\'#63A3E9\'" ';
strFrame+='        onclick="parent.tmpSelectMonthInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+='        title="鐐瑰嚮杩欓噷閫夋嫨鏈堜唤"><span id=meizzMonthHead ></span></td>';
strFrame+='       <td width=16 bgcolor=#63A3E9 align=center style="font-size:12px;cursor: hand;color: #ffffff" ';
strFrame+='        onclick="parent.meizzNextM()" title="鍚戝悗缈�1 鏈� ><b >&gt;</b></td>';
strFrame+='      </tr>';
strFrame+='     </table></td></tr>';
strFrame+='    <tr><td width=142 height=18 >';
strFrame+='     <table border=0 cellspacing=0 cellpadding=2 bgcolor=#63A3E9 ' + (bMoveable? 'onmousedown="DragStart()" onmouseup="DragEnd()"':'');
strFrame+='    BORDERCOLORLIGHT=#63A3E9 BORDERCOLORDARK=#FFFFFF width=140 height=20 style="cursor:' + (bMoveable ? 'move':'default') + '">';
strFrame+='    <tr><td style="font-size:12px;color:#ffffff" width=20>&nbsp;鏃�/td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" >&nbsp;涓�/td><td style="font-size:12px;color:#FFFFFF">&nbsp;浜�/td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" >&nbsp;涓�/td><td style="font-size:12px;color:#FFFFFF" >&nbsp;鍥�/td>';
strFrame+='<td style="font-size:12px;color:#FFFFFF" >&nbsp;浜�/td><td style="font-size:12px;color:#FFFFFF" >&nbsp;鍏�/td></tr>';
strFrame+='</table></td></tr>';
strFrame+=' <tr ><td width=142 height=120 >';
strFrame+='    <table border=1 cellspacing=2 cellpadding=2 BORDERCOLORLIGHT=#63A3E9 BORDERCOLORDARK=#FFFFFF bgcolor=#fff8ec width=140 height=120 >';
var n=0; for (j=0;j<5;j++){ strFrame+= ' <tr align=center >'; for (i=0;i<7;i++){
strFrame+='<td width=20 height=20 id=meizzDay'+n+' style="font-size:12px" onclick=parent.meizzDayClick(this.innerText,0)></td>';n++;}
strFrame+='</tr>';}
strFrame+='      <tr align=center >';
for (i=35;i<37;i++)strFrame+='<td width=20 height=20 id=meizzDay'+i+' style="font-size:12px" onclick="parent.meizzDayClick(this.innerText,0)"></td>';
strFrame+='        <td colspan=5 align=right style="color:#1478eb"><span onclick="parent.setNull()" style="font-size:12px;cursor: hand"';
strFrame+='         onmouseover="style.color=\'#ff0000\'" onmouseout="style.color=\'#1478eb\'" title="灏嗘棩鏈熺疆绌�>缃┖</span>&nbsp;&nbsp;<span onclick="parent.meizzToday()" style="font-size:12px;cursor: hand"';
strFrame+='         onmouseover="style.color=\'#ff0000\'" onmouseout="style.color=\'#1478eb\'" title="褰撳墠鏃ユ湡鏃堕棿">褰撳墠</span>&nbsp;&nbsp;<span style="cursor:hand" id=evaAllOK onmouseover="style.color=\'#ff0000\'" onmouseout="style.color=\'#1478eb\'" onclick="parent.closeLayer()" title="鍏抽棴鏃ュ巻">鍏抽棴&nbsp;</span></td></tr>';
strFrame+='    </table></td></tr><tr ><td >';
strFrame+='        <table border=0 cellspacing=1 cellpadding=0 width=100% bgcolor=#FFFFFF height=22 >';
strFrame+='          <tr bgcolor="#63A3E9"><td id=bUseTimeLayer width=30 style="cursor:hand" title="鐐瑰嚮杩欓噷鍚敤/绂佺敤鏃堕棿"';
strFrame+='    onmouseover="style.backgroundColor=\'#aaccf3\'" align=center onmouseout="style.backgroundColor=\'#63A3E9\'"';
strFrame+='     onclick="parent.UseTime(this)">';
strFrame+=' <span></span></td>';
strFrame+='             <td style="cursor:hand" onclick="parent.tmpSelectHourInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+=' onmouseover="style.backgroundColor=\'#aaccf3\'" onmouseout="style.backgroundColor=\'#63A3E9\'"';
strFrame+=' title="鐐瑰嚮杩欓噷閫夋嫨鏃堕棿" align=center width=42>' ;
strFrame+='     <span id=meizzHourHead></span></td>';
strFrame+='             <td style="cursor:hand" onclick="parent.tmpSelectMinuteInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+=' onmouseover="style.backgroundColor=\'#aaccf3\'" onmouseout="style.backgroundColor=\'#63A3E9\'"';
strFrame+=' title="鐐瑰嚮杩欓噷閫夋嫨鏃堕棿" align=center width=42>' ;
strFrame+='     <span id=meizzMinuteHead></span></td>';
strFrame+='             <td style="cursor:hand" onclick="parent.tmpSelectSecondInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"';
strFrame+=' onmouseover="style.backgroundColor=\'#aaccf3\'" onmouseout="style.backgroundColor=\'#63A3E9\'"';
strFrame+=' title="鐐瑰嚮杩欓噷閫夋嫨鏃堕棿" align=center width=42>' ;
strFrame+='     <span id=meizzSecondHead></span></td>';
strFrame+='    </tr></table></td></tr></table></div>';

window.frames.endDateLayer.document.writeln(strFrame);
window.frames.endDateLayer.document.close(); //瑙ｅ喅ie杩涘害鏉′笉缁撴潫鐨勯棶棰�


//==================================================== WEB 椤甸潰鏄剧ず閮ㄥ垎 ======================================================
var outObject;
var outButton; //鐐瑰嚮鐨勬寜閽�

var outDate=""; //瀛樻斁瀵硅薄鐨勬棩鏈�
var bUseTime=false; //鏄惁浣跨敤鏃堕棿
var odatelayer=window.frames.endDateLayer.document.all; //瀛樻斁鏃ュ巻瀵硅薄
var odatelayer=window.endDateLayer.document.all;
//odatelayer.bUseTimeLayer.innerText="NO";
bImgSwitch();
odatelayer.bUseTimeLayer.innerHTML=bImg;

function setday(tt,obj) //涓昏皟鍑芥暟
{
if (arguments.length > 2){alert("瀵逛笉璧凤紒浼犲叆鏈帶浠剁殑鍙傛暟澶锛�");return;}
if (arguments.length == 0){alert("瀵逛笉璧凤紒鎮ㄦ病鏈変紶鍥炴湰鎺т欢浠讳綍鍙傛暟锛�");return;}
var dads = document.all.endDateLayer.style;
var th = tt;
var ttop = tt.offsetTop; //TT鎺т欢鐨勫畾浣嶇偣楂�

var thei = tt.clientHeight; //TT鎺т欢鏈韩鐨勯珮
var tleft = tt.offsetLeft; //TT鎺т欢鐨勫畾浣嶇偣瀹�

var ttyp = tt.type; //TT鎺т欢鐨勭被鍨�

while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
dads.top = (ttyp=="image") ? ttop+thei : ttop+thei+6;
dads.left = tleft;
outObject = (arguments.length == 1) ? th : obj;
outButton = (arguments.length == 1) ? null : th; //璁惧畾澶栭儴鐐瑰嚮鐨勬寜閽�

//鏍规嵁褰撳墠杈撳叆妗嗙殑鏃ユ湡鏄剧ず鏃ュ巻鐨勫勾鏈�
var reg = /^(\d+)-(\d{1,2})-(\d{1,2})/; //涓嶅惈鏃堕棿
var r = outObject.value.match(reg);
if(r!=null){
r[2]=r[2]-1;
var d=new Date(r[1],r[2],r[3]);
if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3])
{
   outDate=d;
   parent.meizzTheYear = r[1];
   parent.meizzTheMonth = r[2];
   parent.meizzTheDate = r[3];
}
else
{
   outDate="";
}
meizzSetDay(r[1],r[2]+1);
}
else
{
outDate="";
meizzSetDay(new Date().getFullYear(), new Date().getMonth() + 1);
}
dads.display = '';

//鍒ゆ柇鍒濆鍖栨椂鏄惁浣跨敤鏃堕棿,闈炰弗鏍奸獙璇�
//if (outObject.value.length>10)
//{
bUseTime=false;//榛樿浣跨敤鏃堕棿涓簍rue,涓嶄娇鐢ㄤ负false
bImgSwitch();
odatelayer.bUseTimeLayer.innerHTML=bImg;
meizzWriteHead(meizzTheYear,meizzTheMonth);
//}
//else
//{
// bUseTime=false;
// bImgSwitch();
// odatelayer.bUseTimeLayer.innerHTML=bImg;
// meizzWriteHead(meizzTheYear,meizzTheMonth);
//}

try
{
event.returnValue=false;
}
catch (e)
{
//姝ゅ鎺掗櫎閿欒锛岄敊璇師鍥犳殏鏈壘鍒般�
}
}
function setDayAndTime(tt,obj) //涓昏皟鍑芥暟鏄剧ず鏃堕棿鍜屾棩鏈�/////////////////////////////////////////////////////
{
if (arguments.length > 2){alert("瀵逛笉璧凤紒浼犲叆鏈帶浠剁殑鍙傛暟澶锛�");return;}
if (arguments.length == 0){alert("瀵逛笉璧凤紒鎮ㄦ病鏈変紶鍥炴湰鎺т欢浠讳綍鍙傛暟锛�");return;}
var dads = document.all.endDateLayer.style;
var th = tt;
var ttop = tt.offsetTop; //TT鎺т欢鐨勫畾浣嶇偣楂�

var thei = tt.clientHeight; //TT鎺т欢鏈韩鐨勯珮
var tleft = tt.offsetLeft; //TT鎺т欢鐨勫畾浣嶇偣瀹�

var ttyp = tt.type; //TT鎺т欢鐨勭被鍨�

while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
dads.top = (ttyp=="image") ? ttop+thei : ttop+thei+6;
dads.left = tleft;
outObject = (arguments.length == 1) ? th : obj;
outButton = (arguments.length == 1) ? null : th; //璁惧畾澶栭儴鐐瑰嚮鐨勬寜閽�

//鏍规嵁褰撳墠杈撳叆妗嗙殑鏃ユ湡鏄剧ず鏃ュ巻鐨勫勾鏈�
var reg = /^(\d+)-(\d{1,2})-(\d{1,2})/; //涓嶅惈鏃堕棿
var r = outObject.value.match(reg);
if(r!=null){
r[2]=r[2]-1;
var d=new Date(r[1],r[2],r[3]);
if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3])
{
   outDate=d;
   parent.meizzTheYear = r[1];
   parent.meizzTheMonth = r[2];
   parent.meizzTheDate = r[3];
}
else
{
   outDate="";
}
meizzSetDay(r[1],r[2]+1);
}
else
{
outDate="";
meizzSetDay(new Date().getFullYear(), new Date().getMonth() + 1);
}
dads.display = '';

//鍒ゆ柇鍒濆鍖栨椂鏄惁浣跨敤鏃堕棿,闈炰弗鏍奸獙璇�
//if (outObject.value.length>10)
//{
bUseTime=true;//榛樿浣跨敤鏃堕棿涓簍rue,涓嶄娇鐢ㄤ负false
bImgSwitch();
odatelayer.bUseTimeLayer.innerHTML=bImg;
meizzWriteHead(meizzTheYear,meizzTheMonth);
//}
//else
//{
// bUseTime=false;
// bImgSwitch();
// odatelayer.bUseTimeLayer.innerHTML=bImg;
// meizzWriteHead(meizzTheYear,meizzTheMonth);
//}

try
{
event.returnValue=false;
}
catch (e)
{
//姝ゅ鎺掗櫎閿欒锛岄敊璇師鍥犳殏鏈壘鍒般�
}
}
var MonHead = new Array(12); //瀹氫箟闃冲巻涓瘡涓湀鐨勬渶澶уぉ鏁�

MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4] = 31; MonHead[5] = 30;
MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;

var meizzTheYear=new Date().getFullYear(); //瀹氫箟骞寸殑鍙橀噺鐨勫垵濮嬪�

var meizzTheMonth=new Date().getMonth()+1; //瀹氫箟鏈堢殑鍙橀噺鐨勫垵濮嬪�

var meizzTheDate=new Date().getDate(); //瀹氫箟鏃ョ殑鍙橀噺鐨勫垵濮嬪� 
var meizzTheHour=new Date().getHours(); //瀹氫箟灏忔椂鍙橀噺鐨勫垵濮嬪�

var meizzTheMinute=new Date().getMinutes();//瀹氫箟鍒嗛挓鍙橀噺鐨勫垵濮嬪�
var meizzTheSecond=new Date().getSeconds();//瀹氫箟绉掑彉閲忕殑鍒濆鍊�

var meizzWDay=new Array(37); //瀹氫箟鍐欐棩鏈熺殑鏁扮粍

document.onclick = (function(){ 
with(window.event)
{
if (srcElement != outObject && srcElement != outButton)
closeLayer();
}
})
document.onkeyup = (function(){
if (window.event.keyCode==27){
if(outObject)outObject.blur();
closeLayer();
}
else if(document.activeElement)
{
if(document.activeElement != outObject && document.activeElement != outButton)
{
   closeLayer();
}
}
})

function meizzWriteHead(yy,mm,ss) //寰�head 涓啓鍏ュ綋鍓嶇殑骞翠笌鏈�
{
odatelayer.meizzYearHead.innerText = yy + " 骞�";
odatelayer.meizzMonthHead.innerText = format(mm) + " 鏈�";
//鎻掑叆褰撳墠灏忔椂銆佸垎
odatelayer.meizzHourHead.innerText=bUseTime?(meizzTheHour+" 鏃�"):""; 
odatelayer.meizzMinuteHead.innerText=bUseTime?(meizzTheMinute+" 鍒�"):"";
odatelayer.meizzSecondHead.innerText=bUseTime?(meizzTheSecond+" 绉�"):"";
}

function tmpSelectYearInnerHTML(strYear) //骞翠唤鐨勪笅鎷夋
{
if (strYear.match(/\D/)!=null){alert("骞翠唤杈撳叆鍙傛暟涓嶆槸鏁板瓧锛�");return;}
var m = (strYear) ? strYear : new Date().getFullYear();
if (m < 1000 || m > 9999) {alert("骞翠唤鍊间笉鍦�1000 鍒�9999 涔嬮棿锛�");return;}
var n = m - 50;
if (n < 1000) n = 1000;
if (n + 101 > 9999) n = 9974;
var s = "&nbsp;<select name=tmpSelectYear style='font-size: 12px' "
s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
s += "parent.meizzTheYear = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
var selectInnerHTML = s;
for (var i = n; i < n + 101; i++)
{
if (i == m) { selectInnerHTML += "<option value='" + i + "' selected>" + i + "骞� + "</option>\r\n"; }
else { selectInnerHTML += "<option value='" + i + "'>" + i + "骞� + "</option>\r\n"; }
}
selectInnerHTML += "</select>";
odatelayer.tmpSelectYearLayer.style.display="";
odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML;
odatelayer.tmpSelectYear.focus();
}

function tmpSelectMonthInnerHTML(strMonth) //鏈堜唤鐨勪笅鎷夋
{
if (strMonth.match(/\D/)!=null){alert("鏈堜唤杈撳叆鍙傛暟涓嶆槸鏁板瓧锛�);return;}
var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
var s = "&nbsp;&nbsp;&nbsp;<select name=tmpSelectMonth style='font-size: 12px' "
s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
s += "parent.meizzTheMonth = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n";
var selectInnerHTML = s;
for (var i = 1; i < 13; i++)
{
if (i == m) { selectInnerHTML += "<option value='"+i+"' selected>"+i+"鏈�+"</option>\r\n"; }
else { selectInnerHTML += "<option value='"+i+"'>"+i+"鏈�+"</option>\r\n"; }
}
selectInnerHTML += "</select>";
odatelayer.tmpSelectMonthLayer.style.display="";
odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
odatelayer.tmpSelectMonth.focus();
}

/***** 澧炲姞 灏忔椂銆佸垎閽�***/
function tmpSelectHourInnerHTML(strHour) //灏忔椂鐨勪笅鎷夋
{
if (!bUseTime){return;}

if (strHour.match(/\D/)!=null){alert("灏忔椂杈撳叆鍙傛暟涓嶆槸鏁板瓧锛�);return;}
var m = (strHour) ? strHour : new Date().getHours();
var s = "<select name=tmpSelectHour style='font-size: 12px' "
s += "onblur='document.all.tmpSelectHourLayer.style.display=\"none\"' "
s += "onchange='document.all.tmpSelectHourLayer.style.display=\"none\";"
s += "parent.meizzTheHour = this.value; parent.evaSetTime(parent.meizzTheHour,parent.meizzTheMinute);'>\r\n";
var selectInnerHTML = s;
for (var i = 0; i < 24; i++)
{
if (i == m) { selectInnerHTML += "<option value='"+i+"' selected>"+i+"</option>\r\n"; }
else { selectInnerHTML += "<option value='"+i+"'>"+i+"</option>\r\n"; }
}
selectInnerHTML += "</select>";
odatelayer.tmpSelectHourLayer.style.display="";
odatelayer.tmpSelectHourLayer.innerHTML = selectInnerHTML;
odatelayer.tmpSelectHour.focus();
}

function tmpSelectMinuteInnerHTML(strMinute) //鍒嗛挓鐨勪笅鎷夋
{
if (!bUseTime){return;}

if (strMinute.match(/\D/)!=null){alert("鍒嗛挓杈撳叆鍙傛暟涓嶆槸鏁板瓧锛�);return;}
var m = (strMinute) ? strMinute : new Date().getMinutes();
var s = "<select name=tmpSelectMinute style='font-size: 12px' "
s += "onblur='document.all.tmpSelectMinuteLayer.style.display=\"none\"' "
s += "onchange='document.all.tmpSelectMinuteLayer.style.display=\"none\";"
s += "parent.meizzTheMinute = this.value; parent.evaSetTime(parent.meizzTheHour,parent.meizzTheMinute);'>\r\n";
var selectInnerHTML = s;
for (var i = 0; i < 60; i++)
{
if (i == m) { selectInnerHTML += "<option value='"+i+"' selected>"+i+"</option>\r\n"; }
else { selectInnerHTML += "<option value='"+i+"'>"+i+"</option>\r\n"; }
}
selectInnerHTML += "</select>";
odatelayer.tmpSelectMinuteLayer.style.display="";
odatelayer.tmpSelectMinuteLayer.innerHTML = selectInnerHTML;
odatelayer.tmpSelectMinute.focus();
}

function tmpSelectSecondInnerHTML(strSecond) //绉掔殑涓嬫媺妗�
{
if (!bUseTime){return;}

if (strSecond.match(/\D/)!=null){alert("鍒嗛挓杈撳叆鍙傛暟涓嶆槸鏁板瓧锛�);return;}
var m = (strSecond) ? strSecond : new Date().getMinutes();
var s = "<select name=tmpSelectSecond style='font-size: 12px' "
s += "onblur='document.all.tmpSelectSecondLayer.style.display=\"none\"' "
s += "onchange='document.all.tmpSelectSecondLayer.style.display=\"none\";"
s += "parent.meizzTheSecond = this.value; parent.evaSetTime(parent.meizzTheHour,parent.meizzTheMinute,parent.meizzTheSecond);'>\r\n";
var selectInnerHTML = s;
for (var i = 0; i < 60; i++)
{
if (i == m) { selectInnerHTML += "<option value='"+i+"' selected>"+i+"</option>\r\n"; }
else { selectInnerHTML += "<option value='"+i+"'>"+i+"</option>\r\n"; }
}
selectInnerHTML += "</select>";
odatelayer.tmpSelectSecondLayer.style.display="";
odatelayer.tmpSelectSecondLayer.innerHTML = selectInnerHTML;
odatelayer.tmpSelectSecond.focus();
}

function closeLayer() //杩欎釜灞傜殑鍏抽棴
{
var o = document.getElementById("endDateLayer");
if (o != null)
{
o.style.display="none";
}
}

function showLayer() //杩欎釜灞傜殑鍏抽棴
{
document.all.endDateLayer.style.display="";
}

function IsPinYear(year) //鍒ゆ柇鏄惁闂板钩骞�
{
if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
}

function GetMonthCount(year,month) //闂板勾浜屾湀涓�9澶�
{
var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
}

function GetDOW(day,month,year) //姹傛煇澶╃殑鏄熸湡鍑�
{
var dt=new Date(year,month-1,day).getDay()/7; return dt;
}

function meizzPrevY() //寰�墠缈�Year
{
if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
else{alert("骞翠唤瓒呭嚭鑼冨洿锛�000-9999锛夛紒");}
meizzSetDay(meizzTheYear,meizzTheMonth);
}
function meizzNextY() //寰�悗缈�Year
{
if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
else{alert("骞翠唤瓒呭嚭鑼冨洿锛�000-9999锛夛紒");}
meizzSetDay(meizzTheYear,meizzTheMonth);
}
function setNull()
{
outObject.value = '';
closeLayer();
}
function meizzToday() //Today Button
{
parent.meizzTheYear = new Date().getFullYear();
parent.meizzTheMonth = new Date().getMonth()+1;
parent.meizzTheDate = new Date().getDate();
parent.meizzTheHour = new Date().getHours();
parent.meizzTheMinute = new Date().getMinutes();
parent.meizzTheSecond = new Date().getSeconds();
var meizzTheSecond = new Date().getSeconds();

if (meizzTheMonth<10 && meizzTheMonth.length<2) //鏍煎紡鍖栨垚涓や綅鏁板瓧
{
parent.meizzTheMonth="0"+parent.meizzTheMonth;
}
if (parent.meizzTheDate<10 && parent.meizzTheDate.length<2) //鏍煎紡鍖栨垚涓や綅鏁板瓧
{
parent.meizzTheDate="0"+parent.meizzTheDate;
}
//meizzSetDay(meizzTheYear,meizzTheMonth);
if(outObject)
{
if (bUseTime)
{
   outObject.value= parent.meizzTheYear + "-" + format( parent.meizzTheMonth) + "-" + 
       format(parent.meizzTheDate) + " " + format(parent.meizzTheHour) + ":" + 
       format(parent.meizzTheMinute) + ":" + format(parent.meizzTheSecond); 
       //娉細鍦ㄨ繖閲屼綘鍙互杈撳嚭鏀规垚浣犳兂瑕佺殑鏍煎紡
}
else
{
   outObject.value= parent.meizzTheYear + "-" + format( parent.meizzTheMonth) + "-" + 
       format(parent.meizzTheDate); //娉細鍦ㄨ繖閲屼綘鍙互杈撳嚭鏀规垚浣犳兂瑕佺殑鏍煎紡
}
}
closeLayer();
}
function meizzPrevM() //寰�墠缈绘湀浠�
{
if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
meizzSetDay(meizzTheYear,meizzTheMonth);
}
function meizzNextM() //寰�悗缈绘湀浠�
{
if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
meizzSetDay(meizzTheYear,meizzTheMonth);
}

// TODO: 鏁寸悊浠ｇ爜
function meizzSetDay(yy,mm) //涓昏鐨勫啓绋嬪簭**********
{
meizzWriteHead(yy,mm);
//璁剧疆褰撳墠骞存湀鐨勫叕鍏卞彉閲忎负浼犲叆鍊�

meizzTheYear=yy;
meizzTheMonth=mm;

for (var i = 0; i < 37; i++){meizzWDay[i]=""}; //灏嗘樉绀烘鐨勫唴瀹瑰叏閮ㄦ竻绌�

var day1 = 1,day2=1,firstday = new Date(yy,mm-1,1).getDay(); //鏌愭湀绗竴澶╃殑鏄熸湡鍑�

for (i=0;i<firstday;i++)meizzWDay[i]=GetMonthCount(mm==1?yy-1:yy,mm==1?12:mm-1)-firstday+i+1 //涓婁釜鏈堢殑鏈�悗鍑犲ぉ

for (i = firstday; day1 < GetMonthCount(yy,mm)+1; i++) { meizzWDay[i]=day1;day1++; }
for (i=firstday+GetMonthCount(yy,mm);i<37;i++) { meizzWDay[i]=day2;day2++; }
for (i = 0; i < 37; i++)
{
var da = eval("odatelayer.meizzDay"+i) //涔﹀啓鏂扮殑涓�釜鏈堢殑鏃ユ湡鏄熸湡鎺掑垪

if (meizzWDay[i]!="")
{
//鍒濆鍖栬竟妗�
da.borderColorLight="#63A3E9";
da.borderColorDark="#63A3E9";
da.style.color="#1478eb";
if(i<firstday) //涓婁釜鏈堢殑閮ㄥ垎
{
   da.innerHTML="<b><font color=#BCBABC>" + meizzWDay[i] + "</font></b>";
   da.title=(mm==1?12:mm-1) +"鏈� + meizzWDay[i] + "鏃�;
   da.onclick=Function("meizzDayClick(this.innerText,-1)");

   if(!outDate)
    da.style.backgroundColor = ((mm==1?yy-1:yy) == new Date().getFullYear() && 
     (mm==1?12:mm-1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
      "#5CEFA0":"#f5f5f5";
   else
   {
    da.style.backgroundColor =((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())? "#84C1FF" :
    (((mm==1?yy-1:yy) == new Date().getFullYear() && (mm==1?12:mm-1) == new Date().getMonth()+1 && 
    meizzWDay[i] == new Date().getDate()) ? "#5CEFA0":"#f5f5f5");
    //灏嗛�涓殑鏃ユ湡鏄剧ず涓哄嚬涓嬪幓

    if((mm==1?yy-1:yy)==outDate.getFullYear() && (mm==1?12:mm-1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())
    {
     da.borderColorLight="#FFFFFF";
     da.borderColorDark="#63A3E9";
    }
   }
}
else if (i>=firstday+GetMonthCount(yy,mm)) //涓嬩釜鏈堢殑閮ㄥ垎
{
   da.innerHTML="<b><font color=#BCBABC>" + meizzWDay[i] + "</font></b>";
   da.title=(mm==12?1:mm+1) +"鏈� + meizzWDay[i] + "鏃�;
   da.onclick=Function("meizzDayClick(this.innerText,1)");
   if(!outDate)
    da.style.backgroundColor = ((mm==12?yy+1:yy) == new Date().getFullYear() && 
     (mm==12?1:mm+1) == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ?
      "#5CEFA0":"#f5f5f5";
   else
   {
    da.style.backgroundColor =((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())? "#84C1FF" :
    (((mm==12?yy+1:yy) == new Date().getFullYear() && (mm==12?1:mm+1) == new Date().getMonth()+1 && 
    meizzWDay[i] == new Date().getDate()) ? "#5CEFA0":"#f5f5f5");
    //灏嗛�涓殑鏃ユ湡鏄剧ず涓哄嚬涓嬪幓

    if((mm==12?yy+1:yy)==outDate.getFullYear() && (mm==12?1:mm+1)== outDate.getMonth() + 1 && 
    meizzWDay[i]==outDate.getDate())
    {
     da.borderColorLight="#FFFFFF";
     da.borderColorDark="#63A3E9";
    }
   }
}
else //鏈湀鐨勯儴鍒�

{
   da.innerHTML="<b>" + meizzWDay[i] + "</b>";
   da.title=mm +"鏈� + meizzWDay[i] + "鏃�;
   da.onclick=Function("meizzDayClick(this.innerText,0)"); //缁檛d璧嬩簣onclick浜嬩欢鐨勫鐞�

   //濡傛灉鏄綋鍓嶉�鎷╃殑鏃ユ湡锛屽垯鏄剧ず浜摑鑹茬殑鑳屾櫙锛涘鏋滄槸褰撳墠鏃ユ湡锛屽垯鏄剧ず鏆楅粍鑹茶儗鏅�
   if(!outDate)
    da.style.backgroundColor = (yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
     "#5CEFA0":"#f5f5f5";
   else
   {
    da.style.backgroundColor =(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())?
     "#84C1FF":((yy == new Date().getFullYear() && mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate())?
     "#5CEFA0":"#f5f5f5");
    //灏嗛�涓殑鏃ユ湡鏄剧ず涓哄嚬涓嬪幓

    if(yy==outDate.getFullYear() && mm== outDate.getMonth() + 1 && meizzWDay[i]==outDate.getDate())
    {
     da.borderColorLight="#FFFFFF";
     da.borderColorDark="#63A3E9";
    }
   }
}
    da.style.cursor="hand"
   }
else { da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"; }
}
}

function meizzDayClick(n,ex) //鐐瑰嚮鏄剧ず妗嗛�鍙栨棩鏈燂紝涓昏緭鍏ュ嚱鏁�************
{
parent.meizzTheDate=n;
var yy=meizzTheYear;
var mm = parseInt(meizzTheMonth)+ex; //ex琛ㄧず鍋忕Щ閲忥紝鐢ㄤ簬閫夋嫨涓婁釜鏈堜唤鍜屼笅涓湀浠界殑鏃ユ湡
var hh=meizzTheHour;
var mi=meizzTheMinute;
var se=meizzTheSecond;
//鍒ゆ柇鏈堜唤锛屽苟杩涜瀵瑰簲鐨勫鐞�

if(mm<1){
yy--;
mm=12+mm;
}
else if(mm>12){
yy++;
mm=mm-12;
}

if (mm < 10) {mm = "0" + mm;}
if (hh<10) {hh="0" + hh;} //鏃�
if (mi<10) {mi="0" + mi;} //鍒�
if (se<10) {se="0" + se;} //绉�

if (outObject)
{
if (!n) { //outObject.value=""; 
   return;}
if ( n < 10){n = "0" + n;}

WriteDateTo(yy,mm,n,hh,mi,se);

closeLayer(); 
if (bUseTime)
{
   try
   {
    outButton.click();
   }
   catch (e)
   {
    setday(outObject);
     closeLayer();//娣诲姞瀹屾暟鎹悗鍏抽棴
   }
}
}
else {closeLayer(); alert("鎮ㄦ墍瑕佽緭鍑虹殑鎺т欢瀵硅薄骞朵笉瀛樺湪锛�);}
}

function format(n) //鏍煎紡鍖栨暟瀛椾负涓や綅瀛楃琛ㄧず
{
var m=new String();
var tmp=new String(n);
if (n<10 && tmp.length<2)
{
m="0"+n;
}
else
{
m=n;
}
return m;
}

function evaSetTime() //璁剧疆鐢ㄦ埛閫夋嫨鐨勫皬鏃躲�鍒嗛挓
{
odatelayer.meizzHourHead.innerText=meizzTheHour+" 鏃�;
odatelayer.meizzMinuteHead.innerText=meizzTheMinute+" 鍒�;
odatelayer.meizzSecondHead.innerText=meizzTheSecond+" 绉�;
WriteDateTo(meizzTheYear,meizzTheMonth,meizzTheDate,meizzTheHour,meizzTheMinute,meizzTheSecond)
}

function evaSetTimeNothing() //璁剧疆鏃堕棿鎺т欢涓虹┖
{
odatelayer.meizzHourHead.innerText="";
odatelayer.meizzMinuteHead.innerText="";
odatelayer.meizzSecondHead.innerText="";
WriteDateTo(meizzTheYear,meizzTheMonth,meizzTheDate,meizzTheHour,meizzTheMinute,meizzTheSecond)
}

function evaSetTimeNow() //璁剧疆鏃堕棿鎺т欢涓哄綋鍓嶆椂闂�
{
odatelayer.meizzHourHead.innerText=new Date().getHours()+" 鏃�;
odatelayer.meizzMinuteHead.innerText=new Date().getMinutes()+" 鍒�;
odatelayer.meizzSecondHead.innerText=new Date().getSeconds()+" 绉�;
meizzTheHour = new Date().getHours();
meizzTheMinute = new Date().getMinutes();
meizzTheSecond = new Date().getSeconds();
WriteDateTo(meizzTheYear,meizzTheMonth,meizzTheDate,meizzTheHour,meizzTheMinute,meizzTheSecond)
}

function UseTime(ctl)
{
bUseTime=!bUseTime;
if (bUseTime)
{
bImgSwitch();
ctl.innerHTML=bImg;
evaSetTime(); //鏄剧ず鏃堕棿锛岀敤鎴峰師鏉ラ�鎷╃殑鏃堕棿
//evaSetTimeNow(); //鏄剧ず褰撳墠鏃堕棿
}
else
{
bImgSwitch();
ctl.innerHTML=bImg;
evaSetTimeNothing();
}
}

function WriteDateTo(yy,mm,n,hh,mi,se)
{
if (bUseTime)
{
outObject.value= yy + "-" + format(mm) + "-" + format(n) + " " + format(hh) + ":" + format(mi) + ":" + format(se); //娉細鍦ㄨ繖閲屼綘鍙互杈撳嚭鏀规垚浣犳兂瑕佺殑鏍煎紡
}
else
{
outObject.value= yy + "-" + format(mm) + "-" + format(n); //娉細鍦ㄨ繖閲屼綘鍙互杈撳嚭鏀规垚浣犳兂瑕佺殑鏍煎紡
}
}

function bImgSwitch()
{
if(bUseTime)
{
bImg="鍏抽棴";
}
else
{
bImg="寮�惎";
}
}
