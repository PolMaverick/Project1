<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String reserv_num = request.getParameter("reserv_num"); //예약자id(from준규DB)
	int reserv_num2 = Integer.parseInt(reserv_num);
	String m_id = (String)session.getAttribute("id"); //예약자id(from준규DB)
	String name = (String)session.getAttribute("name"); //예약자명(from준규DB)
	
	ReservDTO dto = new ReservDTO();
	dto.setM_id(m_id);
	dto.setReserv_num(reserv_num2);
	
	ReservDAO dao = new ReservDAO();
	ReservDTO dto2 = dao.read(dto);
	
	String h_id = dto2.getH_id();
	String h_name = dto2.getH_name();
	
	HotelInfoDTO dto3 = new HotelInfoDTO();
	dto3.setH_id(h_id);
	HotelInfoDAO dao2 = new HotelInfoDAO();
	HotelInfoDTO dto4 = dao2.info_read(dto3);
	
	int h_std_price = dto4.getHr_std_price();
	int h_pre_price = dto4.getHr_pre_price();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking_mytrip</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#sortId').change(function() {
			//객실타입이 바뀌면 입퇴실 일자, 인원, 금액 초기화
			$('#countId').val('0');
			refactoring()
			$('#inId').val('yyyy-mm-dd');
			$('#outId').val('yyyy-mm-dd');
			//퇴실 일자 변경 시 인원, 금액 초기화
			$('#outId').change(function() {
				$('#countId').val('0');
				refactoring()
				//3일 이상 예약 불가 처리
				dayDiff()
				if(DateDiff > 3){
					alert('최대 3일까지만 예약할 수 있습니다.')
					$('#countId').val('0');
					refactoring()
					$('#outId').val('yyyy-mm-dd')
				}
				if(date1 > date2 || date1 == date2){
					alert('입실/퇴실 일자를 확인해주세요.')
					$('#outId').val('yyyy-mm-dd')
				}
				$('#countId').change(function() {
					refactoring()
					//입퇴실 일자 간의 차이가 0보다 크면 뺀 일수를 가격에 곱해주기
					//result1은 총금액, result2는 금액 계산과정
					dayDiff()
					if($('#sortId').val() == "스탠다드" && DateDiff > 0 && ($('#countId').val() == "1" || $('#countId').val() == "2")){ 
						result1 = (<%= h_std_price %> * DateDiff) + '원'
						result2 = <%= h_std_price %> + '원 ' + '     x      ' + DateDiff + '일     =     총금액 :  '
						$('#pString').val(result2); $('#priceId').val(result1);
					}else if($('#sortId').val() == "스탠다드" && DateDiff > 0 && $('#countId').val() == "3"){
						result1 = ((<%= h_std_price %> + 25000) * DateDiff) + '원'
						result2 = <%= h_std_price %> + '원 (+25000원)' + '   x   ' + DateDiff + '일   =   총금액 : '
						$('#pString').val(result2);	$('#priceId').val(result1);
					}
					if($('#sortId').val() == "프리미엄" && DateDiff > 0 && ($('#countId').val() == "1" || $('#countId').val() == "2")){ 
						result1 = (<%= h_pre_price %> * DateDiff) + '원'
						result2 = <%= h_pre_price %> + '원 ' + '     x      ' + DateDiff + '일     =     총금액 :  '
						$('#pString').val(result2);	$('#priceId').val(result1);
					}else if($('#sortId').val() == "프리미엄" && DateDiff > 0 && $('#countId').val() == "3"){
						result1 = ((<%= h_pre_price %> + 70000) * DateDiff) + '원'
						result2 = <%= h_pre_price %> + '원 (+70000원)' + '   x   ' + DateDiff + '일  =  총금액 : '
						$('#pString').val(result2);	$('#priceId').val(result1);
					}
				})//countId change
			})//outId change
		});//sortId change
	})//end
	
	//날짜 일수 계산
	function dayDiff() {
		date1 = $('#inId').val() //yyyy-mm-dd, String. 작은 수
		date2 = $('#outId').val() //큰 수
		arr1 = date1.split('-')
		arr2 = date2.split('-')
		d1 = new Date(arr1[0], arr1[1], arr1[2]) //Date객체로 변환
		d2 = new Date(arr2[0], arr2[1], arr2[2])
		diff = d2 - d1
		currDay = 24 * 60 * 60 * 1000 //시*분*초*밀리세컨
		DateDiff = parseInt(diff / currDay)
	}
	
	//유효성, 입실일자>퇴실일자 체크
	function check() {
		if($('#sortId').val()=="r_default" || $('#inId').val()=="" || $('#outId').val()=="" || $('#countId').val()=="0"){
			alert('모든 항목에 응답해주세요.')
			return false
		}
		date1 = $('#inId').val()
		date2 = $('#outId').val()
		if(date1 > date2 || date1 == date2){
			alert('입퇴실 일자를 확인해주세요.')
			return false
		}
	}
	//중복코드(가격 초기화) 정리
	function refactoring() {
		$('#pString').val('0원');
		$('#priceId').val('');
	}
