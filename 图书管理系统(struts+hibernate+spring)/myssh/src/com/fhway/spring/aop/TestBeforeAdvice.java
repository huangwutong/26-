package com.fhway.spring.aop;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

import com.laodong.framework.MyDispatchAction;

public class TestBeforeAdvice implements MethodInterceptor,
MethodBeforeAdvice, AfterReturningAdvice {
    public void before(Method method,Object[] args,Object target) throws Throwable{
    	String userid = (String)MyDispatchAction.get();
    	System.out.println("------��ǰ�û���: " + userid);
    	System.out.println("--------------������ʵ��: " + target.getClass().getName());
    	System.out.println("--------------���ط�����: " + method.getName());
        System.out.println("--------------���ط�����������: " + args.length);    
   }
    public Object invoke(MethodInvocation invocation) throws Throwable {
		Object rval = invocation.proceed();
//		System.out.println("--------logDyKey invoke: " + invocation.getArguments());
		return rval;
	}
    /**
	 * Ŀ�귽�����ú�����
	 */
	public void afterReturning(Object arg0, Method arg1, Object[] arg2,
			Object target) throws Throwable {
		String classname = target.toString();
		classname = classname.substring(0, classname.indexOf("@") + 1);
		// ���ط�����ʶ�ִ���Service·��@��������
		String logDyKey = classname + arg1.getName();
		// �������ط�����ʶ�ִ�����־�������ƥ���Ӧ��¼dyObj
		
//		System.out.println("--------logDyKey afterReturning: " + logDyKey);
	}
}
