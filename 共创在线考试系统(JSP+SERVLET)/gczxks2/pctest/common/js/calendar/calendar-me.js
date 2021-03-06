// ** I18N

// Calendar EN language
// Author: Mihai Bazon, <mishoo@infoiasi.ro>
// Encoding: any
// Distributed under the same terms as the calendar itself.

// For translators: please use UTF-8 if possible.  We strongly believe that
// Unicode is the answer to a real internationalized world.  Also please
// include your contact information in the header, as can be seen above.

// full day names
Calendar._DN = new Array
("星期日",
 "星期一",
 "星期二",
 "星期三",
 "星期四",
 "星期五",
 "星期六",
 "星期日");

// Please note that the following array of short day names (and the same goes
// for short month names, _SMN) isn't absolutely necessary.  We give it here
// for exemplification on how one can customize the short day names, but if
// they are simply the first N letters of the full name you can simply say:
//
//   Calendar._SDN_len = N; // short day name length
//   Calendar._SMN_len = N; // short month name length
//
// If N = 3 then this is not needed either since we assume a value of 3 if not
// present, to be compatible with translation files that were written before
// this feature.

// short day names
Calendar._SDN = new Array
("日",
 "一",
 "二",
 "三",
 "四",
 "五",
 "六",
 "日");

// full month names
Calendar._MN = new Array
("1",
 "2",
 "3",
 "4",
 "5",
 "6",
 "7",
 "8",
 "9",
 "10",
 "11",
 "12");

// short month names
Calendar._SMN = new Array
("一月",
 "二月",
 "三月",
 "四月",
 "五月",
 "六月",
 "七月",
 "八月",
 "九月",
 "十月",
 "十一月",
 "十二月");

// tooltips
Calendar._TT = {};
Calendar._TT["INFO"] = "帮助";

Calendar._TT["ABOUT"] =
"日期选择：\n" +
"- 使用 \xab, \xbb 按钮选择年份\n" +
"- 使用 " + String.fromCharCode(0x2039) + ", " + String.fromCharCode(0x203a) + " 按钮选择月份\n" +
"- 在任何一个按钮上面按住鼠标可以加快日期的选择哦。^_^";
Calendar._TT["ABOUT_TIME"] = "\n\n" +
"时间选择：\n" +
"- 点击时间按钮任何一个部分都可以增加\n" +
"- 按住Shift键，点击时间按钮任何一个部分可以减少\n" +
"- 点住并拖动可以加快选择哦。^_^";

Calendar._TT["PREV_YEAR"] = "上一年 (按住出菜单)";
Calendar._TT["PREV_MONTH"] = "上一月 (按住出菜单)";
Calendar._TT["GO_TODAY"] = "到今日";
Calendar._TT["NEXT_MONTH"] = "下一月 (按住出菜单)";
Calendar._TT["NEXT_YEAR"] = "下一年 (按住出菜单)";
Calendar._TT["SEL_DATE"] = "选择日期";
Calendar._TT["DRAG_TO_MOVE"] = "拖动";
Calendar._TT["PART_TODAY"] = " (今日)";


// the following is to inform that "%s" is to be the first day of week
// %s will be replaced with the day name.
Calendar._TT["DAY_FIRST"] = "把【 %s 】显示为第一列";

// This may be locale-dependent.  It specifies the week-end days, as an array
// of comma-separated numbers.  The numbers are from 0 to 6: 0 means Sunday, 1
// means Monday, etc.
Calendar._TT["WEEKEND"] = "0,6";

Calendar._TT["CLOSE"] = "关闭";
Calendar._TT["TODAY"] = "今天";
Calendar._TT["TIME_PART"] = "(Shift-)点击或拖动可以改变值";

// date formats
Calendar._TT["DEF_DATE_FORMAT"] = "%Y-%m-%d";
Calendar._TT["TT_DATE_FORMAT"] = "【%A】%Y年%B月%e号";
Calendar._TT["WK"] = "周:";
//Calendar._TT["WK"] = "wk";
Calendar._TT["TIME"] = "时间:";
