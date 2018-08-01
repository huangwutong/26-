function jumpMenu(selObj) {

	var url = selObj.options[selObj.selectedIndex].value;

	
	if(url.length > 0)

		window.open(url, '');

}


function openMax(theUrl,wlength,hlength)

{

    window.open(theUrl, "","width="+wlength+",height="+hlength+",resizable=yes,toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,top=0,left=0");

}