<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

String[] h_iddd = request.getParameterValues("lh");
//out.print(h_iddd.lensth); 

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="css/project1.css">
			<style>
				.container {
					display: grid;
					
					grid-template-columns: 1fr;
					grid-template-areas:
					"top"
					"filter"
					"map ";
				}
				
				.top{
					grid-area: top;
				}
				
				.map {
					grid-area: map;
				}
				
				.filter{
					grid-area: filter;
				}
				
				.list {
					grid-area: list;
					overflow-y: scroll;
					/* height: 800px;
					width: 100%; */
				}
			</style>
			
	</head>
		<body>
		
		<div class = "container">
		
			<div class = "top">
				<jsp:include page="menu_login.jsp"></jsp:include>
			</div>
			
			<div class = "filter">
				<%-- <%@ include file="hotel_filter.jsp"%> --%>
			</div>
			
			<div class = "map">
				<%@ include file="hotel_map_all.jsp"%>
			</div>
		</div>
	</body>
</html>