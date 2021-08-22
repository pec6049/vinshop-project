<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<link rel="stylesheet" href="../resources/css/order/cart.css">
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
					<span>CART</span>
				</div>
				<div class="content_container">
					<div id="nav_main_1_cart">
						<div id="nav_main_1_cart_check" class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck">전체선택 
						</div>
						<div id="del_btn">
							<button type="button" class="selectDelete_btn">선택삭제</button>
						</div>
						
						<div class="nav_main_1_cart_info">
							<table>
								<thead>
									<tr id="firstrow">
										<td id="c_check">선택</td>
										<td id="c_product_info"colspan="2">상품정보</td>
										<td id="c_price">판매가</td>
										<td id="c_amount">수량</td>
										<td id="c_sum">총금액</td>
										<td id="c_selection">삭제</td>
									</tr>
								</thead>
								<tbody>
									<c:set var="i" value="0"/>
									<c:set var="priceTotal"  value="0"/>
									<c:set var="productKinds" value="0"/>
									<c:set var="productAmount" value="0"/>
									<c:forEach items="${clist}" var="clist">
										<tr>
											<td id="r_cproduct_check">
												<input type="checkbox" id="chkBox${i}" name="chkBox" class="chkBox" data-cartId="${clist.cartId}">
												<input type="hidden" id="cartId${i}" value="${clist.cartId}">
												
												<script>
													$(".chkBox").click(function(){
														$("#allCheck").prop("checked", false);
													});
												</script>
											</td>
											<td id="r_cproduct_image${i}" class="r_cproduct_image">
												<input type="hidden" id="vinId${i}" value="${clist.vinId}">
												<script>
												/* 상품 이미지 가져오기 */
											    (function(){
													var vinId = $("#vinId${i}").val();
													
													//alert(vinId);
													$.getJSON("/getPcover",{vinId:vinId}, function(arr){
														console.log(arr);
														
														var str = "";
														$(arr).each(function(i, attach){
														
															var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
															
															str += "<img src='/display?fileName=" + fileCallPath + "'>";
															
															return false;
														});
														$("#r_cproduct_image${i}").html(str);
														
													});// end getJSON
												})();// end function
												</script>
											</td>
											<td id="r_cproduct_info">
												<div class="title">
													<a>
														<span class="category">[${clist.cateName}]</span> ${clist.vinName}
													</a>
												</div>
											</td>
											<td id="r_cprice">
												판매가 :	<fmt:formatNumber value="${clist.vinPrice}" pattern="#,###"/> 원    
											</td>
											<td id="r_camount">
												<input type="hidden"value="${clist.cartStock}" maxlength="3" id="origin_qty${i}">
												<div class="qty_change">
													<input type="text" name="qty" value="${clist.cartStock}" maxlength="3" id="qty${i}" class="input_style02" name="cartStock" readonly="readonly">
													<a class="btn_plus" id="btn_plus${i}">수량 더하기</a>
													<a class="btn_minus" id="btn_minus${i}">수량 빼기</a>
												</div>
												<br>
												<div class="change_btn_wrap">
													<button class="change_btn">수량변경</button>
												</div>
												<script>
													$(document).ready(function(){
														//수량변경 버튼
														$('.change_btn').click(function(){
															var cartStock = $("#qty${i}").val();
															var origin = $("origin_#qty${i}").val();
															var cartId = ${clist.cartId};
															if(cartStock != origin){
																$.ajax({
																	url : "stockChange",
																	type : "post",
																	data : {cartStock : cartStock, cartId:cartId},
																	success : function(result){
																		if(result == 1){
																			location.href = "cart";	
																		} else{
																			alert(result);
																			alert("변경 실패")
																		}
																	}
																});
															}
															
														});
														
														//수량 증가
														$("#btn_plus${i}").on('click', function(e){
															var value = parseInt($('#qty${i}').val());
															value = value + 1;
															$('#qty${i}').val(value);
														});
														
														//수량 감소
														$("#btn_minus${i}").on('click', function(e){
															var value = parseInt($('#qty${i}').val());
															value = value - 1;
															if(value <= 0){
																return;
															}
															$('#qty${i}').val(value);
														});	
													});
												</script>
												
											</td>
											<c:set var="clist_sum_price" value="${clist.vinPrice * clist.cartStock}" />
											<td id="r_csum">합계 : <fmt:formatNumber value="${clist_sum_price}" pattern="#,###"/>원</td>
											<td id="r_cselection" class="delete">
												<button type="button" id="delete_btn" class="delete_${i}_btn" data-cartId="${clist.cartId}">삭제</button>
												<script>
													$(".delete_${i}_btn").click(function(){
														var confirm_val = confirm("삭제하시겠습니까?");
														
														if(confirm_val){
															var checkArr = new Array();
															
																checkArr.push($(this).attr("data-cartId"));
															
															$.ajax({
																url : "deleteCart",
																type : "post",
																data : {chkbox : checkArr},
																success : function(result){
																	if(result == 1){
																		location.href = "cart";	
																	} else{
																		alert(result);
																		alert("삭제 실패")
																	}
																}
															});
														}
														
													});
												</script>
												
											</td>
										</tr>
									<input type="hidden" id="priceTotal${i}" value="${clist_sum_price}">
									<input type="hidden" id="productAmount${i}" value="${clist.cartStock}">
									
									<c:set var="i" value="${i+1}"></c:set>
									<c:set var="priceTotal"  value="${priceTotal + clist_sum_price}"/>
									<c:set var="productKinds" value="${productKinds+1}"/>
									<c:set var="productAmount" value="${productAmount + clist.cartStock}"/>
									</c:forEach>
								</tbody>
								
							</table>
						</div> <!-- nav_main_1_cart_info -->
					</div> <!-- nav_main_1_cart -->
					
					<div class="nav_main_1_result">
						<form id="buy_form" method="post">
							<div class="nav_main_1_result_info">
								<div id="nav_main_1_result_info_hidden">
								</div>
								<table>
									<thead>
										<tr>
											<td>상품금액/<span id="productKinds"></span>종(<span id="productAmount"></span>개)</td>
											<td>배송비</td>
											<td>결제 예정금액</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="result_info_price">
												<h1><span id="priceTotal"></span></h1><h3>원</h3>
											</td>
											<td id="result_info_ship">
												<div id="result_info_ship_wrap">
													<div id="result_info_plus">+</div>
													<h1><span id="ship_price"></span></h1>
													<div id="result_info_equal">=</div><h3>원</h3>
												</div>
											</td> <!-- 가격따른 차등 --> 
											<td id="result_info_total">	
												<h1><span id="final_total"></span></h1><h3>원</h3>
											</td>
										</tr>
									</tbody>
								</table>		
							</div>
						</form>
						<div class="btn_section">
							<button id="buyBtn" class="btn buy_btn">결제하기</button>
						</div>
					</div> <!-- nav_main_1_result -->
					<div class="clearfix"></div>
				</div> <!-- content_container -->
			</div> <!-- content_area -->
			
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
	
	/* 체크 변경시 체크한 것만 종합하기 */
	$("input[type='checkbox']").change(function(){
		//체크박수 갯수
		var totalCount = $('.chkBox').length;
		//가격 총합
		var priceTotal = 0;
		//상품 종류 수
		var productKinds = 0;
		//상품 총 갯수
		var productAmount = 0;	
		//배송비
		var shipprice = 0;
		//총가격(제품 + 배송비)
		var total = 0;
		//cartlist번호 값을 가진 input생성
		var str = "";
		
		for(var i = 0; i < totalCount; i++){
			if($("#chkBox"+i).is(":checked")){
				//alert("aaaaaa="+$("#priceTotal"+i).val());
				var cartId = $('#cartId'+i).val();
				
				priceTotal = parseInt(priceTotal) + parseInt($("#priceTotal"+i).val());
				productKinds = productKinds + 1;
				productAmount = parseInt(productAmount) + parseInt($("#productAmount"+i).val());
				
				str += "<input type='hidden' id='hidden_cartId' name='cartId' value='"+cartId+"'>";
			}
		}
		$("#priceTotal").html(priceTotal.toLocaleString());
		$("#productKinds").html(productKinds);
		$("#productAmount").html(productAmount);
		if(priceTotal>=10000){
			shipprice = 0;
			$("#ship_price").html(0);
		} else if(priceTotal == null || priceTotal == 0){
			shipprice = 0;
			$("#ship_price").html(0);
		} else{
			shipprice = 2000;
			$("#ship_price").html("2,000");	
		}
		total = priceTotal + shipprice;
		$("#final_total").html(total.toLocaleString());
		$("#nav_main_1_result_info_hidden").html(str);
	});
	
	//모두체크
	$("#allCheck").click(function(){
		var check = $('#allCheck').prop("checked");
		if(check){
			//alert($('.chkBox').length);
			$(".chkBox").prop("checked", true);
		} else{
			//alert($('.chkBox').length);
			$(".chkBox").prop("checked", false);
		}
	});
	
	//선택 삭제
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("전체 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			$("input[class='chkBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartId"));
			});//종료 input선택자
			
			$.ajax({
				url : "deleteCart",
				type : "post",
				data : {chkbox : checkArr},
				success : function(result){
					if(result == 1){
						location.href = "cart";	
					} else{
						alert(result);
						alert("삭제 실패")
					}
				}
			});
			
		}//종료 if
	});//종료 click 
	
	/* 결제하기 버튼 */
	$("#buyBtn").click(function buy_btn(){
		//alert("클릭");
		if($('#hidden_cartId').val() != null){
			$("#buy_form").attr("action","/purchase/preBuy");
			$("#buy_form").submit();
		} else{
			alert("구매할 상품을 선택해주세요.");
		}
	});
	
	</script>
	
</body>
</html>