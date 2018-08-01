<%
/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>
<%@ page import="java.io.*" %>
<table border=0 width="100%">
<tr><td>
<script>
var marqueeContent=new Array();
<%
	String file=application.getRealPath("/WEB-INF/template/scroll_tip.html");
	BufferedReader reader = null;
	FileInputStream fis = null;
	StringBuffer content = new StringBuffer();
	try{
		fis = new FileInputStream(file);
		reader = new BufferedReader(new InputStreamReader(fis));
		String line;
		int i=0;
		do{
			line = reader.readLine();
			if(line==null)
				break;
			if(line.trim().equals(""))
			        continue;
			
		   	out.println("marqueeContent["+i+"]='"+line+"'");
		   	i++;
		   	
		}while(true);
		
	}catch(IOException e1) {
           e1.printStackTrace();
	}finally{
		if(fis!=null)
			fis.close();
	}
%>
var marqueeInterval=new Array();
var marqueeId=0;
var marqueeDelay=2000;
var marqueeHeight=16;
function initMarquee() {
	var str=marqueeContent[0];
	document.write('<div id=marqueeBox style="overflow:hidden;height:'+marqueeHeight+'px" onmouseover="clearInterval(marqueeInterval[0])" onmouseout="marqueeInterval[0]=setInterval(\'startMarquee()\',marqueeDelay)"><div>'+str+'</div></div>');
	marqueeId++;
	marqueeInterval[0]=setInterval("startMarquee()",marqueeDelay);
	}
function startMarquee() {
	var str=marqueeContent[marqueeId];
		marqueeId++;
	if(marqueeId>=marqueeContent.length) marqueeId=0;
	if(marqueeBox.childNodes.length==1) {
		var nextLine=document.createElement('DIV');
		nextLine.innerHTML=str;
		marqueeBox.appendChild(nextLine);
		}
	else {
		marqueeBox.childNodes[0].innerHTML=str;
		marqueeBox.appendChild(marqueeBox.childNodes[0]);
		marqueeBox.scrollTop=0;
		}
	clearInterval(marqueeInterval[1]);
	marqueeInterval[1]=setInterval("scrollMarquee()",20);
	}
function scrollMarquee() {
	marqueeBox.scrollTop++;
	if(marqueeBox.scrollTop%marqueeHeight==(marqueeHeight-1)){
		clearInterval(marqueeInterval[1]);
		}
	}
initMarquee();
</script>
</td></tr></table>

