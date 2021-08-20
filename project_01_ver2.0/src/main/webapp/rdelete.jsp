<%@page import="hotel_reserv.DAO.ReviewDAO"%>
<%@page import="hotel_reserv.DTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String m_id = request.getParameter("m_id");
String writern = request.getParameter("writern");


ReviewDTO dto = new ReviewDTO();
dto.setM_id(m_id);
dto.setWritern(writern);

ReviewDAO dao = new ReviewDAO();
int result = dao.delete(dto);
String text= "게시글 삭제에 실패했습니다. 재신청해주세요";
if(result == 1){
	text = "게시글 삭제 성공 했습니다.";
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
	alert('리뷰 삭제가 완료되었습니다')
<%} %>
</script>
</head>
<body>게시물삭제 처리 요청함.
실행 결과는 <%= text %>
</body>
</html>