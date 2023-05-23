<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ParkIT</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

<link rel="shortcut icon" href="./images/favicon.ico">
	
<link rel="stylesheet" type="text/css" href="css/res_datepicker.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/memJoin.css">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js" ></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">

// 모든 공백 체크 정규식
var emp = RegExp(/\s/g);
// 아이디 정규식
var getId = RegExp(/^[a-z0-9]{6,15}$/i);
// 비밀번호 정규식
var getPw = RegExp(/^(?=.*\d)(?=.*[a-z])[a-zA-Z0-9]{8,15}$/i); 
// 이름 정규식
var getName = RegExp(/^[가-힣]{2,6}$/);
// 이메일 검사 정규식
var getMail = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
// 휴대폰 번호 정규식
var getPhone = RegExp(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/);
// 아이디 중복확인 여부
var isIdConfirmed = false;
// 이메일 인증 여부
var isEmailConfirmed = false;

// 아이디 중복확인 --------------------------------------------------------------------



$(function () {
$("#confirmId").on("click", function() {
  let idValue = $("#id").val();

  if (idValue === "") {
    alert("아이디를 입력해주세요.");
    return false;
  }
  

	// 아이디 유효성검사
	if(!getId.test($("#id").val())){
		alert("6~15자 영문, 숫자를 입력해주세요.");
		$("#id").focus();
		return false;
	}
  
  
  

  $.ajax({
    type: "POST",
    url: "./MemberConfirmIdAction.me",
    dataType: "JSON",
    success: function (data) {
      console.log(data);


      
      
      let checkId = false;

      for (let i = 0; i < data.memberList.length; i++) {
        if (data.memberList[i].id === idValue) {
          checkId = true;
          break;
        }
      }
		
		      if (checkId) {
		        alert("이미 사용중인 아이디 입니다.");
//         		$("#join_submit").prop("disabled", true);
		        isIdConfirmed = false;
		      } else {
		        alert("사용 가능한 아이디 입니다.");
//         		$("#join_submit").prop("disabled", false);
		        isIdConfirmed = true;
		      }
		    }
		  }); // ajax
		}); // 중복관리 버튼

});


