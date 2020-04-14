<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
</head>

  <body>

   	
    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-6 d-flex">
    			<!-- 프로그램대표사진 -->
    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-end" style="background-image:url(${pageContext.request.contextPath}/resources/images/${requestProgram.banner_file_name});">
    				</div>
    			</div>
    			
    			<!-- 간단요약부분 -->
    			<div class="col-md-6 pl-md-5">
    				<div class="row justify-content-start py-5">
		          <div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
		          	<span class="subheading">모집완료까지 D-??</span>
		            <h2 class="mb-4">${requestProgram.program_subject}</h2>
		            <p>기부단체명 : (rcritrNm)<br>
	            		모집기간 : ${requestProgram.start_date} - ${requestProgram.end_date}<br>
	            		목표금액 : ${requestProgram.target_amount } 원
		            </p>
		            <div class="tabulation-2 mt-4">
									<div class="tab-content bg-light rounded mt-2">
									  <div class="tab-pane container p-0 active">
									  	<p>${requestProgram.summary}</p>
									  </div>
									</div>
									<br>
									<ul class="nav nav-pills nav-fill d-md-flex d-block">
									  <li class="nav-item mb-md-0 mb-2">
									    <a class="nav-link active py-2" data-toggle="tab" href="">기부하기</a>
									  </li>
									  <li class="nav-item px-lg-2 mb-md-0 mb-2">
									    <a class="nav-link py-2" data-toggle="tab" href="${requestProgram.organization_url}">홈페이지에서 참여하기</a>
									  </li>
									 <!--  <li class="nav-item">
									    <a class="nav-link py-2 mb-md-0 mb-2" data-toggle="tab" href="#home3">Our Value</a>
									  </li> -->
									</ul>
									
						</div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>


<!-- 금액 / 퍼센트 -->
    <section class="ftco-counter" id="section-counter" >
    	<div class="container" >
				<div class="row" >
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text-2">
              	<span style = "width : 100px">모집금액</span>
              </div>
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="1523000">0</strong>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text-2">
              	<span style = "width : 200px; padding-left : 100px">목표금액</span>
              </div>
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="${requestProgram.target_amount }">0</strong>
              </div>
              
            </div>
          </div>
           <!-- <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="378">0</strong>
              </div>
              <div class="text-2">
              	<span>Professional <br>Expert</span>
              </div>
            </div>
          </div> -->
          <!--<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 d-flex">
              <div class="text d-flex align-items-center">
                <strong class="number" data-number="1200">0</strong>
              </div>
              <div class="text-2">
              	<span>Machineries <br>Equipments</span>
              </div>
            </div>
          </div> -->
        </div>
    	</div>
    </section>


	<!-- 상세 글 -->
	
	
<!-- 	<section>
	<div class="col-md-6 pl-md-5">
	<div class="row justify-content-start py-5">
	<div class="col-md-12 heading-section ftco-animate pl-md-4 py-md-4">
		<div class="tabulation-2 mt-4">
			<ul class="nav nav-pills nav-fill d-md-flex d-block">
									  <li class="nav-item mb-md-0 mb-2">
									    <a class="nav-link2 active py-2" data-toggle="tab" href="#home1">모집내용</a>
									  </li>
									  <li class="nav-item px-lg-2 mb-md-0 mb-2">
									    <a class="nav-link2 py-2" data-toggle="tab" href="#home2">기관소개</a>
									  </li>

									</ul>
		</div>
		</div>
		</div>
	</div>
	</section> -->


