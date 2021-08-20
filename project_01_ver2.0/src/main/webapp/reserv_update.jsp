<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String reserv_num = request.getParameter("reserv_num");
    	int reserv_num2 = Integer.parseInt(reserv_num);
		  	String room_sort = request.getParameter("room_sort");
    	String check_in = request.getParameter("check_in");
    	String check_out = request.getParameter("check_out");
    	String reserv_count = request.getParameter("reserv_count");
    	int reserv_count2 = Integer.parseInt(reserv_count);
    	String reserv_price = request.getParameter("reserv_price"); //00000원
    	//금액(숫자)+원인 값에서 숫자만 추출
    	String reserv_price2 = reserv_price.substring(0, reserv_price.length() - 1);
    	int reserv_price3 = Integer.parseInt(reserv_price2);
	
		ReservDTO dto = new ReservDTO();
		dto.setReserv_num(reserv_num2);
		dto.setRoom_sort(room_sort);
		dto.setCheck_in(check_in);
		dto.setCheck_out(check_out);
		dto.setReserv_count(reserv_count2);
		dto.setReserv_price(reserv_price3);
		
		ReservDAO dao = new ReservDAO();
		int result = dao.update(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script type="text/javascript">
	<%
		if(result != 0){ %>
			alert('예약정보 수정을 성공했습니다.')
			location.href="reserv_list.jsp"
		<%}else{%>
			alert('예약정보 실패했습니다. 다시 시도해주세요.')
		<%}
	%>
</script>
</head>
<body>
</body>
</html>