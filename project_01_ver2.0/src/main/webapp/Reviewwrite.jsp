<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% String m_id = (String)session.getAttribute("id"); //유저id( DB)
	 %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking</title>
<link rel="stylesheet" href="css/project1.css">

</head>
<body>
<div id="total">
	<div id="menu_frame">
		<jsp:include page="menu_login.jsp"></jsp:include>
	</div><br>
	<hr>		
	<br>
</div>
<font color="#7D5A38" size="5">리뷰 작성</font>
<div id="center">
<form action="insert.jsp">
				날짜(20xx-00-00): <input name="today"><br> 이용한 호텔: <input name="h_name"><br>
					서비스점수:
<input type="radio" value="1" name="service">1
<input type="radio" value="2" name="service">2
<input type="radio" value="3" name="service">3
<input type="radio" value="4" name="service">4
<input type="radio" value="5" name="service">5<br>
		
				청결 점수: 
				<input type="radio" value="1" name="clean">1
<input type="radio" value="2" name="clean">2
<input type="radio" value="3" name="clean">3
<input type="radio" value="4" name="clean">4
<input type="radio" value="5" name="clean">5<br>
				가성비 점수:  
				<input type="radio" value="1" name="bang">1
<input type="radio" value="2" name="bang">2
<input type="radio" value="3" name="bang">3
<input type="radio" value="4" name="bang">4
<input type="radio" value="5" name="bang">5<br>
					별점:  
		<input type="radio" value="1" name="grade">1
<input type="radio" value="2" name="grade">2
<input type="radio" value="3" name="grade">3
<input type="radio" value="4" name="grade">4
<input type="radio" value="5" name="grade">5<br>

				내용:<textarea rows=10 cols="20" placeholder="후기를 입력해주세요" name="content"></textarea><br>
				<input type="hidden" value="<%=m_id%>" name="m_id">
				<button>리뷰 등록</button>
			</form>
				<a href="Reviewmain.jsp"><button>리뷰 목록</button></a>
			</div>
</body>
</html>