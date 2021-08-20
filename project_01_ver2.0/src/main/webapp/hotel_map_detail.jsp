<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//DB에서 데이터 값 불러오기
HotelInfoDAO dao3 = new HotelInfoDAO();
ArrayList<HotelInfoDTO> list = dao3.all_info();

//JSON 형태의 객체를 담을 배열 객체 생성
JSONArray mapLocationAarray = new JSONArray();

//불러온 DB의 리스트 만큼 인덱스가 1씩 증가하면서 반복 
for ( HotelInfoDTO dto_map : list) {

//호텔의 경도와 위도, 이름, 고유번호 데이터가 담긴 mapLocation JSON 객체 생성
JSONObject mapLocation = new JSONObject();

//생성된 JSON객체에 데이터 키:값 저장
mapLocation.put("H_id", dto_map.getH_id());
mapLocation.put("H_name", dto_map.getH_name());
mapLocation.put("Hl_lat", dto_map.getHl_lat());
mapLocation.put("Hl_har", dto_map.getHl_har());

//데이터 저장이 완료된 JSON객체를 JSON배열에 저장  
mapLocationAarray.add(mapLocation);
}

String h_id = request.getParameter("h_id");

HotelInfoDTO bag = new HotelInfoDTO();
bag.setH_id(h_id);

HotelInfoDAO dao2 = new HotelInfoDAO();
HotelInfoDTO bag2 = dao2.info_read(bag);

session.setAttribute("hr_std_img1", bag2.getHr_std_img1());
session.setAttribute("hr_std_img2", bag2.getHr_std_img2());
session.setAttribute("hr_pre_img1", bag2.getHr_pre_img1());
session.setAttribute("hr_pre_img2", bag2.getHr_pre_img2());
session.setAttribute("h_name", bag2.getH_name());
session.setAttribute("h_id", bag2.getH_id());
session.setAttribute("hl_har", bag2.getHl_har());
session.setAttribute("hl_lat", bag2.getHl_lat());
session.setAttribute("hl_place", bag2.getHl_place());
session.setAttribute("hr_std_price", bag2.getHr_std_price());
session.setAttribute("hr_pre_price", bag2.getHr_pre_price());
session.setAttribute("hl_place", bag2.getHl_place());
session.setAttribute("h_out_img", bag2.getH_out_img());
session.setAttribute("hf_wifi", bag2.getHf_wifi());
session.setAttribute("hf_swim", bag2.getHf_swim());
session.setAttribute("hf_fitness", bag2.getHf_fitness());
session.setAttribute("h_call", bag2.getH_call());

%>

