<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@ page isELIgnored="false" %>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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

<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


<script>
	$(function() {
		/* 기부내역 추가 누를 시 입력 창 */
		$("#testBtn").on('click', function() {
			$("#modal").show();
		});

		/* 기부 이력 상세 글 보기 */
		$("p").click(
				function() {

					var param = "num=" + $(this).attr("title");

					var url = "ContributionContent.do";
					$.ajax({
						type : "post",
						url : url,
						data : param,
						dataType : "json"
					}).done(
							function(args) {

								var organization_name = args.organization_name;
								var program_name = args.program_name;
								var date = args.date;
								var contribution = args.contribution;
								var subscription_type = args.subscription_type;
								var note = args.note;
								var date1 = new Date(date);
								var text_date = date1.getFullYear() + "년  "
										+ (date1.getMonth() + 1) + "월 "
										+ date1.getDate() + "일";

								$("#organization_name").append(
										"<div class='a'>" + organization_name
												+ "</div>");
								$("#program_name").append(
										"<div class='a' >" + program_name
												+ "</div>");
								$("#date").append(
										"<div class='a'>" + text_date
												+ "</div>");
								$("#contribution").append(
										"<div class='a'>" + contribution + "원"
												+ "</div>");
								$("#subscription_type").append(
										"<div class='a'>" + subscription_type
												+ "</div>");
								$("#note").append(
										"<div class='a'>" + note + "</div>");

							});
					$("#contentmodal").show();
					return false;
				});

		/* 수정을 누를 경우 수정 창 띄우기 */
		$(".update")
				.click(
						function() {
							var param = "num2=" + $(this).attr("title");
							var url = "ContributionUpdate.do";
							$
									.ajax({
										type : "post",
										url : url,
										data : param,
										dataType : "json"
									})
									.done(
											function(args) {
                                                var contribution_history_idx=args.contribution_history_idx;
												var organization_name = args.organization_name;
												var program_name = args.program_name;
												var date = args.date;
												var contribution = args.contribution;
												var subscription_type = args.subscription_type;
												var note = args.note;
												var date1 = new Date(date);
												var month1 = date1.getMonth() + 1 < 10? '0'+(date1.getMonth() + 1) : date1.getMonth() + 1;
												var date2 = date1.getDate() < 10? '0'+date1.getDate(): date1.getDate();
												 var text_date = date1.getFullYear()
														+ "-"
														+ month1
														+ "-"
														+ date2;

												//var text_date = "2020-04-01";
												$("#organization_name2")
														.append(
																"<br class='a'><input type='text' name='organization_name' class='a' value='"+organization_name+"'>");
												$("#program_name2")
														.append(
																"<br class='a'><input type='text' name='program_name' class='a' value='"+program_name+"'>");
												$("#date2")
														.append(
																"<br class='a'><input type='date' name='date' class='a' value='"+text_date+"'>");
												$("#contribution2")
														.append(
																"<br class='a'><input type='text' name='contribution' class='a' value='"+contribution+"'>");
												$("#note2")
														.append(
																"<br class='a'><textarea cols='50' rows='3' name='note' class='a' style='resize: none;'>"
																		+ note
																		+ "</textarea>");
												$("#hidden")
												.append(
														"<input type='hidden' name='contribution_history_idx' value='"+contribution_history_idx+"' />");
											});
							$("#updatemodal").show();
							return false;
						});
	});

	function deletelist(a){
      if(confirm("삭제하시겠습니까?")){
            location.href="delete.do?contribution_history_idx="+a;

          }else{
            close();
              }
		}

	function closeModal() {
		$('.searchModal').hide();
		$('.searchModal2').hide();
		$('.a').remove();
	};
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

/* 기부추가 버튼 꾸미기 */
#testBtn {
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: #4e73df;
	color: white;
	padding: 5px;
}

#testBtn:hover {
	color: white;
	background-color: skyblue;
}

