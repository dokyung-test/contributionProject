<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!-- -------------------------------------공지사항 상세 페이지------------------------------------------------- -->

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
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"
	defer></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote('disable');
	});
	//목록버튼 누를시 공지사항 리스트 페이지로 이동
	function returnNotice() {
		location.href = "notice.do";
	};
</script>


</head>

<body>
	<!-- 공지사항 상세 시작 -->
	<div class="container">
		<div class="col-md-12">
			<h1 class="mb-4">공지사항 상세</h1>
			<button onclick="returnNotice()" class="btn btn-primary"
				style="position: relative; left: 800px; width: 250px; font-size: 20px;">목록</button>
			<div class="row no-gutters mb-5" style="background: #e8edf0;">
				<div class="contact-wrap w-100 p-md-5 p-4">
					<div id="form-message-warning" class="mb-4"></div>
					<div class="row">
						<div class="form-group" style="width: 900px;">

							<label class="label" style="font-size: 30px; color: black">${list.subject}</label>
							<hr width="900px" color="black" noshade />

							<ul style="width: 100%; position: relative; top: 10px;">
								<li
									style="display: inline; color: black; position: relative; right: 30px;">작성자
									: admin</li>
								<li
									style="display: inline; color: black; position: relative; right: 20px;">조회수
									: ${list.readcount}</li>
								<li
									style="display: inline; color: black; position: relative; left: 400px;">작성일
									: <fmt:formatDate value="${list.register_date}"
										pattern="yyyy년 MM월 dd일" />
								</li>
							</ul>
							<hr width="900px" color="black" noshade />

							<textarea class="form-control" name=subject id="summernote"
								style="margin: auto; display: inline-block;" rows="25"
								readonly="readonly">${list.content}
									</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 상세 끝 -->

	<div id="ftco-loader" class="show fullscreen"></div>

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
</body>
</html>