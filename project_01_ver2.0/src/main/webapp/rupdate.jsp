<%@page import="hotel_reserv.DAO.ReviewDAO"%>
<%@page import="hotel_reserv.DTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String writern = request.getParameter("writern");
String m_id = request.getParameter("m_id");
String today = request.getParameter("today");
String h_name = request.getParameter("h_name");
String service = request.getParameter("service");
String clean = request.getParameter("clean");
String bang = request.getParameter("bang");
String grade = request.getParameter("grade");
String content = request.getParameter("content");

ReviewDTO dto = new ReviewDTO();
dto.setWritern(writern);
dto.setM_id(m_id);
dto.setToday(today);
dto.setH_name(h_name);
dto.setService(service);
dto.setClean(clean);
dto.setBang(bang);
dto.setGrade(grade);
dto.setContent(content);


ReviewDAO dao = new ReviewDAO();
int result = dao.update(dto);
String text= "회원정보 수정 실패했습니다. 재신청해주세요";
if(result == 1){
	text = "회원정보수정에 성공 했습니다.";
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
	alert('리뷰 수정이 완료되었습니다')
<%} %>

</script>
</head>
<body>수정처리 요청함.
실행 결과는 <%= text %>
</body>
</html>
