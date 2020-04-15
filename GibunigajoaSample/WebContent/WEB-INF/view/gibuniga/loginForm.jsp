<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   
    <!--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--> 
   <meta http-equiv="X-UA-Compatible" content="IE=edge" /><meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, shrink-to-fit=no" />
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
    <link href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/ionicons.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.2.3.min.js" type="application/javascript"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script type="text/javascript">
var oPay = Naver.Pay.create({
    "mode" : "production", // development or production
    "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
});

var elNaverPayBtn = document.getElementById("naverPayBtn");
elNaverPayBtn.addEventListener("click", function() {

oPay.open({
      "merchantUserKey": "가맹점 사용자 식별키",
      "merchantPayKey": "가맹점 주문 번호",
      "productName": "상품명을 입력하세요",
      "totalPayAmount": "1000",
      "taxScopeAmount": "1000",
      "taxExScopeAmount": "0",
      "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
    });
});
function naverPay(){

	
	//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
	BootPay.request({
		price: '1000', //실제 결제되는 가격
		application_id: "59a4d323396fa607cbe75de4",
		name: '아름다운가게', //결제창에서 보여질 이름
		pg: 'payapp', //'payapp'-네이버 일시 
		method: 'npay', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		 items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000, //상품 단가
				cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			}
		], 
		user_info: { //우리 쪽 db에서 작업 
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
		    expire_month: '12', // 정기걸제 시 사용됨, 정기결제가 적용되는 개월 수, 미설정시 12개월
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용

		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		//alert("재고");
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log(data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		alert("정상결제 중");
		
		console.log(data);
	});
}


function kakaoPay(){
	
	//실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
	BootPay.request({
		price: '1000', //실제 결제되는 가격
		application_id: "59a4d323396fa607cbe75de4",
		name: '아름다운가게', //결제창에서 보여질 이름
		pg: 'kakao', //'payapp'-네이버 일시 
		method: 'easy', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
		 items: [
			{
				item_name: '나는 아이템', //상품명
				qty: 1, //수량
				unique: '123', //해당 상품을 구분짓는 primary key
				price: 1000, //상품 단가
				cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
				cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
				cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
			}
		], 
		user_info: { //우리 쪽 db에서 작업 
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
		extra: {
		    expire_month: '12', // 정기걸제 시 사용됨, 정기결제가 적용되는 개월 수, 미설정시 12개월
	        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
	        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용

		}
	}).error(function (data) {
		//결제 진행시 에러가 발생하면 수행됩니다.
		console.log(data);
	}).cancel(function (data) {
		//결제가 취소되면 수행됩니다.
		console.log(data);
	}).ready(function (data) {
		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
		console.log(data);
	}).confirm(function (data) {
		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
		//alert("재고");
		console.log(data);
		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
		if (enable) {
			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
		} else {
			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		}
	}).close(function (data) {
	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
	    console.log(data);
	}).done(function (data) {
		//결제가 정상적으로 완료되면 수행됩니다
		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
		alert("정상결제 중");
		
		console.log(data);
	});
}



</script>
</head>
<body>
	<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters mb-5">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<h3 class="mb-4">LOGIN</h3>
										<div id="form-message-warning" class="mb-4"></div> 
					      		<div id="form-message-success" class="mb-4">
					            	<div class="col-md-12" >
										<label class="label" for="user_id">ID</label>
											<div class="form-group">
												<input type="text" class="form-control" name="user_id" id="user_id" placeholder="ID를 입력해주세요" style="width: 100%;">
											</div>
									</div>
					      		</div>
					      		<div class="col-md-12"> 
									<label class="label" for="password">password</label>
										<div class="form-group">
											<input type="password" class="form-control" name="password" id="password" placeholder="password를 입력해주세요" style="width: 100%; display: inline-block;">
										</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="button" value="로그인" class="btn btn-primary" onclick="loginCheck()"/>
										<input type="button" value="취소" class="btn btn-primary" onclick="location.href='main.do'"/>
										<div class="submitting"></div>
									</div>
								</div>
								<!-- 카카오로그인 버튼 -->
								<div class="col-md-12">
								<div class="form-group" style="display: inline-block;">
									<a id="kakao-login-btn"></a>
									<%-- <div onclick="kakaoLogOut();"><span id="kakaoThumbnailImg"></span></div>
									<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a> --%>
									
									<!-- 네이버 로그인 창으로 이동 -->
									<div id="naver_id_login" style="text-align:center; margin-top: 10%;">
									<a href="${url}">
									<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
									</a>
								</div>
								</div>
								</div>
								
								<a id="kakaoPayBtn" onclick="kakaoPay();"> <img alt="카카오페이결제버튼" src="${pageContext.request.contextPath}/resources/images/payment_icon_yellow_medium.png"></a>
								<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼" onclick="naverPay();">
								<%-- <input type="button" id="kakaoPayBtn" value="카카오페이 결제 버튼" onclick="kakaoPay();">  --%> 
							
							</div>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>
    </section>
	
    

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <!--카카오로그인  -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/popper.min.js"/>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
  <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
  <script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="<c:url value="/resources/js/google-map.js"/>"></script>
  <script src="<c:url value="/resources/js/main.js"/>"></script>
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
  <script src="<c:url value="/resources/js/signup.js"/>"></script>
</body>
</html>