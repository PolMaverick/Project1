<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DAO.PaymentInfoDAO"%>
<%@page import="hotel_reserv.DTO.PaymentInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
  		// session 불러오기 - 유저이름, 호텔주소, 호텔사진, 호텔위도, 호텔경도
  		String name = (String)session.getAttribute("name");
    	String mId = (String)session.getAttribute("id");
    	String hlPlace = (String)session.getAttribute("hl_place");
    	String hOutImg = (String)session.getAttribute("h_out_img");
    	double hlLat = (double)session.getAttribute("hl_lat");
    	double hlHar = (double)session.getAttribute("hl_har");
    	//String name = "홍길동";
	  	//String mId = "root";
	    //String hlPlace = "제주특별자치도 서귀포시 중문관광로72번길 35, 63535, 대한민국"; 
	    //String hOutImg = "img/106158_13336_5515.jpg";
	    //double hlLat = 33.248445;
	    //double hlHar = 126.410629;
     	
    	ReservDTO dto2 = new ReservDTO();
    	dto2.setM_id(mId);
    	// 예약DB read - 예약번호, 체크인날짜, 체크아웃날짜, 룸타입
    	ReservDAO dao2 = new ReservDAO();
     	ReservDTO dto3 = dao2.read2(dto2);
    	int reservNum = dto3.getReserv_num(); // 변수 선언
    	String checkIn = dto3.getCheck_in(); // 변수 선언
    	String checkOut = dto3.getCheck_out(); // 변수 선언
    	String roomSort = dto3.getRoom_sort(); // 변수 선언 
    	//int reservNum = 123456789;
    	//String checkIn = "2021.09.10 (금) 15:00";
    	//String checkOut = "2021.09.12 (일) 11:00";
    	//String roomSort = "프리미엄";
    	
    	// pay.jsp 불러오기 - 결제일시, 결제금액, 결제id, 호텔이름, 이메일 주소, 연락처
  		String dateTime = request.getParameter("dateTime");
    	String paymentTotal = request.getParameter("reservPrice");
    	String paymentData = request.getParameter("hName");
    	String mail = request.getParameter("mail");
    	String tel = request.getParameter("tel");
    	String paymentDateTime = dateTime.substring(0, 24);
    	int paymentTotal2 = Integer.parseInt(paymentTotal);
    	//String paymentData = "롯데호텔 제주";
    	//String mail = "hong@gmail.com";
    	//String tel = "010-1111-2222";
    	//String paymentDateTime = "2021/08/24 16:23:45";
    	//int paymentTotal2 = 200000;
    	
    	// payment db에 넣기
    	PaymentInfoDTO dto = new PaymentInfoDTO();
    	dto.setmId(mId); // dto에 넣기
    	dto.setPaymentData(paymentData); // dto에 넣기
    	dto.setPaymentDatetime(paymentDateTime); // dto에 넣기
    	dto.setPaymentTotal(paymentTotal2); // dto에 넣기
    	
    	PaymentInfoDAO dao = new PaymentInfoDAO();
    	dao.create(dto); // DAO처리한 결과값의 create
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JEJU Hotel Booking</title>
		<link rel="stylesheet" href="css/project1.css">
 		<style type="text/css">
  			#message_frame{
				font-weight: bold;
				font-size: 21px;
				text-align: left;
				margin: 30px 20px 30px 20px;
			}
			#covid19_frame{
				text-align: left;
				padding: 20px 80px 40px 80px;
				background-color: orange;
			}
			#content_frame{
				font-size: 18px;
				width: 550px;
				height: auto;
				margin: 0px 0px 0px 325px;
			}
			#hotel {
				width: 550px;
				height: 250px
				margin 0px 0px 0px 0px;
			}
			#mapImg {
				border: none;
			}
			#mapImg2 {
				border: none;
			} 
			th {
				border: none;
			}
			table {
				width: 530px;
				height: 150px;
				margin: 0px 10px 0px 10px;
			}
			img {
				height: 245px;
				width: 270px;
				object-fit: cover;
			}
			td {
				border-bottom: 1px solid;
			}
			body {
				font-size: 18px;
			}
			.left {
				text-align: left;
			}
			.right {
				text-align: right;
			}
			button {
				background-color: #0067a3;
				color: white;
				padding: 10px 30px 10px 30px;
				font-size: 18px;
				border-radius: 10px;
			}
		</style>
	</head>
	<body>
		<div id="total">
			<div id="menu_frame">
				<jsp:include page="menu_login.jsp"></jsp:include>
			</div>
			<hr>
		</div>
		<div id="content_frame">
			<div id="message_frame">
				<%= mId %>님, 감사합니다. 결제가 성공적으로 완료되었으며 예약이 확정 되었습니다.
			</div>
			<div id="covid19_frame">
				<p style="font-weight: bold">중요 공지사항:</p>
				코로나바이러스감염증-19(COVID-19)의 확산으로 인해 일부 여행이 제한될 수 있는 점 주지해주시기 바랍니다. 저희는 모든 고객에게 정부와 보건 당국의 여행 관련 주의사항을 준수할 것을 권고하고 있습니다. 계획이 바뀌어 예약을 변경하셔야 할 경우, 일반적인 예약 조건이 적용될 예정이므로 환불이 불가능할 수도 있습니다.
			</div>
			<br>
			<div id="pay_frame">
				<h3>결제 정보</h3>
				<table>
					<tr>
						<td class="left">예약번호 확인</td>
						<td class="right"><%= reservNum %></td>
					</tr>
					<tr>
						<td class="left">결제일시</td>
						<td class="right"><%= paymentDateTime %></td>
					</tr>
					<tr>
						<td class="left">결제금액</td>
						<td class="right"><%= paymentTotal2 %>원</td>
					</tr>
				</table>
			</div>
			<br>
			<div id="reserv_frame">
				<h3>예약 정보</h3>
						<p style="color: blue; font-weight: bold; margin: 0px 10px 0px 10px;"><%= paymentData %></p>
						<p style="margin: 0px 10px 0px 10px;"><%= hlPlace %></p><br>
						<table id="hotel">
							<tr>
								<td id="mapImg2">
									<img src="<%= hOutImg %>">
								</td>
								<td id="mapImg">
									<div id="map" style="width:270px; height:240px;"></div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e960539dae2829ccd1e66a9f22d356ba"></script>
									<script>
										var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
										    mapOption = {
										        center: new kakao.maps.LatLng(<%= hlLat %>, <%= hlHar %>), // 지도의 중심좌표
										        level: 3 // 지도의 확대 레벨
										    };
										var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
										// 마커가 표시될 위치입니다
										var markerPosition  = new kakao.maps.LatLng(<%= hlLat %>, <%= hlHar %>);
										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
										    position: markerPosition
										});
										// 마커가 지도 위에 표시되도록 설정합니다
										marker.setMap(map);
										// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
										// marker.setMap(null);
									</script>
								</td>
							</tr>
						</table>
						<br> 
				<table>
					<tr>
						<td class="left">체크인</td>
						<td class="right"><%= checkIn %> 15:00</td>
					</tr>
					<tr>
						<td class="left">체크아웃</td>
						<td class="right"><%= checkOut %> 11:00</td>
					</tr>
					<tr>
						<td class="left">룸타입</td>
						<td class="right"><%= roomSort %></td>
					</tr>
				</table>
			</div>
			<br>
			<div id="user_frame">
				<h3>투숙객 정보</h3>
				<table>
					<tr>
						<td class="left">투숙객</td>
						<td class="right"><%= name %></td>
					</tr>
					<tr>
						<td class="left">이메일 주소</td>
						<td class="right"><%= mail %></td>
					</tr>
					<tr>
						<td class="left">연락처</td>
						<td class="right"><%= tel %></td>
					</tr>
				</table>
			</div>
			<br>
			<div align="right">
				<form action="main_login.jsp">
				<button>메인화면으로</button>
				</form>
			</div>

		</div>
	</body>
</html>

<% session.removeAttribute("hl_place"); %>
<% session.removeAttribute("h_out_img"); %>
<% session.removeAttribute("hl_lat"); %>
<% session.removeAttribute("hl_har"); %>
      	