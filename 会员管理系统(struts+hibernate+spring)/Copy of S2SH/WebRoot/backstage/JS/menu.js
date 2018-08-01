function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function P7AniMagic(el, x, y, a, b, c, s) { //v2.5 PVII
 var g,elo=el,f="",m=false,d="";x=parseInt(x);y=parseInt(y);
 var t = 'g.p7Magic = setTimeout("P7AniMagic(\''+elo+'\','; 
 if ((g=MM_findObj(el))!=null) {d=(document.layers)?g:g.style;}else{return;}
 if (parseInt(s)>0) {eval(t+x+','+y+','+a+','+b+','+c+',0)",' + s+')');return;}
 var xx=(parseInt(d.left))?parseInt(d.left):0;
 var yy=(parseInt(d.top))?parseInt(d.top):0;
 if(parseInt(c)==1) {x+=xx;y+=yy;m=true;c=0;}
 else if (c==2) {m=false;clearTimeout(g.p7Magic);}
 else {var i=parseInt(a);
  if (eval(g.moved)){clearTimeout(g.p7Magic);}
  if (xx<x){xx+=i;m=true;if(xx>x){xx=x;}}
  if (xx>x){xx-=i;m=true;if(xx<x){xx=x;}}
  if (yy<y){yy+=i;m=true;if(yy>y){yy=y;}}
  if (yy>y){yy-=i;m=true;if(yy<y){yy=y;}}}
 if (m) {if((navigator.appName=="Netscape") && parseInt(navigator.appVersion)>4){
    xx+="px";yy+="px";}
  d.left=xx;d.top=yy;g.moved=true;eval(t+x+','+y+','+a+','+b+','+c+',0)",'+b+')');
  }else {g.moved=false;}
}
