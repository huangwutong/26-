//Add by Liurh

//检查是否为数字，如-1.2,3.6,333
function checknum(str)
{
  var i,flag=false;
  for(i=0;i<str.length;i++)
  {
    if(str.substr(i,1)<"0"||str.substr(i,1)>"9")
    {
      if(str.substr(i,1)=="."&&!flag)
        flag=true;
      else if(str.substr(i,1)=="-"&&i==0)
        continue;
      else
        return false;
    }
  }
  return true;
}

//检查字符串中是否全为数字字符
function checknumber(str)
{
  var i;
  if(str.length==0)
  {
    return false;
  }
  for(i=0;i<str.length;i++)
  {
    if((str.substr(i,1)<"0")||(str.substr(i,1)>"9"))
	return false;
  }
  return true;
}

function montharr(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11)
{
   this[0] = m0;
   this[1] = m1;
   this[2] = m2;
   this[3] = m3;
   this[4] = m4;
   this[5] = m5;
   this[6] = m6;
   this[7] = m7;
   this[8] = m8;
   this[9] = m9;
   this[10] = m10;
   this[11] = m11;
}

//检查日期格式（YYYY/MM/DD）是否合法
function checkdate(str)
{
  var a,s,i,a0,a1,a2;
  var month=new montharr(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
  a=str.split("/");
  if(a.length!=3){
  	a=str.split("-");
  	if(a.length!=3) return false;
  }	
  
  
  for(i=0;i<3;i++)
  {
    if(!checknumber(a[i])) return false;
  }
  a0=eval(a[0]);
  a1=eval(a[1]);
  a2=eval(a[2]);
  if (((a0 % 4 == 0) && (a0 % 100 != 0)) || (a0 % 400 == 0))
      month[1] = 29;
  if(a1<1||a1>12)
    return false;
  if(a2<1||a2>month[a1-1])
    return false;
  return true;
}

//End for Liurh

