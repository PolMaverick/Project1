<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 		//회원가입 실패시 세션에 저장된 에러메세지를 변수에 저장
	    String errMsg = (String)session.getAttribute("errMsg_login");	
    
	    if(errMsg == null) errMsg = "";	//에러메세지가 없을 경우 빈칸
	    
	    session.invalidate(); //사용 후 세션을 닫아준다.
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_login</title>
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
	
	<h3>로그인</h3>
	<div style="margin: 50px;">
	
		<!-- 폼액션을 사용해 버튼 클릭시 입력칸에 입력한 정보들을 로그인 결과처리 페이지로 넘긴다. -->
		<form action="login_result.jsp">	
		<table>
		<tr>
			<td>아이디</td>
			<td><input name='id'></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name='pw'></td>
		</tr>
		</table>
		<!-- 로그인 실패시 메세지 띄우는 부분 -->
		<div id="errMsg" style="color:red"><%= errMsg %></div><br>
		<button >로그인</button>
		</form>	
	</div>
	
</div>

</body>
</html>