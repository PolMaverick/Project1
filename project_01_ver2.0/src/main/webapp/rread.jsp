<%@page import="hotel_reserv.DAO.ReviewDAO"%>
<%@page import="hotel_reserv.DTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String m_id = request.getParameter("m_id");

ReviewDTO dto = new ReviewDTO();
dto.setM_id(m_id);

ReviewDAO dao = new ReviewDAO();
ReviewDTO dto2 = dao.read(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>내가 쓴 글 검색 결과입니다</h3>
	<hr color = "pink">
	<table border=1>
	<tr bgcolor = "#C29D79">
	<td>검색된 아이디는 <%=dto2.getM_id()%></td> 
	<td>검색된 날짜는 <%=dto2.getToday()%></td> 
	<td>검색된 호텔이름은 <%=dto2.getH_name()%></td> 
	<td>검색된 글번호는 <%=dto2.getWritern()%></td> 
	<td>검색된 서비스 점수는 <%=dto2.getService()%></td> 
	<td>검색된 청결 점수는 <%=dto2.getClean()%></td> 
	<td>검색된 가성비 점수는 <%=dto2.getBang()%></td> 
	<td>검색된 별점은 <%=dto2.getGrade()%></td> 
	<td>검색된 후기내용은 <%=dto2.getContent()%></td>
	</tr>
	</table>
</body>
</html>