<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ParkIT</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
<link rel="stylesheet" href="css/park.css">
<link rel="stylesheet" href="css/noticeContent.css">


</head>
<body>

<jsp:include page="../inc/top.jsp"/>



<!-- 	<section class=king> -->
	<section class="ftco-section contact-section">
		
		
		<script>
			function noticeConfirm(noticeNo) {
				var msg = "정말 삭제하시겠습니까?";
				var result = confirm(msg);
				if (result) { // "예"를 선택한 경우
					return true;
				}
				else { // "아니오"를 선택한 경우
					return false;
				}
			}
		</script>


		
<!-- 		</head> -->
<!-- 		<body> -->

	
		
	
		<table border="1">
		
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.noticeTitle}</td>
		</tr>
		<tr>
			<th class="rc">조회수</th>
			<td>${dto.noticeRc}</td>
		</tr>
		
		<tr>
			<th >작성일</th>
			<td colspan="3">${dto.noticeDate}</td>
		</tr>
		
		
		<tr>
			<th>첨부파일</th>
			<td colspan="3">${dto.noticeFile}</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td colspan="3" height="300px">${dto.noticeContents} 
			<c:if test="${dto.noticeFile != null}">
			<img src="./upload/${dto.noticeFile }">
			</c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="4" style="text-align:center">
																					<!-- flex가 있어야 사용가능 -->
		<div style="display: flex; justify-content: center;"> <!-- flex - 가로정렬기능, justify-content - 가로정렬에서 어떤식으로 정렬할것인지 -->
		<form action="./noticeUpdateForm.no" method="post">
			<c:if test="${ id eq 'admin' }">
			<input type="submit" value="글수정">
			</c:if>
			<input type="hidden" name="noticeNo" value="${dto.noticeNo}">
			<input type="hidden" name="noticeTitle" value="${dto.noticeTitle}">
			<input type="hidden" name="noticeFile" value="${dto.noticeFile}">
			<input type="hidden" name="noticeContents" value="${dto.noticeContents}">
		</form>
			
		<form action="./noticeDeleteAction.no" method="post" onsubmit="return noticeConfirm()">
			<c:if test="${ id eq 'admin' }">
			<input type="submit" value="글삭제">
			</c:if>
			<input type="hidden" name="noticeNo" value="${dto.noticeNo}">
		</form>
			<input type="button" value="목록으로" onclick="location.href='./noticeList.no?pageNum=${pageNum}'" id="list1">
		</div>
		
		</td>
		</tr>
		</table>
		
		
		<div>
			<div>
				<c:if test="${!empty dtoPre.noticeNo }">
				<div class="previous-post">
				[ 이전글 ] <a href="./noticeContent.no?noticeNo=${dtoPre.noticeNo}&amp;pageNum=${pageNum}" style="color: gray">${dtoPre.noticeTitle}</a>
				</div>
				</c:if>
			</div>
			<div>
				<c:if test="${maxNoticeCount >= dtoNext.noticeNo }">
				<div class="previous-next">
				[ 다음글 ] <a href="./noticeContent.no?noticeNo=${dtoNext.noticeNo}&amp;pageNum=${pageNum}" style="color: gray">${dtoNext.noticeTitle}</a>
				</div>
				</c:if>
			</div>
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