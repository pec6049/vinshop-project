<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<link rel="stylesheet" href="../resources/css/admin/orderList.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>

	<%@include file="../includes/admin/header.jsp" %>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>주문 목록</span>
		</div>
		<div class="main_content">
        	<table>
        		<thead>
        			<tr>
        				<td class="th_orderNum">주문번호</td>
        				<td class="th_orderYear">일자</td>
        				<td class="th_orderName">고객명</td>
        				<td class="th_orderInfo">상품정보</td>
        				<td class="th_orderState">상품상태</td>
						<td class="th_orderBtn">비고</td>
        			</tr>
        		</thead>
        		<tbody>
        			<c:set var="vinAmount" value="0" />
        			<c:forEach items="${list}" var="list">
        				<tr>
        					<td id="tb_orderNum" class="tb_orderNum">${list.orderId }</td>
							<td id="tb_orderYear" class="tb_orderYear">${list.orderDate }</td>
							<td id="tb_orderName" class="tb_orderName">
								주문자 아이디 : ${list.memberId}
								<br>
								받는 이 : ${list.orderRec}
							</td>
							<td id="tb_orderInfo" class="tb_orderInfo">
								상품명 :<span id="vinName${i}"></span>
								(<span id="cnt${i}"></span> 종 /<span id="amount${i}"></span>개)
								<br>
								금액 : <fmt:formatNumber value="${list.totalPrice}" pattern="#,###"/>원
								<input type="hidden" id="orderId${i}" value="${list.orderId}">
								
								<script>
								//상품 이름, 종류, 갯수
								(function(){
									var orderId = $('#orderId${i}').val();
									var data = {orderId : orderId}
									
									$.ajax({
										url : "/myRoom/repOrder",
										type : "post",
										data : data,
										dataType:'json',
										success : function(data){
											console.log(data.vinName);
											$('#vinName${i}').html(data.vinName);
											$('#cnt${i}').html(data.cnt);
											$('#amount${i}').html(data.amount);
										}
									});
								})();
								</script>
								
							</td>
							<td id="tb_orderState" class="tb_orderState">${list.state}</td>
							<td id="tb_orderBtn" class="tb_orderBtn">
								<c:if test="${list.state == '배송완료'}"> <!-- 배송완료 -->
									-
								</c:if>
								<c:if test="${list.state == '배송준비'}">
									<button id="ship_1${i}" class="ship_1${i}">배송출발</button>	
								</c:if>
								<c:if test="${list.state == '배송중'}">
									<button id="ship_2${i}" class="ship_2${i}">배송도착</button>
								</c:if>	
								<input type="hidden" id="orderId${i }" value="${list.orderId}">
								
								<script>
								//배송 출발 버튼
								$('#ship_1${i}').on("click", function(){
									var orderId = $('#orderId${i}').val();
									var data = {orderId : orderId}
									$.ajax({
										url : "shipStart",
										type : "post",
										data : data,
										dataType:'json',
										success : function(data){
											location.reload();
										}
									});
								});
								
								//배송도착 버튼
								$('#ship_2${i }').on("click", function(){
									
									var orderId = $('#orderId${i}').val();
									var data = {orderId : orderId}
									$.ajax({
										url : "shipArrive",
										type : "post",
										data : data,
										dataType:'json',
										success : function(data){
											location.reload();
										}
									});
								});
								</script>
							</td>
        				</tr>
        			<c:set var="i" value="${i+1}" />	
        			</c:forEach>
        		</tbody>
        	</table>			
        </div>
		
		<!-- 페이지 이름 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pageMaker">
			
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev }">
					<li class="pageMaker_btn prev">
						<a href="${pageMaker.pageStart -1}">이전</a>
					</li>
				</c:if>
		
				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
						<a href="${num}">${num}</a>
					</li>	
				</c:forEach>
		
				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next">
						<a href="${pageMaker.pageEnd + 1 }">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<form id="moveForm" action="/admin/orderList" method="get" >
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		
	</div>
	
	<%@include file="../includes/admin/footer.jsp" %>

	<script>
	
	let moveForm = $('#moveForm');
	
	/* 페이지 이동 버튼 */
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
	});
	
	</script>
	
</body>
</html>