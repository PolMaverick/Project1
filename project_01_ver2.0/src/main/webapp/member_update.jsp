<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
   		/* 입력받지 않는 id, name은 세션에서 받아와서 변수에 저장 */
    	String id = (String)session.getAttribute("id");		
   		String name = (String)session.getAttribute("name");
   		
    	/* 입력받은 데이터들은 변수에 저장  */
   		String pw = request.getParameter("pw");
   		String mail = request.getParameter("mail");
   		String tel = request.getParameter("tel");
	    
   		/* DTO에 데이터 저장 */
	    MemberDTO dto = new MemberDTO();
	    dto.setId(id);
	    dto.setPw(pw);
	    dto.setMail(mail);
	    dto.setTel(tel);
	     
	    /* DAO의 update메서드를 사용해 DB에 저장된 값을 수정 */
	    MemberDAO dao = new MemberDAO();
	    String result = dao.update(dto);
	    
	%>
<%= result%>