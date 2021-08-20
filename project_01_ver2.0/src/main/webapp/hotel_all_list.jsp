<%@page import="java.util.List"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
HotelInfoDAO dao = new HotelInfoDAO();
ArrayList<HotelInfoDTO> list = dao.all_info();

String[] h_ids = request.getParameterValues("lm");
%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
		<style>
		.hf {
			background: #eaeaea;
			display: table-row;
		}
		</style>
	</head>
	<body>
		<div style="overflow-y:scroll; height:800px; width:100%">
		<%
		//List<String> testList = new ArrayList<String>();
		for ( HotelInfoDTO dto : list) {
			for (int j=0; j<h_ids.length; j++){
				String test = h_ids[j];
				if (dto.getH_id().equals(test)){
		%>	
		<table border="1" >
		
		<tr>
		<!-- 숙박시설 종류 호텔 성급 분류 -->
		<td colspan="2">
		<%
		String h_rank_result = "error";
		
		if (dto.getH_rank() >= 3){ // h_rank 값이 3 이상부터 1성급 호텔
			for (int i = 0; i < dto.getH_rank()-2; i++) {
				%> <span class="iconify" data-inline="false"
		data-icon="emojione-v1:star"></span> <%}
		} else {
			
			switch(dto.getH_rank()){ // 호텔 성급을 표현하기 위해서 만들었지만 이것을 활용해 민박/여관/모텔을 구분
			case 0 : h_rank_result = "민박"; break;
			case 1 : h_rank_result = "여관"; break;
			case 2 : h_rank_result = "모텔"; break;
			}%> <%=h_rank_result%> <%
		}
		%>
		</td>

		<!-- 호텔 외관 이미지 -->
		<td rowspan="5"
		style="height: 100px; width: 100px; padding-top: 6px;"><img
		src="<%=dto.getH_out_img()%>"
		style="height: 160px; width: 100px; object-fit: cover"></td>
		</tr>

		<tr>
		<!-- 호텔 이름 및 호텔 상세 페이지 이동 -->
		<td colspan="2" style="width: 100%"><a
			href="http://localhost:8889/project_01_ver2.0/hotel_map_detail.jsp?h_id=<%=dto.getH_id()%>">
				<font size="2px"><%= dto.getH_name() %></font>
		</a>
		</td>
		</tr>

		<tr>
		<!-- 호텔 객실 가격 -->
		<td colspan="2"><font size="2px"><%=dto.getHr_std_price()%>원 ~ <%=dto.getHr_pre_price()%>원</font></td>
		</tr>

		<tr>
		<!-- 호텔 시설 종류별 존재 여부 아이콘 표시 -->
		<td colspan="2" rowspan="2" style="width: 150px">
		<%
		if(dto.getHf_wifi() == 1){%>
			<div class="hf">
				<span class="iconify" data-inline="false" data-icon="fa-solid:wifi"
					style="font-size: 12px; vertocal-align: middle"></span> <font
					size="1px">와이파이</font>
			</div> <%
		}
		if(dto.getHf_swim() ==	1){%>
			<div class="hf">
				<span class="iconify" data-inline="false" data-icon="bx:bx-swim"
					style="font-size: 15px;"></span> <font size="1px">수영시설</font>
			</div> <%
		}
		
		if(dto.getHf_fitness() == 1){%>
			<div class="hf">
				<span class="iconify" data-inline="false"
					data-icon="ic:round-fitness-center" style="font-size: 14px;"></span>
				<font size="1px">운동시설</font>
			</div> <%
		}
		%>
		
		<!-- 호텔 아이디 -->
		<input type="hidden" class="list_h_id" value=<%= dto.getH_id() %>>
		
		<!-- 호텔 시설이 없을 경우 -->
		<%	
		int [] h_facility = {dto.getHf_wifi(), dto.getHf_swim(), dto.getHf_fitness()};
		int hf_count=0;
		for(int i = 0; h_facility.length > i; i++){
			if (h_facility[i] == 0){				
			hf_count++;
				if(hf_count == h_facility.length){%>
				<div style ="text-align:center"><font size="1px"> 숙박 편의 시설 없음</font></div>
				<%
				}
			}
		}
		%>
		</td>
		<tr>
		</tr>
		
		</table>
		<%
				}
			}
		}
		%>
		</div>

		<script type="text/javascript">
				var list_h_id = document.getElementsByClassName("list_h_id");
				var list_h_id_arry = "";
				for (var jj=0; jj<list_h_id.length; jj++){
					list_h_id_arry.push(list_h_id[jj].value);
				}
				//alert(list_h_id_arry);
				
				$(function(){
					$(document).click(function(){ // 지도를 클릭하게 되면 이벤트 실행
						var request = $.ajax({
						  url: "hotel_list_map.jsp", // 어디에서 받아올건가
						  method: "get",
						  traditional: true,
						  data: {
							  "lh": list_h_id_arry
						  } // 값을 넘겨서 매개변수로 활용하는 부분
						  //dataType: "text" // 받아올 값을 HTML문으로 받아오는 부분
						});
						request.done(function(data) {
							alert(data);
						});
						request.fail(function( jqXHR, textStatus ) {
							alert("실");
						});
					});
				});
		</script>
		