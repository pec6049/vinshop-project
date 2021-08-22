package com.vinshopmysql.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ClothesVO {
	
	/* 상품 id */
	private int vinId;
	
	/* 상품 이름 */
	private String vinName;
	
	/* 카테고리 코드 */
	private String cateCode;
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 상품 가격 */
	private int vinPrice;
	
	/* 상품 재고 */
	private int vinStock;
	
	/* 상품 할인률(백분율) */
	private double vinDiscount;
	
	/* 상품 소개 */
	private String vinInfo;
	
	/* 등록 날짜 */
	private Date regDate;
	
	/* 수정 날짜 */
	private Date updateDate;

	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	//업로드 
	public List<AttachImageVO> getPcover;
	
	private MultipartFile filename;
	
	public int getVinId() {
		return vinId;
	}

	public void setVinId(int vinId) {
		this.vinId = vinId;
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

	public int getVinPrice() {
		return vinPrice;
	}

	public void setVinPrice(int vinPrice) {
		this.vinPrice = vinPrice;
	}

	public int getVinStock() {
		return vinStock;
	}

	public void setVinStock(int vinStock) {
		this.vinStock = vinStock;
	}

	public double getVinDiscount() {
		return vinDiscount;
	}

	public void setVinDiscount(double vinDiscount) {
		this.vinDiscount = vinDiscount;
	}

	public String getVinInfo() {
		return vinInfo;
	}

	public void setVinInfo(String vinInfo) {
		this.vinInfo = vinInfo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	
	public List<AttachImageVO> getGetPcover() {
		return getPcover;
	}

	public void setGetPcover(List<AttachImageVO> getPcover) {
		this.getPcover = getPcover;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "ClothesVO [vinId=" + vinId + ", vinName=" + vinName + ", cateCode=" + cateCode + ", cateName="
				+ cateName + ", vinPrice=" + vinPrice + ", vinStock=" + vinStock + ", vinDiscount=" + vinDiscount
				+ ", vinInfo=" + vinInfo + ", regDate=" + regDate + ", updateDate=" + updateDate + ", imageList="
				+ imageList + ", getPcover=" + getPcover + ", filename=" + filename + "]";
	}
	
}
