<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>admin chat</title>
<style>
.float-left{
float:left;
margin: 5px;
}
.message{
	width: 175px;
}
</style>
</head>
<body>

<div class="template" style="display:none">
	<!-- 유저와 주고받는 메시지가 보이는 부분 -->
	<textarea rows="15" cols="30" class="console" disabled="disabled"></textarea>
	<form>
		<!-- 메시지를 작성하는 텍스트 박스 -->
		<input type="text" class="message" onkeydown="if(event.keyCode === 13) return false;">
		<!-- 메시지 송신을 하는 버튼 -->
		<input value="Send" type="button" class="sendBtn">
	</form><br />
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

	//서버의 admin의 서블릿으로 웹 소켓을 한다.
	var webSocket = new WebSocket("ws://localhost:8889/chat/admin");
	webSocket.onopen = function(message) { };
	webSocket.onclose = function(message) { };
	webSocket.onerror = function(message) { };
	//서버로부터 메시지가 오면 
	webSocket.onmessage = function(message) {
		//제이슨 형태의 메시지
		let node = JSON.parse(message.data);
		
		//유저가 접속하면
		if(node.status === "visit") {
			let form = $(".template").html();
			//속성 data-key에 unique키를 넣고 body에 template을 추가
			form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form);
			$("body").append(form);
		
		//유저가 메시지를 보내면
		} else if(node.status === "message") {
			//key로 해당 div영역을 찾고
			let $div = $("[data-key='"+node.key+"']");
			//console영역을 찾아서
			let log = $div.find(".console").val();
			//메시지를 추가
			$div.find(".console").val(log + "(user) => " +node.message + "\n");
		
		//유저가 접속을 끊으면
		} else if(node.status === "bye") {
			//해당 키로 div를 찾아서 제거
			$("[data-key='"+node.key+"']").remove();
		}
	};
		
		//전송 버튼을 클릭하면
		$(document).on("click", ".sendBtn", function(){
			let $div = $(this).closest(".float-left");
			let message = $div.find(".message").val();
			let key = $div.data("key");
			let log = $div.find(".console").val();
			//채팅창에 메시지 추가
			$div.find(".console").val(log + "(me) => " + message + "\n");
			$div.find(".message").val("");
			
			//웹소켓으로 메시지전송
			webSocket.send(key+"#####"+message);
		});

		//엔터키를 누르면 버튼을 클릭하는 트리거를 발생
		$(document).on("keydown", ".message", function(){
			if(event.keyCode === 13) {
			$(this).closest(".float-left").find(".sendBtn").trigger("click");
			// form에 의해 자동 submit을 막는다.
			return false;
			}
			return true;
		});
	</script>
</body>
</html>
