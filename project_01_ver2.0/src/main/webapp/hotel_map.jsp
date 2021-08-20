<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//DB에서 데이터 값 불러오기
HotelInfoDAO dao = new HotelInfoDAO();
ArrayList<HotelInfoDTO> list = dao.all_info();

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
					.container_map {
						display: grid;
						
						grid-template-columns: 0.35fr 1fr;
						grid-template-areas:
						"list_map main_map";
					}
					
					.main_map{
						grid-area: main_map;
					}
					
					.list_map {
						grid-area: list_map;
						overflow-y: scroll;
						height: 800px;
						width: 100%;
					}
			</style>
		</head>
		<body>
			<div class ="container_map">
				<div class ="list_map">
					리스트가 출력되는 부분입니다.
				</div>
				
				<div class="main_map" >
					<!--지도 레이아웃 시작-->
					<div id="map" style="width: 100%; height: 750px;"></div>
					<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ff6ed06df85eabd9e0e07503eada6419"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = {
						center : new kakao.maps.LatLng(33.48608139541198, 126.48697464689863), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
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
					
					// 현재 지도에 있는 마커를 저장하기 위한 변수
					var listMarker = "";
					
					// 지도를 드래그를 하면 생성된 지도 바운드내에 DB의 좌표가 있는 마커에 대해서 존재하는지 여부를 파악하고 호텔 id를 배열로 저장 
					kakao.maps.event.addListener(map, 'dragend', function() {
				    // 현재 지도 박스 영역
				    var lb = new kakao.maps.LatLngBounds(map.getBounds().getSouthWest(), map.getBounds().getNorthEast());
				    
				    // 현재 지도에 찍힌 마커를 저장하는 배열
				    var list_add = [];
				    
				   	//alert("박스영역 확인: "+ lb);
				    for (var i=0; i<hotel_info.length; i++){
				    	if(lb.contain(positions[i].latlng) == true){
				    		list_add.push(hotel_info[i].H_id);
				    	}
				    }
				    listMarker = list_add;
					});
					</script>
					
					<!--지도 레이아웃 종료-->
				</div>
			</div>
			
			
				
				<script type="text/javascript">
					$(function(){
						$('#map').click(function(){ // 지도를 클릭하게 되면 이벤트 실행
							lm = listMarker;
							var request = $.ajax({
							  url: "hotel_all_list.jsp", // 어디에서 받아올건가
							  method: "get",
							  traditional: true,
							  data: {
								  "lm": lm
							  }, // 값을 넘겨서 매개변수로 활용하는 부분
							  dataType: "html" // 받아올 값을 HTML문으로 받아오는 부분
							});
							request.done(function(data) {
									//$("#list").empty();	
									$('.list_map').html(data);
							});
							request.fail(function( jqXHR, textStatus ) {
							  //alert( "Request failed: " + textStatus );
							  $(".list_map").empty();
							});
						});
					});
				</script>
		</body>
</html>