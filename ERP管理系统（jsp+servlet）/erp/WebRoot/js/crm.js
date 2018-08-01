/**
 * @author dean
 */
var dean;
if (!dean) dean={};

if (!dean.RegExpTxt){
	dean.RegExpTxt = {
		Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
		Phone : /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
		Mobile : /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/,
		Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
		Number : /^\d+$/,
		Zip : /^[1-9]\d{5}$/,
		QQ : /^[1-9]\d{4,8}$/,
		Integer : /^[-\+]?\d+$/,
		Double : /^[-\+]?\d+(\.\d+)?$/,
		English : /^[A-Za-z]+$/,
		Chinese : /^[\u0391-\uFFE5]+$/,
		Username : /^[a-z]\w{3,}$/i,
		UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
		shortDate : /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/
	}
}
if (!dean.formValidation){
	dean.formValidation = {self : dean.RegExpTxt};
}
dean.Browser = function(locationWin){
	var ua, s, i;
	this.isIE = false;
	this.isNS = false;
	this.isOP = false;
	this.isSF = false;
	ua = navigator.userAgent.toLowerCase();
	
	if (locationWin.innerWidth)
	{
		var ww = locationWin.innerWidth;
		var wh = locationWin.innerHeight;
		var bgX = locationWin.pageXOffset;
		var bgY = locationWin.pageYOffset;
	}else{
		var ww = document.documentElement.offsetWidth;
		var wh = document.documentElement.offsetHeight;
		var bgX = document.documentElement.scrollLeft;
		var bgY = document.documentElement.scrollTop;
	}
	this.width = ww;
	this.height = wh;
	this.offisetX = bgX;
	this.offisetY = bgY;
	
	//document.write ("<font color=\"#ff0000\">"+ua+"</font><br />");
	s = "opera";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isOP = true;
		return;
	}

	s = "msie";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isIE = true;
		return;
	}

	s = "netscape6/";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isNS = true;
		return;
	}

	s = "gecko";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isNS = true;
		return;
	}
	
	s = "safari";
	if ((i = ua.indexOf(s)) >= 0) {
		this.isSF = true;
		return;
	}
}

dean.centerPosition = function(bodyWinId,bodyWinH){
	var t_DiglogY;	
	var browser = new dean.Browser(window);
	t_DiglogY = (browser.offisetY + ((browser.height - bodyWinH)/2));;
	var loginAreaId = document.getElementById(bodyWinId);
	loginAreaId.style.marginTop =  t_DiglogY+"px";
/*	
	if (browser.isIE) {
		document.write(document.documentElement.scrollLeft +" / " + document.documentElement.scrollTop +" / ");
		document.write ("msie  "+ loginAreaId.style.width +" / "+ document.documentElement.offsetWidth + " / " + document.documentElement.offsetHeight + " / " + document.body.clientWidth +" / "+document.body.clientHeight + "</font>")
	}
	else
	{
		document.write (window.pageXOffset +" / " + window.pageYOffset + " / ");
		document.write ("gecko  "+ loginAreaId.style.width +" / "+ window.innerWidth+ " / " + window.innerHeight + " / " + document.body.clientWidth +" / "+document.body.clientHeight + "</font>")
	}*/
}
dean.iframeWin = function(iframe,leftSide,rightSide){
	this.iframe = iframe;
	this.leftSide = leftSide;
	this.rightSide = rightSide;
}
dean.iframeWin.prototype.autoResize = function(winInnerHeight,spaceHeight){
	var leftSide = document.getElementById(this.leftSide);
	var iframe = document.getElementById(this.iframe);
	var rightSide = document.getElementById(this.rightSide);
	try
    {
		leftSide.style.height = winInnerHeight-spaceHeight+"px";
		iframe.style.height = winInnerHeight-spaceHeight+"px";
		rightSide.style.height = winInnerHeight-spaceHeight+"px";
	}catch(e){}
}
dean.form=function(formName){
	this.formElement = formName;
};
dean.form.prototype.checkclick=function(msg){
	if(confirm(msg)){
		this.formElement.submit();
	}else{
		window.focus();
	}
};
dean.form.prototype.chooseAll=function(ops){
	for(var i=0;i<this.formElement.elements.length;i++){
		var e = this.formElement.elements[i];
		if (e.name == "idnum"){
			if(ops){
				e.checked = true;
			}else{
				e.checked = false;
			}
		}
	}
};
dean.form.prototype.getall=function(){
	var str=new String("");
	for(var i=0;i<this.formElement.elements.length;i++)
    {
		var e = this.formElement.elements[i];
		if (e.name == "idnum")
        {
			if(e.checked==true)
            {
				str = str+e.value+",";
			}
        }
    }
    formObj.checkclick(str);
};
dean.formValidation.isShortDate = function(str){
	var r = str.match(this.self.shortDate);
	if(r==null)return false;
	var d= new Date(r[1], r[3]-1, r[4]);
	return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}
dean.formValidation.isMail = function(mail){return(new RegExp(this.self.Email).test(mail));}
dean.formValidation.isMobile = function(mobile){return(new RegExp(this.self.Mobile).test(mobile));}
dean.formValidation.isPhone = function(phone){return(new RegExp(this.self.Phone).test(phone));}
dean.formValidation.isChinese = function(str){return(new RegExp(this.self.Chinese).test(str));}
dean.formValidation.isEnglish = function(str){return(new RegExp(this.self.English).test(str));}
dean.formValidation.isSafe = function(Str){return !this.self.UnSafe.test(str);}

