package com.vinshopmysql.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vinshopmysql.model.OrderDetailVO;
import com.vinshopmysql.model.OrderVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PurchaseMapperTests {

	@Autowired
	private PurchaseMapper purchasemapper;
	
	/*
	@Test
	public void ctPurchase() throws Exception{
		
		OrderVO order = new OrderVO();
		
		order.setMemberId("test1");
		order.setOrderRec("박은채");
		order.setMemberAddr1("28781");
		order.setMemberAddr2("");
		order.setMemberAddr3("");
		order.setOrderPhone("010-000-000");
		order.setShipPrice(2000);
		order.setTotalPrice(50000);
		
		purchasemapper.ctPurchase(order);
	}
	*/
	
	/*
	@Test
	public void orderDetail() throws Exception{
		OrderDetailVO detail = new OrderDetailVO();
		detail.setOrderId(3);
		detail.setVinId(8);
		detail.setAmount(1);
		
		purchasemapper.ctPurchaseDetail(detail);
	}
	*/
	
	/*
	@Test
	public void cartDelete() throws Exception{
		int cartId = 10;
		purchasemapper.cartDelete(cartId);
	}
	*/
	
	/*
	@Test
	public void deduction() throws Exception{
		OrderVO order = new OrderVO();
		order.setTotalPrice(10000);
		order.setGetPoint(200);
		order.setUsePoint(500);
		order.setMemberId("test1");
		purchasemapper.deductionMoney(order);
	}
	*/
	
	@Test
	public void dedcutionStock() throws Exception{
		OrderDetailVO detail = new OrderDetailVO();
		detail.setVinId(26);
		detail.setAmount(50);
		purchasemapper.deductionStock(detail);
	}
	
}
