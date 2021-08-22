<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/board/modify.css">  
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
		                    <a href="/member/login">로그인</a>
		                </li>
		                <li>
		                    <a href="/member/join">회원가입</a>
		                </li>
	                </c:if>
	                <c:if test="${member != null }">
	                	<c:if test="${member.adminCk == 1 }">
	                        <li><a href="/admin/main">관리자 페이지</a></li>
	                    </c:if>                
	                    <li>
	                        <a href="/member/logout.do">로그아웃</a>
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
			
			<!-- 게시글 조회 영역 -->
			<div class="content_area">
				<div class="content_subject">
					<span>CUSTOMER CENTER</span>
				</div>
				<div class="content_wrap">
					<form id="modifyForm" action="/board/modify" method="post">
						<div class="form_section">
							<table>
								<thead>
									<tr>
										<th class="bno_width">게시판 번호</th>
											<td><input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' ></td>
									</tr>
									<tr>
										<th class="title_width">게시판 제목</th>
											<td><input name="title" value='<c:out value="${pageInfo.title}"/>' ></td>
									</tr>
									<tr>
										<th class="content_width">게시판 내용</th>
											<td><textarea rows="3" name="content"><c:out value="${pageInfo.content}"/></textarea></td>
									</tr>
									<tr>
										<th class="writer_width">게시판 작성자</th>
											<td><input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' ></td>
									</tr>
									<tr>
										<th class="regdater_width">게시판 등록일</th>
											<td><input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' ></td>
									</tr>
									<tr>
										<th class="updateDate_width">게시판 수정일</th>
											<td><input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' ></td>
									</tr>
								</thead>
							</table>
						</div>
					</form>
					
					<div class="btn_wrap">
						<button id="listBtn" class="btn" >목록 페이지</button> 
						<button id="modifyBtn" class="btn" >수정 완료</button>
						<button id="deleteBtn" class="btn" >삭제</button>
						<button id="cancelBtn" class="btn" >취소</button>
					</div>	
			
					<form id="infoForm" action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
						<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
						<input type="hidden" name="type" value="${cri.type}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
					</form>
				</div>	
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
		</div> <!-- class="wrap" -->
	</div> <!-- class="wrapper" -->	
	
	<script>

	let form = $("#infoForm");       // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#listBtn").on("click", function(e){
	    form.find("#bno").remove();
	    form.attr("action", "/board/list");
	    form.submit();
	});
	
	/* 수정 완료 버튼 */
	$("#modifyBtn").on("click", function(e){
	    mForm.submit();
	});
	
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
	    form.attr("action", "/board/get");
	    form.submit();
	});
	
	/* 삭제 버튼 */
    $("#deleteBtn").on("click", function(e){
        form.attr("action", "/board/delete");
        form.attr("method", "post");
        form.submit();
    });
	
	</script>
		
</body>
</html>