.a {
	color: black;
	border-top-left-radius: 7px;
	border-bottom-left-radius: 7px;
	border-top-right-radius: 7px;
	border-bottom-right-radius: 7px;
}
</style>

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
	<!-- 리스트 시작 -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div id="content">

			<div class="container-fluid">
				<!-- 페이지 머리 -->
				<h1 class="h3 mb-2 text-gray-800">기부목록관리 페이지</h1>

				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h4 class="m-0 font-weight-bold text-primary">기부내역조회</h4>
						<a style="position: absolute; right: 20px; top: 10px;">
							<button id="testBtn" style="font-size: 20px;">기부내역 추가</button>
						</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th style="font-size: 20px">기관명</th>
										<th style="font-size: 20px">프로그램명</th>
										<th style="font-size: 20px">기부금액</th>
										<th style="font-size: 20px">날짜</th>
										<th style="font-size: 20px">구분</th>
										<th style="font-size: 20px"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list}">
										<tr>
											<td style="font-size: 15px">${list.organization_name}</td>
											<td style="font-size: 15px"><p id="content"
													title="${list.contribution_history_idx}">
													${list.program_name}</p></td>
											<td style="font-size: 15px">${list.contribution}원</td>
											<td style="font-size: 15px"><fmt:formatDate
													value="${list.date}" pattern="yyyy년 MM월 dd일" /></td>
											<td style="font-size: 15px">${list.subscription_type}</td>
											<td align="center" style="font-size: 15px"><a href="#"
												title="${list.contribution_history_idx}" class="update"
												style="color: blue">수정 / </a> <a href="#"
												onclick="deletelist(${list.contribution_history_idx})"
												style="color: blue">삭제</a>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End of Main Content -->

		<!-- 기부 내역 추가 폼 -->
		<div id="modal" class="searchModal">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4" style="font-size: 40px">기부 내역 추가</h3>
								<div id="form-message-warning" class="mb-4"></div>
								<div id="form-message-success" class="mb-4"
									style="font-size: 20px">기부내역을 추가해 주세요.</div>
								<form method="POST" action="insert.do" name="form"
									onsubmit="return checkAll()">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎기관명</label> <input
													type="text" class="form-control" name="organization_name"
													placeholder="기관명">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎프로그램명</label>
												<input type="text" class="form-control" name="program_name"
													placeholder="프로그램명">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎기부 금액</label>
												<input type="text" class="form-control" name="contribution"
													placeholder="기부금액">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎날짜</label> <input
													type="Date" class="form-control" name="date"
													placeholder="날짜">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎구분</label> <select
													name="subscription_type"
													style="width: 200px; height: 50px; font-size: 20px">
													<option value="정기" style="font-size: 20px">정기</option>
													<option value="비정기" style="font-size: 20px">비정기</option>
												</select>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px">◎비고</label>
												<textarea name="note" class="form-control" id="message"
													cols="30" rows="4" placeholder="메모할 내용을 적으세요." style="resize: none;"></textarea>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<input type="button" onclick="closeModal()"
													style="height: 50px; width: 240px; font-size: 20px;"
													value="취소" class="btn btn-primary" /> <input type="submit"
													style="height: 50px; width: 240px; font-size: 20px;"
													value="추가" class="btn btn-primary" />
											</div>
										</div>
									</div>
									<input type="hidden" name="register_type_flg" value="1">
									<input type="hidden" name="user_idx" value="${user_idx}">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부 내역 추가 종료 -->

		<!-- 기부 내역 상세 내역-->
		<div id="contentmodal" class="searchModal">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<!--  <div class="col-md-7"> -->
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h1 class="mb-4" style="font-size: 40px">기부 내역</h1>
								<div id="form-message-success" class="mb-4"
									style="font-size: 20px">기부내역 상세보기</div>
								<hr width="1000px" color="black" noshade />
								<form method="POST" action="ContributionContent.do">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="organization_name">◎기관명 </label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="program_name">◎프로그램명</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="contribution">◎기부 금액</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px" id="date">◎날짜</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="subscription_type">◎구분(정기/비정기)</label>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px" id="note">◎메모</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<input type="button" onclick="closeModal()" id="cancel"
													style="height: 50px; width: 240px; font-size: 20px;"
													value="취소" class="btn btn-primary" />
											</div>
										</div>
									</div>
									<input type="hidden" name="register_type_flg" value="1">
									<input type="hidden" name="user_idx" value="1">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부 내역 상세내역 종료 -->

		<!-- 기부내역 수정 시작 -->
		<div id="updatemodal" class="searchModal">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4" style="font-size: 40px">기부 내역 수정</h3>
								<div id="form-message-warning" class="mb-4"></div>
								<div id="form-message-success" class="mb-4"
									style="font-size: 20px">기부내역을 수정해 주세요.</div>
								<form method="POST" action="update.do" name="form2"
									onsubmit="return checkAll2()">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="organization_name2">◎기관명 </label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="program_name2">◎프로그램명</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="contribution2">◎기부 금액</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px" id="date2">◎날짜</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px"
													id="subscription_type2">◎구분</label> <select
													name="subscription_type"
													style="width: 200px; height: 50px; font-size: 20px">
													<option value="정기" style="font-size: 20px">정기</option>
													<option value="비정기" style="font-size: 20px">비정기</option>
												</select>
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" style="font-size: 20px" id="note2">◎메모</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<input type="button" onclick="closeModal()" id="cancel"
													style="height: 50px; width: 240px; font-size: 20px;"
													value="취소" class="btn btn-primary" /> <input type="submit"
													id="hidden"
													style="height: 50px; width: 240px; font-size: 20px;"
													value="수정" class="btn btn-primary" />
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기부내역 수정 끝 -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<!-- 	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a> -->


<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

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
  <script src="<c:url value="/resources/js/logoutcheck.js?v=1"/>"></script>



	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/check.js?v=1"></script>
		<script
		src="${pageContext.request.contextPath}/resources/vendor/datatables/check3.js?v=1"></script>
	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>

</body>

</html>
