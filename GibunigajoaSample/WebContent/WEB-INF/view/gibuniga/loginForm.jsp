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
								<a id="kakao-login-btn"></a>
								<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
								<!--
								<a href="https://kauth.kakao.com/oauth/authorize
								?client_id=11ca364dcf1e525a4923fc643d1a05e2
								&redirect_uri=http://localhost:8081/GibunigajoaSample/kakaologin.do
								&response_type=code">
									<img alt="카카오버튼" src="${pageContext.request.contextPath}/resources/images/kakao_login_btn_medium_narrow.png">
								</a>  -->
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