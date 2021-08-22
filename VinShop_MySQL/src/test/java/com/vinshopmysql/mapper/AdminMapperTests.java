package com.vinshopmysql.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vinshopmysql.model.Criteria;
import com.vinshopmysql.model.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	/*
	@Test
	public void vinEnrollTest() throws Exception{
		
		ClothesVO ct = new ClothesVO();
		
		ct.setVinName("mapper 테스트");
		ct.setCateCode("101000");
		ct.setVinPrice(20000);
		ct.setVinStock(300);
		ct.setVinDiscount(0.23);
		ct.setVinInfo("상품 소개 ");
		
		System.out.println("Before ClothesVO :" + ct);
		
		mapper.vinEnroll(ct);
		
		System.out.println("After ClothesVO :" + ct);
	}
	*/
	
	/* 카테고리 리스트 */
	/*
	@Test
	public void cateListTest() throws Exception{
		
		System.out.println("cateList()..........." + mapper.cateList());
		
	}
	*/
	
	/* 상품 리스트 & 상품 총 갯수 */
	/*
	@Test
	public void goodsGetListTest() {
		
		Criteria cri = new Criteria();
		
		//검색조건
		cri.setKeyword("테스트");
		
		//검색 리스트
		List list = mapper.goodsGetList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result......." + i + " : " + list.get(i));
		}
		
		//상품 총 갯수
		int result = mapper.goodsGetTotal(cri);
		System.out.println("result.........." + result);
	}
	*/
	
	/* 상품 조회 페이지 */
	/*
	@Test
	public void goodsGetDetailTest() {
		
		int vinId = 15;
		
		ClothesVO result = mapper.goodsGetDetail(vinId);
		
		System.out.println("상품 조회 데이터 : " + result);
		
	}
	*/
	
	/* 상품 정보 수정 */
	/*
	@Test
	public void goodsModifyTest() {
		
		ClothesVO ct = new ClothesVO();
		
		ct.setVinId(1);
		ct.setVinName("mapper 테스트");
		ct.setCateCode("101000");
		ct.setVinPrice(20000);
		ct.setVinStock(300);
		ct.setVinDiscount(0.23);
		ct.setVinInfo("상품 소개");
		
		mapper.goodsModify(ct);
		
	}
	*/
	
	/* 상품 정보 삭제 */
	/*
	@Test
	public void goodsDeleteTest() {
		
		int vinId = 15;
		
		int result = mapper.goodsDelete(vinId);
		
		if(result == 1) {
			System.out.println("삭제 성공");
		}
		
	}
	*/
	
	/* 이미지 등록 */
	/*
	@Test
	public void imageEnrollTest() {
		
		AttachImageVO vo = new AttachImageVO();
		
		vo.setVinId(14);
		vo.setFileName("test");
		vo.setUploadPath("test");
		vo.setUuid("test2");
		
		mapper.imageEnroll(vo);
		
	}
	*/
	
	/* 어제자 날짜 이미지 리스트 */
	/*
	@Test
	public void checkImageListTest() {
		
		mapper.checkFileList();
		
	}
	*/
	
	/* 지정 상품 이미지 정보 얻기 */
	/*
	@Test
	public void getAttachInfoTest() {
		
		int vinId = 25;
		
		List<AttachImageVO> list = mapper.getAttachInfo(vinId);
		
		System.out.println("list : " + list);
		
	}
	*/
	
	/* 회원 목록 테스트 */
    @Test
    public void memberGetListTest() throws Exception{
        
        Criteria cri = new Criteria(1,10);    // 1페이지 & 10개 행 표시
        cri.setKeyword("테스트");
        
        List<MemberVO> list = mapper.memberGetList(cri);
        
        for(int i = 0; i < list.size(); i++) {
            System.out.println("list" + i + ".........." + list.get(i));
        }
    }
}
