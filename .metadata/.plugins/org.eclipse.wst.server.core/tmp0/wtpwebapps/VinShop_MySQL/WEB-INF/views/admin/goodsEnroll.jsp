<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VinShop</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
</style>
</head>
</head>
<body>
<%@include file="../includes/admin/header.jsp" %>

<div class="admin_content_wrap">
    <div class="admin_content_subject">
    	<span>상품 등록</span>
    </div>
    <div class="admin_content_main">
    	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 이름</label>
    			</div>
    			<div class="form_section_content">
    				<input name="vinName">
    				<span class="ck_warn vinName_warn">상품 이름을 입력해주세요.</span>
    			</div>
    		</div>             
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 카테고리</label>
    			</div>
    			<div class="form_section_content">
    				<div class="cate_wrap">
						<span>대분류</span>
						<select class="cate1">
							<option selected value="none">선택</option>
						</select>
					</div>
					<div class="cate_wrap">
						<span>중분류</span>
						<select class="cate2" name="cateCode">
							<option selected value="none">선택</option>
						</select>
					</div>
					<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
    			</div>
    		</div>          
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 가격</label>
    			</div>
    			<div class="form_section_content">
    				<input name="vinPrice" value="0">
    				<span class="ck_warn vinPrice_warn">상품 가격을 입력해주세요.</span>
    			</div>
    		</div>               
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 재고</label>
    			</div>
    			<div class="form_section_content">
    				<input name="vinStock" value="0">
    				<span class="ck_warn vinStock_warn">상품 재고를 입력해주세요.</span>
    			</div>
    		</div>          
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 할인율</label>
    			</div>
    			<div class="form_section_content">
    				<input id="discount_interface" maxlength="2" value="0">
					<input name="vinDiscount" type="hidden" value="0">
					<span class="step_val">할인된 가격 : <span class="span_discount"></span></span>
    				<span class="ck_warn vinDiscount_warn">1~99 숫자를 입력해주세요.</span>
    			</div>
    		</div>          		
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 소개</label>
    			</div>
    			<div class="form_section_content">
    				<textarea name="vinInfo" id="vinInfo_textarea"></textarea>
    				<span class="ck_warn vinInfo_warn">상품 소개를 입력해주세요.</span>
    			</div>
    		</div>
    		<div class="form_section">
    			<div class="form_section_title">
    				<label>상품 이미지</label>
    			</div>
    			<div class="form_section_content">
    				<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
    				<div id="uploadResult">
    				
    				</div>
    			</div>
    		</div>
   		</form>
		<div class="btn_section">
			<button id="cancelBtn" class="btn">취 소</button>
 			<button id="enrollBtn" class="btn enroll_btn">등 록</button>
 		</div> 
    </div>  
</div>

<%@include file="../includes/admin/footer.jsp" %>

<script>

	let enrollForm = $("#enrollForm")
	
	/* 취소 버튼 */
	$("#cancelBtn").click(function(){
		
		location.href="/admin/goodsManage"
		
	});

	/* 상품 등록 버튼 */
	$("#enrollBtn").on("click",function(e){
		
		e.preventDefault();
		
		/* 체크 변수 */
		let vinNameCk = false;
		let cateCodeCk = false;
		let priceCk = false;
		let stockCk = false;
		let discountCk = false;
		let infoCk = false;
		
		/* 체크 대상 변수 */
		let vinName = $("input[name='vinName']").val();
		let cateCode = $("select[name='cateCode']").val();
		let vinPrice = $("input[name='vinPrice']").val();
		let vinStock = $("input[name='vinStock']").val();
		let vinDiscount = $("#discount_interface").val();	//사용자가 입력하는 <input>태그를 가리킴
		let vinInfo = $(".bit p").html();
	
		/* 공란 체크 */
		if(vinName){
			$(".vinName_warn").css('display','none');
			vinNameCk = true;
		} else {
			$(".vinName_warn").css('display','block');
			vinNameCk = false;
		}
		
		if(cateCode != 'none'){
			$(".cateCode_warn").css('display','none');
			cateCodeCk = true;
		} else {
			$(".cateCode_warn").css('display','block');
			cateCodeCk = false;
		}	
	
		if(vinPrice != 0){
			$(".vinPrice_warn").css('display','none');
			priceCk = true;
		} else {
			$(".vinPrice_warn").css('display','block');
			priceCk = false;
		}	
		
		if(vinStock != 0){
			$(".vinStock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".vinStock_warn").css('display','block');
			stockCk = false;
		}		
	
		if(!isNaN(vinDiscount)){	//입력값이 문자인지 숫자인지 판단
			$(".vinDiscount_warn").css('display','none');
			discountCk = true;
		} else {
			$(".vinDiscount_warn").css('display','block');
			discountCk = false;
		}	
	
		if(vinInfo != '<br data-cke-filler="true">'){
			$(".vinInfo_warn").css('display','none');
			infoCk = true;
		} else {
			$(".vinInfo_warn").css('display','block');
			infoCk = false;
		}	
	
		if(vinNameCk && cateCodeCk && priceCk && stockCk && discountCk && infoCk){
			//alert('통과');
			enrollForm.submit();
		} else {
			return false;
		}
	
	});

	/* 위지윅 적용 */
	/* 상품 소개 */
	ClassicEditor
		.create(document.querySelector('#vinInfo_textarea'))
		.catch(error=>{
			console.error(error);
	});

	/* 카테고리 */
	let cateList = JSON.parse('${cateList}');
	
	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	
	let cateSelect1 = $(".cate1");		
	let cateSelect2 = $(".cate2");
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}
	
	/* 배열 초기화 */
	makeCateArray(cate1Obj,cate1Array,cateList,1);
	makeCateArray(cate2Obj,cate2Array,cateList,2);
	
	/* 대분류 <option> 태그 */
	for(let i = 0; i < cate1Array.length; i++){
		cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
	}
	
	/* 중분류 <option> 태그 */
	$(cateSelect1).on("change",function(){
		
		let selectVal1 = $(this).find("option:selected").val();	
		
		cateSelect2.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>")
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}
	});
	
	/* 할인율 Input 설정 */
	$("#discount_interface").on("propertychange change keyup paste input", function(){
			
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='vinDiscount']");
			
		let discountRate = userInput.val();					// 사용자가 입력할 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='vinPrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);	
			discountInput.val(sendDiscountRate);
		}	
	});
	
	/* 바로 상품가격을 수정해도 할인된 가격 출력 */
	$("input[name='vinPrice']").on("change", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='vinDiscount']");
		
		let discountRate = userInput.val();					// 사용자가 입력한 할인값
		let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
		let goodsPrice = $("input[name='vinPrice']").val();			// 원가
		let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
		
		if(!isNaN(discountRate)){
			$(".span_discount").html(discountPrice);
		}
	});
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success : function(result) {
				console.log(result);
				showUploadImage(result);
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");	//jpg 또는 png파일만 가능
	let maxSize = 1048576; //1MB
	
	function fileCheck(fileName, fileSize) {
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0) {
			return
		}
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id = 'result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";	
		
   		uploadResult.append(str);
	}
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
		
		deleteFile();
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url : '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result) {
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
</script>  

</body>