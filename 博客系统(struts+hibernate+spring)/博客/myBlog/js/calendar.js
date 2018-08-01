
/*****************************************************************************
                                   日期资料
*****************************************************************************/

var lunarInfo=new Array(
0x04bd8,0x04ae0,0x0a570,0x054d5,0x0d260,0x0d950,0x16554,0x056a0,0x09ad0,0x055d2,
0x04ae0,0x0a5b6,0x0a4d0,0x0d250,0x1d255,0x0b540,0x0d6a0,0x0ada2,0x095b0,0x14977,
0x04970,0x0a4b0,0x0b4b5,0x06a50,0x06d40,0x1ab54,0x02b60,0x09570,0x052f2,0x04970,
0x06566,0x0d4a0,0x0ea50,0x06e95,0x05ad0,0x02b60,0x186e3,0x092e0,0x1c8d7,0x0c950,
0x0d4a0,0x1d8a6,0x0b550,0x056a0,0x1a5b4,0x025d0,0x092d0,0x0d2b2,0x0a950,0x0b557,
0x06ca0,0x0b550,0x15355,0x04da0,0x0a5d0,0x14573,0x052d0,0x0a9a8,0x0e950,0x06aa0,
0x0aea6,0x0ab50,0x04b60,0x0aae4,0x0a570,0x05260,0x0f263,0x0d950,0x05b57,0x056a0,
0x096d0,0x04dd5,0x04ad0,0x0a4d0,0x0d4d4,0x0d250,0x0d558,0x0b540,0x0b5a0,0x195a6,
0x095b0,0x049b0,0x0a974,0x0a4b0,0x0b27a,0x06a50,0x06d40,0x0af46,0x0ab60,0x09570,
0x04af5,0x04970,0x064b0,0x074a3,0x0ea50,0x06b58,0x055c0,0x0ab60,0x096d5,0x092e0,
0x0c960,0x0d954,0x0d4a0,0x0da50,0x07552,0x056a0,0x0abb7,0x025d0,0x092d0,0x0cab5,
0x0a950,0x0b4a0,0x0baa4,0x0ad50,0x055d9,0x04ba0,0x0a5b0,0x15176,0x052b0,0x0a930,
0x07954,0x06aa0,0x0ad50,0x05b52,0x04b60,0x0a6e6,0x0a4e0,0x0d260,0x0ea65,0x0d530,
0x05aa0,0x076a3,0x096d0,0x04bd7,0x04ad0,0x0a4d0,0x1d0b6,0x0d250,0x0d520,0x0dd45,
0x0b5a0,0x056d0,0x055b2,0x049b0,0x0a577,0x0a4b0,0x0aa50,0x1b255,0x06d20,0x0ada0)

var solarMonth=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
var Gan=new Array("甲","乙","丙","丁","戊","己","庚","辛","壬","癸");
var Zhi=new Array("子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥");
var Animals=new Array("鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪");
var solarTerm = new Array("小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至")
var sTermInfo = new Array(0,21208,42467,63836,85337,107014,128867,150921,173149,195551,218072,240693,263343,285989,308563,331033,353350,375494,397447,419210,440795,462224,483532,504758)
var nStr1 = new Array('一','二','三','四','五','六','七','八','九','十')
var nStr2 = new Array('初','十','廿','卅','　')
var monthName = new Array("1 月","2 月","3 月","4 月","5 月","6 月","7 月","8 月","9 月","10 月","11 月","12 月");

//国历节日 *表示放假日
var sFtv = new Array(
"0101*元旦",
"0214 情人节",
"0308 妇女节",
"0312 植树节",
"0315 消费者权益日",
"0401 愚人节",
"0501 劳动节",
"0504 青年节",
"0512 护士节",
"0601 儿童节",
"0701 建党节",
"0801 建军节",
"0808 父亲节",
"0909 毛泽东逝世纪念",
"0910 教师节",
"0928 孔子诞辰",
"1001*国庆节",
"1006 老人节",
"1024 联合国日",
"1112 孙中山诞辰",
"1220 澳门回归",
"1225 圣诞节",
"1226 毛泽东诞辰")