// ------------------------------------------------------------------------------------
// 회원가입 정규식 유효성 검사
		function checkData(){

			
			
			// 아이디 공백 확인
			if($("#id").val() == ""){
		        alert("아이디를 입력해주세요.");
		        $("#id").focus();
		        return false;
		      }
			
			
			// 아이디 중복체크 확인
			else if(!isIdConfirmed){
				alert("아이디 중복확인을 해주세요.")
				$("#id").focus();
				return false;
			}
			
			

		      // 비밀번호 공백 확인
		      else if($("#pw").val() == ""){
		        alert("비밀번호를 입력해주세요.");
		        $("#pw").focus();
		        return false;
		      }
		           

		      // 아이디 비밀번호 같음 확인
		     else if($("#id").val() == $("#pw").val()){
		        alert("아이디와 비밀번호가 동일합니다. 다시 입력해주세요.");
		        $("#pw").val("");
		        $("#pw").focus();
		        return false;
		      }
		      
		      // 비밀번호 유효성검사
		     else if(!getPw.test($("#pw").val())){
		        alert("비밀번호 형식에 맞게 입력해주세요.");
		        $("#pw").val("");
		        $("#pw").focus();
		        return false;
		      }
		           
		      // 비밀번호 확인란 공백 확인
		     else if($("#pw2").val() == ""){
		        alert("비밀번호 확인란을 입력해주세요.");
		        $("#pw2").focus();
		        return false;
		      }
		           
		      // 비밀번호 서로확인
		     else if($("#pw").val() != $("#pw2").val()){
		          alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다.");
		          $("#pw").focus();
		          return false;
		      }
		          
		      // 이름 공백 검사
		     else if($("#memname").val() == ""){
		        alert("이름을 입력해주세요.");
		        $("#name").focus();
		        return false;
		      }

		      // 이름 유효성 검사
		     else if(!getName.test($("#memname").val())){
		        alert("이름 형식에 맞게 입력해주세요.")
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		      }

		      // 생년월일 공백 확인
		     else if($("#birth").val() == ""){
		        alert("생년월일을 입력해주세요.");
		        $("#birth").focus();
		        return false;
		      }
		      
		      // 휴대전화 공백 확인
		     else if($("#tel").val() == ""){
		        alert("휴대전화를 입력해주세요.");
		        $("#tel").focus();
		        return false;
		      }
		      
			
			// 휴대전화 유효성 검사
		     else if(!getPhone.test($("#tel").val().replace(/-/g, ""))){
		        alert("전화번호를 정확히 입력해주세요.")
		        $("#tel").focus();
		        return false;
		      }
			
			
		      // 이메일 공백 확인
		     else if($("#email").val() == ""){
		        alert("이메일을 입력해주세요.");
		        $("#email").focus();
		        return false;
		      }
		           
		      // 이메일 유효성 검사
		     else if(!getMail.test($("#email").val())){ // - 제거하는것
		        alert("이메일 형식에 맞게 입력해주세요.")
		        $("#email").val("");
		        $("#email").focus();
		        return false;
		      }
			

				else if(!isEmailConfirmed){
					alert("이메일 인증을 해주세요.")
					return false;
				}
					
			
		      
			
			// 약관 체크 ------------------------------------
		    	let checked_1 = $("#check_1").is(":checked");
		        let checked_2 = $("#check_2").is(":checked");
		        let checked_3 = $("#check_3").is(":checked");
		        
		        if (checked_1 && checked_2) {
					// [필수]약관에 모두 동의한 경우
					return true;
				} else {
					alert('[필수]약관에 모두 동의해야 회원가입이 가능합니다.');
					return false;
				}
			
		
		      
	} // checkData() 끝



// ------------------------------------------------------------------------------------
// 비밀번호 일치,불일치 입력창 밑에 띄우기

	$(function() {
		
		$('#alert-error').css('color', 'red');
		$('#alert-success').css('color', 'blue');
		$('#alert-danger').css('color', 'red');
		
		$("#alert-error").hide();
		$("#alert-success").hide();
		$("#alert-danger").hide();
		
		$("input").keyup(function() {
			var pw=$("#pw").val();
			var pw2=$("#pw2").val();
			if(pw != "" || pw2 != ""){
				
				if (!/^(?=.*\d)(?=.*[a-z])[a-zA-Z0-9]{8,15}$/i.test(pw)) {
					$("#alert-error").show();
					$("#alert-success").hide();
					$("#alert-danger").hide();
				}
				else if(pw == pw2){
					$("#alert-error").hide();
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("join_submit").removeAttr("disabled");
				}
				else{
					$("#alert-error").hide();
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("join_submit").attr("disabled", "disabled");
				}
			} 
			
			
		});
	});
// ------------------------------------------------------------------------------------
// 회원 약관 동의 전체 선택 처리
		$(document).ready(function() {
		    // [전체선택] 클릭시 개별 체크 박스를 전체 선택 또는 해제
		    $("#AgreeCheckBox-All").click(function() {
		      if ($("#AgreeCheckBox-All").prop("checked")) {
		        $(".joincheck").prop("checked", true);
		      } else {
		        $(".joincheck").prop("checked", false);
		      }
		    });
		    // 체크된거 해제하면 전체선택 박스 해제 및 개별체크 전부 클릭시 전체 선택 처리
		    $(".joincheck").click(function() {
		      if ($("input[class='joincheck']:checked").length == 3) {
		        $("#AgreeCheckBox-All").prop("checked", true);
		      } else {
		        $("#AgreeCheckBox-All").prop("checked", false);
		      }
		    });
// ------------------------------------------------------------------------------------
// [필수] 약관에 하나라도 동의 안되어있으면 안넘어가게 처리 -> 위에서 처리함

	}); // 약관동의 전체 선택 처리부터
	
	

	
	

