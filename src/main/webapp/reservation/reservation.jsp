<%@page import="java.util.List"%>
<%@page import="com.team2.parkingdetail.db.PDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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



<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lot.css">
<!-- jQuery 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- iamport 결제 라이브러리 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- datepicker -->
<link rel="stylesheet" type="text/css" href="css/res_datepicker.css">

<!-- timepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<link rel="stylesheet" type="text/css" href="css/res.css">


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
		
			
		$('#dateTimeBtn').click(function() {
			
			let selectedDate = $('#datepicker').val();
			let fromTime = $('#fromTime').val();
			let toTime = $('#toTime').val();
			let parkingCode = $('#parkingCode').val();
			
			if(selectedDate=="") {
				alert("날짜를 선택하세요");
				$('#datepicker').focus();
				return false;
			}
			if(fromTime=="") {
				alert("입차시간을 선택하세요");
				$('#fromTime').focus();
				return false;
			}
			if(toTime=="") {
				alert("출차시간을 선택하세요");
				$('#toTime').focus();
				return false;
			}
			
			$('.click_inner a.selected').removeClass('selected');
			$('#payInfo input#parkingCode').val('');
			$('#payInfo input#parkingPosition').val('');
			
			$('#resDate').val(selectedDate);
			$('#parkInTime').val(fromTime);
			$('#parkOutTime').val(toTime);
			
			$('#res_click_map').find('.cbtn').each(function() {
				$(this).removeClass('cbtn_on').addClass('cbtn_off');
			});
					
			$.ajax({
				url:"./Available.res",
				type:"post",
				data:{date:selectedDate,fromTime:fromTime,toTime:toTime,parkingCode:parkingCode},
				success:function(data) {
					
					var i;
					for(i=0; i<data.length-1; i++) { 
							
						let park = data[i].parkingCode + data[i].parkingPosition;	
						
						$('#res_click_map').find('.cbtn').each(function(idx, elem) {
							let code = $(this).find('#code').val();
							let position = $(this).find('#position').val();
							let result = code + position;
// 							console.log(result);
							
							if(result==park) {
								$(this).removeClass('cbtn_off').addClass('cbtn_on');
							}
							
						}); //res_click_map
						
						
					} //for
					
					$('#price').attr('value',data[i].price);
					
					
				},  //success
				error:function() {
					alert("error");
				}  //error
			}); //ajax
			
		}); //dateTimeBtn
		
		
	});
	