//农历节日 *表示放假日
var lFtv = new Array(
"0101*农历春节",
"0115 元宵节",
"0505 端午节",
"0707 七夕情人节",
"0815 中秋节",
"0909 重阳节",
"1208 腊八节",
"1224 小年",
"0100*除夕")

//某月的第几个星期几
var wFtv = new Array(
"0520 母亲节")

/*****************************************************************************
                                      日期计算
*****************************************************************************/

//====================================== 传回农历 y年的总天数
function lYearDays(y) {
   var i, sum = 348
   for(i=0x8000; i>0x8; i>>=1) sum += (lunarInfo[y-1900] & i)? 1: 0
   return(sum+leapDays(y))
}

//====================================== 传回农历 y年闰月的天数
function leapDays(y) {
   if(leapMonth(y))  return((lunarInfo[y-1900] & 0x10000)? 30: 29)
   else return(0)
}

//====================================== 传回农历 y年闰哪个月 1-12 , 没闰传回 0
function leapMonth(y) {
   return(lunarInfo[y-1900] & 0xf)
}

//====================================== 传回农历 y年m月的总天数
function monthDays(y,m) {
   return( (lunarInfo[y-1900] & (0x10000>>m))? 30: 29 )
}

//====================================== 算出农历, 传入日期物件, 传回农历日期物件
//                                       该物件属性有 .year .month .day .isLeap .yearCyl .dayCyl .monCyl
function Lunar(objDate) {

   var i, leap=0, temp=0
   var baseDate = new Date(1900,0,31)
   var offset   = (objDate - baseDate)/86400000

   this.dayCyl = offset + 40
   this.monCyl = 14

   for(i=1900; i<2050 && offset>0; i++) {
      temp = lYearDays(i)
      offset -= temp
      this.monCyl += 12
   }

   if(offset<0) {
      offset += temp;
      i--;
      this.monCyl -= 12
   }

   this.year = i
   this.yearCyl = i-1864

   leap = leapMonth(i) //闰哪个月
   this.isLeap = false

   for(i=1; i<13 && offset>0; i++) {
      //闰月
      if(leap>0 && i==(leap+1) && this.isLeap==false)
         { --i; this.isLeap = true; temp = leapDays(this.year); }
      else
         { temp = monthDays(this.year, i); }

      //解除闰月
      if(this.isLeap==true && i==(leap+1)) this.isLeap = false

      offset -= temp
      if(this.isLeap == false) this.monCyl ++
   }

   if(offset==0 && leap>0 && i==leap+1)
      if(this.isLeap)
         { this.isLeap = false; }
      else
         { this.isLeap = true; --i; --this.monCyl;}

   if(offset<0){ offset += temp; --i; --this.monCyl; }

   this.month = i
   this.day = offset + 1
}
/////////////////////////////////////////////////////////

var bsYear;  
var bsDate;  
var bsWeek;  
var arrLen=8;	//数组长度
var sValue=0;	//当年的秒数
var dayiy=0;	//当年第几天
var miy=0;	//月份的下标
var iyear=0;	//年份标记
var dayim=0;	//当月第几天
var spd=86400;	//每天的秒数

var year1999="30;29;29;30;29;29;30;29;30;30;30;29";	//354
var year2000="30;30;29;29;30;29;29;30;29;30;30;29";	//354
var year2001="30;30;29;30;29;30;29;29;30;29;30;29;30";	//384
var year2002="30;30;29;30;29;30;29;29;30;29;30;29";	//354
var year2003="30;30;29;30;30;29;30;29;29;30;29;30";	//355
var year2004="29;30;29;30;30;29;30;29;30;29;30;29;30";	//384
var year2005="29;30;29;30;29;30;30;29;30;29;30;29";	//354
var year2006="30;29;30;29;30;30;29;29;30;30;29;29;30";

