package hotel_reserv.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotel_reserv.DTO.ReviewDTO;

public class ReviewDAO {

	public int create(ReviewDTO dto) {// 3
		System.out.println("전달된 아이디는 " + dto.getM_id());
		System.out.println("전달된 날짜는 " + dto.getToday());
		System.out.println("전달된 호텔번호는 " + dto.getH_name());
		System.out.println("전달된 서비스 점수는 " + dto.getService());
		System.out.println("전달된 청결도 점수는 " + dto.getClean());
		System.out.println("전달된 가성비 점수는 " + dto.getBang());
		System.out.println("전달된 별점은" + dto.getGrade());
		System.out.println("전달된 후기내용은" + dto.getContent());
//		System.out.println("전달된 글번호는 " + dto.getWritern());

		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector연결 성공!!!");

			String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, username, password);

			System.out.println("2.hotel_reserv db연결 성공!!!");
			
			//String m_id = request.getParameter("m_id");
			//String m_id = (String)session.getAttribute("m_id");
			
			String sql = "insert into review values(null, ? ,?, ? ,? ,? ,? ,? ,? )"; // 변경됨
			
//			String sql = "insert into review(`today`, `h_name`, `service`, `clean`, `bang`, `grade`, `content` ) values(?,?,?,?,?,?,?)";
			
			
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, dto.getM_id());
//			ps.setString(3, dto.getH_id());
//			ps.setString(1, dto.getWritern());
			ps.setString(1, dto.getM_id());
			ps.setString(2, dto.getToday());
			ps.setString(3, dto.getH_name());
			ps.setString(4, dto.getService());
			ps.setString(5, dto.getClean());
			ps.setString(6, dto.getBang());
			ps.setString(7, dto.getGrade());
			ps.setString(8, dto.getContent());
			System.out.println("3.sql문 생성 성공");

			result = ps.executeUpdate();
			System.out.println("4.sql문 전송 성공");
			System.out.println(result);
		} catch (ClassNotFoundException e) { 
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			 e.printStackTrace();
		} catch (SQLException e) { 
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			 e.printStackTrace();
		}
		
		return result;
	}// create end

	public int update(ReviewDTO dto)  {
		System.out.println("전달된 아이디는 " + dto.getM_id());
		System.out.println("전달된 날짜는 " + dto.getToday());
		System.out.println("전달된 호텔은 " + dto.getH_name());
		System.out.println("전달된 서비스 점수는 " + dto.getService());
		System.out.println("전달된 청결도 점수는 " + dto.getClean());
		System.out.println("전달된 가성비 점수는 " + dto.getBang());
		System.out.println("전달된 별점은" + dto.getGrade());
		System.out.println("전달된 후기내용은" + dto.getContent());
		System.out.println("전달된 글번호는 " + dto.getWritern());
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector연결 성공!!!");

			String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, username, password);

			System.out.println("2.hotel_reserv연결 성공!!!");
			
			String sql = "update review set today = ?, h_name = ?, service = ?, clean =?, bang = ?, grade = ?, content = ? where writern = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getToday());
			ps.setString(2, dto.getH_name());
			ps.setString(3, dto.getService());
			ps.setString(4, dto.getClean());
			ps.setString(5, dto.getBang());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getContent());
			ps.setString(8, dto.getWritern());
			System.out.println("3.sql문 생성 성공");
			
			result = ps.executeUpdate();
			System.out.println("4.sql문 전송 성공");
			System.out.println(result);
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			 e.printStackTrace();
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			 e.printStackTrace();
		}
		return result;

	}// update end

	public int delete(ReviewDTO dto) {

		System.out.println("전달된 id는 " + dto.getM_id());
		System.out.println("전달된 writern는 " + dto.getWritern());
//		System.out.println("전달된 날짜는 " + dto.getToday());
//		System.out.println("전달된 호텔은 " + dto.getH_name());
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector연결 성공!!!");

			String url = "jdbc:mysql://localhost:3306/hotel_reserv";
			String username = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, username, password);

			System.out.println("2.hotel_reserv db연결 성공!!!");

//			String sql = " delete from member where m_id = ? and today =? and h_name =?";
			String sql = " delete from review where writern = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
//			ps.setString(1, dto.getM_id());
			ps.setString(1, dto.getWritern());
