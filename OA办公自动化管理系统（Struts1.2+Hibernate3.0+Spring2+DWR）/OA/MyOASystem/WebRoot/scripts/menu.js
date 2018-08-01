window.onload=showTime;
	function showTime(){
		setInterval(show,1000);
	}
	function show(){
		var year = new Date().getYear();
		var month=new Date().getMonth()+1;
		if(month<10){
			month="0"+month;
		}
		var day = new Date().getDate();
		if(day<10){
			day="0"+day;
		}
		var hour = new Date().getHours();
		if(hour<10){
			hour="0"+hour;
		}
		var minute = new Date().getMinutes();
		if(minute<10){
			minute="0"+minute;
		}
		var second = new Date().getSeconds();
		if(second<10){
			second="0"+second;
		}
		document.getElementById("showTime").innerHTML=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	} 