</script>
</head>
<body>
	
	<jsp:include page="../inc/top.jsp"/>
	
	<section class="ftco-section contact-section" style="padding: 0em;">
	
	<div id="header">
		<span id="pName"> ${pDto.parkingName } </span>
		
		<c:choose>
			<c:when test="${pDto.inOutDoor.equals('in') }">
				<span id="inout">실내</span>
			</c:when>
			<c:when test="${pDto.inOutDoor.equals('out') }">
				<span id="inout">야외</span>
			</c:when>
		</c:choose>
		<span class="lotInfo">
			<b>Addr:</b> ${pDto.parkingAdr }
			| 
			<b>Tel:</b> ${pDto.parkingTel } 
		</span>
		<hr id="hr1">
	</div>
	
	<div id="right-section">
			<div>
				<input type="hidden" id="parkingCode" value="${pDto.parkingCode }" >
				
				예약일: <input type="text" id="datepicker" name="selectedDate" class="picker" autocomplete="off">
				입차: <input type="text" id="fromTime" name="fromTime" class="picker" autocomplete="off">
				출차: <input type="text" id="toTime" name="toTime" class="picker" autocomplete="off">
				
				<input type="button" value="조회" id="dateTimeBtn">
			</div>
	</div>
	
	
	
	
	<script type="text/javascript">
		let aList = ${aList};
		
		$(function() {
			
			$('#res_click_map').find('.cbtn').each(function() {
				$(this).removeClass('cbtn_on').addClass('cbtn_off');
			});
			
			for(var i=0; i<aList.length; i++) {
				let park = aList[i].parkingCode + aList[i].parkingPosition;
				
				$('#res_click_map').find('.cbtn').each(function(idx, elem) {
					let code = $(this).find('#code').val();
					let position = $(this).find('#position').val();
					let result = code + position;
					
					if(result==park) {
						$(this).removeClass('cbtn_off').addClass('cbtn_on');
					}
					
				}); //res_click_map
				
			} //for
		});
		
	</script>
	
	<div id="left-nav">
	<div id="res_click_map">
		<img src="./img/parkIT.png">
		<div class="click_inner">
		
			<a href="#" class="cbtn cbtn_01" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="1">
			01
			</a>
			
			<a href="#" class="cbtn cbtn_02" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="2">
			02
			</a>
			
			<a href="#" class="cbtn cbtn_03" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="3">
			03
			</a>
			
			<a href="#" class="cbtn cbtn_04" onclick="return false;">
				<input type="hidden" id="code" class="" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="4">
			04
			</a>
			
			<a href="#" class="cbtn cbtn_05" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="5">
			05
			</a>
			
			<a href="#" class="cbtn cbtn_06" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="6">
			06
			</a>
			
			<a href="#" class="cbtn cbtn_07" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="7">
			07
			</a>
			
			<a href="#" class="cbtn cbtn_08" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="8">
			08
			</a>
			
			<a href="#" class="cbtn cbtn_09" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="9">
			09
			</a>
			
			<a href="#" class="cbtn cbtn_10" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="10">
			10
			</a>
			
			<a href="#" class="cbtn cbtn_11" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="11">
			11
			</a>
			
			<a href="#" class="cbtn cbtn_12" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="12">
			12
			</a>
			
			<a href="#" class="cbtn cbtn_13" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="13">
			13
			</a>
			
			<a href="#" class="cbtn cbtn_14" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="14">
			14
			</a>
			
			<a href="#" class="cbtn cbtn_15" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="15">
			15
			</a>
			
			<a href="#" class="cbtn cbtn_16" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="16">
			16
			</a>
			
			<a href="#" class="cbtn cbtn_17" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="17">
			17
			</a>
			
			<a href="#" class="cbtn cbtn_18" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="18">
			18
			</a>
			
			<a href="#" class="cbtn cbtn_19" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="19">
			19
			</a>
			
			<a href="#" class="cbtn cbtn_20" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="20">
			20
			</a>
			
			<a href="#" class="cbtn cbtn_21" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="21">
			21
			</a>
			
			<a href="#" class="cbtn cbtn_22" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="22">
			22
			</a>
			
			<a href="#" class="cbtn cbtn_23" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="23">
			23
			</a>
			
			<a href="#" class="cbtn cbtn_24" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="24">
			24
			</a>
			
			<a href="#" class="cbtn cbtn_25" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="25">
			25
			</a>
			
			<a href="#" class="cbtn cbtn_26" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="26">
			26
			</a>
			
			<a href="#" class="cbtn cbtn_27" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="27">
			27
			</a>
			
			<a href="#" class="cbtn cbtn_28" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="28">
			28
			</a>
			
			<a href="#" class="cbtn cbtn_29" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="29">
			29
			</a>
			
			<a href="#" class="cbtn cbtn_30" onclick="return false;">
				<input type="hidden" id="code" value="${pDto.parkingCode }">
				<input type="hidden" id="position" class="" value="30">
			30
			</a>
			
			
		</div>
	 </div>
	
	 <div class="container">
		<div class="pst1"> </div> <div class="pst-desc1"> 이미 예약된 자리</div> 
		<div class="pst2"> </div> <div class="pst-desc2"> 예약 가능한 자리 </div> 
		<div class="pst3"> </div> <div class="pst-desc3"> 선택한 자리</div> 
	 </div>
	
	</div>
	
	<script type="text/javascript">
		$(function() {
			$('.cbtn').click(function() {
				if( $(this).hasClass('cbtn_on') ) {
					$('.click_inner a.selected').removeClass('selected');
					$(this).addClass('selected');
					$('#payInfo input#parkingCode').val( $(this).find('#code').val() );
					$('#payInfo input#parkingPosition').val( $(this).find('#position').val() );
				} 
			}); //cbtnClick
			
		});
	</script>
	
	<div id="right-section">
	
		<h6> 주차장 이용 수칙 </h6>
		<p> 요금은 30분당 1,000원입니다. </p>
		<p> 주차장 내에서는 서행하여야 하며 경적을 울리거나 추월, 위험물 반입 및 취급을 금합니다. </p>
		<p> 훼손, 분실 등에 주의하시고 차량의 훼손 및 내부 분실물은 당 주차장에서 책임을 지지 않습니다. </p>
		<p> 이용자의 고의나 과실로 인하여 시설물 및 차량사고(대인, 대물 등) 발생시에는 사고자 책임 하에 변상 및 보상처리가 되어야 합니다. </p>
		
		<form action="./PayAction.res" id="payInfo" method="post">
			<!-- 회원 아이디 -->
			<input type="hidden" id="id" name="id" value="${sessionScope.id }">
			<!-- 주차장코드 -->
			<input type="hidden" id="parkingCode" name="parkingCode" value="${available[0].parkingCode }">
			<!-- 주차장자리번호 -->
			<input type="hidden" id="parkingPosition" name="parkingPosition" value="">
			
			
			<p><b>※ 예약 날짜와 입, 출차시간을 확인해주세요.</b></p>
			<div id="chk">
			 <!-- 예약날짜 -->
			 <div>예약일: <input type="text" id="resDate" name="resDate" class="check" value="${resDate }" readonly></div>
			
			 <!-- 입차시간 -->
			 <div>입차시간: <input type="text" id="parkInTime" name="parkInTime" class="check" value="${parkInTime }" readonly></div>
			
			 <!-- 출차시간 -->
			 <div>출차시간: <input type="text" id="parkOutTime" name="parkOutTime" class="check" value="${parkOutTime }" readonly></div>
			
			 <div>차량번호: <input type="text" id="carNo" name="carNo"></div>
			</div>
			<hr>
			<div>
				<h3> 결제 예상금액: <input type="text" id="price" name="price" class="check" value="${price }" readonly></h3>
				
			</div>
		</form>
				<button onclick="requestPay()"> 결제하기 </button>
	</div>
	
	<script type="text/javascript">
		var number = $('#price').val();
		console.log(number);
		console.log(typeof number);
		var formatNum = number.toLocaleString();
		console.log(formatNum);

	</script>
	
	
	<script type="text/javascript">
	
		function getToday() {
			var date = new Date();
			var year = date.getFullYear();
			var month = ("0" + (1 + date.getMonth())).slice(-2);
			var day = ("0" + date.getDate()).slice(-2);
			
			return year + "-" + month + "-" + day;
		}
		
		/* iamport 결제 API */
		var IMP = window.IMP;  //생략 가능
		IMP.init("imp81382761");  //가맹점 고유번호
		
		function requestPay() {
			//예약 테이블에 들어갈 값
			var id = $('#payInfo input#id').val();
			var code = $('#payInfo input#parkingCode').val();
			var position = $('#payInfo input#parkingPosition').val(); 
			var name = code + position;
			
			var resDate = $('#payInfo input#resDate').val();
			var parkInTime = $('#payInfo input#parkInTime').val();
			var parkOutTime = $('#payInfo input#parkOutTime').val();
			var price = $('#price').val();
			var carNo = $('#carNo').val();
			
			//결제 테이블에 들어갈 값
			var today = getToday(); 
			
			if(id==null) {
				alert("로그인 후 이용하실 수 있습니다.");
				location.href = "./MemberLogin.me";
			}
			if(price==0) {
				alert("결제 가능한 자리가 없습니다.");
				return false;
			}
			if(name.length<2) {
				alert("자리를 선택해주세요.");
				return false;
			}
			if(carNo=='') {
				alert("차량번호를 입력해주세요.");
				$('#carNo').focus();
				return false;
			}
			
			let msg;
			
			IMP.request_pay({
				pg: "kakaopay",  //PG사
				pay_method: "card",  //결제수단
				merchant_uid: "order_" + new Date().getTime(),  //주문번호
				name: name,  //결제창에서 보여질 이름(제품이름)
				amount: price,  //가격(숫자타입)
			}, function(rsp) {
				console.log(rsp);
				//rsp.imp_uid 값으로 결제 단건조회 API 호출하여 결제결과 판단
				//결제 검증()
				if(rsp.success) {
				
					$.ajax({
						url: "./PayAction.res",
						type: "post",
						dataType: "json",
						data: {
							"id":id,
							"parkingCode":code,
							"parkingPosition":position,
							"resDate":resDate,
							"parkInTime":parkInTime,
							"parkOutTime":parkOutTime,
							"price":price,  //예약, 결제
							"carNo":carNo,
							"payNo":rsp.merchant_uid,  //결제
							"payDate":today  //결제
						}
					}).done(function(data) {
						
						console.log(data);
						console.log(data.resResult + ", " + data.payResult);
						
						if(data.resResult==1 && data.payResult==1) {
							var con = confirm("결제가 완료되었습니다. 예약내역페이지로 이동하시겠습니까?");
							if(con) {
								location.href = "./ResList.me";
							} else {
								history.back();
							}
						}
						
// 						msg = "결제완료";
// 						msg += "고유ID: " + rsp.imp_uid;
// 						msg += "상점 거래 ID: " + rsp.merchant_uid;
// 						msg += "결제 금액: " + rsp.paid_amount;
// 						msg += "카드 승인번호: " + rsp.apply_num;
					});
				
				} else {
// 					msg = "결제 실패";
					alert("결제 실패: " + rsp.error_msg);
				}
// 				console.log(msg);
			});
		} //requestPay()
	</script>
		
	<div id="footer"></div>
	
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
	<!--  datepicker -->
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