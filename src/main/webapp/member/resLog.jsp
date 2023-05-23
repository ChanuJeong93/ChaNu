<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ParkIT</title>
<meta charset="UTF-8">
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

<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/resLog.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/park.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/mem_resLog.css">
</head>
<style>
.bg-light {
    background-color: #fff !important;
}
</style>
<body>

	<jsp:include page="../inc/mem_top.jsp"/>
	
	<div class="res1">
	
	<c:if test="${empty resList }">
		<p class="empty_p">현재 예약 내역이 없습니다.</p>
	</c:if>
	
<c:if test="${not empty resList}">
	<section class="ftco-section ftco-no-pt bg-light">
	<p class="res_p">예약 내역</p>
	<table border="1" class="rwd-table">
		<tr>
			<th> 예약번호 </th>
			<th> 지점 </th>
			<th> 자리번호 </th>
			<th> 날짜 </th>
			<th> 입차시간 </th>
			<th> 출차시간 </th>
			<th> 결제금액 </th>
			<th> 예약상태 </th>
		</tr>
		
		<c:forEach var="dto" items="${resList }">
			<tr>
				<td> ${dto.resNo } </td>
				
				
				<td>
					<c:choose>
						<c:when test="${dto.parkingCode.equals('A') }">
							서면점
						</c:when>
						<c:when test="${dto.parkingCode.equals('B') }">
							해운대점
						</c:when>
						<c:when test="${dto.parkingCode.equals('C') }">
							명지점
						</c:when>
					</c:choose>
				</td>
				
				
				<td> ${dto.parkingPosition } </td>
				<td> ${dto.resDate } </td>
				<td> ${dto.parkInTime } </td>
				<td> ${dto.parkOutTime } </td>
				<td> ${dto.price } </td>
				<c:choose>
					<c:when test="${dto.resStatus==1 }">
						<td> 예약완료 </td>
					</c:when>
					<c:when test="${dto.resStatus==0 }">
						<td> 예약취소 </td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
		
	</table>
	</c:if>
	</section>
	
	</div>
	
	
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
	
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 	<script src="js/bootstrap-datepicker.js"></script> -->
<!-- timepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!--   	<script src="js/jquery.timepicker.min.js"></script>  -->

	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	
	
	
</body>
</html>