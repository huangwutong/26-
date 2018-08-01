package net.acai.filter;
import java.util.regex.*;

/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */

public class FlashFilter extends filter {

  public FlashFilter(String s) {
    super(s);
  }
  public FlashFilter() {
   }
  public String convertString(){
    return this.flashConverter();
  }
  private String flashConverter(){
		Pattern p;
		Matcher m;
		StringBuffer sb;
		boolean result;
		String reg="(\\[FLASH\\])(.[^\\[]*)(\\[\\/FLASH\\])";
        p = Pattern.compile(reg,Pattern.CASE_INSENSITIVE);
        m = p.matcher(s);
        sb = new StringBuffer();
        result = m.find();
        while(result) {
            m.appendReplacement(sb,"<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=\""+m.group(2)+"\"><PARAM NAME=quality VALUE=high><embed src=\""+m.group(2)+"\" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>"+m.group(2)+"</embed></OBJECT>");
            result = m.find();
        }
        m.appendTail(sb);

        return sb.toString();
  }


}