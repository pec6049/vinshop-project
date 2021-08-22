package com.vinshopmysql.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vinshopmysql.model.AttachImageVO;
import com.vinshopmysql.model.ClothesVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {

	@Autowired
	private AdminService service;
	
	
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	@Test
	public void vinEnrollTEsts() {

		ClothesVO ct = new ClothesVO();
		// 상품 정보
		ct.setVinName("mapper 테스트");
		ct.setCateCode("102000");
		ct.setVinPrice(20000);
		ct.setVinStock(300);
		ct.setVinDiscount(0.23);
		ct.setVinInfo("상품 소개");

		// 이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		
		
		ct.setImageList(imageList);
		
		// vinEnroll() 메서드 호출
		service.vinEnroll(ct);
		
		System.out.println("등록된 VO : " + ct);
		
		
	}
	
}