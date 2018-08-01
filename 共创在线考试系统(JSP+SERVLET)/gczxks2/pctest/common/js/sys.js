var i = 0;
function callhtm(URL,Width,Height)
{
i++;
var l = ((window.screen.width-parseInt(Width))/2);
var t = ((window.screen.height-parseInt(Height))/2);
window.open(URL,'n'+i,'top='+t+',left='+l+', width='+Width+', height='+Height+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
if(i>1000)i=-1;
}

function callSys(URL,Width,Height)
{
i++;
var l = ((window.screen.width-parseInt(Width))/2);
var t = ((window.screen.height-parseInt(Height))/2);
window.open(URL,'b'+i,'top='+t+',left='+l+', width='+Width+', height='+Height+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no');
if(i>1000)i=-1;
}

function callSysWithScroll(URL,Width,Height)
{
i++;
var l = ((window.screen.width-parseInt(Width))/2);
var t = ((window.screen.height-parseInt(Height))/2);
window.open(URL,'b'+i,'top='+t+',left='+l+', width='+Width+', height='+Height+',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no');
if(i>1000)i=-1;
}