<!-- 모집내용/기관소개섹션 -->
	<section>
	<div class="tabulation-2 mt-4">
	<!-- 탭버튼영역 -->
	<ul class="nav nav-pills nav-fill d-md-flex d-block">
	<li class="nav-item px-lg-2 mb-md-0 mb-2">
	
	<a data-toggle = "tab" class = "nav-link2 active py-2" href = "#programContent">모집내용</a>
	</li>
	<li class="nav-item px-lg-2 mb-md-0 mb-2">
	<a data-toggle = "tab" href = "#organization" class="nav-link2 py-2">기관소개</a>
	</li></ul>
	
	
	
	<!-- 탭내용영역 -->
	<div class="tab-content bg-light rounded mt-2">
	<div class="tab-pane container p-0 active" id="programContent">
  		<h3>모집목적</h3>
  		<br>
  		<p>${requestProgram.purpose}</p>
  		<h3>상세내용</h3>
		<br>
		<p>${requestProgram.content}</p>
	  </div>
	  <div class="tab-pane container p-0 fade" id="organization">
	  	<p>기관소개</p>
	  </div>
	  </div>
	  </div>

	</section><!-- 모집내용/기관소개섹션 -->



	<!-- 사진 -->
    <section class="ftco-section ftco-no-pt ftco-no-pb">
		  <div class="container-fluid px-md-0">
        <div class="row no-gutters">

          <div class="col-md-4 ftco-animate">
          <!-- 화면에 깔리는 img -->
            <div class="work img d-flex align-items-end" style="background-image: url(images/unicef.jpg);">
            	<!-- 클릭시 확대되는 이미지. 위아래 둘다 일치시켜줄 것!-->
            	<a href="images/unicef.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
            	<div class="desc w-100 px-4">
	              <div class="text w-100 mb-3">
	              	<span>Building</span>
	              	<h2><a href="work-single.html">College Health Profession</a></h2>
	              </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="work img d-flex align-items-end" style="background-image: url(images/work-5.jpg);">
            	<a href="images/work-5.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
            	<div class="desc w-100 px-4">
	              <div class="text w-100 mb-3">
	              	<span>Building</span>
	              	<h2><a href="work-single.html">College Health Profession</a></h2>
	              </div>
              </div>
            </div>
          </div>
          <div class="col-md-4 ftco-animate">
            <div class="work img d-flex align-items-end" style="background-image: url(images/work-6.jpg);">
            	<a href="images/work-6.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
            	<div class="desc w-100 px-4">
	              <div class="text w-100 mb-3">
	              	<span>Building</span>
	              	<h2><a href="work-single.html">College Health Profession</a></h2>
	              </div>
              </div>
            </div>
          </div>
        </div>
      </div> 
		</section>

  


    <section class="ftco-section testimony-section bg-primary">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          	<span class="subheading">기부니가좋아 에서 기부해주신 분들</span>
            <h2 class="mb-4">기부후기</h2>
          </div>
        </div>
        
        
        <!-- 댓글영역 -->
        <!-- 등록된 댓글이 없는 경우 & 빈자리에 기부를 기다립니다. 표시 -->
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              
              <!-- 댓글한세트 -->
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_1.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name">Roger Scott1</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              
             
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_3.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name">Roger Scott2</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_1.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name">Roger Scott3</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/person_2.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name">Roger Scott4</p>
		                    <span class="position">Marketing Manager</span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>



<!--     <section class="ftco-section ftco-no-pb ftco-no-pt mb-5">
      <div class="container">
      	<div class="row">
	      	<div class="col-md-12">
	      		<div class="bg-primary w-100 rounded px-md-0 px-4">
			        <div class="row d-flex justify-content-center">
			        	<div class="col-lg-8 py-4">
			        		<div class="row">
					          <div class="col-md-6 d-flex align-items-center">
					            <h2 class="mb-0" style="color:white; font-size: 24px;">Subcribe to our Newsletter</h2>
					          </div>
					          <div class="col-md-6 d-flex align-items-center">
					            <form action="#" class="subscribe-form">
					              <div class="form-group d-flex">
					                <input type="text" class="form-control" placeholder="Enter email address">
					                <input type="submit" value="Subscribe" class="submit px-3">
					              </div>
					            </form>
					          </div>
				          </div>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>
      </div>
    </section> -->

    <footer class="footer">
			<div class="container-fluid px-lg-5">
				<div class="row">
					<div class="col-md-9 py-5">
						<div class="row">
							<div class="col-md-4 mb-md-0 mb-4">
								<h2 class="footer-heading">About us</h2>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
								<ul class="ftco-footer-social p-0">
		              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="ion-logo-twitter"></span></a></li>
		              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="ion-logo-facebook"></span></a></li>
		              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="ion-logo-instagram"></span></a></li>
		            </ul>
							</div>
							<div class="col-md-8">
								<div class="row justify-content-center">
									<div class="col-md-12 col-lg-10">
										<div class="row">
											<div class="col-md-4 mb-md-0 mb-4">
												<h2 class="footer-heading">Services</h2>
												<ul class="list-unstyled">
						              <li><a href="#" class="py-1 d-block">Construction</a></li>
						              <li><a href="#" class="py-1 d-block">House Renovation</a></li>
						              <li><a href="#" class="py-1 d-block">Painting</a></li>
						              <li><a href="#" class="py-1 d-block">Arhictecture Design</a></li>
						            </ul>
											</div>
											<div class="col-md-4 mb-md-0 mb-4">
												<h2 class="footer-heading">About</h2>
												<ul class="list-unstyled">
						              <li><a href="#" class="py-1 d-block">Staff</a></li>
						              <li><a href="#" class="py-1 d-block">Team</a></li>
						              <li><a href="#" class="py-1 d-block">Careers</a></li>
						              <li><a href="#" class="py-1 d-block">Blog</a></li>
						            </ul>
											</div>
											<div class="col-md-4 mb-md-0 mb-4">
												<h2 class="footer-heading">Resources</h2>
												<ul class="list-unstyled">
						              <li><a href="#" class="py-1 d-block">Security</a></li>
						              <li><a href="#" class="py-1 d-block">Global</a></li>
						              <li><a href="#" class="py-1 d-block">Charts</a></li>
						              <li><a href="#" class="py-1 d-block">Privacy</a></li>
						            </ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-md-5">
							<div class="col-md-12">
								<p class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-ios-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
					  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
							</div>
						</div>
					</div>
<!-- 					<div class="col-md-3 py-md-5 py-4 aside-stretch-right pl-lg-5">
						<h2 class="footer-heading">Request A Quote</h2>
						<form action="#" class="contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="3" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
              	<button type="submit" class="form-control submit px-3">Send</button>
              </div>
            </form>
					</div> -->
				</div>
			</div>
		</footer>
    
  
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