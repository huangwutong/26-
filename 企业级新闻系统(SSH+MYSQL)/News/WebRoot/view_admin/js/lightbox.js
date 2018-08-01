
/*-------------------------------GLOBAL VARIABLES------------------------------------*/

var detect = navigator.userAgent.toLowerCase();
var OS,browser,version,total,thestring;

/*-----------------------------------------------------------------------------------------------*/

function getBrowserInfo() {
	if (checkIt('konqueror')) {
		browser = "Konqueror";
		OS = "Linux";
	}
	else if (checkIt('safari')) browser 	= "Safari"
	else if (checkIt('omniweb')) browser 	= "OmniWeb"
	else if (checkIt('opera')) browser 		= "Opera"
	else if (checkIt('webtv')) browser 		= "WebTV";
	else if (checkIt('icab')) browser 		= "iCab"
	else if (checkIt('msie')) browser 		= "Internet Explorer"
	else if (!checkIt('compatible')) {
		browser = "Netscape Navigator"
		version = detect.charAt(8);
	}
	else browser = "An unknown browser";

	if (!version) version = detect.charAt(place + thestring.length);

	if (!OS) {
		if (checkIt('linux')) OS 		= "Linux";
		else if (checkIt('x11')) OS 	= "Unix";
		else if (checkIt('mac')) OS 	= "Mac"
		else if (checkIt('win')) OS 	= "Windows"
		else OS = "an unknown operating system";
	}
}

function checkIt(string) {
	place = detect.indexOf(string) + 1;
	thestring = string;
	return place;
}

/*-----------------------------------------------------------------------------------------------*/
//??????initialize?getBrowserInfo??
Event.observe(window, 'load', initialize, false);
Event.observe(window, 'load', getBrowserInfo, false);
//????????
Event.observe(window, 'unload', Event.unloadCache, false);

var lightbox = Class.create();

lightbox.prototype = {

	yPos : 0,
	xPos : 0,
    //????,ctrl?????????
	initialize: function(ctrl) {
	    //??????????this.content
		this.content = ctrl.href;
		//??????onclick??activate??
		Event.observe(ctrl, 'click', this.activate.bindAsEventListener(this), false);
		ctrl.onclick = function(){return false;};
	},
	
	//??????
	activate: function(){
		if (browser == 'Internet Explorer'){//???IE???
			this.getScroll();
			this.prepareIE('100%', 'hidden');
			this.setScroll(0,0);
			this.hideSelects('hidden');//?????<select>??
		}
		//??????displayLightbox??
		this.displayLightbox("block");
	},
	
	// Ie requires height to 100% and overflow hidden or else you can scroll down past the lightbox
	prepareIE: function(height, overflow){
		bod = document.getElementsByTagName('body')[0];
		bod.style.height = height;
		bod.style.overflow = overflow;
  
		htm = document.getElementsByTagName('html')[0];
		htm.style.height = height;
		htm.style.overflow = overflow; 
	},
	
	// In IE, select elements hover on top of the lightbox
	hideSelects: function(visibility){
		selects = document.getElementsByTagName('select');
		for(i = 0; i < selects.length; i++) {
			selects[i].style.visibility = visibility;
		}
	},
	
	// Taken from lightbox implementation found at http://www.huddletogether.com/projects/lightbox/
	getScroll: function(){
		if (self.pageYOffset) {
			this.yPos = self.pageYOffset;
		} else if (document.documentElement && document.documentElement.scrollTop){
			this.yPos = document.documentElement.scrollTop; 
		} else if (document.body) {
			this.yPos = document.body.scrollTop;
		}
	},
	
	setScroll: function(x, y){
		window.scrollTo(x, y); 
	},
	
	displayLightbox: function(display){
	    //??????
		$('overlay').style.display = display;
		//??????
		$('lightbox').style.display = display;
		//????????,???????loadInfo??
		if(display != 'none') this.loadInfo();
	},
	
	//?????Ajax??
	loadInfo: function() {
	    //???????????processInfo??
		var myAjax = new Ajax.Request(
        this.content,
        {method: 'get', parameters: "", onComplete: this.processInfo.bindAsEventListener(this)}
		);
		
	},
	// ???????????????
	processInfo: function(response){
	    //?????????
		var result = response.responseText;
		//??????
		info = "<div id='lbContent'>" + result + "</div>";
		//?info?????????
		new Insertion.Before($('lbLoadMessage'), info)
		//???????class name??
		$('lightbox').className = "done";	
		//?????actions??
		this.actions();
		var ctrl=$('lightbox');
		//????????????reset
        Event.observe(ctrl, 'click', this.reset.bindAsEventListener(this), false);
		ctrl.onclick = function(){return false;};
	},
	//?????? 
	reset:function(){
	    //?????
        $('overlay').style.display="none";
        //??????
		$('lbContent').innerHTML="";
		//?????
        $('lightbox').style.display="none";
	},
	// Search through new links within the lightbox, and attach click event
	actions: function(){
		lbActions = document.getElementsByClassName('lbAction');
		for(i = 0; i < lbActions.length; i++) {
			Event.observe(lbActions[i], 'click', this[lbActions[i].rel].bindAsEventListener(this), false);
			lbActions[i].onclick = function(){return false;};
		}

	}
}

/*-----------------------------------------------------------------------------------------------*/

// Onload, make all links that need to trigger a lightbox active
//?????
function initialize(){
    //???????????????????
	addLightboxMarkup();
	//?????????????lightbox??
	lbox = document.getElementsByClassName('lbOn');
	for(i = 0; i < lbox.length; i++) {
		valid = new lightbox(lbox[i]);
	}
}

// ??Dom????????????
function addLightboxMarkup() {
	bod 				= document.getElementsByTagName('body')[0];
	overlay 			= document.createElement('div');
	overlay.id		= 'overlay';
	lb					= document.createElement('div');
	lb.id				= 'lightbox';
	lb.className 	= 'loading';
	lb.innerHTML	= '<div id="lbLoadMessage">' +
						  '<p>Loading</p>' +
						  '</div>';
	bod.appendChild(overlay);
	bod.appendChild(lb);
}