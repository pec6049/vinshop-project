package com.vinshopmysql.model;

import java.util.Date;

public class CartVO {

	//카트 번호(기본키)
	private int cartId;
	
	//회원 번호(외부연결)
	private String memberId;
	
	//제품 번호(외부연결)
	private int vinId;
	
	//구매 수량
	private int cartStock;
	
	//등록날짜
	private Date addDate;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getVinId() {
		return vinId;
	}

	public void setVinId(int vinId) {
		this.vinId = vinId;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "CartVO [cartId=" + cartId + ", memberId=" + memberId + ", vinId=" + vinId + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
	}

	
}
