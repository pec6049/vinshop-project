package com.vinshopmysql.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/shopinfo")
public class ShopInfoController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	//회사 소개 페이지 이동
	@RequestMapping(value="/aboutus", method = RequestMethod.GET)
	public void aboutusGET() {
		logger.info("about us 페이지 진입......................");
	}
	
	//약관 페이지 이동
	@RequestMapping(value="/agreement", method = RequestMethod.GET)
	public void agreementGET() {
		logger.info("agreement 페이지 진입......................");
	}
	
	//정책 페이지 이동
	@RequestMapping(value="/policy", method = RequestMethod.GET)
	public void policyGET() {
		logger.info("policy 페이지 진입......................");
	}
}