package com.vinshopmysql.model;

import java.util.List;

public class CartListVO {

	private int cartId;
	
	private int vinId;
	
	private String memberId;
	
	private int cartStock;
	
	private String addDate;
	
	private String vinName;
	
	private String cateCode;
	
	private String cateName;
	
	private List<AttachImageVO> pCover;
	
	private int vinPrice;
	
	private int vinDiscount;
	
	private String vinInfo;
	
	private String regDate;
	
	private String updateDate;
	
	private int vinStock;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getVinId() {
		return vinId;
	}

	public void setVinId(int vinId) {
		this.vinId = vinId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public String getVinName() {
		return vinName;
	}

	public void setVinName(String vinName) {
		this.vinName = vinName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public List<AttachImageVO> getpCover() {
		return pCover;
	}

	public void setpCover(List<AttachImageVO> pCover) {
		this.pCover = pCover;
	}

	public int getVinPrice() {
		return vinPrice;
	}

	public void setVinPrice(int vinPrice) {
		this.vinPrice = vinPrice;
	}

	public int getVinDiscount() {
		return vinDiscount;
	}

	public void setVinDiscount(int vinDiscount) {
		this.vinDiscount = vinDiscount;
	}

	public String getVinInfo() {
		return vinInfo;
	}

	public void setVinInfo(String vinInfo) {
		this.vinInfo = vinInfo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getVinStock() {
		return vinStock;
	}

	public void setVinStock(int vinStock) {
		this.vinStock = vinStock;
	}

	@Override
	public String toString() {
		return "CartListVO [cartId=" + cartId + ", vinId=" + vinId + ", memberId=" + memberId + ", cartStock="
				+ cartStock + ", addDate=" + addDate + ", vinName=" + vinName + ", cateCode=" + cateCode + ", cateName="
				+ cateName + ", pCover=" + pCover + ", vinPrice=" + vinPrice + ", vinDiscount=" + vinDiscount
				+ ", vinInfo=" + vinInfo + ", regDate=" + regDate + ", updateDate=" + updateDate + ", vinStock="
				+ vinStock + "]";
	}

}