//			ps.setString(2, dto.getToday());
//			ps.setString(3, dto.getH_name());
//		ps.setString(4, dto.getService());
//		ps.setString(5, dto.getClean());
//		ps.setString(6, dto.getBang());
//		ps.setString(7, dto.getGrade());
//		ps.setString(8, dto.getWriter());
			System.out.println("3.sql문 생성 성공");

			result = ps.executeUpdate();
			System.out.println("4.sql문 전송 성공");
			System.out.println(result);
		} catch (ClassNotFoundException e) { // 1단계
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
			 e.printStackTrace();
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			 e.printStackTrace();
		}
		return result;
	}// delete end

	public ReviewDTO read(ReviewDTO dto) {
		System.out.println("전달된 id는 " + dto.getM_id());
		System.out.println("전달된 날짜는 " + dto.getToday());
		System.out.println("전달된 호텔은 " + dto.getH_name());
		System.out.println("전달된 서비스 점수는 " + dto.getService());
		System.out.println("전달된 청결도 점수는 " + dto.getClean());
		System.out.println("전달된 가성비 점수는 " + dto.getBang());
		System.out.println("전달된 별점은" + dto.getGrade());
		System.out.println("전달된 후기내용은" + dto.getContent());
		System.out.println("전달된 글번호는 " + dto.getWritern());
		ResultSet rs = null;

		ReviewDTO dto2 = new ReviewDTO();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector연결 성공!!!");

			String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
			String username = "root";
			String password = "1234";

			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("2.hotel_reserv db연결 성공!!!");
			String sql = "select * from member where m_id = ?";
			// + "and hotel =?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getM_id());
//			ps.setString(2, dto.getToday());
//			ps.setString(3, dto.getHotel());
//			ps.setString(4, dto.getService());
//			ps.setString(5, dto.getWritern());
//			ps.setString(6, dto.getClean());
//			ps.setString(7, dto.getBang());
//			ps.setString(8, dto.getGrade());
//			ps.setString(9, dto.getWriter());	

			System.out.println("3.sql문 생성 성공");

			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("검색 결과가 있음");
				String m_id = rs.getString(1);
				String today = rs.getString(2);
//				String h_name = rs.getString(3);
				String h_name = rs.getString(4);
				String service = rs.getString(5);
				String clean = rs.getString(6);
				String bang = rs.getString(7);
				String grade = rs.getString(8);
				String content = rs.getString(9);
				String writern = rs.getString(10);
				System.out.println(m_id + " " + today + " " + h_name + " " + service + " " + clean + " "  + bang + " " + grade + " " + content + " "  + writern + " ");
				dto2.setM_id(m_id + " ");
				dto2.setToday(today + " ");
				dto2.setH_name(h_name + " ");
				dto2.setService(service + " ");
				dto2.setClean(clean + " ");
				dto2.setBang(bang + " ");
				dto2.setGrade(grade + " ");
				dto2.setContent(content + " ");
				dto2.setWritern(writern + " ");
			} else {
				System.out.println("검색 결과가 없음");
			}
		} catch (

		ClassNotFoundException e) { // 1단계
			e.printStackTrace(); 
			System.out.println("1번 에러>> 드라이버 없음.!!!!");
		} catch (SQLException e) { // 2-4단계
			System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
			e.printStackTrace();
		}
		return dto2;
	}// read end
	 public ArrayList<ReviewDTO> read() {
		  ArrayList<ReviewDTO> list = new ArrayList<>();
		      ResultSet rs = null; //메서드 안에서 선언된 변수는 모두 지역변수
		    
		      try {
		         Class.forName("com.mysql.jdbc.Driver");
		         System.out.println("1. connector연결 성공!!!");
		         
		         //   연결할 주소url(ip, port, db명), username, password
		         String url = "jdbc:mysql://localhost:3306/hotel_reserv?useUnicode=true&characterEncoding=utf8";
		         String username = "root";
		         String password = "1234";
		         Connection con = DriverManager.getConnection(url, username, password);
		         System.out.println("2. hotel_reserv db연결 성공!!!");
		         
		         String sql = "select * from review";
		         PreparedStatement ps = con.prepareStatement(sql);
		         System.out.println("3. sql문 생성 성공!!!");
		         
		         rs = ps.executeQuery();
		         System.out.println("4. sql문 전송 전송");
//		         System.out.println("검색 결과는 >> " + rs.next());
		        while(rs.next()) {
		        	  ReviewDTO dto2 = new ReviewDTO();
		        	 System.out.println("검색 결과가 있음");
		        	 dto2.setWritern( rs.getString(1));
		        	 dto2.setM_id(rs.getString(2));
		        	 dto2.setToday(rs.getString(3));
		        	 dto2.setH_name(rs.getString(4));
		        	 dto2.setService(rs.getString(5));
		        	 dto2.setClean(rs.getString(6));
		        	 dto2.setBang(rs.getString(7));
		        	 dto2.setGrade( rs.getString(8));
		        	 dto2.setContent( rs.getString(9));
		        	 System.out.print(dto2);
		        	 list.add(dto2);
		        	 System.out.println(list.size());
		         }
		      } catch (ClassNotFoundException e) { //1단계
		    	  e.printStackTrace();
		         System.out.println("1번 에러>> 드라이버 없음.!!!!");
		      } catch (SQLException e) { //2-4단계
		         System.out.println("2-4번 에러>> DB관련된 처리하다 에러발생함..!!!!");
		         e.printStackTrace(); 
		      }
		      return list;
		      
		   }//read end
}
