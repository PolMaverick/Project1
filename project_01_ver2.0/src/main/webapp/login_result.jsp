<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String id = request.getParameter("id");		/* 넘겨준 입력값들을 변수에 저장 */
	    String pw = request.getParameter("pw");
	    
	    MemberDTO dto = new MemberDTO();	/* DTO에 입력값들 저장 */
	    dto.setId(id);
	    dto.setPw(pw);
	    
	    MemberDAO dao = new MemberDAO();
	    /* DAO의 read메서드를 사용해 입력받은 아이디에 해당하는 row를 검색하여 DTO에 넣어 가져온다*/
	    MemberDTO dto2 = dao.read(dto);	
	    	    
	    if(pw.equals(dto2.getPw())){	/* DB에서 가져온 패스워드와 입력받은 패스워드가 동일할 경우 */
	    	
	    	/* 호텔 예약에 필요한 데이터들을 로그인이 되어있는 동안 사용할 수 있도록 세션에 저장한다. */
	    	session.setAttribute("id",dto2.getId());
		    session.setAttribute("name",dto2.getName());
		    session.setAttribute("mail",dto2.getMail());
		    session.setAttribute("tel",dto2.getTel());
	    	response.sendRedirect("main_login.jsp");	/* 로그인된 메인페이지로 이동 */
	    	
	    }else{		/* DB에서 가져온 패스워드와 입력받은 패스워드가 동일하지 않을 경우 */
	    	/* 에러메세지를 세션에 저장하고 로그인페이지로 다시 이동 */
    		session.setAttribute("errMsg_login", "로그인 정보가 올바르지 않습니다.");
    		response.sendRedirect("login.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>.</title>
</head>
<body>
.
</body>
</html>
