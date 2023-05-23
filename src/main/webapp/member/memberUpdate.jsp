<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ParkIT</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">	
	
<link rel="stylesheet" href="css/alert.css">
<link rel="stylesheet" href="css/memUpdate.css">
<link rel="stylesheet" href="css/style.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
//------------------------------------------------------------------------------------
//전화번호에 자동으로 하이픈 넣기

	$(function () {
		
		
		$("#tel").on("keyup", function () {
			var telVal = $(this).val();
			telVal = telVal.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 제거
			var telLen = telVal.length;
			if(telLen > 3){
				telVal = telVal.substring(0,3) + "-" + telVal.substring(3);
			}
			if(telLen > 7){
				telVal = telVal.substring(0,8) + "-" +telVal.substring(8);
			}
			$(this).val(telVal);
		});
	
	}); // 하이픈
		
		function checkData() {
			// 아이디가 입력되어있는지 체크
			if(document.fr.pw.value == ""){
				alert("비밀번호를 입력하세요.");
				document.fr.pw.focus();
				return false;
			}
			
		}
	</script>

</head>
<style>
.bg-light {
    background-color: #fff !important;
}
</style>
<body>
	
	<jsp:include page="../inc/mem_top.jsp"/>
	
	<section class="ftco-section ftco-no-pt bg-light">
	<!-- itwill_member 테이블에 저장될 정보를 입력 -->
		<div class="memberUpdate_content">
				<div class="form-group">
					<a class="navbar-brand1">회원정보 수정</a>
				</div>
			<div class="login_content">	
				<!-- action 주소가 없으면 자신의 페이지 호출 -->
				<form action="./MemberUpdateProAction.me" method="post" id="form_sumit" name="fr" onsubmit="return checkDate();">
					<div>아이디  <input type="text" id="id" name="id" value="${requestScope.dto.id }" readonly></div>
					<div>비밀번호  <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요"></div>	
					<div>이름  <input type="text" id="name" name="memname" value="${dto.memname }" readonly></div>
					<div>생년월일  <input type="date" id="birth" name="birth" value="${dto.birth }" readonly></div>
					<div>휴대전화  <input type="tel" id="tel" name="tel" maxlength="13" value="${dto.tel }" ></div>
					<div>이메일  <input type="text" id="email" name="email" value="${dto.email }" readonly></div>
					
					<hr>
					<input type="submit" value="회원 정보 수정" class="btn_update">
			
				</form>
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