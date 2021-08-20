<%@page import="hotel_reserv.DAO.HotelInfoDAO"%>
<%@page import="hotel_reserv.DTO.HotelInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String h_name = (String)session.getAttribute("h_name");
String hl_place = (String)session.getAttribute("hl_place");
double hl_har = (double)session.getAttribute("hl_har");
double hl_lat = (double)session.getAttribute("hl_lat");
String h_out_img = (String)session.getAttribute("h_out_img");
String hr_std_img1 = (String)session.getAttribute("hr_std_img1");
String hr_std_img2 = (String)session.getAttribute("hr_std_img2");
String hr_pre_img1 = (String)session.getAttribute("hr_pre_img1");
String hr_pre_img2 = (String)session.getAttribute("hr_pre_img2");
int hr_std_price = (int)session.getAttribute("hr_std_price");
int hr_pre_price = (int)session.getAttribute("hr_pre_price");
int hf_wifi = (int)session.getAttribute("hf_wifi");
int hf_swim = (int)session.getAttribute("hf_swim");
int hf_fitness = (int)session.getAttribute("hf_fitness");
String h_call = (String)session.getAttribute("h_call");
%>

<style>
				.detail_container {
					display: grid;
					width:300px;
					grid-template-areas:
					"detail_info"
					"detail_img";
				}
				.detail_info {
					grid-area: detail_info;
				}
				.detail_img {
					grid-area: detail_img;
				}
				
				.small_thumb{
					
				}
				
				
				.small_thumb > img{
					width: 186px;
					height: 100px;
					cursor: pointer;
					object-fit: cover;
				}
				
				.big_pic > img{
					width: 100%;
					height: 350px;	
				}
				
				
								
				
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
function lo() {
	var n, x, y;
	n = "<%=h_name%>";
	x = <%=hl_lat%>;
	y = <%=hl_har%>;

	location.href = `https://map.kakao.com/link/to/\${n},\${x},\${y}`;
}


function copy (x) {
	  var copyText = document.getElementById(x);
	  copyText.select();
	  document.execCommand("Copy");
}
	
</script>

<div class = detail_container>
	
	
	<div class = detail_info>
	<hr>
	<h2><%=h_name %></h2>
	문의전화: <input id="h_call_btn" value=<%=h_call%> readonly>
	<button onclick="copy('h_call_btn')">복사하기</button><br>

	주소:<input id="hl_place_btn" value="<%=hl_place%>" readonly>
	<button onclick="copy('hl_place_btn')">복사하기</button><br>
	편의시설:<br>
	
	
		<%
		if(hf_wifi == 1){%>
				<span class="iconify" data-inline="false" data-icon="fa-solid:wifi"
					style="font-size: 12px; vertocal-align: middle"></span> <font
					size="1px">와이파이</font>
		<%
		}
		if(hf_swim == 1){%>
				<span class="iconify" data-inline="false" data-icon="bx:bx-swim"
					style="font-size: 15px;"></span> <font size="1px">수영시설</font>
		<%
		}
		
		if(hf_fitness == 1){%>
				<span class="iconify" data-inline="false"
					data-icon="ic:round-fitness-center" style="font-size: 14px;"></span>
				<font size="1px">운동시설</font>
		<%
		}
		%>
	<br>
	
	스탠다드 객실 가격:<%= hr_std_price %> /
	프리미엄 객실 가격:<%= hr_pre_price %> <br>
	<form>
		<input type="button" onclick="lo()" value="길찾기">
		<input type="button" onclick="location.href='reserv_main.jsp'" value="예약하기"><br>
		
	</form>
	</div>

	<div class = "detail_img">
	<div class="big_pic">
		<script>
			$(function(){
		        $('.detail_img>div>img').on({
		            "click" : function(){
		                var imgSrc = $(this).attr('src');
		                var imgValue = $(this).attr('alt');
		                $('.big_pic>input').attr('value',imgValue);
		                $('.big_pic>img').attr('src',imgSrc);
		            }
		        });          
		            });
			</script>
			<input type="button" value="호텔외경">
			<img src=<%= h_out_img %> alt="호텔외경">
			
		</div>
		<div class="small_thumb">
	        <img src=<%= h_out_img %> alt="호텔외경">
	        <img src=<%= hr_std_img1 %> alt="스탠다드객실01">
	        <img src=<%= hr_std_img2 %> alt="스탠다드객실02">
	        <img src=<%= hr_pre_img1 %> alt="프리미엄객실01">
	        <img src=<%= hr_pre_img2 %> alt="프리미엄객실02"><br>
	    </div>
    </div>
	
</div>

