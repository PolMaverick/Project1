<%@page import="hotel_reserv.DAO.ReviewDAO"%>
<%@page import="hotel_reserv.DTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String m_id = request.getParameter("m_id");
String today = request.getParameter("today");
String h_name = request.getParameter("h_name");
String service = request.getParameter("service");
String clean = request.getParameter("clean");
String bang = request.getParameter("bang");
String grade = request.getParameter("grade");
String content = request.getParameter("content");
String writern = request.getParameter("writern");

//jsp에서 자동 import:클릭 후, 컨트롤 +쉬푸트+m
ReviewDTO dto = new ReviewDTO();
//session.setAttribute("m_id",dto.getM_id());
dto.setM_id(m_id);
dto.setToday(today);
dto.setH_name(h_name);
dto.setService(service);
dto.setClean(clean);
dto.setBang(bang);
dto.setGrade(grade);
dto.setContent(content);
dto.setWritern(writern);

ReviewDAO dao = new ReviewDAO();
int result = dao.create(dto);
String text = "리뷰 등록이 실패했습니다. 재등록해주세요";
if(result == 1){
	text = "리뷰 등록이 완료되었습니다.";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%if(result == 1){%>
location.href="Reviewmain.jsp"
	alert('리뷰 등록이 완료되었습니다')
<%}else{ %>
location.href="Reviewmain.jsp"
alert('리뷰 등록이 실패했습니다. 다시 입력해주세요')
<%}%>

</script>
</head>
<body bgcolor="yellow">입력된 리뷰의 sql문을 전송함.
실행 결과는<%= text %>
</body>
</html>