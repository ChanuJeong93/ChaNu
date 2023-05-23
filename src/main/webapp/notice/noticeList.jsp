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
<link rel="stylesheet" href="css/park.css">
<link rel="stylesheet" href="css/notice.css">


</head>
<body>

<jsp:include page="../inc/top.jsp"/>




	



	<div id=noticeMain> 
<!-- 	공지사항 -->
	</div>
		<div class="container">
			<div class="row d-flex mb-5 contact-info">
				<div class="col-md-4">
					<div class="row mb-5">
						
						</div>
					</div>
				</div>
				
			

			</div>
		
		
				
<div id="noticecontents">
    <table class="list">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="notice" items="${noticeList}">
            <tr>
                <td>${notice.noticeNo}</td>
                <td>
                    <a href="./noticeContent.no?noticeNo=${notice.noticeNo}&amp;pageNum=${pageNum}">
                        ${notice.noticeTitle}
                    </a>
                </td>
                <td>${notice.noticeDate}</td>
                <td>${notice.noticeRc}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="search-form">
        <form action="./noticeList.no" method="get">
            <input type="text" name="keyWord" placeholder="검색어를 입력하세요" id="searchkey">
            <input type="submit" value="검색">
            <c:if test="${ id eq 'admin' }">
            <input type="button" value="글쓰기" onclick="location.href='./noticeWriteForm.no'" id="write">
            </c:if>
        </form>
    </div>
</div>
			
		
			
			<div id="searchFormWrapper">
			<form action="./noticeList.no" method="get">
			</form>
			</div>
			
				<section class="sec01">
	 <div id="pageBlock">
	
		<c:if test="${startPage > pageBlock}">
			<a href="./noticeList.no?pageNum=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="./noticeList.no?pageNum=${i}">[${i}]</a>
			</c:forEach>
		
		<c:if test="${endPage < pageCount}">
			<a href="./noticeList.no?pageNum=${startPage+pageBlock}">[다음]</a>
		</c:if>
		
		
		
		
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