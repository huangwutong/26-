var mySlide;
var myAjax;
var otherAjax;
var max = 20;
var min = 1;
function init(){
	var j = 0;
	var flag = false;
	var flagCount = false;
    if(!flagCount){
    	postMe();
    	flagCount = true;
    }
	mySlide = YAHOO.widget.Slider.getHorizSlider("pageBGDiv", "pageHandleDiv", min, max, 1);
  	mySlide.onChange = function() {
  			j++;
  			if(mySlide.getValue() < min)
		  	    mySlide.setValue(min, true);
		  	if(mySlide.getValue() > max)
  	   			mySlide.setValue(max, true);
  	   		if(j > 2){
				var info = document.getElementById("pageInfo");
				info.innerHTML = mySlide.getValue() + "/" + max;
			}
			flag = true;
  	}
	mySlide.onSlideEnd = postAjax;
	if(!flag){
  		postAjax(flag);
  	}
}

function postMe(){
	otherAjax = new Ajax.Request("/News/article_Action.do?method=searchCountByAjax", {method: 'get', onComplete: showCount});
}

function showCount(request){
	max = parseInt(request.responseText);
}

function postAjax(obj){
   var param = "page=1";         
   myAjax = new Ajax.Request("/News/article_Action.do?method=searchByAjax", {method: 'get', parameters: param, onComplete: showPage});
}

function postAjax(){
   if(mySlide.getValue() < min)
		mySlide.setValue(min, true);
   if(mySlide.getValue() > max)
  	   	mySlide.setValue(max, true);
   var param = "page=" + mySlide.getValue();                             
   myAjax = new Ajax.Request("/News/article_Action.do?method=searchByAjax", {method: 'get', parameters: param, onComplete: showPage});
}

function showPage(request){
   var xmlDoc = request.responseXML;
   var articlesviews = xmlDoc.getElementsByTagName("articlesview");
   var result = "<table border=1 align=center><tr><td>ID</td><td>Title</td><td>Deployer</td><td>Bigclass</td><td>Smallclass</td><td>Deploytime</td><td>Operate</td></tr>";
   for (var i = 0 ; i < articlesviews.length ; i ++){
     result += "<tr>";
     var articlesview = articlesviews[i];
     result += "<td>" + articlesview.getElementsByTagName("id")[0].firstChild.nodeValue + "</td>";
     result += "<td>" + articlesview.getElementsByTagName("title")[0].firstChild.nodeValue + "</td>";
     result += "<td>" + articlesview.getElementsByTagName("deployer")[0].firstChild.nodeValue + "</td>";
     result += "<td>" + articlesview.getElementsByTagName("bigclass")[0].firstChild.nodeValue + "</td>";
     result += "<td>" + articlesview.getElementsByTagName("smallclass")[0].firstChild.nodeValue + "</td>";
     result += "<td>" + articlesview.getElementsByTagName("deploytime")[0].firstChild.nodeValue + "</td>";
     result += "<td><html:link href='/News/article_Action.do?method=updateArticle&id="+articlesview.getElementsByTagName("id")[0].firstChild.nodeValue+"'>update</html:link>" +
     				"&nbsp;&nbsp;<html:link href='/News/article_Action.do?method=deleteArticle&id="+articlesview.getElementsByTagName("id")[0].firstChild.nodeValue+"'>del</html:link></td>";
     result += "</tr>";
   }
   result += "</table>";
   document.getElementById("data").innerHTML= result;
}

function setSlider(){
   var number = 1;
   if (arguments[0] == "first")
     number = 1;
   else if (arguments[0] == "last")
     number = max;
   else if (arguments[0] == "previous")
     number = mySlide.getValue() - 1;
   else if (arguments[0] == "next")
      number = mySlide.getValue() + 1;
   mySlide.setValue(number, true);
   postAjax();
}