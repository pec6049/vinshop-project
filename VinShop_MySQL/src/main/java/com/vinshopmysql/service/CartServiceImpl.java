package com.vinshopmysql.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vinshopmysql.mapper.CartMapper;
import com.vinshopmysql.model.CartListVO;
import com.vinshopmysql.model.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper cartmapper;
	
	/* 장바구니 담기 */
	@Override
	public void cartEnroll(CartVO cart) throws Exception {
		cartmapper.cartEnroll(cart);
	}

	/* 장바구니 리스트 */
	@Override
	public List<CartListVO> cartList(String memberId) throws Exception {
		return cartmapper.cartList(memberId);
	}
	
	/* 장바구니 삭제 */
	@Override
	public void cartDelete(CartVO cart) throws Exception {
		cartmapper.cartDelete(cart);
	}
	
	/* 장바구니 수량 변경 */
	@Override
	public void stockChange(CartVO cart) throws Exception {
		cartmapper.stockChange(cart);
	}
	
	/* 장바구니 선택 리스트 */
	@Override
	public CartListVO buyList(int cartId) throws Exception {
		return cartmapper.buyList(cartId);
	}
}
