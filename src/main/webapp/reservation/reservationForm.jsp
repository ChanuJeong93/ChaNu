<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkIT</title>

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
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="css/park.css">

<link rel="stylesheet" href="css/resForm.css">

<!-- jQuery 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- datepicker  -->
<link rel="stylesheet" type="text/css" href="css/res_datepicker.css">

<!-- timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script type="text/javascript">			
	
	$(function() {
		$('#datepicker').datepicker({
			showOn:'focus',
			changeMonth:false,
			changeYear:false,
			nextText:'다음달',
			prevText:'이전달',
			showButtonPanel:'true',
			currentText:'오늘',
			closeText:'닫기',
			dateFormat:'yy-mm-dd',
			dayNames:['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			minDate:0,
			maxDate:+30,
			onSelect: function(date, inst) {
				var selected = $(this).datepicker('getDate');
				var current = new Date();
				
				if(selected > current) {
					$('#fromTime').timepicker('option', 'minTime', '06:00');
					$('#toTime').timepicker('option', 'minTime', '06:00');
				} else {
					$('#fromTime').timepicker('option', 'minTime', new Date());
					$('#toTime').timepicker('option', 'minTime', new Date());
				}
			} //onSelect
		});
		
		$('#fromTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'06:00',
			minTime:'06:00',
			maxTime: '22:00',
			dynamic:false,
			scrollbar:true,
			change:function(time) {
				var minTime = new Date(time);
				minTime.setMinutes(minTime.getMinutes() + 30);
				$('#toTime').timepicker('option', 'minTime', minTime);
			}
		});

		$('#toTime').timepicker({
			timeFormat:'H:mm',
			interval:30,
			startTime:'06:00',
			minTime:'06:00',
			maxTime: '22:00',
			dynamic:false,
			scrollbar:true
		});
		
		$('input[type=submit]').click(function() {
			var selectedDate = $('#datepicker').val();
			var fromTime = $('#fromTime').val();
			var toTime = $('#toTime').val();
			
			$('#selectedDate').val(selectedDate);
			$('input[type="hidden"]#parkInTime').val(fromTime);
			$('input[type="hidden"]#parkOutTime').val(toTime);
		});
		
	});
	
	function check() {
		if(document.fr.datepicker.value=="") {
			alert("날짜를 선택하세요");
			document.fr.datepicker.focus();
			return false;
		} 
		if(document.fr.fromTime.value=="") {
			alert("입차시간을 선택하세요");
			document.fr.fromTime.focus();
			return false;
		}
		if(document.fr.toTime.value=="") {
			alert("출차시간을 선택하세요");
			document.fr.toTime.focus();
			return false;
		}
	} //check()
	
	
</script>
</head>
<body>

	<jsp:include page="../inc/top.jsp"/>
	
	<section class="ftco-section contact-section" style="padding: 0em;">
	
	<div id="header" class="common">
		<h1> 예약하기 </h1>
		<hr>
	</div>
	
	<div id="section" class="common">
		<form action="./ReservationAction.res" name="fr" method="post" onsubmit="return check();">
		  <span id="form-elements">
		  
			<span id="parkingLot" class="pCon">
				<span id="parkSelect">지점 선택</span>
				<select name="parking" id="parking">
				 <option value="A" style="color:#4b4b4b"> 서면점 </option>
				 <option value="B" style="color:#4b4b4b"> 해운대점 </option>
				 <option value="C" style="color:#4b4b4b"> 명지점 </option>
				</select>
			</span>
			
			<span class="cont">
				<span>희망 예약 날짜</span>
				<input type="text" id="datepicker" class="parkSelect" autocomplete="off"  placeholder="날짜를 선택하세요">
			</span>
			<span class="cont">
				<span>희망 입차 시간</span>
				<input type="text" id="fromTime" class="parkSelect" autocomplete="off" placeholder="입차시간을 선택하세요">
			</span>
			<span class="cont">
				<span>희망 출차 시간</span>
				<input type="text" id="toTime" class="parkSelect" autocomplete="off" placeholder="출차시간을 선택하세요">
			</span>
				
		  </span>
		  
				<input type="hidden" id="selectedDate" name="selectedDate">
				<input type="hidden" id="parkInTime" name="parkInTime">
				<input type="hidden" id="parkOutTime" name="parkOutTime">
		  
			<span id="submitBtn">
				<input type="submit" value="예약하기">
			</span>
			
		</form>
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
	
	<!-- timepicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	
	
	
</body>
</html>