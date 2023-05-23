<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@page import="com.team2.member.db.MemberDAO"%>
<%@page import="com.team2.member.db.MemberDTO"%>
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
<link rel="stylesheet" href="css/park_find_af.css">

</head>
<body>
<!-- <h1>아이디/비밀번호 찾기</h1> -->

 <div class="form-group">
	<a class="navbar-brand" href="./Main.park">
		Park<span>IT</span>
	</a>
</div>
 
 <section class="findsec1"> 
 
<!-- <h3>비밀번호 찾기</h3> -->
			<% String pw = (String)session.getAttribute("pw"); 
			%>
			<form action="./MemberLogin.me" method="post">
			<label>회원가입 시 사용한 비밀번호는 <b><%=pw %></b>  입니다.</label>
			<div><input type="submit" value="로그인 화면으로 돌아가기" class="btn_login"></div>
			</form>

</section>				
</body>
</html>