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

public class AutoFilter extends filter {

  public AutoFilter(String s) {
    super(s);
  }
  public AutoFilter() {

  }
  public String convertString(){
    return autoURLConverter();
  }
  public String autoURLConverter(){
          Pattern p;
          Matcher m;
          StringBuffer sb;
          boolean result;
          String reg="^(http://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)|"+
                  "((http://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)$)|"+
                  "([^>=\"\"](http://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+))"+
                  "|^(ftp://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)"+
                  "|(ftp://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)$"+
                  "|[^>=\"\"](ftp://[A-Za-z0-9\\.\\/=\\?%\\-&_~`@':+!]+)"+
                  "|^(rtsp://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)"+
                  "|(rtsp://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)$"+
                  "|[^>=\"\"](rtsp://[A-Za-z0-9\\.\\/=\\?%\\-&_~`@':+!]+)"+
                  "|^(mms://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)"+
                  "|(mms://[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)$"+
                  "|[^>=\"\"](mms://[A-Za-z0-9\\.\\/=\\?%\\-&_~`@':+!]+)";
  p = Pattern.compile(
      reg,
      Pattern.CASE_INSENSITIVE);
  m = p.matcher(s);
  sb = new StringBuffer();
  result = m.find();
  while(result&&m.group(0)!=null) {
      m.appendReplacement(sb,"<a target=_blank href="+m.group(0)+">"+m.group(0)+"</a>");
      result = m.find();
  }
  m.appendTail(sb);
          return sb.toString();
  }
}