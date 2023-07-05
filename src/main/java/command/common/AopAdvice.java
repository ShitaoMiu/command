package command.common;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import command.controller.MenuController;

@Aspect
public class AopAdvice {
	private static final Logger logger = LogManager.getLogger(AopAdvice.class);

	@Autowired
	private PlatformTransactionManager transactionManager;

	  @Before("execution(*command.controller.*(..))")
	  public void logMethodCall(JoinPoint joinPoint) {
		  logger.info("Method " + joinPoint.getSignature().getName() + " is called");
	  }
	
	
	
	@Pointcut("execution(*command.service.*.*(..))")
	public void serviceMethod() {
	}

	@Around("serviceMethod()")
	public Object transactional(ProceedingJoinPoint joinPoint) throws Throwable {
		DefaultTransactionDefinition definition = new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		try {
			Object result = joinPoint.proceed();
			transactionManager.commit(status);
			return result;
		} catch (Exception e) {
			transactionManager.rollback(status);
			throw e;
		}
	}
}