</script>
<link rel="stylesheet" href="css/project1.css">
</head>
<body>
<!-- 상단 메뉴바 -->
<div id="total">
	<div id="menu_frame">
		<jsp:include page="menu_login.jsp"></jsp:include> <!-- ★★합할 때 주석 풀기★★ -->
	</div>
	<hr>
	<div id="notice_frame">
		notice. 고객님의 여정이 코로나19(COVID-19)발생 상황에 영향을 받을 수 있으니 예약시 코로나 현황을 꼭 확인해주세요.
	</div>
<!-- 좌측 메뉴바(회원정보, 예약정보) -->	
	<div id="my_trip">
		<ul>
			<li class='my_trip_button'><a href="my_trip.jsp">회원정보</a></li>
			<li class='my_trip_button'><a href="reserv_list.jsp">예약정보</a></li>
		</ul>
	</div>
	<div id="updown" style="margin-right:25px"></div>
</div><br><br>
	<b><%= m_id %>님의 예약 정보</b>
	<hr style="width: 220px; color: lightgray; margin-bottom: 10px">
	<form action="reserv_update.jsp" onsubmit="return check()">
	<input type="hidden" name="reserv_num" value="<%= reserv_num2 %>">
		<table border='1'>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">예약 번호</td>
				<td width="630px" height="30px"><%=dto2.getReserv_num()%></td>
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">예약자id</td>
				<td width="630px" height="30px"><%= m_id %></td> <!-- 세션값으로 -->
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">예약자명</td>
				<td width="630px" height="30px"><%= name %></td> <!-- 세션값으로 -->
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">호텔명</td>
				<td width="630px" height="30px"><%= h_name %></td> <!-- 세션값으로 -->
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">객실 타입</td>
				<td width="630px" height="30px"><select name="room_sort" id="sortId">
								<option value="r_default">--객실선택--
								<option value="스탠다드">스탠다드
								<option value="프리미엄">프리미엄
						</select></td> 
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">입실 일자</td>
				<td width="630px" height="30px"><input type="date" name="check_in" id="inId"></td>
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">퇴실 일자</td>
				<td width="630px" height="30px"><input type="date" name="check_out" id="outId"></td>
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">투숙 인원</td>
				<td style="font-style: italic; font-size: 12px; color: blue;" width="630px" height="30px"><select name="reserv_count" id="countId">
								<option value="0">--인원선택--
								<option value="1">1명
								<option value="2">2명
								<option value="3">3명
						</select> (기준 2인/최대 3인, 기준 인원 초과시 추가비용 발생. 스탠다드-25000원, 프리미엄-70000원)</td>
			</tr>
			<tr>
				<td bgcolor="beige" width="150px" height="30px">결제 금액</td>
				<td width="630px" height="30px"><input id="pString" value="0원" style="border:none; width: 250px" readonly>
			<input id="priceId" name="reserv_price" style="border:none; font-weight: bold; font-style: italic" readonly></td>
			</tr>
		</table>
		<button style="float:left; width: 120px; height: 30px; margin-top: 10px; margin-right: 20px">예약 변경</button>
	</form>
		<a href="reserv_list.jsp"><button style="float:left; width: 120px; height: 30px; margin-top: 10px; margin-right: 20px">변경 취소</button></a>
</body>
</html>