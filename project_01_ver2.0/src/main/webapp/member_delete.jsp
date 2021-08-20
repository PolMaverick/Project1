<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* 로그인되어있는 아이디 변수에 저장*/
    String id = (String)session.getAttribute("id");
        
    MemberDTO dto = new MemberDTO();
    dto.setId(id);
    /* DAO의 delete메서드를 사용해 DB데이터 삭제   */
    MemberDAO dao = new MemberDAO();
    int result = dao.delete(dto);
    /* 삭제 결과를 세션에 저장 후 페이지 이동 */
    if (result == 1){
    	response.sendRedirect("main.jsp?msg=true");
    }else{
    	response.sendRedirect("my_trip.jsp?msg=false");
    }  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
.
</body>
</html>