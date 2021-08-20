<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		String cerMsg = request.getParameter("cerMsg");//본인인증 결과를 받아옴
	    if(cerMsg == null) cerMsg = "";//본인인증을 하기 전 공백
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_sign up</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$('#cer').click(function() {	/* 본인인증 버튼 클릭시  */
			location.href='cer.jsp'		/* cer.jsp페이지로 이동 */
		})
		$('#inputId').blur(function() { /* 입력칸에서 커서가 벗어났을때  */
			idValue = $('#inputId').val(); /* 입력칸에 입력된 값을 변수에 저장 */
			idMsgTag = $('#idMsg');	
			idMsgTag2 = $('#idMsg2');
			if(idValue.length < 2 || idValue.length > 20){ /* 입력값이 2글자 미만이거나 20글자 초과시  */
				idMsgTag.html('<font color=red>아이디는 2~20글자 이내로 입력해주세요.</font>'); /* 해당 메세지 출력 */
			} else{
				idMsgTag.html('<font color=green>입력가능한 아이디입니다.</font>');
			}
		})
		$('#idCheck').click(function() { /* 중복확인 버튼 클릭시 */
			idValue = $('#inputId').val(); 
			$.ajax({					/* 중복확인하는 페이지로 넘겨서 결과값 받아온 후 결과값 출력 */
				url: "login_check2.jsp",
				data:{
					id: idValue
				},
				success: function(result){
					alert(result);
				}
			})
		})
		$('#inputPw').blur(function() {
			pwValue = $('#inputPw').val();
			pwMsgTag = $('#pwMsg');
			if(pwValue.length < 2 || pwValue.length > 20){
				pwMsgTag.html('<font color=red>비밀번호는 2~20글자 이내로 입력해주세요.</font>');
			} else{
				pwMsgTag.html('<font color=green>사용가능한 비밀번호입니다.</font>');
			}
		})
		$('#inputName').blur(function() {
			nameValue = $('#inputName').val();
			nameMsgTag = $('#nameMsg');
			if(nameValue.length > 20){
				nameMsgTag.html('<font color=red>이름은 20글자 이내로 입력해주세요.</font>');
			} else{
				nameMsgTag.html('');
			}
		})
		$('#inputMail').blur(function() {
			mailValue = $('#inputMail').val();
			mailMsgTag = $('#mailMsg');
			if(mailValue.length > 100){
				mailMsgTag.html('<font color=red>메일은 100글자 이내로 입력해주세요.</font>');
			} else{
				mailMsgTag.html('');
			}
		})
		$('#inputTel').blur(function() {
			telValue = $('#inputTel').val();
			telMsgTag = $('#telMsg');
			if(telValue.length > 20){
				telMsgTag.html('<font color=red>전화번호는 20글자 이내로 입력해주세요.</font>');
			}else{
				telMsgTag.html('');
			}
		})
		$('#create').click(function() {		/* 회원가입 버튼 클릭시 */
			idValue = $('#inputId').val();	/* 입력칸에 입력받은 값들을 변수에 저장 */
			pwValue = $('#inputPw').val();
			nameValue = $('#inputName').val();
			mailValue = $('#inputMail').val();
			telValue = $('#inputTel').val();
			
			cerMsg = $('#cerMsg').text();	/* 모든 체크메세지들을 변수에 저장 */
			idMsg = $('#idMsg').text();
			idMsg2 = $('#idMsg2').text();
			pwMsg = $('#pwMsg').text();
			nameMsg = $('#nameMsg').text();
			mailMsg = $('#mailMsg').text();
			telMsg = $('#telMsg').text();
			
			if(idMsg == '입력가능한 아이디입니다.' &&	/* 모든 체크메세지들이 입력 가능일 경우 */ 
					cerMsg == '본인인증 성공' && 
					pwMsg == '사용가능한 비밀번호입니다.' &&
					nameMsg == "" &&
					mailMsg == "" &&
					telMsg == ""
					){	
					$.ajax({				/* 입력받은 데이터들을 ajax를 사용하여 넘긴다 */
						url: "member_create_result2.jsp",
						data:{
							id: idValue, 
							pw: pwValue, 
							name: nameValue, 
							mail: mailValue, 
							tel: telValue
						},
						success: function(result){ 
							alert(result)				/* 처리 결과 출력 */
							if (result == "회원가입성공"){ 	/* 성공시 로그인 페이지로 이동 */
								location.href="login.jsp";
							}
						}
					})
			}else{			/* 체크메세지중 입력불가한 항목이 하나라도 있을경우 메세지 출력 */
				alert('가입조건이 맞지 않습니다.')
			} 
		})
	})
</script>
<link rel="stylesheet" href="css/project1.css">
</head>
<body>
<div id="total">
	<div id="menu_frame">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<hr>
	<div id="notice_frame">
		notice. 고객님의 여정이 코로나19(COVID-19)발생 상황에 영향을 받을 수 있으니 예약시 코로나 현황을 꼭 확인해주세요.
	</div>
	<h3>회원가입</h3>
	<div style="margin: 50px;">
			<button id='cer'>본인인증</button><br>		<!-- 본인인증 버튼 -->
			<div id="cerMsg" class="msg"><%= cerMsg %></div><br><!-- 본인인증 버튼 클릭 후 리턴된 메세지를 출력 -->
			
			ID <input id='inputId' name = "id"> <!-- 아이디 입력칸 --> 
			<button id="idCheck">중복확인</button> <!-- 중복확인 버튼 -->
			<div id="idMsg" class="msg"></div><br> <!-- 아이디 글자수 체크 후 메세지 출력 -->
			
			PW <input id='inputPw' name = "pw"><br> <!-- 비밀번호 입력칸 -->
			<div id="pwMsg" class="msg"></div><br> <!-- 비밀번호 글자수 체크 후 메세지 출력 -->
			
			이름 <input id='inputName' name = "name"><br> <!-- 이름 입력칸 -->
			<div id="nameMsg" class="msg"></div><br> <!-- 이름 글자수 체크 후 메세지 출력 -->
			
			mail <input id='inputMail' name = "mail"><br> <!-- 메일 입력칸 -->
			<div id="mailMsg" class="msg"></div><br> <!-- 메일 글자수 체크 후 메세지 출력 -->
			
			tel <input id='inputTel' name = "tel"><br> <!-- 전화번호 입력칸 -->
			<div id="telMsg" class="msg"></div><br> <!-- 전화번호 글자수 체크 후 메세지 출력 -->
			<button id="create" >회원가입</button> <!-- 회원가입 버튼 -->
	</div>
</div>
</body>
</html>