// ------------------------------------------------------------------------------------
// 전화번호에 자동으로 하이픈 넣기

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
		





// // 여기서부터 이메일 인증 관련-------------------------------------------------------------------
	  function sendVerificationEmail() {
	    var email = $("#email").val();

	    if (validateEmail(email)) {
	      $.ajax({
	        type: "POST",
	        url: "./SendEmailAction.me",
	        data: { email: email },
	        success: function(response) {
	          alert("이메일로 인증번호가 전송되었습니다.");
	          var verificationCodeInput = '<input type="text" id="verificationCode" name="verificationCode" class="int" title="인증 번호">';
	          var verifyButton = '<input type="button" value="인증" onclick="verifyEmail()">';

	          $("#verificationForm").html(verificationCodeInput + verifyButton);
	          
	        },
	        error: function(xhr, status, error) {
	          alert("이메일 전송 중 오류가 발생했습니다. 다시 시도해주세요.");
	        }
	      });
	    } else {
	      alert("유효한 이메일 주소를 입력해주세요.");
	    }
	  }

	  function validateEmail(email) {
	    var re = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	    return re.test(email);
	  }
	  
//  유효성 검사 + 인증번호 메일로 보내기-------------------------------------------------
	function verifyCode() {
	  var userInput = $("#userInput").val();  // 사용자가 입력한 인증번호 가져오기
	  
	  $.ajax({
	    type: "POST",
	    url: "./VerifyEmailAction.me",
	    data: { verificationCode: userInput },  // 사용자가 입력한 인증번호 전송
	    success: function(response) {
	      if (response === "true") {
	        alert("인증이 완료되었습니다.");
	        // 인증이 성공한 경우 추가적인 처리를 수행할 수 있습니다.
	        isEmailConfirmed = true;
	        
	      } else {
	        alert("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
	        isEmailConfirmed = false;
	      }
	    },
	    error: function(xhr, status, error) {
	      alert("인증번호 확인 중 오류가 발생했습니다. 다시 시도해주세요.");
	    }
	  });
	}


// ------------------------------------------------------------------------------------
// 미성년자 생일 입력 불가 처리

	$(function () {
		$("#birth").datepicker({
			dateFormat: 'yy-mm-dd',
			showOn:'focus',
			prevText: '이전달',
			nextText: '다음달',
			minDate: new Date(1900, 0, 1),
			maxDate: new Date(2005, 4, new Date().getDate()),
// 			yearRange: '1900:' + new Date().getFullYear(),
			yearRange: '1900:2005',
			closeText:'닫기',
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: 'true',
		    changeMonth: 'true',
		    changeYear: 'true', // 연도 선택 스크롤 활성화
		    yearSuffix: '년',
		    showButtonPanel: 'true',
		});//datepicker
		
	});//function
	
	
</script>


</head>
<body>
<!------------------------------------------------------------------------------------------------------------>
	<div class="form-group">
		<a class="navbar-brand" href="./Main.park">Park<span>IT</span></a>
	</div>	
	
	<div class="join_content">
		<form action="./MemberJoinAction.me" method="post" name="fr" onsubmit="return checkData();" id="form_sumit">
	<!-- 아이디, 비밀번호 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="id">아이디</label><br>
					<span class="ps_box int_id">
						<input type="text" id="id" name="id" class="int" title="ID" maxlength="15" placeholder="영문, 숫자 6-15 자"> 
						<input type="button" id="confirmId" value="중복확인"><br>	
<!-- 						<div><span id="id_signed"></span></div>				 -->
					</span>
				</p>
			</div>	
			<div class="join_row">
				<p>
					<label class="join_title" for="pw">비밀번호</label><br>
					<span class="ps_box int_pass_step3" id="pswd1Img">
						<input type="password" id="pw" name="pw" class="int" title="비밀번호 입력" placeholder="숫자, 영문 조합 최소 8자">
					</span>
				</p>
				<p>	
					<label class="join_title" for="pw2">비밀번호 재확인</label><br>
					<span class="ps_box int_pass_check" id="pswd2Img">
						<input type="password" id="pw2" name="pw2" class="int" title="비밀번호 재확인 입력">
					</span>
				</p>		
						<div class="alert alert-error" id="alert-error">8~15자 영문, 숫자를 사용해주세요.</div>
						<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			</div>	
		</div>	
	<!-- // 아이디, 비밀번호 입력 -->
	<!-- 이름, 생년월일, 휴대전화 입력 -->
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="memname">이름</label><br>
					<span class="ps_box">
						<input type="text" id="memname" name="memname" title="이름" class="int" maxlength="40">				
					</span>
				</p>
			<div class="join_row">
				<p>
					<label class="join_title" for="birth">생년월일</label><br>
					<span class="ps_box">
						<input type="text" id="birth" name="birth" title="생년월일" class="int" autocomplete="off">		
					</span>
				</p>
			</div>	
			<div class="join_row">
				<p>
					<label class="join_title" for="tel">휴대전화</label><br>
					<span class="ps_box">
						<input type="text" id="tel" name="tel" title="휴대전화" class="int" maxlength="13">				
					</span>
				</p>
			</div>	
		</div>	
	</div>		
	<!-- // 이름, 생년월일, 휴대전화 입력 -->
	<!-- 이메일 입력 -->	
		<div class="row_group">
			<div class="join_row">
				<p>
					<label class="join_title" for="email">이메일</label><br>
					<span class="ps_box">
						<input type="email" id="email" name="email" class="int" title="이메일"> 
						<input type="button" name="email2" value="인증번호 전송" onclick="sendVerificationEmail();">	
					</span>
				</p>
				
				<div>
					<input type="text" id="userInput">
					<input type="button" value="인증" onclick="verifyCode();">
				</div>
			</div>	
		</div>
	<!-- // 이메일 입력 -->	
		<hr>		
	<!-- 		약관동의 -->
		<div class="login-join_form_agreement">
			<div class="login-join_form_agreement_all-checkbox">
				<input type="checkbox" id="AgreeCheckBox-All" class="AgreeCheckBox-All">
				<label for="AgreeCheckBox-All"><b>약관 전체 동의하기(선택 동의 포함)</b></label>
			</div>	
<!-- 		class="ageAgreeCheckBox" -->
			<div class="login-join_form_agreement_age">
				<input type="checkbox" class="joincheck" id="check_1">	
				<label for="ageAgreeCheckBox">[필수] 만 18세 이상입니다. </label>
			</div>
<!-- 		class="privacyAgreeCheckBox" -->
			<div class="login-join_form_agreement_privacy">
				<input type="checkbox" class="joincheck" id="check_2">	
				<label for="privacyAgreeCheckBox">[필수] 개인정보 수집 및 이용 동의</label>
<span style="display: inline-block; margin-left: 7px;"><a onclick="window.open('MemberJoinAgree.me', '_blank', 'width=500, height=500, top=' + ((screen.height - 500) / 2) + ', left=' + ((screen.width - 500) / 2));" style="text-decoration: underline;">보기</a></span>
			</div>
<!-- 		class="adAgreeCheckBox" -->
			<div class="login-join_form_agreement_ad">
				<input type="checkbox" class="joincheck" id="check_3">	
				<label for="adAgreeCheckBox">[선택] 광고성 정보 수신 동의 </label>
			</div>
		</div>
		
		<div><input type="submit" value="가입하기" id="join_submit" class="btn_join"></div>
		</form>
	</div>
		<br><br><br>

		
		


</body>
</html>