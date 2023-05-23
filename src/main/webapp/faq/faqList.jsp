<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ParkIT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="shortcut icon" href="./images/favicon.ico">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/faq.css">
<link rel="stylesheet" href="css/park.css">

</head>
<body>

<jsp:include page="../inc/top.jsp"/>





	<section class="ftco-section contact-section">
			
				<div class="faqpage">
					<div class="container">
						<h1 class="title">자주 묻는 질문</h1>

						<c:forEach var="dto" items="${requestScope.faqList }">
							<button class="accordion">${dto.faqTitle }</button>
							<div class="panel">
								<p>${dto.faqContents }</p>
							</div>
							<c:if test="${id eq 'admin'}">
							<div class="delete-button">
								<form action="./FaqUpdate.fa" method="post">
			<input type="hidden" name="faqNo" value="${dto.faqNo }">
			<input type="hidden" name="faqTitle" value="${dto.faqTitle }">
			<input type="hidden" name="faqContents" value="${dto.faqContents }">
			<input type="submit" value="수정하기">
		</form>
								<form action="./FaqDeleteAction.fa" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
			<input type="hidden" name="faqNo" value="${dto.faqNo }">
			<input type="submit" value="삭제하기">
		</form>
							</div>
							</c:if>
						</c:forEach>
						<c:if test="${id eq 'admin'}">
			<form action="./FaqWrite.fa">
  <input type="submit" value="글 작성하기">
</form>

					</c:if>
					</div>

					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script>
						$(document)
								.ready(
										function() {
											$(".accordion")
													.click(
															function() {
																$(this)
																		.toggleClass(
																				"active");
																var panel = $(
																		this)
																		.next();
																if (panel
																		.css("max-height") === "0px") {
																	panel
																			.css(
																					"max-height",
																					panel
																							.prop("scrollHeight")
																							+ "px");
																} else {
																	panel
																			.css(
																					"max-height",
																					"0px");
																}
															});
										});
					</script>
					
				</div>

	</section>

<jsp:include page="../inc/bottom.jsp"/>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>