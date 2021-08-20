<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	    ReservDAO dao = new ReservDAO();
   		ArrayList<HotelInfoDTO> list2 = dao.read3(); // DAO처리한 결과값의 arraylist 받아오기
   		//System.out.println(list2.size());
    %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
 		<style type="text/css">
			img {
				height: 245px;
				width: 270px;
				object-fit: cover;
			}
			a {
				text-decoration: none;
			}
			#recommend{
				font-size: 18px;
				width: 1100px;
				height: auto;
				margin: 0px 0px 0px 50px;
			}
		</style>
	</head>
	<body>
		<div id="recommend">
			<h2>방금 예약된 호텔 추천</h2>
				<table>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
					%>
							<td>
								<a href="http://localhost:8899/project_01_ver2.0/hotel_detail.jsp?h_id=<%=dto5.getH_id()%>"><img src="<%= dto5.getH_out_img() %>" width="275" height="250"></a>
							</td>

					<%
 		  		  		}
						//System.out.println(list2.size());
    				%>
    				
					</tr>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
							
					%>
							<td>
								<font><a href="http://localhost:8899/project_01_ver2.0/hotel_detail.jsp?h_id=<%=dto5.getH_id()%>"><b><%= dto5.getH_name() %></b></a></font><br>
								<font><%= dto5.getHr_std_price() %>원</font><br>
							</td>
					<%
 		   				}
						//System.out.println(list2.size());
    				%>

				</table>
		</div> <!-- id recommend div end -->
	</body>
</html>