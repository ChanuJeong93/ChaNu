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
<link rel="stylesheet" href="css/introduction.css">


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a8f31d6c1c411a19691f71462e48ee1&libraries=services"></script>

</head>
<body>


	<jsp:include page="../inc/top.jsp"/>
	
	<div id="total">
	
	
	<div id="top" style="margin-bottom: 10em;">
	
	<h1> 이용안내 </h1>
	<hr style="border: 2px solid #ccc;">
		<div>
		<h4>① 가입하기</h4> 
		parkIT 홈페이지에서 회원가입을 진행해주세요. parkIT는 만19세 이상부터 이용이 가능합니다.
		</div>
		
		<div>
		<h4>② 예약하기</h4>
		이용시간, 날짜를 설정하고 원하는 주차장과 자리번호를 선택해 주세요.
		</div>
		
		<div>
		<h4>③ 이용하기 </h4>
		예약하신 자리를 예약한 시간에 사용하시면 됩니다.
		</div>
	<br><br><br>
	
	<h1> 이용수칙 및 준수사항 </h1>
	<hr style="border: 2px solid #ccc;">
	<p>
	주차장 내에서는 서행하여야 하며 경적을 울리거나 추월, 위험물 반입 및 취급을 금합니다.<br><br>

	훼손, 분실 등에 주의하시고 차량의 훼손 및 내부 분실물은 당 주차장에서 책임을 지지 않습니다.<br><br>

	이용자의 고의나 과실로 인하여 시설물 및 차량사고(대인, 대물 등) 발생시에는 사고자 책임 하에 변상 및 보상처리가 되어야 합니다. <br><br>

	※ 예약 날짜와 입, 출차시간을 확인해주세요.
	</p>
	<br><br><br><br>
	
	<h1> 이용요금 </h1>
	<hr style="border: 2px solid #ccc;">
		<div>
		<h4 id="seo123"> 30분당 1000원 </h4>
		</div>
	</div> <!-- /top -->	
	
	<div id="bottom"> <!-- 아래  -->
	
	<h1> 주차장 안내 </h1>
	<hr style="border: 2px solid #ccc;">
	
	<div class="box"> <!-- box -->
	
	
	<div style="font-size: 25px;">
		<h2> 서면점</h2>
	
	
	잔여/전체 : ${requestScope.availableA } / ${allA } <br>
	
	tel. 051-9999-9999 <br>
	
	운영시간 6:00 ~ 22:00 <br>
	
	주소 : 부산광역시 부산진구 동천로 109 <br>
	
	<span id="hae123">실내 주차장</span>
	
	</div>
	
	
	
		<div id="map" style="width:400px;height:300px;">
		
		
		<script type="text/javascript">
			var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var mapOption = {  //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
					level: 3  //지도의 레벨(확대, 축소 정도)
			};
			
			//지도 생성 및 객체 리턴
			var map = new kakao.maps.Map(mapContainer, mapOption);  
			
			//주소-좌표 변환 객체 생성
			var geocoder = new kakao.maps.services.Geocoder();
			
			//주소로 좌표 검색
			geocoder.addressSearch('부산광역시 부산진구 동천로 109', function(result, status) {
				//정상적으로 검색 완료시
				if(status==kakao.maps.services.Status.OK) {
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					console.log("coords: " + coords);
					
					//결과값으로 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					
					//인포윈도우로 장소에 대한 설명 표시
					var infowindow = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">서면점</div>'
					});
					infowindow.open(map, marker);
					
					//지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
				} //if
			}); //addressSearch()
			
			/////////////////////////////////////////////////////////////////////////////////////
		</script>
		
		</div> <!-- map 사진 div -->
	
	

	
	</div> <!-- /box1 -->
	




	<div class="box">

	<div style="font-size: 25px;">
		<h2>해운대점</h2>
		잔여/전체 : ${availableB } / ${allB } <br>
		
		tel. 051-8888-8888 <br>
		
		운영시간 6:00 ~ 22:00 <br>
		
		주소 : 부산광역시 해운대구 해운대해변로 264 <br>
		
		<span id="mung123">실외 주차장</span>
		
	</div>


		<div id="map2" style="width:400px;height:300px;">
		
		
		<script type="text/javascript">
			var mapContainer2 = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스
			var mapOption2 = {  //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
					level: 3  //지도의 레벨(확대, 축소 정도)
			};
			
			//지도 생성 및 객체 리턴
			var map2 = new kakao.maps.Map(mapContainer2, mapOption2);  
			console.log("map2: " + map);
			
			//주소-좌표 변환 객체 생성
			var geocoder2 = new kakao.maps.services.Geocoder();
			
			//주소로 좌표 검색
			geocoder.addressSearch('부산광역시 해운대구 해운대해변로 264', function(result, status) {
				//정상적으로 검색 완료시
				if(status==kakao.maps.services.Status.OK) {
					var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					console.log("coords2" + coords2);
					
					//결과값으로 받은 위치를 마커로 표시
					var marker2 = new kakao.maps.Marker({
						map: map2,
						position: coords2
					});
					
					//인포윈도우로 장소에 대한 설명 표시
					var infowindow2 = new kakao.maps.InfoWindow({
						content: '<div style="width:150px;text-align:center;padding:6px 0;">해운대점</div>'
					});
					infowindow2.open(map2, marker2);
					
					//지도의 중심을 결과값으로 받은 위치로 이동
					map2.setCenter(coords2);
				} //if
			}); //addressSearch()
		</script>
		
		</div> <!-- /map2 -->
	

	
	
	</div> <!-- /box -->
	
	
	
	
	<div class="box">
	
	<div style="font-size: 25px;">
	<h2>명지점</h2>
	
		잔여/전체 : ${availableC } / ${allC } <br>
		
		tel. 051-7777-7777 <br>
		
		운영시간 6:00 ~ 22:00 <br>
		
		주소 : 부산광역시 강서구 명지국제6로 220번길 30 <br>
		
		실외 주차장
	
	</div>
	
	
	<div id="map3" style="width:400px;height:300px;">
	
	<script type="text/javascript">
		var mapContainer3 = document.getElementById('map3'); //지도를 담을 영역의 DOM 레퍼런스
		var mapOption3 = {  //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표
				level: 3  //지도의 레벨(확대, 축소 정도)
		};
		
		//지도 생성 및 객체 리턴
		var map3 = new kakao.maps.Map(mapContainer3, mapOption3);  
		console.log("map3: " + map3);
		
		//주소-좌표 변환 객체 생성
		var geocoder3 = new kakao.maps.services.Geocoder();
		
		//주소로 좌표 검색
		geocoder.addressSearch('부산광역시 강서구 명지국제6로 220번길 30', function(result, status) {
			//정상적으로 검색 완료시
			if(status==kakao.maps.services.Status.OK) {
				var coords3 = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				console.log("coords3" + coords3);
				
				//결과값으로 받은 위치를 마커로 표시
				var marker3 = new kakao.maps.Marker({
					map: map3,
					position: coords3
				});
				
				//인포윈도우로 장소에 대한 설명 표시
				var infowindow3 = new kakao.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">명지점</div>'
				});
				infowindow3.open(map3, marker3);
				
				//지도의 중심을 결과값으로 받은 위치로 이동
				map3.setCenter(coords3);
			} //if
		}); //addressSearch()
	</script>
	
	</div> <!-- map3 -->
	
	
	</div> <!-- box -->
	
	
	</div> <!-- bottom -->
	
	
	</div> <!-- /전체 (total) -->
	
	
	
	
	
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
	
	<script src="js/scrollax.min.js"></script>
	<script src="js/main.js"></script>
	
</body>
</html>