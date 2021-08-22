package com.vinshopmysql.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vinshopmysql.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/menu")
@Log4j
public class MenuController {
	
	@Autowired
	private ProductService productservice;
	
	//전체 상품 페이지 이동
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public void allPageGET(Model model) throws Exception {
		log.info("전체 상품 페이지 진입");
		
		//신상품 순서 
		model.addAttribute("das", productservice.dateAllSelect());
	}
	
	//아우터 페이지 이동
	@RequestMapping(value="/outer", method = RequestMethod.GET)
	public void outerPageGET(Model model) throws Exception {
		log.info("아우터 페이지 진입");
		
		model.addAttribute("os", productservice.outerSelect());
	}
	
	//상의 페이지 이동
	@RequestMapping(value="/top", method = RequestMethod.GET)
	public void topPageGET(Model model) throws Exception {
		log.info("상의 페이지 진입");
		
		model.addAttribute("ts", productservice.topSelect());
	}
	
	//하의 페이지 이동
	@RequestMapping(value="/bottom", method = RequestMethod.GET)
	public void bottomPageGET(Model model) throws Exception {
		log.info("하의 페이지 진입");
		
		model.addAttribute("bs", productservice.bottomSelect());
	}
	
	//원피스 페이지 이동
	@RequestMapping(value="/onepiece", method = RequestMethod.GET)
	public void onepiecePageGET(Model model) throws Exception {
		log.info("원피스 페이지 진입");
		
		model.addAttribute("ones", productservice.onepieceSelect());
	}
	
	//신발, 가방 페이지 이동
	@RequestMapping(value="/shoesbags", method = RequestMethod.GET)
	public void shoesbagsPageGET(Model model) throws Exception {
		log.info("신발, 가방 페이지 진입");
		
		model.addAttribute("sbs", productservice.shoesbagsSelect());
	}
	
	//악세서리 페이지 이동
	@RequestMapping(value="/acc", method = RequestMethod.GET)
	public void accPageGET(Model model) throws Exception {
		log.info("악세서리 페이지 진입");
		
		model.addAttribute("as", productservice.accSelect());
	}
	

}