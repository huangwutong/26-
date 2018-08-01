package com;
import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

public class MothedAdvisor extends DefaultService implements MethodInterceptor,
		MethodBeforeAdvice, AfterReturningAdvice {

	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object rval = invocation.proceed();
		System.out.println("--------logDyKey: ");
		return rval;
	}

	/**
	 * Ŀ�귽������ǰ����
	 */
	public void before(Method arg0, Object[] arg1, Object arg2)
			throws Throwable {
		System.out.println("--------logDyKey: ");
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
		
		System.out.println("--------logDyKey: " + logDyKey);
	}
}
