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
<link rel="stylesheet" href="css/notice.css">


</head>
<body>

<jsp:include page="../inc/top.jsp"/>




	<section class="ftco-section contact-section">
		
		
		<script type="text/javascript">
			$(document).ready(function(){
				// select 태그에서 선택된 값을 가져오기
				function updateTitle() {
					
				var selectedValue = $("#noticeCategory").val();
				
				if(selectedValue == 'all'){
					$("#title").val('[전체공지]');
				}else if(selectedValue == 'a'){
					$("#title").val('[서면점]');
				}else if(selectedValue == 'b'){
					$("#title").val('[해운대점]');
				}else if(selectedValue == 'c'){
					$("#title").val('[명지점]');
				}
				
			}
				
				// select 태그의 change 이벤트에 updateTitle 함수를 등록
			    $("#noticeCategory").change(function() {
			        updateTitle();
			    });
				
			    // 페이지가 로드될 때 updateTitle 함수를 실행하여 초기 제목 설정
			    updateTitle();
		
		
			});
		</script>
		
			
			
			
			<div id="writecontainer">
  <div>
    <select name="noticeCategory" id="noticeCategory">
      <option value="all">전체공지</option>
      <option value="a">서면점</option>
      <option value="b">해운대점</option>
      <option value="c">명지점</option>
    </select>
  </div>

  <div class="writeform">
    <form action="./noticeWriteAction.no" method="post" enctype="multipart/form-data" name="fr" onsubmit="return validateForm()">
      <div class="form-group">
        <input type="text" name="noticeTitle" id="title">
      </div>

      <div class="form-group">
        <textarea id="writeco" rows="5" cols="10" name="noticeContents" placeholder="내용을 입력하세요."></textarea>
      </div>

      <div class="form-group">
        <input type="file" name="noticeFile">
      </div>

      <div class="form-group">
        <input type="submit" value="등록" id="writesubmit">
        <input type="button" value="목록으로" id="writelist" onclick="location.href='./noticeList.no'">
      </div>
    </form>
  </div>
</div>
			
			<script>
			function validateForm() {
				var title = document.forms["fr"]["noticeTitle"].value;
				if (title == "") {
					alert("제목을 입력하세요.");
					return false;
				}
			}
			
		</script>
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