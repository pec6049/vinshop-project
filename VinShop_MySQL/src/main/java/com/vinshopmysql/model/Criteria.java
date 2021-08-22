package com.vinshopmysql.model;

public class Criteria {
	
	/* 현재 페이지 번호 */
    private int pageNum;
    
    /* 페이지 표시 개수 */
    private int amount;
    
    /* 페이지 skip */
    private int skip;
    
    /* 검색 타입 */
    private String type;
    
    /* 검색 키워드 */
    private String keyword;
    
    // 회원 아이디
 	private String memberId;
    
    /* Criteria 생성자 */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum -1) * amount;
    }
    
    /* Criteria 기본 생성자 */
    public Criteria(){
        this(1,10);
    }
    
    /* 검색 타입 데이터 배열 변환 */
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (pageNum - 1) * this.amount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		this.skip = (pageNum - 1) * this.amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", type=" + type
				+ ", keyword=" + keyword + ", memberId=" + memberId + "]";
	}
    
}
