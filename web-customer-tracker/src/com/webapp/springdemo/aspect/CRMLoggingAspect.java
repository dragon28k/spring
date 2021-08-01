package com.webapp.springdemo.aspect;

import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component

public class CRMLoggingAspect {

	private Logger myLogger=Logger.getLogger(getClass().getName());
	
	@Pointcut("execution(* com.webapp.springdemo.controller.*.*(..))")
	private void forControllerPackage() {
		
	}
	
	@Pointcut("execution(* com.webapp.springdemo.service.*.*(..))")
	private void forServicePackage() {
		
	}
	
	@Pointcut("execution(* com.webapp.springdemo.dao.*.*(..))")
	private void forDAOPackage() {
		
	}
	
	@Pointcut("forControllerPackage() || forServicePackage() || forDAOPackage()")
	private void forAppFlow() {
		 
	}
	
	@Before("forAppFlow()")
	public void before(JoinPoint theJoinPoint) {
		String method=theJoinPoint.getSignature().toShortString();
		myLogger.info("@Before Method:"+method);
		Object [] ar=theJoinPoint.getArgs();
		for(Object obj:ar)
			myLogger.info("Argument:"+obj);
	}	
	
	@AfterReturning(pointcut="forAppFlow()", returning="theResult")
	public void afterReturning(JoinPoint theJoinPoint,Object theResult) {
		String method=theJoinPoint.getSignature().toShortString();
		myLogger.info("@Returning Method:"+method);
		myLogger.info("Result:"+theResult);
		
	}
	
}
