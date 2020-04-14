<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page isELIgnored="false" %>
<%@ page session="true" %>

 <!-- 로고 -->
 <input type="hidden" id="user_type" value="${user_type_id}"/>
    <div class="container pt-5">
			<div class="row justify-content-between">
				<div class="col">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do">
					<img src="${pageContext.request.contextPath}/resources/images/logo3_3.png"/></a>
				</div>
				<div class="col d-flex justify-content-end">
					<div class="social-media">
		    		<p class="mb-0 d-flex" style="margin-top: 45%;">
		    		<c:choose>
		    			<c:when test="${empty user_id}">
		    				<a href="javascript:void(0);" class="d-flex align-items-center justify-content-center" style="margin-left: 2%;" id="loginBtn"><span class="fa"><i class="sr-only"></i><img alt="user" src="${pageContext.request.contextPath}/resources/images/login_02.png"></span></a>
		    				<a href="javascript:void(0);" class="d-flex align-items-center justify-content-center" style="margin-left: 20%;" id="myBtn"><span class="fa"><i class="sr-only"></i><img alt="user" src="${pageContext.request.contextPath}/resources/images/user_02.png"></span></a>	
		    				<div>
		    				<a href="javascript:void(0);" id="loginBtn">로그인&nbsp;&nbsp;&nbsp;</a>
		    				<a href="javascript:void(0);" style="color: #0056b3;" id="myBtn">회원가입</a>
		    				</div>	
		    			</c:when>
		    			<c:otherwise>
		    				<div style="margin-top: 15%;">
		    					<span style="color: #ffc107;">${nickname}</span>님 환영합니다.&nbsp;&nbsp;&nbsp;
		    					<a href="javascript:void(0);" onclick="logout(); return false;" style="color: #0056b3;">로그아웃</a>
		    				</div>
		    			</c:otherwise>
		    		</c:choose>
		    		
					</p>
		    		
	       		 </div>
				</div>
			</div>
		</div>
		<!--메뉴 바  -->
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" >
	    
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav" >
	        <ul class="navbar-nav mr-auto">
	        	<li class="nav-item active"><a href="${pageContext.request.contextPath}/response.do" class="nav-link">기부단체</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/programList.do" class="nav-link">모집프로그램</a></li>
	        	<li class="nav-item" id="mypage"><a href="javascript:void(0);" class="nav-link">마이페이지</a>
	        		<ul class="submenu">
	        			<li><a href="${pageContext.request.contextPath}/mypage.do">기부이력목록조회</a></li>
	        			<li><a href="${pageContext.request.contextPath}/qANDa.do">Q&A</a></li>
	        			<li><a href="${pageContext.request.contextPath}/updateUser.do">회원정보수정</a></li>
	        		</ul>
	        	</li>
	        	<li class="nav-item" id="customerpage"><a href="javascript:void(0);" class="nav-link">고객센터</a>
	        		<ul class="submenu">
	        			<li><a href="#">공지사항</a></li>
	        			<li><a href="javascript:void(0);" onclick="programAuthorityCheck(); return false;">프로그램신청</a></li>
	        			<!-- ${pageContext.request.contextPath}/contributionProgram/registerForm.do onclick="programAuthorityCheck();-->
	        		</ul>
	        	</li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	       	<!-- The Modal -->
    <div id="myModal" class="modal_box">
 
      <!-- Modal content -->
      <div class="modal-content_box">
        <div onclick="closeX()"><span class="close_m">&times;</span></div>                                                               
        <input type="button" id="individual" class="btn btn-primary" value="개인회원" onclick="location.href='signupCheck.do?num=1'"/>
        <input type="button" id="group" class="btn btn-primary" value="단체회원" onclick="location.href='signupCheck.do?num=2'"/>
      </div>
     </div>  
 	
 
 
 
