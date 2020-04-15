<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
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
    
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function zipSearch(){
		new daum.Postcode({
            oncomplete: function(data) {
            	var roadAddr = data.roadAddress; // 도로명 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zip").value = data.zonecode;
                document.getElementById("address").value = roadAddr;
            }
        }).open();
	}
</script>
</head>
<body>
<table>
<form:form commandName="program" action="${pageContext.request.contextPath}/registerProgram.do">
 <input type = "hidden" id = "organization_id" name = "organization_id" value = "<%=session.getAttribute("organization_id")%>"/>
<tr><td>프로그램명 : </td><td><form:input path="program_subject"/></td></tr>
<tr><td>분류 : </td><td><form:select path="type_id">
<form:options items = "${typeList }" itemLabel="type" itemValue="type_id"/>
</form:select></td></tr>
<tr><td>모집시작일  : </td><td><input type = "date" id = "start_date" name = "start_date"></td></tr>
<tr><td>모집종료일 : </td><td><input type = "date" id = "end_date" name = "end_date" ></td></tr>
<tr><td>목표금액 : </td><td><form:input path="target_amount"/></td></tr>
<tr><td>모집목적 : </td><td><form:input path="purpose"/></td></tr>
<tr><td>모집내용(요약) : </td><td><form:input path="summary"/></td></tr>
<tr><td>모집내용(상세) : </td><td><form:textarea path="content"/></td></tr>
<tr><td>단체URL : </td><td><form:input path="organization_url"/></td></tr>
<tr><td>은행명 : </td><td><form:input path="bank_name"/></td></tr>
<tr><td>계좌번호 : </td><td><form:input path="account"/></td></tr>
<tr><td>사업자등록번호 : </td><td><form:input path="corporate_registration_number"/></td></tr>
<!-- form안에 버튼은 type을 지정해주지 않으면 default submit으로 움직인다. type을 지정해줄것! -->
<tr><td>우편번호 : </td><td><form:input path="zip"/> <form:button type = "button" onclick = "zipSearch();">우편번호검색</form:button> </td></tr>
<tr><td>주소 : </td><td><form:input path="address" readonly="true" /> </td></tr>
<tr><td>상세주소 : </td><td><form:input path="address_detail"/></td></tr>
<tr><td>연락처 : </td><td><form:input path="phone_number"/></td></tr>
<tr><td>대표자명 : </td><td><form:input path="representative"/></td></tr>
<tr><td><input type = "submit" value = "전송">
<form:button type = "button" onclick = "window.location='${pageContext.request.contextPath}/requestList.do'">목록으로</form:button>
</td></tr></form:form>
</table>



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
  <script src="<c:url value="/resources/js/logoutcheck.js"/>"></script>
    

</body>
</html>