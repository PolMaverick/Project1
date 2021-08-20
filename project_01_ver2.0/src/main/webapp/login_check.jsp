<%@page import="hotel_reserv.DAO.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id"); //회원가입 페이지에서 입력받은 아이디
    MemberDAO dao = new MemberDAO(); 
    List<String> idAll = dao.idAll(); //memberDB에 저장된 모든 아이디를 가져오는 함수 사용
    String result = "사용가능한 아이디입니다.";
    for (String i: idAll){ //모든 아이디를 입력받은 아이디와 같은지 체크해서 같으면 사용중인 아이디
    	if(i.equals(id)){
    		result = "이미 사용중인 아이디입니다.";
    	} 
    }
    %>
    <%= result%>
    
    <!-- 아이디를 전부 가져오지 말고 read를 사용하여 결과값이 있으면 이미 사용중인 아이디로 체크했으면 더 좋았을듯 -->