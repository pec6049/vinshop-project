package com.vinshopmysql.service;

import com.vinshopmysql.model.OrderVO;

public interface PurchaseService {
	
	/* 주문 등록 */
	public void ctBuy(OrderVO order) throws Exception;
	
}
