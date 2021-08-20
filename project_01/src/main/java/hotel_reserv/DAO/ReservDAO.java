package hotel_reserv.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.ArrayList;
import java.util.ArrayList;

import hotel_reserv.DTO.HotelInfoDTO;
import hotel_reserv.DTO.ReservDTO;

public class ReservDAO {
	// 채연씨 ReservDAO 밑에 붙여넣기
	// pay,payConfirm에서 read 사용
	public ReservDTO read2(ReservDTO dto2) { // 리턴 안 하니 int->void로 => dto2의 타입으로

		System.out.println("전달된 m_id는 " + dto2.getM_id());
		System.out.println("전달된 name는 " + dto2.getName());
		System.out.println("전달된 h_id는 " + dto2.getH_id());
		System.out.println("전달된 h_name는 " + dto2.getH_name());
		System.out.println("전달된 room_sort는 " + dto2.getRoom_sort());
		System.out.println("전달된 check_in는 " + dto2.getCheck_in());
		System.out.println("전달된 check_out는 " + dto2.getCheck_out());
		System.out.println("전달된 reserv_count는 " + dto2.getReserv_count());
		System.out.println("전달된 reserv_price는 " + dto2.getReserv_price());
		ResultSet rs = null; //int->resultSet으로, result의 변수명은 통상 rs, 참조형의 초기화는 null
							 //컬럼과 로우 담을 수 있는 부품 resultSet
		ReservDTO dto3 = new ReservDTO(); //입력용dto, 반환용dto 따로 만들어야함!!! 재사용xxxx
		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. hotel_reserv db연결 성공!!!");

			// 3. sql문을 만든다.
						 // 예약DB에서 해당 id의 예약번호를 최신순으로 정렬 후 첫번째 row 불러오는 SQL문
			String sql = "select * from reservation where m_id = ? order by reserv_num desc limit 1";
			PreparedStatement ps = con.prepareStatement(sql); // 데이터 바인딩
			ps.setString(1, dto2.getM_id());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			rs = ps.executeQuery(); // result set 객체에 결과값 담을 수 있다. read는 executeQuery();를 써준다.
			System.out.println("4. sql문 전송 전송");
			if (rs.next()) { //rs.next()를 if문에서 한번더 해준 셈이라 둘째줄로 내려가서 무조건 false가 나옴.
				System.out.println("검색 결과가 있음.");
				//dto3에 값들 넣기
				dto3.setReserv_num(rs.getInt("reserv_num")); // ()안에 id대신 rs.getString(1)을 넣어도 됨.
				dto3.setM_id(rs.getString("m_id"));
				dto3.setName(rs.getString("name"));
				dto3.setH_id(rs.getString("h_id"));
				dto3.setH_name(rs.getString("h_name"));
				dto3.setRoom_sort(rs.getString("room_sort"));
				dto3.setCheck_in(rs.getString("check_in"));
				dto3.setCheck_out(rs.getString("check_out"));
				dto3.setReserv_count(rs.getInt("reserv_count"));
				dto3.setReserv_price(rs.getInt("reserv_price"));
				System.out.println(dto3);
			}else {
				System.out.println("검색 결과가 없음.");
			}
		
			} catch (ClassNotFoundException e) { //1단계
				System.out.println("1번 에러>> 드라이버 없음!!!!");
				e.printStackTrace(); //에러를 구체적으로 알려줌
			} catch (SQLException e) { //2-4단계
				System.out.println("2-4번 에러>> DB관련된 처리하다 에러 발생!!!!");
				e.printStackTrace();
			}
			return dto3; // dto3 반환
						 // dto3을 try-catch밖에 만들어준다.
	}//read end
	
	// 채연씨 ReservDAO 밑에 붙여넣기
	// recommend에서 read 사용
	public ArrayList<HotelInfoDTO> read3() { //
		ResultSet rs = null; // int->resultSet으로, result의 변수명은 통상 rs, 참조형의 초기화는 null
								// 컬럼과 로우 담을 수 있는 부품 resultSet
		ResultSet rs2 = null;
		// 가방을 넣어줄 컨테이너를 하나 만들어주자.
		// java파일에서 자동 import: ctrl+shift+O
		ArrayList<HotelInfoDTO> list2 = new ArrayList<HotelInfoDTO>(); // list를 리턴할 것.

		try {
			// 자바와 db연결하는 프로그램(JDBC) 순서
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결:
			// 연결할 주소url(ip, port, db명), username, password
			String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. hotel_reserv db연결 성공!!!");

			// 3. sql문을 만든다.
						 // 호텔 예약 DB에서 최신순으로 정렬 후 상위 예약건 row 4개를 불러오는 SQL문
			String sql = "select * from reservation order by reserv_num desc limit 4";
			PreparedStatement ps = con.prepareStatement(sql); // 데이터 바인딩
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			// result = ps.executeUpdate(); //executeUpdate();는 CUD일 때만 사용
			rs = ps.executeQuery(); // result set 객체에 결과값 담을 수 있다. read는 executeQuery();를 써준다.
			System.out.println("4. sql문 전송 전송");
			ArrayList<String> list3 = new ArrayList<String>();
			while (rs.next()) { // row 개수만큼 rs.next()로 t/f 반복 확인. row 1개당 가방 1개
				System.out.println("검색 결과가 있음.");
				list3.add(rs.getString(4)); // list3의 개수만큼 반복
			}
			System.out.println(list3.size());
			rs.close();
			
			Connection con2 = DriverManager.getConnection(url, username, password);
			System.out.println("2. hotel_reserv db연결 성공!!!");
			// 3. sql문을 만든다.
						  // 호텔정보DB에서 해당 호텔들의 id의 row들을 불러오는 SQL문
			String sql2 = "select * from hotel_info where h_id = ? or h_id = ? or h_id = ? or h_id = ?";
			PreparedStatement ps2 = con2.prepareStatement(sql2); // 데이터 바인딩
			System.out.println("3. sql문 생성 성공!!!");
			ps2.setString(1, list3.get(0));
			ps2.setString(2, list3.get(1));
			ps2.setString(3, list3.get(2));
			ps2.setString(4, list3.get(3));
			rs2 = ps2.executeQuery(); // result set 객체에 결과값 담을 수 있다. read는 executeQuery();를 써준다.
			System.out.println("4. sql문 전송 전송");
			while (rs2.next()) { // row 개수만큼 rs.next()로 t/f 반복 확인. row 1개당 가방 1개
				System.out.println("검색 결과가 있음.");
				// dto5에 값을 넣기
				HotelInfoDTO dto5 = new HotelInfoDTO(); // while문 안에 있어야 row마다 가방 반복해서 만듦
				dto5.setH_id(rs2.getString(1));
				dto5.setH_name(rs2.getString(3));
				dto5.setH_out_img(rs2.getString(4));
				dto5.setHr_std_price(rs2.getInt(5));
				// 만들어진 가방을 컨테이너에 넣어주어야 한다.
				
				list2.add(dto5); // list2의 개수만큼 반복
			}
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음!!!!");
			e.printStackTrace(); // 에러를 구체적으로 알려줌
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러 발생!!!!");
			e.printStackTrace();
		}
		return list2; // list2 반환

	}// read end
	
}