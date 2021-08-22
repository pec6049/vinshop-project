package com.vinshopmysql.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.vinshopmysql.model.MemberVO;
import com.vinshopmysql.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
public class ReSessionInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MemberService memberservice;
	
	private static final String LOGIN = "member";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
							ModelAndView modelAndview) throws Exception {
		
		log.info("postHandle 진입");
		HttpSession session = request.getSession();
		
		//기존 세션 정보제거
		if(session.getAttribute(LOGIN) != null) {
			log.info("clear login data before");
			System.out.println("clear login data before");
			session.removeAttribute(LOGIN);
		}
		//새 세션 정보 저장
		String memberId = (String) modelAndview.getModel().get("memberId");
		MemberVO vo = memberservice.reSession(memberId);
		Object lvo = vo;
		log.info("lvo새로담기");
		session.setAttribute(LOGIN, lvo);
		log.info("lvo값 = " + lvo);
		response.sendRedirect(request.getContextPath() +"/main");
		
		super.postHandle(request, response, handler, modelAndview);
	}
}
