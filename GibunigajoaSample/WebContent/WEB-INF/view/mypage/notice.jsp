<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<%@ page isELIgnored="false"%>


<head>
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

<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>마이페이지</title>

</head>
<body id="page-top">
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	</nav>
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<div class="container-fluid">
			<!-- 페이지 머리 -->
			<h1 class="h3 mb-2 text-gray-800">공지사항</h1>

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h4 class="m-0 font-weight-bold text-primary">공지사항 페이지 입니다.</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="font-size: 20px">제목</th>
									<th style="font-size: 20px">작성자</th>
									<th style="font-size: 20px">내용</th>
									<th style="font-size: 20px">작성일자</th>
									<th style="font-size: 20px">조회수</th>

								</tr>
							</thead>

							<tbody>

								<c:forEach var="dto" items="${list}">
									<tr>
										<td style="font-size: 15px"><p id="content"
												title="${list.notice_idx}">${list.subject}</p></td>
										<td style="font-size: 15px"><p id="content"
												title="${list.notice_idx}">admin</p></td>
										<td style="font-size: 15px"><p id="content"
												title="${list.notice_idx}">${list.content}</p></td>
										<td style="font-size: 15px"><p id=title="${dto.notice_idx}">
												<fmt:formatDate value="${dto.register_date}"
													pattern="yyyy년 MM월 dd일" /></td>
										<td style="font-size: 15px"><p id="content"
												title="${list.notice_idx}">${list.readcount}</p></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->

	<!-- Q&A  추가 폼 -->
	<div id="modal" class="searchModal">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<!--  <div class="col-md-7"> -->
						<div class="contact-wrap w-100 p-md-5 p-4">
							<h3 class="mb-4" style="font-size: 40px">Q&A작성</h3>
							<div id="form-message-warning" class="mb-4"></div>
							<div id="form-message-success" class="mb-4"
								style="font-size: 20px">Q&A를 작성해 주세요.</div>
							<form method="POST" action="qANDaInsert.do" name="form"
								onsubmit="return checkAll()">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="label" style="font-size: 20px">제목</label> <input
												type="text" class="form-control" name="subject"
												placeholder="제목">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label class="label" style="font-size: 20px">문의내용</label>
											<textarea name="content" class="form-control" cols="50"
												rows="10" placeholder="문의할 내용을 작성해 주세요."></textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="button" onclick="closeModal()"
												style="float: right; height: 50px; width: 240px; font-size: 20px;"
												value="취소" class="btn btn-primary" /> <input type="submit"
												style="float: right; margin-right: 1%; height: 50px; width: 240px; font-size: 20px;"
												value="보내기" class="btn btn-primary" />
										</div>
									</div>
								</div>
								<input type="hidden" name="user_idx" value="${user_idx}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Q&A 추가 종료 -->

	<!-- Q&A 상세 내역-->
	<div id="contentmodal" class="searchModal">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<!--  <div class="col-md-7"> -->
						<div class="contact-wrap w-100 p-md-5 p-4">
							<h3 class="mb-4" style="font-size: 40px">Q&A</h3>
							<div id="form-message-warning" class="mb-4"></div>
							<div id="form-message-success" class="mb-4"
								style="font-size: 20px">Q&A상세내용</div>
							<hr width="1000px" color="black" noshade />

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" style="font-size: 20px" id="status_id">상태
										</label>

									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" style="font-size: 20px"
											id="register_date">작성일</label>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" style="font-size: 20px" id="subject">제목</label>

									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" style="font-size: 20px" id="QandAcontent">문의내용</label>

									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="label" style="font-size: 20px" id="answer">답변내용</label>

									</div>
								</div>


								<div class="col-md-12">
									<div class="form-group">
										<input type="button" onclick="closeModal()"
											style="float: right; height: 50px; width: 240px; font-size: 20px;"
											value="취소" class="btn btn-primary" />
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기부 내역 상세내역 종료 -->
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

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/check2.js?v=1"></script>
	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>
