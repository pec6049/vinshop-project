package com.vinshopmysql.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vinshopmysql.mapper.ProductMapper;
import com.vinshopmysql.model.AttachImageVO;
import com.vinshopmysql.model.ClothesVO;
import com.vinshopmysql.model.Criteria;
import com.vinshopmysql.model.OrderVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServcieImpl implements ProductService {

	@Autowired
	ProductMapper productmapper;
	
	/* 신상품순 select */
	@Override
	public List<ClothesVO> dateSelect() throws Exception {
		
		return productmapper.dateSelect();
	}
	
	/* 전체 all select */
	@Override
	public List<ClothesVO> dateAllSelect() throws Exception {
		
		return productmapper.dateAllSelect();
	}
	
	/* outer select */
	@Override
	public List<ClothesVO> outerSelect() throws Exception {
		
		return productmapper.outerSelect();
	}
	
	/* top select */
	@Override
	public List<ClothesVO> topSelect() throws Exception {
		
		return productmapper.topSelect();
	}
	
	/* bottom select */
	@Override
	public List<ClothesVO> bottomSelect() throws Exception {
		
		return productmapper.bottomSelect();
	}
	
	/* onepiece select */
	@Override
	public List<ClothesVO> onepieceSelect() throws Exception {
		
		return productmapper.onepieceSelect();
	}
	
	/* shoes&bags select */
	@Override
	public List<ClothesVO> shoesbagsSelect() throws Exception {
		
		return productmapper.shoesbagsSelect();
	}
	
	/* acc select */
	@Override
	public List<ClothesVO> accSelect() throws Exception {
		
		return productmapper.accSelect();
	}
	
	/* 이미지 정보 가져오기 */
	@Override
	public List<AttachImageVO> getPcover(int vinId) {
		
		log.info("get Pcover list by vinId : " + vinId);
		
		return productmapper.findByVinId(vinId);
	}
	
	/* 제품 상세 */
	@Override
	public ClothesVO vinDetail(int vinId) throws Exception {
		return productmapper.vinDetail(vinId);
	}
	
	/* 주문 목록 리스트 */
	@Override
	public List<OrderVO> orderList(Criteria cri) throws Exception {
		return productmapper.orderList(cri);
	}

	/* 주문 목록 갯수 */
	@Override
	public int orderCount(Criteria cri) throws Exception {
		return productmapper.orderCount();
	}
}
