package com.vinshopmysql.service;

import java.util.List;

import com.vinshopmysql.model.AttachImageVO;
import com.vinshopmysql.model.ClothesVO;
import com.vinshopmysql.model.Criteria;
import com.vinshopmysql.model.OrderVO;

public interface ProductService {

	/* 신상품순 select */
	public List<ClothesVO> dateSelect() throws Exception;
	
	/* 전체 all select */
	public List<ClothesVO> dateAllSelect() throws Exception;
	
	/* outer select */
	public List<ClothesVO> outerSelect() throws Exception;
	
	/* top select */
	public List<ClothesVO> topSelect() throws Exception;
	
	/* bottom select */
	public List<ClothesVO> bottomSelect() throws Exception;
	
	/* onepiece select */
	public List<ClothesVO> onepieceSelect() throws Exception;
	
	/* shoes&bags select */
	public List<ClothesVO> shoesbagsSelect() throws Exception;
	
	/* acc select */
	public List<ClothesVO> accSelect() throws Exception;
	
	/* 첨부파일 vinId 알아내기 */
	public List<AttachImageVO> getPcover(int vinId);
	
	/* 제품 상세 페이지 */
	public ClothesVO vinDetail(int vinId) throws Exception;
	
	/* 주문 목록 리스트 */
	public List<OrderVO> orderList(Criteria cri) throws Exception;
	
	/* 주문 목록 갯수 */
	public int orderCount(Criteria cri) throws Exception;
	
}
