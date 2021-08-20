<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="hotel_reserv.DTO.ReservDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.ReservDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    ReservDAO dao = new ReservDAO();
 		// DAO처리한 결과값들의 list 받아오기
   		ArrayList<HotelInfoDTO> list2 = dao.read3();
   		System.out.println(list2.size());
   		System.out.println(list2);
   		
    
    	String msg = request.getParameter("msg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU Hotel Booking</title>
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
<link rel="stylesheet" href="css/project1.css">
<script type="text/javascript">
<% if (msg != null){ %>
alert('탈퇴 성공!');	
location.href="main.jsp"
<%}%>
</script>
</head>
<body>
<div id="total">
	<div id="menu_frame">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<hr>
	<div id="notice_frame">
		notice. 고객님의 여정이 코로나19(COVID-19)발생 상황에 영향을 받을 수 있으니 예약시 코로나 현황을 꼭 확인해주세요.
	</div>
	<div id="main_frame">
	<div id="recommend">
			<h2>방금 예약된 호텔 추천</h2>
				<table>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
					%>
							<td>
								<a href="http://localhost:8889/project_01_ver2.0/hotel_map_detail.jsp?h_id=<%=dto5.getH_id()%>">
								<img src="<%=dto5.getH_out_img()%>" width="275" height="250"></a>
							</td>

					<%
 		  		  		}
						System.out.println(list2.size());
    				%>
    				
					</tr>
					<tr align="center"> <!-- 중앙정렬 -->
					<%
						for(HotelInfoDTO dto5 : list2){ // read한 list2 길이 만큼 반복
							
					%>
							<td>
								<font><a href="http://localhost:8889/project_01_ver2.0/hotel_map_detail.jsp?h_id=<%=dto5.getH_id()%>">
								<b><%= dto5.getH_name() %></b></a></font><br>
								<font><%= dto5.getHr_std_price() %>원</font><br>
							</td>
					<%
 		   				}
						//System.out.println(list2.size());
    				%>

				</table>
		</div> <!-- id recommend div end -->
	</div>
</div>
</body>
</html>