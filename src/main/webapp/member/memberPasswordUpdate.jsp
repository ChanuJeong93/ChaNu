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


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">

<link rel="stylesheet" href="css/find.css">

<link rel="stylesheet" href="css/park_uppw.css">
<link rel="stylesheet" href="css/style.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
    function checkData() {
	    var currentPassword = document.getElementById("pw").value;
	    var newPassword = document.getElementById("newpw").value;
		var getNewPw = RegExp(/^(?=.*\d)(?=.*[a-z])[a-zA-Z0-9]{8,15}$/i);

	    if (currentPassword === newPassword) {
	      alert("현재 비밀번호와 새로운 비밀번호가 일치합니다.\n다시 입력해주세요.");
	      return false; // 폼 제출을 중지하기 위해 false 반환
	    }

	  
	
	 // 비밀번호 유효성검사
	    if(!getNewPw.test($("#newpw").val())){
	       alert("비밀번호 형식에 맞게 입력해주세요.");
	       $("#newpw").val("");
	       $("#newpw").focus();
	       return false;
	     }
	    return true; // 폼 제출을 진행하기 위해 true 반환
		}
	
		
	</script>
	
	<!-- 중복 검사 -->
	<script type="text/javascript">	
	function pwCheck() {
		if(document.fr.pw.value=="") {
			alert("현재 비밀번호를 입력해 주세요.");
			document.fr.pw.focus();
			return false;
		}	
		
		if(document.fr.newpw.value=="") {
			alert("변경할 비밀번호를 입력해 주세요.");
			document.fr.newpw.focus();
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
<!-- 	<h2>비밀번호 변경</h2> -->

	<section class="ftco-section ftco-no-pt bg-light">
	
	<div class="form-group">
		<a class="navbar-brand1">비밀번호 변경</a>
	</div>
	
	<div class="login_content">
	<fieldset>
<!-- 		<legend>비밀번호 변경</legend> -->
		<!-- action 주소가 없으면 자신의 페이지 호출 -->
		<form action="./MemberPasswordUpdateProAction.me" method="post" name="fr" onsubmit="return checkData();">
			현재 비밀번호  <input type="password" id="pw" name="pw" placeholder="현재 비밀번호를 입력하세요." required="required" class="input_text" id="pw"> 			<br>	
			변경할 비밀번호  <input type="password" id="newpw" name="newpw" placeholder="변경할 비밀번호를 입력하세요." required="required" class="input_text1" id="newpw"> 			<br>	
			
			
			<hr>
			<input type="submit" value="비밀번호 변경" class="btn_login">
	
		</form>
	</fieldset>
	</div>
	</section>
	
<!-- 	<h3><a href="./Main.park">메인페이지로</a></h3> -->

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