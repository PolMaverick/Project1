<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//로그인한 id로 예약된 글들을 검색하기 위해 id값을 세션 받아옴
	    String m_id = (String)session.getAttribute("id"); //예약자id(준규DB)
			
	    ReservDTO dto = new ReservDTO();
	    dto.setM_id(m_id);
	    
	    ReservDAO dao = new ReservDAO();
		ArrayList<ReservDTO> list = dao.readAll(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script type="text/javascript">
	function cancel() {
		yesno = confirm('예약을 취소하시겠습니까?')
		if (yesno) {
			location.href="reserv_delete.jsp"
		}
	}
</script>
<link rel="stylesheet" href="css/project1.css">
</head>
<body>
<!-- 예약정보탭 누르면 보이는 예약 목록 페이지입니다. -->
<!-- 상단 메뉴바(로그인 후) -->
<div id="total">
	<div id="menu_frame">
<jsp:include page="menu_login.jsp"></jsp:include>
	</div>
	<hr>
	<div id="notice_frame">
		notice. 고객님의 여정이 코로나19(COVID-19)발생 상황에 영향을 받을 수 있으니 예약시 코로나 현황을 꼭 확인해주세요.
	<!-- 좌측 메뉴바(회원정보, 예약정보) -->	
	</div>
		<div id="my_trip">
		<ul>
			<li class='my_trip_button'><a href="my_trip.jsp">회원정보</a></li>
			<li class='my_trip_button'><a href="reserv_list.jsp">예약정보</a></li>
		</ul>
	</div>
<div id="updown" style="margin-right:25px"></div>
</div>
<br><br><b>전체 예약된 객실의 개수: <%= list.size() %>개</b><br>
<hr style="width: 220px; color: lightgray; margin-bottom: 10px">
<table border=1>
	<tr bgcolor="beige">
		<th width="100">예약 번호</th>
		<th width="100">예약자명</th>
		<th width="120">호텔명</th>
		<th width="100">객실 타입</th>
		<th width="100">입실 일자</th>
		<th width="100">퇴실 일자</th>
		<th width="100">투숙 인원</th>
		<th width="100">결제 금액</th>
		<th width="100"></th>
	</tr>
<%
	for(ReservDTO dto6 : list){ 
%>
	<tr align="center">
		<td><%= dto6.getReserv_num() %></td>
		<td><%= dto6.getName() %></td> 
		<td><%= dto6.getH_name() %></td> 
		<td><%= dto6.getRoom_sort() %></td>
		<td><%= dto6.getCheck_in() %></td>
		<td><%= dto6.getCheck_out() %></td>
		<td><%= dto6.getReserv_count() %></td>
		<td><%= dto6.getReserv_price() %></td>
		<td>
	<a href= "reserv_up.jsp?reserv_num=<%=dto6.getReserv_num()%>">
		<button style="width:100px">예약변경</button></a>
	<a href= "reserv_delete.jsp?reserv_num=<%=dto6.getReserv_num()%>">
	<button style="width:100px">예약취소</button></a>
		</td>
	</tr>
<% } %>
</table>
</body>
</html>