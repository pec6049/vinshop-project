package com.vinshopmysql.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.vinshopmysql.model.AttachImageVO;
import com.vinshopmysql.model.CartListVO;
import com.vinshopmysql.model.CartVO;
import com.vinshopmysql.model.MemberVO;
import com.vinshopmysql.service.CartService;
import com.vinshopmysql.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductController {

	@Autowired
	private ProductService productservice;
	
	@Autowired
	private CartService cartservice;
	
	// 게시물 첨부파일 조회 컨트롤러
	@RequestMapping(value="getPcover", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachImageVO>> getPcover(int vinId){
		
		System.out.println("getPcover " + vinId);
		
		return new ResponseEntity<>(productservice.getPcover(vinId), HttpStatus.OK);
		
	}
	
	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		
		log.info("fileName : " + fileName);
		
		File file = new File("C:\\upload\\temp" + fileName);
		
		log.info("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 상품 상세 페이지 */
	@RequestMapping("detail")
	public String detailGET(int num, Model model, HttpServletRequest request) throws Exception{
		
		 Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		 String result = "0";
		 
		 if(redirectMap != null) {
			 System.out.println(redirectMap.get("buyFail"));
			 result = (String)redirectMap.get("buyFail");
			 System.out.println("result : " + result);
			model.addAttribute("buyFail", result);
		 } else {
			 
			 model.addAttribute("buyFail", result);
		 }
		
		System.out.println("제품 상세(detailGET....) 실행");
		model.addAttribute("bd", productservice.vinDetail(num));
		
		return "detail";
	}
	
	/* 장바구니 추가 */
	@RequestMapping(value = "addEnroll", method = RequestMethod.POST)
	@ResponseBody
	public String addCartPOST(CartVO cart, HttpSession session) throws Exception{
		
		log.info("addEnroll 진입");
		
		String result = "false";
		
		//현재 사용자
		MemberVO member = (MemberVO)session.getAttribute("member");
		log.info("현재 사용자 : " + member);
		
		//현재 사용자 장바구니에 아이템 저장
		if(member != null) { 
			cart.setMemberId(member.getMemberId());
			cartservice.cartEnroll(cart); 
			result = "true";
		}
		
		log.info(result);
		return result;
	}
	
	/* 장바구니 페이지 */
	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public String cartGET(HttpSession session, Model model) throws Exception{
		// 현재 사용자
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memberId = member.getMemberId();
		log.info("현재 memberId : " + memberId);
		
		//담긴 상품 list
		log.info("list" + cartservice.cartList(memberId));
		List<CartListVO> list = cartservice.cartList(memberId);
		model.addAttribute("clist",list);
		
		return "/order/cart";
	}
	
	/* 장바구니 상품 삭제 */
	@RequestMapping(value="/order/deleteCart", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCart(HttpSession session, @RequestParam(value="chkbox[]") List<String> chkArr, CartVO cart)throws Exception{
		
		log.info("delete cart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String memberId = member.getMemberId();
		
		String result = "0";
		int cartId = 0;
		
		if(member != null) {
			cart.setMemberId(memberId);
			
			for(String i : chkArr) {
				cartId = Integer.parseInt(i);
				cart.setCartId(cartId);
				cartservice.cartDelete(cart);
			}
			result = "1";
		}
		return result;
	}
	
	/* 장바구니 수량 변경 */
	@RequestMapping(value="/order/stockChange", method=RequestMethod.POST)
	@ResponseBody
	public String stockChange(HttpSession session,CartVO cart) throws Exception{
		
		log.info("Stock Change");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String result = "0";
		
		if(member != null) {
			cartservice.stockChange(cart);
			
			result = "1";
		}
		return result;
	}
	
}
