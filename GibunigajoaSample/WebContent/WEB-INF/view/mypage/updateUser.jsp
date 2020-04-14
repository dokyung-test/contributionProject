<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.css"/>">
<link
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/ionicons.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/flaticon.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/icomoon.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">

<script>
	$(function() {
		$("#delete").on('click', function() {
			$("#modal").show();
		});
	});
</script>
<style>
/* modal창의 배경 */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
</style>
</head>
<body>

	<form action="userUpdate.do" method="post">
		<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row no-gutters mb-5" style="background: #e8edf0;">
								<!-- <div class="col-md-7"> -->
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3 class="mb-4">회원정보 수정</h3>
									<div id="form-message-warning" class="mb-4"></div>
									<div class="row">
										<div class="col-md-12">
											<label class="label" for="password">password</label>
											<div class="form-group">
												<input type="password" class="form-control" name="password"
													id="password" placeholder="password"
													style="width: 70%; display: inline-block;">
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="password">passwordCheck</label>
											<div class="form-group">
												<input type="password" class="form-control"
													name="passwordCheck" id="passwordCheck"
													placeholder="passwordCheck"
													onchange="signupPasswordCheck()"
													style="width: 70%; display: inline-block;">
												<div id="passwordChkResult"></div>
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="name">Name</label>
											<div class="form-group">
												<input type="text" value="${list.name}" class="form-control"
													name="name" id="name" placeholder="Name"
													style="width: 70%; margin: auto; display: inline-block;">
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="name">Nickname</label>
											<div class="form-group">
												<input type="text" value="${list.nickname}"
													class="form-control" name="nickname" id="nickname"
													placeholder="nickName"
													style="width: 70%; margin: auto; display: inline-block;"
													value>
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="birthday">birthday</label>
											<div class="form-group">
												<input type="date" value="${list.birthday}"
													class="form-control" name="birthday" id="birthday"
													style="width: 70%; margin: auto; display: inline-block;">
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="phone_number">PhoneNumber</label>
											<div class="form-group">
												<input type="number" value="${list.phone_number}"
													class="form-control" name="phone_number" id="phone_number"
													style="width: 70%; margin: auto; display: inline-block;">
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">



												<input type="button" value="취소" class="btn btn-primary"
													style="float: right; padding-left: 4%; padding-right: 4%;"
													onclick="location.href='mypage.do'" /> <input type="submit"
													value="회원정보 수정" class="btn btn-primary"
													style="float: right; margin-right: 1%" />
												<div class="submitting"></div>
											</div>
										</div>
									</div>
									<input type="hidden" name="user_idx" value="${user_idx}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div id="modal" class="searchModal">
			<div class="container">
				<input type="text">
			</div>
		</div>
	</form>
	<button id="delete" class="btn btn-primary" onclick="deleteUser()">회원
		탈퇴</button>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.animateNumber.min.js"/>"></script>
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<script
		src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/scrollax.min.js"/>"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<c:url value="/resources/js/google-map.js"/>"></script>
	<script src="<c:url value="/resources/js/main.js"/>"></script>
	<script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>
	<script src="<c:url value="/resources/js/signup.js?v=1"/>"></script>
</body>
</html>