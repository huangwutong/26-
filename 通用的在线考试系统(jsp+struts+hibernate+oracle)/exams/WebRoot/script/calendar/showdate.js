var gcToggle = "#ffff00";
var gcBG = "#CCCCFF";

function IOFFICE_GetSelected(aCell)
{

  		window.returnValue = aCell.innerText;
		window.close();
  
}
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
	codebase += '/script/calendar';
//	retval = window.showModalDialog(codebase+"/popcalendar.htm", "", "dialogWidth:197px; dialogHeight:190px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	retval = window.showModalDialog("/exams/script/calendar/popcalendar.htm", "", "dialogWidth:197px; dialogHeight:190px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
		ctrlobj.focus();
		ctrlobj.blur();
	}else{
		//alert("canceled");
	}
	
}
function fPopUpCalendarDlg2(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
	codebase += '/script/calendar';
//	retval = window.showModalDialog(codebase+"/popcalendar.htm", "", "dialogWidth:197px; dialogHeight:190px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	retval = window.showModalDialog("script/calendar/popcalendar.htm", "", "dialogWidth:197px; dialogHeight:190px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
		ctrlobj.focus();
		ctrlobj.blur();
		ctrlobj.form.submit();
	}else{
		//alert("canceled");
	}
	
}
