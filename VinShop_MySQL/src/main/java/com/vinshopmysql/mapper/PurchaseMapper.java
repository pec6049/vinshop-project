package com.vinshopmysql.mapper;

import com.vinshopmysql.model.OrderDetailVO;
import com.vinshopmysql.model.OrderVO;

public interface PurchaseMapper {

	//최초 주문 등록
	public void ctPurchase(OrderVO order);
	
	//주문 상세 등록
	public void ctPurchaseDetail(OrderDetailVO order);
	
	//주문한 카트 id 삭제
	public void cartDelete(int cartId);
	
	//주문상품 비용 차감(돈, 포인트)
	public void deductionMoney(OrderVO order);
	
	//주문 상품 재고 차감
	public void deductionStock(OrderDetailVO order);
	
}
