<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ReservDAO dao = new ReservDAO();
		ArrayList<HotelInfoDTO> list2 = dao.read3(); // DAO처리한 결과값의 arraylist 받아오기
		System.out.println(list2.size());
		System.out.println(list2);
		
    	String id = (String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking</title>
<style type="text/css">
#textMessage{
	width: 175px;
}
img {
	height: 245px;
	width: 270px;
	object-fit: cover;
}
a {
	text-decoration: none;
}
#recommend{
	font-size: 18px;
	width: 1100px;
	height: auto;
	margin: 0px 0px 0px 50px;
}
</style>
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
	<div id="main_frame">
		<div id="recommend">
			<h2>방금 예약된 호텔 추천</h2>
				<table>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
					%>
							<td>
								<a href="http://localhost:8889/project_01_ver2.0/hotel_map_detail.jsp?h_id=<%=dto5.getH_id()%>">
								<img src="<%= dto5.getH_out_img() %>" width="275" height="250"></a>
							</td>

					<%
 		  		  		}
						System.out.println(list2.size());
    				%>
    				
					</tr>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
							
					%>
							<td>
								<font><a href="http://localhost:8889/project_01_ver2.0/hotel_map_detail.jsp?h_id=<%=dto5.getH_id()%>">
								<b><%= dto5.getH_name() %></b></a></font><br>
								<font><%= dto5.getHr_std_price() %>원</font><br>
							</td>
					<%
 		   				}
						//System.out.println(list2.size());
    				%>

				</table>
		</div> <!-- id recommend div end -->
	</div>
</div>

<div id="chat_frame">
		<div id="chat">
			<!-- 서버와 주고받는 메시지가 보이는 부분 -->
			<textarea id="messageTextArea" rows="15" cols="30" disabled="disabled"></textarea>
			<form>
				<!-- 메시지를 작성하는 텍스트 박스 -->
				<input id="textMessage" type="text" onkeydown="return enter()">
				<!-- 메시지 송신을 하는 버튼 -->
				<input onclick="sendMessage()" value="Send" type="button">
			</form><br/>
		</div>
</div>
	<script type="text/javascript">
	
		/* 서버의 broadsocket의 서블릿으로 웹 소켓을 한다. */
		var webSocket = new WebSocket("ws://localhost:8889/chat/broadsocket");		
		var messageTextArea = document.getElementById("messageTextArea");
		
		/* 접속시 메시지가 보이는 부분에 문구 출력 */
		webSocket.onopen = function(message) {
			messageTextArea.value += "Server connect... success!!\n";
		};
		
		/* 에러가 발생했을때 문구 출력 */
		webSocket.onerror = function(message) {
			messageTextArea.value += "error...\n";
		};
		
		/* 서버로부터 메시지가 도착하면 출력 */
		webSocket.onmessage = function(message) {
			messageTextArea.value += "(admin) => " + message.data + "\n";
		};
		
		/* 서버로 메시지를 발송하는 함수
		Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행 */
		function sendMessage() {
			let message = document.getElementById("textMessage");
			/* 입력한 값을 채팅창에 출력 */
			messageTextArea.value += "(<%= id%>) => " + message.value + "\n";
			/* 입력한 값을 소켓으로 전송 */
			webSocket.send(message.value);
			/* 입력칸 초기화 */
			message.value = "";
		}
		
		function enter() {
			/* 엔터를 누르면 (keyCode 13 == 엔터)*/
			if(event.keyCode === 13) {
				/* 함수 실행 */
				sendMessage();
				/* form에 의해 자동 submit을 막는다. */
				return false;
			}
			return true;
		}
	</script>
</body>
</html>