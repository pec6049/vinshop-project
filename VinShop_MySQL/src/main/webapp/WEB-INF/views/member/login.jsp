<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/member/login.css">
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
		
		<!-- 로그인 영역 -->
		<div class="content_area">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>LOGIN</span>
				</div>
				<div class="login_wrap"> 
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="memberId" placeholder="ID">
						</div>
						<span class="final_id_ck">아이디를 입력해주세요.</span>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_input" name="memberPw" placeholder="PASSWORD">
						</div>
						<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					</div>
					<c:if test = "${result == 0 }">
		               <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
		           	</c:if>
					<div class="login_button_wrap">
						<input type="button" class="login_button" value="LOGIN">
					</div>			
				</div>
			</form>
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

    var idCheck = false;            //아이디
	var pwCheck = false;            //비밀번호
	
	$(document).ready(function(){
		
		//회원가입 버튼(회원가입 기능 작동)
		$(".login_button").click(function(){
			
			/* 입력값 변수 */
	        var id = $('.id_input').val();                // id 입력란
	        var pw = $('.pw_input').val();                // 비밀번호 입력란
	        
	        /* 아이디 유효성검사 */
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            idCheck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            idCheck = true;
	        }
	        /* 비밀번호 유효성 검사 */
	        if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	        
	        /* 최종 유효성 검사 */
	        if(idCheck&&pwCheck){
	        	//모두 true일 경우 실행
	        	$("#login_form").attr("action", "/member/login.do");
	    		$("#login_form").submit();
	        }
	        return false; //한 개라도 false가 있을 경우
		});
		
	});
	
</script>

</body>
</html>