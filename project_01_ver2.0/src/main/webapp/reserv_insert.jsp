<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  
    	String m_id = (String)session.getAttribute("id"); //예약자id(from 준규DB)
    	String name = (String)session.getAttribute("name"); //예약자명(from 준규DB)
		String h_id = (String)session.getAttribute("h_id"); //호텔id(from 명준DB)
		String h_name = (String)session.getAttribute("h_name"); //호텔명(from 명준DB)
		//reserv_main의 form으로부터 받아온 값
		String room_sort = request.getParameter("room_sort");
    	String check_in = request.getParameter("check_in");
    	String check_out = request.getParameter("check_out");
    	String reserv_count = request.getParameter("reserv_count");
    	int reserv_count2 = Integer.parseInt(reserv_count);
    	String reserv_price = request.getParameter("reserv_price"); //00000원
    	//"금액(숫자)+원"인 값에서 숫자만 추출
    	String reserv_price2 = reserv_price.substring(0, reserv_price.length() - 1);
    	int reserv_price3 = Integer.parseInt(reserv_price2);
    	
    	//모든 컬럼의 값을 dto에 싣기
    	ReservDTO dto = new ReservDTO();
    	dto.setM_id(m_id);
    	dto.setName(name);
    	dto.setH_id(h_id);
    	dto.setH_name(h_name);
    	dto.setRoom_sort(room_sort);
    	dto.setCheck_in(check_in);
    	dto.setCheck_out(check_out);
    	dto.setReserv_count(reserv_count2);
    	dto.setReserv_price(reserv_price3);
    	//create 메서드에 dto 전달
    	ReservDAO dao = new ReservDAO();
    	dao.create(dto);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script type="text/javascript">
	//db처리 후 결제시스템 띄우기
	location.href="pay.jsp";
</script>
</head>
<body>
</body>
</html>