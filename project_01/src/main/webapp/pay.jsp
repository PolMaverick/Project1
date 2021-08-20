<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 		
		// session(member) 불러오기 - 유저id, 전화번호, 이메일
    	String id = (String)session.getAttribute("id");
    	String tel = (String)session.getAttribute("tel");
    	String mail = (String)session.getAttribute("mail");
    	//String id = "root";
    	//String tel = "010-1111-2222";
    	//String mail = "hong@gmail.com";
    	
    	ReservDTO dto = new ReservDTO();
    	dto.setM_id(id); // 세션으로 불러온 해당 ID row 값 DTO에 넣기
    	// reservDB read - 호텔이름, 총금액
    	ReservDAO dao2 = new ReservDAO();
     	ReservDTO dto3 = dao2.read2(dto); // DAO처리한 결과값 받아오기
    	String hName = dto3.getH_name(); // 변수 선언
    	int reservPrice = dto3.getReserv_price(); // 변수 선언
    	//String hName = "롯데호텔 제주";
    	//int reservPrice = 200000;
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- jQuery -->
 		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<!-- iamport.payment.js -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<!-- 여기에 new Date().getTime() 변수에 넣어주기 -->
		<script type="text/javascript">
			var IMP = window.IMP; // 생략가능
			IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			dateTime = new Date(); //DATETIME 변수 선언
			//IMP.request_pay({json}, function(x) {}) 아래 코드 요약
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(), // date,time location
				name : '<%= hName %>', // 호텔명(reservDB) location
				amount : <%= reservPrice %>, // 총금액(reservDB) location
				buyer_email : /* 'hong@gmail.com' */'<%= mail %>', // 이메일(member세션) location
				buyer_name : /* 'hong' */'<%= id %>', // id(member세션) location
				buyer_tel : /* '010-1111-2222' */'<%= tel %>', // 전화번호(member세션) location
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : 'www.yourdomain.com/payments/complete'
				}, function(rsp) {
					if ( rsp.success ) { // 결제가 성공했을 경우
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						console.log(msg)
						location.href = "payConfirm.jsp?mId=<%= id %>&dateTime=" + dateTime + "&reservPrice=<%= reservPrice %>&hName=<%= hName %>&mail=<%= mail %>&tel=<%= tel %>" /* 위의 변수들 입력 */
					} else { // 결제가 실패 했을 경우
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						console.log(msg)
					}
			});
		</script>
	</head>
	<body>
	</body>
</html>