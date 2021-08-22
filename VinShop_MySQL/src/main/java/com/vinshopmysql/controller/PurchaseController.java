package com.vinshopmysql.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vinshopmysql.model.CartListVO;
import com.vinshopmysql.model.CartVO;
import com.vinshopmysql.model.MemberVO;
import com.vinshopmysql.model.OrderVO;
import com.vinshopmysql.service.CartService;
import com.vinshopmysql.service.MemberService;
import com.vinshopmysql.service.PurchaseService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/purchase")
@Log4j
public class PurchaseController {
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private PurchaseService purchaseservice;

	/* 장바구니 담은후 구매페이지 */
	@RequestMapping(value="/preBuy", method=RequestMethod.POST)
	public void preBuy(String[] cartId, Model model, HttpSession session) throws Exception{

		log.info("preBuy 실행");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String memberId = member.getMemberId();
		member = memberservice.importInfo(memberId);
		model.addAttribute("memberinfo", member);
		log.info("member : "+ member);
		
		List<CartListVO> list = new ArrayList<CartListVO>(); 
		
		// 장바구니 목록중 선택한것 가져오기
		for(int i = 0; i<cartId.length ; i++) {
			int id = 0;
			CartListVO cartlist = new CartListVO();
			id = Integer.parseInt(cartId[i]);
			cartlist = cartservice.buyList(id);
			
			list.add(cartlist);
		}
		if( !list.isEmpty() ) {
			model.addAttribute("buylist", list);
			log.info("list성공?>?" + list);
		}
	}
	
	/* 상품 한개 바로 구매페이지 */
	@RequestMapping(value="/preOneBuy", method=RequestMethod.POST)
	public String preOneBuy(CartVO cart, Model model, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		//회원정보 가져오기
		MemberVO member = (MemberVO)session.getAttribute("member");
		log.info(cart);
		
		//회원정보 없을시 반환
		if(member == null) {
			rttr.addFlashAttribute("buyFail", "1");
			return "redirect:/detail?num=" + cart.getVinId();
		}
		
		log.info(member);
		String memberId = member.getMemberId();
		member = memberservice.importInfo(memberId);
		model.addAttribute("memberinfo",member);
		
		//카트 담기
		if(member != null) { 
			cart.setMemberId(member.getMemberId());
			cartservice.cartEnroll(cart); 
		}
		log.info(cart);
		
		List<CartListVO> list = new ArrayList<CartListVO>(); 
		
		int[] cartId = new int[1];
		cartId[0] = cart.getCartId();
		System.out.println(cartId[0]);
		
		//카트 리스트 정보 가져오기
		for(int i = 0; i<cartId.length ; i++) {
			int id = 0;
			CartListVO cartlist = new CartListVO();
			id = cartId[i];
			cartlist = cartservice.buyList(id);
			
			list.add(cartlist);
		}
		
		if( !list.isEmpty() ) {
			model.addAttribute("buylist",list);
			System.out.println("list성공?>?" + list);
		}
		log.info("삭제전");
		cartservice.cartDelete(cart);
		log.info("삭제후");
		
		return "/purchase/preBuy";
	}
	
	/* 최종 결제 페이지 */
	@RequestMapping(value="/buy", method=RequestMethod.POST)
	public void ctBuy(HttpServletRequest request, OrderVO order,Model model) throws Exception{
		log.info("데이터진입");
		log.info(order);
		
		String memberId;
		
		if(order.getoDetail() != null) {
			order.getoDetail().forEach(attach -> log.info("" + attach));
			order.getCartId().forEach(cart -> log.info("" + cart));
			purchaseservice.ctBuy(order);
			memberId = order.getMemberId();
			model.addAttribute("memberId", memberId);
		}
	}
	
}
