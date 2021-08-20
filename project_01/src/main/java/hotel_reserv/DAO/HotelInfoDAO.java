package hotel_reserv.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotel_reserv.DTO.HotelInfoDTO;


public class HotelInfoDAO {
	// 전역변수 
	// 디비 인스턴스 
	
	
	// 생성자 (디비 인스턴스 할당)
	
	
	public HotelInfoDTO info_read(HotelInfoDTO bag) {
		System.out.println("전달된 id는 " + bag.getH_id());
		ResultSet rs = null;
		
		HotelInfoDTO bag2 = new HotelInfoDTO();
		try {
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결
			String url = "jdbc:mysql://localhost:3306/hotel_reserv";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. shoes db연결 성공!!!");
			
			//
			// 3. sql문 생성
			String sql = "SELECT * FROM hotel_info WHERE h_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bag.getH_id());
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			if (rs.next()) {
				bag2.setH_id(rs.getString(1));
				bag2.setH_rank(rs.getInt(2));
				bag2.setH_name(rs.getString(3));
				bag2.setH_out_img(rs.getString(4));
				bag2.setHr_std_price(rs.getInt(5));
				bag2.setHr_pre_price(rs.getInt(6));
				bag2.setHr_std_qty(rs.getInt(7));
				bag2.setHr_pre_qty(rs.getInt(8));
				bag2.setHr_std_img1(rs.getString(9));
				bag2.setHr_std_img2(rs.getString(10));
				bag2.setHr_pre_img1(rs.getString(11));
				bag2.setHr_pre_img2(rs.getString(12));
				bag2.setHl_lat(rs.getDouble(13));
				bag2.setHl_har(rs.getDouble(14));
				bag2.setHl_place(rs.getString(15));
				bag2.setHf_wifi(rs.getInt(16));
				bag2.setHf_swim(rs.getInt(17));
				bag2.setHf_fitness(rs.getInt(18));
			} else {
				System.out.println("검색실패");
			}

		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			e.printStackTrace();
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			e.printStackTrace();
		}

		return bag2;
	} // Read End
	
	
	public ArrayList<HotelInfoDTO> all_info() {

		ResultSet rs = null;

		ArrayList<HotelInfoDTO> list = new ArrayList<HotelInfoDTO>();

		try {
			// 1. jdbc connector설정
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1. connector연결 성공!!!");

			// 2. java에서 db로 연결
			String url = "jdbc:mysql://localhost:3306/hotel_reserv";
			String username = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2. shoes db연결 성공!!!");

			// 3. sql문 생성
			String sql = "SELECT * FROM hotel_info";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println("3. sql문 생성 성공!!!");

			// 4. sql문을 mysql로 전송한다.
			rs = ps.executeQuery();
			System.out.println("4. sql문 전송 전송");

			while (rs.next()) {
				System.out.println("검색완료");
				HotelInfoDTO bag2 = new HotelInfoDTO();
				bag2.setH_id(rs.getString(1));
				bag2.setH_rank(rs.getInt(2));
				bag2.setH_name(rs.getString(3));
				bag2.setH_out_img(rs.getString(4));
				bag2.setHr_std_price(rs.getInt(5));
				bag2.setHr_pre_price(rs.getInt(6));
				bag2.setHr_std_qty(rs.getInt(7));
				bag2.setHr_pre_qty(rs.getInt(8));
				bag2.setHr_std_img1(rs.getString(9));
				bag2.setHr_std_img2(rs.getString(10));
				bag2.setHr_pre_img1(rs.getString(11));
				bag2.setHr_pre_img2(rs.getString(12));
				bag2.setHl_lat(rs.getDouble(13));
				bag2.setHl_har(rs.getDouble(14));
				bag2.setHl_place(rs.getString(15));
				bag2.setHf_wifi(rs.getInt(16));
				bag2.setHf_swim(rs.getInt(17));
				bag2.setHf_fitness(rs.getInt(18));
				
				list.add(bag2);
				System.out.println(list.size());
			}

		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			e.printStackTrace();

		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			e.printStackTrace();
		}

		return list;
	} // AllRead End
}