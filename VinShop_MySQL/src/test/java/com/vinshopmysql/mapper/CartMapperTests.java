package com.vinshopmysql.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {

	@Autowired
	private CartMapper cartmapper;
	
	/*
	@Test
	public void cartenroll() throws Exception{
		CartVO cart = new CartVO();
		
		cart.setCartStock(3);
		cart.setMemberId("test1");
		cart.setVinId(1);
		
		cartmapper.cartEnroll(cart);
		
	}
	*/
	
	@Test
	public void cartList() throws Exception{
		
		cartmapper.cartList("test1");
		
	}
}
