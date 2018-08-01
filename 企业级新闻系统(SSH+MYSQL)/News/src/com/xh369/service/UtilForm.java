package com.xh369.service;

import org.apache.commons.beanutils.BeanUtils;

public class UtilForm{

    //使ActionForm与持久化类相互转化
    public static Object populate(Object form, String classname, String[] f){

      Object o=null;
      try {
        o=Class.forName(classname).newInstance();
        for(int i=0;i<f.length;i++){
          String p=f[i];
          Object v= BeanUtils.getProperty(form,p);
          BeanUtils.setProperty(o, p, v);
        }
      } catch (Exception e) {
          e.printStackTrace();
      }
      return o;
    }
}