<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<link rel="stylesheet" href="css/project1.css">	
			<title>Insert title here</title>
			<style>
					.container_detail_map {
						display: grid;
						grid-template-columns: 1fr 1fr;
						grid-template-areas:
						"top top"
						"detail_info detail_map "
						"all_list_map all_list_map";
					}
					
					.top{
						grid-area: top;
					}
					
					.detail_map{
						grid-area: detail_map;
					}
					
					.detail_info{
						grid-area: detail_info;
						height: 200px;
				
					}
					.all_list_map{
						grid-area: all_list_map;
					}
					
					body > div > div.all_list_map > div > table{
						display:inline-block;
					}
					
					
			</style>
		</head>
		<body>
			<div class ="container_detail_map">
				
				<div class = "top">
					<jsp:include page="menu_login.jsp"></jsp:include>
				</div>
				
				
				<!--지도 레이아웃 시작-->
				<div class="detail_map" >
					<div id="map" style="width: 100%; height: 680px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff6ed06df85eabd9e0e07503eada6419"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							mapOption = {
								center : new kakao.maps.LatLng(<%= bag2.getHl_lat()%>, <%=bag2.getHl_har()%>), // 지도의 중심좌표
								level : 3 // 지도의 확대 레벨	
							};
				
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						// 마커를 표시할 위치와 title 객체 배열입니다 
						var hotel_info = <%= mapLocationAarray %>;
						var positions = [];
				          	for (var i = 0; i < hotel_info.length; i++) {
								positions.push({
								title : hotel_info[i].H_name,
								latlng : new kakao.maps.LatLng(hotel_info[i].Hl_lat, hotel_info[i].Hl_har)
							});
						}
						
						 // 마커 이미지의 이미지 주소입니다
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
				
						for (var i = 0; i < positions.length; i++) {
							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new kakao.maps.Size(24, 35);
				
							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
				
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : positions[i].latlng, // 마커를 표시할 위치
								title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								image : markerImage
							// 마커 이미지 
							});		
						 } 
						
						
						
						// 현재 지도 박스 영역
						var lb = new kakao.maps.LatLngBounds(map.getBounds().getSouthWest(), map.getBounds().getNorthEast());
						
						// 현재 지도에 있는 마커를 저장하기 위한 변수
						var listMarker = [];
						
						for (var i=0; i<hotel_info.length; i++){
					    	if(lb.contain(positions[i].latlng) == true){
					    		listMarker.push(hotel_info[i].H_id);
					    	}
					    }
						
						// 지도를 드래그를 하면 생성된 지도 바운드내에 DB의 좌표가 있는 마커에 대해서 존재하는지 여부를 파악하고 호텔 id를 배열로 저장 
						kakao.maps.event.addListener(map, 'drag', function(){
					    var lb = new kakao.maps.LatLngBounds(map.getBounds().getSouthWest(), map.getBounds().getNorthEast()); // 현재 지도 박스 영역
					    var list_add = []; // 현재 지도에 찍힌 마커를 저장하는 배열
					    
					    for (var i=0; i<hotel_info.length; i++){
					    	if(lb.contain(positions[i].latlng) == true){
					    		list_add.push(hotel_info[i].H_id);
					    	}
					    }
					    
					    listMarker = list_add; //전역 변수에 데이터 저장
					    
						});
												
						
					</script>
				</div><!--지도 레이아웃 종료-->
				
				
				<div class ="detail_info">
					상세페이지
					<script type="text/javascript">
					$(function(){
						$(document).ready(function(){ // 지도를 클릭하게 되면 이벤트 실행
							var request = $.ajax({
							  url: "hotel_detail.jsp", // 어디에서 받아올건가
							  method: "get",
							  dataType: "html" // 받아올 값을 HTML문으로 받아오는 부분
							});
							request.done(function(data) {
									//$("#list").empty();	
									$('.detail_info').html(data);
							});
						});
					});
				</script>
				</div>
				
				<div class ="all_list_map">
					전체 리스트가 출력되는 부분입니다.
					<script type="text/javascript">
					
					$(function(){
						$(document).ready(function(){ // 지도를 클릭하게 되면 이벤트 실행
							var request = $.ajax({
							  url: "hotel_all_list.jsp", // 어디에서 받아올건가
							  method: "get",
							  traditional: true,
							  data: {
								  "lm": listMarker
							  }, // 값을 넘겨서 매개변수로 활용하는 부분
							  dataType: "html" // 받아올 값을 HTML문으로 받아오는 부분
							});
							request.done(function(data) {
									$(".all_list_map").empty();	
									$('.all_list_map').html(data);
							});
							request.fail(function( jqXHR, textStatus ) {
							  //alert( "Request failed: " + textStatus );
							  $(".all_list_map").empty();
							});
						});
					});
					
					
					
					$(function(){
						$('#map').click(function(){ // 지도를 클릭하게 되면 이벤트 실행
							var request = $.ajax({
							  url: "hotel_all_list.jsp", // 어디에서 받아올건가
							  method: "get",
							  traditional: true,
							  data: {
								  "lm": listMarker
							  }, // 값을 넘겨서 매개변수로 활용하는 부분
							  dataType: "html" // 받아올 값을 HTML문으로 받아오는 부분
							});
							request.done(function(data) {
									//$("#list").empty();	
									$('.all_list_map').html(data);
							});
							request.fail(function( jqXHR, textStatus ) {
							  //alert( "Request failed: " + textStatus );
							  $(".all_list_map").empty();
							});
						});
					});
					</script>
				</div>
			</div><!-- 전체 레이아웃 종료-->		
		</body>
</html>