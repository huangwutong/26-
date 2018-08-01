//Gets the browser specific XmlHttpRequest Object
function getXmlHttpRequestObject() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		alert("Your Browser Sucks!\nIt's about time to upgrade don't you think?");
	}
}
function createAjaxObj(){
  var httprequest = false;
  if (window.XMLHttpRequest){//if Mozilla, Safari etc
    httprequest = new XMLHttpRequest();
    if (httprequest.overrideMimeType)
      httprequest.overrideMimeType('text/xml');
   }else if (window.ActiveXObject){//if IE
     try {
       httprequest=new ActiveXObject("Msxml2.XMLHTTP");
     }
     catch (e){
       try{
          httprequest=new ActiveXObject("Microsoft.XMLHTTP");
       }
       catch (e){}
     }
   }
   return httprequest
}
//Our XmlHttpRequest object to get the auto suggest
var searchReq = createAjaxObj();
//Called from keyup on the search textbox.
//Starts the AJAX request.
function searchSuggest() {
	if (searchReq.readyState == 4 || searchReq.readyState == 0) {
		var strtitle = escape(document.getElementById('title').value);
		searchReq.open("GET", '/News/article_Action.do?method=searchTitle&search=' + strtitle, true);
		searchReq.onreadystatechange = handleSearchSuggest; 
		searchReq.send(null);
	}		
}
//Called when the AJAX response is returned.
function handleSearchSuggest() {
	if (searchReq.readyState == 4) {
		var ss = document.getElementById('search_suggest');
		ss.className = 'search_show';
		ss.innerHTML = '';
		var xmldoc = new ActiveXObject("Microsoft.XMLDOM");
		xmldoc.loadXML(searchReq.responseText);
		var rootNode = xmldoc.documentElement;
		for(var i = 0 ; i < rootNode.childNodes.length ; i ++){
			var suggest = '<div onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">' + rootNode.childNodes[i].childNodes[0].text + '</div>';
			ss.innerHTML += suggest;
		}
	}
}
//Mouse over function
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
//Mouse out function
function suggestOut(div_value) {
	div_value.className = 'suggest_link';
}
//Click function
function setSearch(value) {
	document.getElementById('title').value = value;
	document.getElementById('search_suggest').innerHTML = '';
}