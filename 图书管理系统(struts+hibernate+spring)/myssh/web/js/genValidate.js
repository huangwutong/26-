function isDigit (c)
{   
	return ((c >= "0") && (c <= "9"))
}
//�ж��������s�Ƿ�Ϊ����
function isInteger (s)
{
    var i;
    if (s==""){
       return false;
    }
    for (i = 0; i < s.length; i++)
    {
        var c = s.charAt(i);
        if (!isDigit(c)) return false;
    }
    return true;
}   
//�ж��Ƿ�Ϊ�Ǹ�����
function isFfzs(s){
	 if(!isInteger (s)){
	 	  return false;
	 }
	 else
	 {
	 		if(s<0)
	 		   return false;
	 		else
	 			 return true;
	 }
}
//���ݴ���radio�������飬��ȡѡ�ж����valueֵ
function getRadioValue(obj){
	for(i=0;i<obj.length;i++){
		if(obj[i].checked)
		   return obj[i].value
	}
}
//�ж��Ƿ�yyyymmdd��׼���ڸ�ʽ
function isdate(obj){
   			var mydate = obj.value;
   			if(mydate=="")
   			   return;
   			if(!isBzDate(mydate))
        {
   				 alert("���ڸ�ʽ(YYYYMMDD)���ԣ�");
   				 obj.value="";
   				 obj.focus();
   			}
}
//�ж��Ƿ�yyyymmdd��׼���ڸ�ʽ
function isBzDate(indate){
	if(!isInteger(indate))
	   return false;
	if(indate.length!=8)
	   return false;
	var month = indate.substring(4,6);

	if(month<=0||month>12)
	   return false;
	var day = indate.substring(6,8);

	if(day<=0||day>31)
	   return false;
	   
	return true;
}  
//�ж��Ƿ�Ϊ����
function f_check_number(s)
{
    if(isNaN(s))
    {
       return false;
    }
    else
    {
       return true;
    }
}  
//�ж��Ƿ�Ϊ�Ǹ�����
function isFfsz(s){
	 if(!f_check_number (s)){
	 	  return false;
	 }
	 else
	 {
	 		if(s<0)
	 		   return false;
	 		else
	 			 return true;
	 }
}