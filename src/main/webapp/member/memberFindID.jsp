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

<link rel="stylesheet" href="css/find.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/park_find.css">


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
</head>
<body>
<!-- <h1>아이디/비밀번호 찾기</h1> -->

<div class="form-group">
	<a class="navbar-brand" href="./Main.park">
		Park<span>IT</span>
	</a>
</div>
 
<section class="findsec1">

<!-- <h3>아이디 찾기</h3> -->
	<div class="login_content">
		<form action="./MemberFindIDAction.me" method="post">
			<div>		
				<label>Name</label> <br>
				<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" class="input_text">
			</div>
			
			<div>
				<label>Email</label> <br>
				<input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" class="input_text">	
			</div>			
			
		<hr>
				
			<input type="submit" value="아이디 찾기" class="btn_login">
		</form>
		
		
		<ul class="find_wrap" >	
			<li>
				<a target="_blank" href="./MemberJoin.me" class="find_text">회원가입</a>
			</li>
		
			<li>
				<a target="_blank" href="./MemberFindPW.me" class="find_text">비밀번호 찾기</a>
			</li>
		</ul>
		
		
		</div>
</section>		
		
<!-- 		<section class="findsec2"> -->
<!-- 			<div class="findmenu"> -->
<!-- <!-- 			<h3>메뉴</h3> -->
			
<!-- 				<div> -->
<!-- 					<form action="./MemberFindPW.me" method="post"> -->
<!-- 						<input type="submit" value="비밀번호 찾기"> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 				<div> -->
<!-- 					<form action="./MemberFindID.me" method="post"> -->
<!-- 						<input type="submit" value="아이디 찾기"> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
</body>
</html>