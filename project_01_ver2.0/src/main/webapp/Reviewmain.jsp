<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.ReviewDAO"%>
<%@page import="hotel_reserv.DTO.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String m_id = (String)session.getAttribute("id"); //유저id( DB)
	 %>
     <%
    ReviewDAO dao = new ReviewDAO();
    ArrayList<ReviewDTO> list = dao.read(); //ArrayList<게시판Bag>
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
<div id="center">
			<font color="#7D5A38" size="5">review</font>
			<table border=1>
			
			<tr>
			<th>번호</th>
			<th> 아이디</th>
			<th>날짜</th>
			<th>이용호텔</th>
			<th>서비스</th>
			<th>청결도</th>
			<th>가성비</th>
			<th>별 점</th>
			<th>내용</th>
			<th colspan="2">수정/삭제</th>
			</tr>
	         
	       
			
	<%
for(ReviewDTO dto : list){
%>
   <tr bgcolor=#F8E9DB>
	<td> <%=dto.getWritern()%></td>
         <td><%=dto.getM_id()%>
         <a href="http://localhost:8889/project_01/rread.jsp?m_id=<%=dto.getM_id()%>"></a></td>
    <td> <%=dto.getToday()%></td> 
    <td> <%=dto.getH_name()%></td> 
	<td> <%=dto.getService()%></td> 
	<td> <%=dto.getClean()%></td> 
	<td> <%=dto.getBang()%></td> 
	<td> <%=dto.getGrade()%></td> 
	<td> <%=dto.getContent()%></td>
	<td>
	<a href= "Reviewupdate.jsp?writern=<%=dto.getWritern()%>&h_name=<%=dto.getH_name()%>">
	<button>수정</button></a>
	</td>
	<td>
	<a href= "rdelete.jsp?writern=<%=dto.getWritern()%>"><button>삭제</button></a>
	</td>
      </tr>
	  <%
      }
      %>
			</table>
      <a href="Reviewwrite.jsp"><button>글쓰기</button></a>			
			</div>
</body>
</html>