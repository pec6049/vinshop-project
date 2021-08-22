<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<link rel="stylesheet" href="../resources/css/detail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<div class="logo_area">
					<a href="/main"><img src="../resources/img/VS_logo.png"></a>
				</div>
				<ul class="list">
					<c:if test = "${member == null}">
		                <li >
		                    <a href="../member/login">로그인</a>
		                </li>
		                <li>
		                    <a href="../member/join">회원가입</a>
		                </li>
	                </c:if>
	                <c:if test="${member != null }">
	                	<c:if test="${member.adminCk == 1 }">
	                        <li><a href="../admin/main">관리자 페이지</a></li>
	                    </c:if>                
	                    <li>
	                        <a id="gnb_logout_button">로그아웃</a>
	                    </li>
	                    <li>
	                        <a href="/myRoom/main">마이룸</a>
	                    </li>
	                    <li>
	                        <a href="/order/cart">장바구니</a>
	                    </li>
	                </c:if> 
	                <li>
	                    <a href="/board/list">고객센터</a>
	                </li>            
	            </ul>
			</div>
	
			<div class="navi_bar_area">
				<ul class="list">
					<li>
						<a href="/menu/all">ALL</a>
	                </li>
					<li>
						<a href="/menu/outer">OUTER</a>
	                </li>
	                <li>
	                	<a href="/menu/top">TOP</a>
	                </li>
	                <li>
	                	<a href="/menu/bottom">BOTTOM</a>
	                </li>
	                <li>
	                	<a href="/menu/onepiece">ONEPIECE</a>
	                </li>
	                <li>
	                	<a href="/menu/shoesbags">SHOES&BAGS</a>
	                </li>
	                <li>
	                	<a href="/menu/acc">ACC</a>
	                </li>
				</ul>
			</div>
			
			<!-- 상품 출력 영역 -->
			<div class="content_area">
				<div class="content_subject">
					<span>DETAIL</span>
				</div>
				<div class="content_container">
					<div class="content_cover">
						<div class="image_box" id="image">
							이미지
						</div>
						<div class="purchase">
							<h2><strong>${bd.vinName}</strong></h2>
							<br>
							<br>
							<span>${bd.vinInfo}</span>
							<br>
							<c:set value="${bd.vinPrice - bd.vinDiscount}" var="dc"></c:set>
							<div id="purchase_money1">판매가 : <fmt:formatNumber value="${bd.vinPrice}" pattern="#,###"/>원</div>
							<br>
							<div id="purchase_money2">할인판매가 : <fmt:formatNumber value="${bd.vinDiscount}" pattern="#,###"/>원</div>
							<br>
							<div id="purchase_regDate">제조일 : <fmt:formatDate value="${bd.regDate}" pattern='yyyy-MM-dd'/></div>
							<br>
							<div id="purchase_btn">
								<form method="post" id="buyForm">
								<span class="btn_count">
									<input type="hidden" name="vinId" id="vinId" value="${bd.vinId}">
									수량 : 
									<select name="cartStock" id="qty">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>&nbsp;개
								</span>	
								</form>
							</div>
							
						</div>
						<div class="btn_section">
							<button id="cartBtn" class="btn" type="submit">장바구니</button>
							<button id="buyBtn" class="btn buy_btn">주문하기</button>
						</div>
					</div> <!-- content_cover -->
				</div> <!-- content_container -->
			</div>
			
			<!-- Footer 영역 -->
			<div class="footer_nav">
				<div class="footer_nav_container">
					<ul>
						<li>
							<a href="/shopinfo/aboutus">ABOUT US</a>
						</li>
						<span class="line">|</span>
						<li>
							<a href="/shopinfo/agreement">AGREEMENT</a>
						</li>
						<span class="line">|</span>
						<li>
							<a href="/shopinfo/policy">PRIVACY POLICY</a>
						</li>
					</ul>
				</div>
			</div> <!-- class="footer_nav" -->
			
			<div class="footer">
				<div class="footer_container">
					<div class="footer_customer">
						CUSTOMER CENTER
						<br>
						<br>
						<strong>010-1234-1234</strong>
						<br>
						MON-FRI 10:00~17:30		LUNCH 12:00~13:00
						<br>
						SAT / SUN / HOLIDAY CLOSE
					</div>
					<div class="footer_bank">
						BANK INFO
						<br>
						<br>
						신한 : 110-123-456789
						<br>
						농협 : 312-1234-1234-12
						<br>
						<strong>예금주 : 박은채</strong>
					</div>
					<div class="footer_addr">
						RETURN & EXCHANGE
						<br>
						<br>
						서울특별시 강남구 압구정로 5-25
						<br>
						CJ대한통운(1588-1255)
					</div>
				</div>
			</div> <!-- class="footer" -->
			<div class="footer_bottom">
				<div class="footer_copy">
					COMPANY : VINSHOP / OWNER : 박은채 / ADDRESS : 06000 서울특별시 강남구 압구정로 5-25
					<br>
					CALL : 010-1234-1234 / E-MAIL : pec6049@naver.com / BUSINESS LICENSE : 123-45-67890 / MALL ORDER LICENSE : 제2021-서울특별시-0000
					<br>
					COPYRIGHT © VINSHOP ALL RIGHTS RESERVED.
				</div>
				<div class="clearfix"></div>
			</div>
		</div>	<!-- class="wrap" -->
	</div>	<!-- class="wrapper" -->

	<script>
	
    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        $.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                //alert("로그아웃 성공");
                document.location.reload();    //새로고침 
            } 
        }); 
    });
	
	//이미지 넣기
	(function(){
		var vinId = ${bd.vinId};
		//alert(vinId);
		$.getJSON("/getPcover",{vinId:vinId}, function(arr){
			console.log(arr);
			
			var str = "";
			$(arr).each(function(i, attach){
			
				var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
				
				str += "<img src='display?fileName="+fileCallPath+"' data-path='" + attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='" + attach.image+"'>";
				
				return false;
			});
			
			$("#image").html(str);
			
		});// end getJSON
		
	})();// end function
	
	$(document).ready(function(){
		//alert("연결");

		//수량 증가
		$("#btn_plus").on('click', function(e){
			var value = parseInt($('#qty').val());
			value = value + 1;
			$('#qty').val(value);
		});
		//수량 감소
		$("#btn_minus").on('click', function(e){
			var value = parseInt($('#qty').val());
			value = value - 1;
			if(value <= 0){
				return;
			}
			$('#qty').val(value);
		});
	});
	
	//카트 등록하기
	$("#cartBtn").click(function cartEnroll(){
		var vinId = $("#vinId").val()
		var cartStock = $('#qty').val();
		var data = { 
			vinId : vinId,
			cartStock : cartStock
		}
		$.ajax({
			url : "/addEnroll",
			type : "post",
			data : data,
			success : function(result){
				if(result == 'true'){
					alert("카트 담기 성공");
					$('#qty').val(1);
				} else{
					alert("회원만 사용할 수 있습니다.");
				}
			}, error : function(){
				alert("카트 담기 실패");
			}
		}); // End ajax
	});
	
	//구매하기 실패시
	$(function(){
		var buyResult = ${buyFail};
		
        if(buyResult == 1){
            alert("로그인 후 구매가능합니다.");
        }
        
    }); 
	
	//바로 구매하기
	$("#buyBtn").click(function buyBtn() {
		$('#buyForm').attr("action","/purchase/preOneBuy");
		$('#buyForm').submit();
	});
	
	</script>
	
</body>
</html>