<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("id"); //로그인 되어있는 아이디
    
    MemberDTO dto = new MemberDTO();	
    dto.setId(id);	
    
    MemberDAO dao = new MemberDAO();
    MemberDTO dto2 = dao.read(dto);		//DB에서 해당 아이디의 데이터 read 
   	
    String msg = request.getParameter("msg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<style type="text/css">
input{
	font-size: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
<%if (msg != null){%>
	alert("탈퇴 실패!");
	location.href="my_trip.jsp"
<%}%>
$(function() {
	$('#updateB').click(function() {	/* 버튼 클릭시 */
		pwTag = $('#inputPw')		/* 입력값 변수에 저장 */ 
		mailTag = $('#inputMail')
		telTag = $('#inputTel')
		
		pwValue = pwTag.val();
		mailValue = mailTag.val();
		telValue = telTag.val();
		check = confirm("수정하시겠습니까?")	/* 체크메세지 띄워서 체크 */
		if(check){						/* 확인시 ajax로 수정처리페이지에 값을 넘김 */ 
			$.ajax({
				url: "member_update2.jsp",
				data:{
					pw: pwValue,
					mail: mailValue,
					tel: telValue
				},
				success: function(result){
					if(result == "수정성공"){	/* 결과에 따른 메세지 출력 */
						alert("수정되었습니다.")
					}else{
						alert("수정실패하였습니다.")
					}
				}
			})
		}
	})
	$('#deleteB').click(function() { /* 탈퇴 버튼 클릭시 */
		check = confirm("정말 탈퇴하시겠습니까?") /* 메세지 띄워서 확인 */
		if(check){					/* 탈퇴처리 페이지로 이동 */
			location.href="member_delete.jsp"
		}
	})
})
</script>
<link rel="stylesheet" href="css/project1.css">
</head>
<body>
<div id="total">
	<div id="menu_frame">
		<jsp:include page="menu_login.jsp"></jsp:include>
	</div>
	<hr>
	<div id="notice_frame">
		notice. 고객님의 여정이 코로나19(COVID-19)발생 상황에 영향을 받을 수 있으니 예약시 코로나 현황을 꼭 확인해주세요.
	</div>
	<div id="my_trip">
		<ul>
			<li class='my_trip_button'><a href="my_trip.jsp">회원정보</a></li>
			<li class='my_trip_button'><a href="reserv_list.jsp">예약정보</a></li>
		</ul>
	</div>
<div id="updown"></div>
	<div id="info_frame">
		<table id='my_info'>
			<tr>
				<td class="info_list">아이디</td>
				<td id="Id" class="info_list"><%=id %></td>
			</tr>
			<tr>
				<td class="info_list">비밀번호</td>
				<td class="info_list"><input id="inputPw" value="<%=dto2.getPw() %>"></td>
			</tr>
			<tr>
				<td class="info_list">이름</td>
				<td class="info_list"><%=dto2.getName() %></td>
			</tr>
			<tr>
				<td class="info_list">메일</td>
				<td class="info_list"><input id="inputMail" value="<%=dto2.getMail() %>"></td>
			</tr>
			<tr>
				<td class="info_list">전화번호</td>
				<td class="info_list"><input name = "tel" id="inputTel" value="<%=dto2.getTel() %>"></td>
			</tr>
		</table>
		<br><br>
		<div align="right">
			<button id='updateB' class='info_button'>수정하기</button>
			<button id='deleteB' class='info_button'>회원탈퇴</button>
		</div>
		
	</div>
	
		
</div>
</body>
</html>