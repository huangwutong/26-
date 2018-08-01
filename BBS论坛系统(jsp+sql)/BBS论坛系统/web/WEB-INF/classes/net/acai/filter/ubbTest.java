package net.acai.filter;
import net.acai.filter.*;
import java.lang.reflect.*;

/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */

public class ubbTest {
  public static void main(String[] args) {
    String testString="as[i]df1[/i][QUOTE]asdffda[/quote]234[img]asdf[/img][url]asdf[/url][url=asdf]fdsa[/url]asdf";
    UBBFilter m=new IMGFilter(testString);
    //m.setInputString(testString);
    testString=m.getFilterString();

    m=new URLFilter(testString);
    testString=m.getFilterString();

    m=new URLFilter(testString);
   testString=m.getFilterString();

    m=new CSSFilter(testString);
   testString=m.getFilterString();
    java.lang.reflect.Constructor constructor;
    try{
      Class myClass=Class.forName("net.acai.filter.TextStyleFilter");
      Class [] constructorArgsTypes={String.class};
      Object [] constructorArgs={testString};
      constructor=myClass.getConstructor(constructorArgsTypes);
      m=(UBBFilter)constructor.newInstance(constructorArgs);
      //m.setInputString(testString);
     testString=m.getFilterString();
    }
    catch(Exception e){
      e.printStackTrace();
    }
    System.out.println(testString);
  }
}