<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="hotel_reserv.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = request.getParameter("id");		//입력값 받아서 변수에 저장
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	String mail = request.getParameter("mail");
    	String tel = request.getParameter("tel");
    	
    	MemberDTO dto = new MemberDTO();			//DTO에 입력값 저장
    	dto.setId(id);
    	dto.setPw(pw);
    	dto.setName(name);
    	dto.setMail(mail);
    	dto.setTel(tel);
    	
    	MemberDAO dao = new MemberDAO();
    	String result = dao.create(dto);	//DAO의 create메서드를 사용하여 DB에 입력
    %>
<%= result%> 