# 웹쇼핑몰 프로젝트 :: VinShop
## 구동 영상 URL
https://youtu.be/XVxetedaOp8

## 개발 환경
* Eclipse
* Tomcat 8.5
* Maven

## 사용 기술
### 백엔드
#### JSP
#### Spring
#### Database
* MySQL
![erd](https://user-images.githubusercontent.com/78144748/130341652-04ca3b61-8110-418d-838c-9ff98a10e464.png)

### 프론트엔드
* CSS
* JQuery
* JavaScript

## VinShop
![main](https://user-images.githubusercontent.com/78144748/130340143-257ef368-c32d-47d7-a2f4-973b2d2c4917.png)

## 주요기능
### 메인화면(top)
* 로그인, 회원가입, 질문을 할 수 있는 고객센터 메뉴가 있습니다.
* 상품은 관리자가 등록한 순(최신순)으로 12개의 상품까지 메인화면에 출력됩니다.
 * 등록된 모든 상품을 볼 수 있는 All 메뉴와 카테고리별로 조회 가능한 Outer, Top 등의 메뉴가 있습니다.

### 메인화면(footer)
![footer](https://user-images.githubusercontent.com/78144748/130358169-c611815d-e9e9-45fe-8c09-e4c56742f831.png)
* 쇼핑몰 정보가 담긴 CONTACT를 볼 수 있습니다.


### 회원가입 & 로그인
![join](https://user-images.githubusercontent.com/78144748/130340725-be774c12-1edb-45bb-8bec-23202906a73a.png)
* 회원가입 시, 비밀번호 인코딩(BCryptPasswordEncoder 적용)과 이메일 인증으로 가입하고 주소찾기는 다음주소 검색으로 연결합니다.
* 로그인 시, BCryptPasswordEncoder로 인코딩 된 비밀번호 일치 여부를 판단하여 로그인합니다.


### 마이룸
![myroom](https://user-images.githubusercontent.com/78144748/130340868-d543a19b-7001-451f-9f12-4c6ed6c33586.png)
* 회원 로그인 시, 마이룸 접속이 가능합니다.
* 비밀번호 수정, 주문/배송 조회, 회원 탈퇴가 가능합니다.
 * 새 비밀번호를 BCryptPasswordEncoder 적용하고 기존 비밀번호 삭제 후 다시 저장합니다.
 * 관리자가 주문 상태 변경을 하면 배송 상태가 변경됩니다.
 * 이메일 인증 후 회원 탈퇴가 가능합니다.
 
 
### 장바구니
![cart](https://user-images.githubusercontent.com/78144748/130341076-64accc4f-5dbd-47fb-8bca-ac421473f9d2.png)
* 장바구니 추가된 상품 리스트를 조회할 수 있습니다.
* 전체선택, 개별/선택 삭제, 수량 변경이 가능합니다.
* 주문을 할 수 있는 주문하기 버튼이 있습니다.
 * 배송비는 3만원 이상 구매 시 무료배송


### 주문하기
![order](https://user-images.githubusercontent.com/78144748/130341171-55543172-98dc-4e85-a2dc-b168a0d161fa.png)
* 주문하는 상품 리스트와 회원정보를 불러옵니다.
* 새로운 배송 주소를 입력할 수 있습니다.
* 회원가입 시 적립된 5000포인트를 사용할 수 있습니다.


### 고객센터
![customercenter](https://user-images.githubusercontent.com/78144748/130341242-8d961d86-544a-4733-b696-249aaa2abd8b.png)
* 질문을 할 수 있는 게시판입니다.
* 등록, 수정, 삭제 기능이 있습니다.
* 글을 검색할 수 있는 검색기능이 있습니다.


### 관리자 페이지
![adminpage](https://user-images.githubusercontent.com/78144748/130341297-6e636d86-7bc1-42c9-87ed-3fb05331edd9.png)
* 관리자 아이디로 로그인해야 합니다.
* 상품 등록, 상품관리(수정, 삭제, 상품검색)가 가능하며 회원목록, 주문목록 조회가 가능합니다.
 * 주문목록에서 주문상태를 변경할 수 있습니다.
 