var month1999="正月;二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2001="正月;二月;三月;四月;闰四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2004="正月;二月;闰二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
var month2006="正月;二月;三月;四月;五月;六月;七月;闰七月;八月;九月;十月;十一月;十二月"
var Dn="初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";

var Ys=new Array(arrLen);
Ys[0]=919094400;Ys[1]=949680000;Ys[2]=980265600;
Ys[3]=1013443200;Ys[4]=1044028800;Ys[5]=1074700800;
Ys[6]=1107878400;Ys[7]=1138464000;

var Yn=new Array(arrLen);   //农历年的名称
Yn[0]="己卯年";Yn[1]="庚辰年";Yn[2]="辛巳年";
Yn[3]="壬午年";Yn[4]="癸未年";Yn[5]="甲申年";
Yn[6]="乙酉年";Yn[7]="丙戌年"; 
var D=new Date();
var yy=D.getYear();
var mm=D.getMonth()+1;
var dd=D.getDate();
var ww=D.getDay();
if (ww==0) ww="<font color=RED>星期日";
if (ww==1) ww="星期一";
if (ww==2) ww="星期二";
if (ww==3) ww="星期三";
if (ww==4) ww="星期四";
if (ww==5) ww="星期五";
if (ww==6) ww="<font color=RED>星期六";
ww=ww;
var ss=parseInt(D.getTime() / 1000);
if (yy<100) yy="19"+yy;

for (i=0;i<arrLen;i++)
	if (ss>=Ys[i]){
		iyear=i;
		sValue=ss-Ys[i];    //当年的秒数
		}
dayiy=parseInt(sValue/spd)+1;    //当年的天数

var dpm=year1999;
if (iyear==1) dpm=year2000;
if (iyear==2) dpm=year2001;
if (iyear==3) dpm=year2002;
if (iyear==4) dpm=year2003;
if (iyear==5) dpm=year2004;
if (iyear==6) dpm=year2005;
if (iyear==7) dpm=year2006;
dpm=dpm.split(";");

var Mn=month1999;
if (iyear==2) Mn=month2001;
if (iyear==5) Mn=month2004;
if (iyear==7) Mn=month2006;
Mn=Mn.split(";");

var Dn="初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";
Dn=Dn.split(";");

dayim=dayiy;

var total=new Array(13);
total[0]=parseInt(dpm[0]);
for (i=1;i<dpm.length-1;i++) total[i]=parseInt(dpm[i])+total[i-1];
for (i=dpm.length-1;i>0;i--)
	if (dayim>total[i-1]){
		dayim=dayim-total[i-1];
		miy=i;
		}
bsWeek=ww;
bsDate=yy+"年"+mm+"月";
bsDate2=dd;
bsYear="农历"+Yn[iyear];
bsYear2=Mn[miy]+Dn[dayim-1];
if (ss>=Ys[7]||ss<Ys[0]) bsYear=Yn[7];

function CAL(){
	document.write("<table border='1' cellspacing='3' width='100' bordercolor='#009B00' bgcolor='#FFFFFF' height='110' cellpadding='2'");
	document.write("<tr><td align='center'><b><font color=#008040>"+bsDate+"</font><br><font face='Arial' size='6' color=#FF8040>"+bsDate2+"</font><br><font color=#008040><span style='FONT-SIZE: 9pt'>");
	document.write(bsWeek+"</span><br>"+"<br></b><font color=#9B4E00>");
	document.write(bsYear+"<br>"+bsYear2+"</td></tr></table>");
}
function CAL2(){
	document.write("<b>今天是：<font color=#008040>"+bsDate+bsDate2+"日</font><font color=#008040>&nbsp;&nbsp;&nbsp;<span style='FONT-SIZE: 9pt'>");
	document.write(bsWeek+"</span></b><font color=#9B4E00>");
	document.write("&nbsp;&nbsp;&nbsp;<b>"+bsYear+bsYear2+"</b>");
}
