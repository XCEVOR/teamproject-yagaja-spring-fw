package mul.cam.a.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mysql.cj.Session;

import mul.cam.a.dto.MemberDto;

@Aspect
public class AopProc {
	
	//@Around("within(mul.cam.a.controller.*) or within(mul.cam.a.dao.*.*)") //컨트롤러 감시 지정
	@Around("within(mul.cam.a.controller.*)") //컨트롤러 감시 지정

	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable{
		
		// session check
		/*
		// requset를 접근하는 방법
		HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		if(request != null) {
			HttpSession session = request.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");
			if(login==null) {
				return "redirect:/sessionOut.do"; // 원래는 logout.do
				// redirect은 controller에서 controller로 이동시 redirect:/[이동할 위치] 을 붙이면 해당 위치로 이동
				// ==sendRedirect와 동일
			}
		}
		*/
		
		String signatureStr= joinpoint.getSignature().toShortString();
		// 컨트롤러가 동작할 때 감시자가 감시를 시작
		
		
		try {
			Object obj = joinpoint.proceed(); // 컨트롤러 진입 시
			System.out.println("AOP log:"+signatureStr+"메소드 실행 "+new Date());
			return obj;
		}finally {
			//System.out.println("실행 후:"+System.currentTimeMillis());
		}
	}
}
