package BookShop;

import java.text.*;
import java.util.*;

public class MyTime{

	/***************************************************
	*method name:	getDay<br>
	*method function:	get system time<br>
	*return value:  String<br>
	*		   		yyyy-MM-dd<br>
	*parameter explain:	no<br>	
	*amend:	crazyadept<br>
	*		2004/8/4<br>
	****************************************************/
	public String getDay(){
		
    	SimpleDateFormat formatter;  // Formats the date displayed
	    Date currentDate;            // Used to get date to display
	    String now;             // String to hold date displayed
        formatter = new SimpleDateFormat ("yyyy-MM-dd", Locale.getDefault());
        currentDate = new Date();
        now = formatter.format(currentDate);
		return now;
	}
	
	/***************************************************
	*method name:	getYear<br>
	*method function:	get system time<br>
	*return value:  String<br>
	*		   		yyyy/MM/dd HH:mm<br>
	*parameter explain:	no<br>
	*amend:	crazyadept<br>
	*		2004/8/4<br>
	****************************************************/
	public String getYear(){
	
    	SimpleDateFormat formatter;  // Formats the date displayed
	    Date currentDate;            // Used to get date to display
	    String now;             // String to hold date displayed
        formatter = new SimpleDateFormat ("yyyy/MM/dd HH:mm", Locale.getDefault());
        currentDate = new Date();
        now = formatter.format(currentDate);
		return now;
	}

	/***************************************************
	*method name:	getSecond<br>
	*method function:	get system time<br>
	*return value:  String<br>
	*		   		HH:mm:ss<br>
	*parameter explain:	no<br>
	*amend:	crazyadept<br>
	*		2004/8/14<br>
	****************************************************/
	public String getSecond(){
	
    	SimpleDateFormat formatter;  // Formats the date displayed
	    Date currentDate;            // Used to get date to display
	    String now;             // String to hold date displayed
        formatter = new SimpleDateFormat ("HH:mm:ss", Locale.getDefault());
        currentDate = new Date();
        now = formatter.format(currentDate);
		return now;
	}
	
	/***************************************************
	*method name:	getId<br>
	*method function:	get system time be use to id<br>
	*return value:  String<br>
	*		   		yyyyMMddHHmmss<br>
	*parameter explain:	no<br>
	*amend:	crazyadept<br>
	*		2004/8/20<br>
	****************************************************/

	public String getId(){
		
    	SimpleDateFormat formatter;  // Formats the date displayed
	    Date currentDate;            // Used to get date to display
	    String now;             // String to hold date displayed
        formatter = new SimpleDateFormat ("yyMMddHHmmss", Locale.getDefault());
        currentDate = new Date();
        now = formatter.format(currentDate);
		return ("HY"+now);
	}
}