package tiger.spring.web.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class AspectTrace {
	
	private static final Logger logger = LoggerFactory.getLogger(AspectTrace.class);

    @Around("execution(* tiger.spring.web..*.*(..))")
	public Object trace(ProceedingJoinPoint jp) throws Throwable {
		
		String signatureString = jp.getSignature().toShortString();
		logger.debug("{} starts..", signatureString);
		long start = System.currentTimeMillis();
		try {
			Object result = jp.proceed();
			return result;
		} finally {
			long finish = System.currentTimeMillis();
			logger.debug("{} ends..; duration {}ms", signatureString, (finish-start)); 
		}
		
	}
	
}
