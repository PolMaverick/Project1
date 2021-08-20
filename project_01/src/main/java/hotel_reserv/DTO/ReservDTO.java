package hotel_reserv.DTO;

public class ReservDTO {
	private int reserv_num;
	private String m_id;
	private String h_id;
	private String room_sort;
	private String check_in;
	private String check_out;
	private int reserv_count;
	private int reserv_price;
	private String name;
	private String h_name;
	public int getReserv_num() {
		return reserv_num;
	}
	public void setReserv_num(int reserv_num) {
		this.reserv_num = reserv_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getH_id() {
		return h_id;
	}
	public void setH_id(String h_id) {
		this.h_id = h_id;
	}
	public String getRoom_sort() {
		return room_sort;
	}
	public void setRoom_sort(String room_sort) {
		this.room_sort = room_sort;
	}
	public String getCheck_in() {
		return check_in;
	}
	public void setCheck_in(String check_in) {
		this.check_in = check_in;
	}
	public String getCheck_out() {
		return check_out;
	}
	public void setCheck_out(String check_out) {
		this.check_out = check_out;
	}
	public int getReserv_count() {
		return reserv_count;
	}
	public void setReserv_count(int reserv_count) {
		this.reserv_count = reserv_count;
	}
	public int getReserv_price() {
		return reserv_price;
	}
	public void setReserv_price(int reserv_price) {
		this.reserv_price = reserv_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	@Override
	public String toString() {
		return "reservDTO [reserv_num=" + reserv_num + ", m_id=" + m_id + ", h_id=" + h_id + ", room_sort=" + room_sort
				+ ", check_in=" + check_in + ", check_out=" + check_out + ", reserv_count=" + reserv_count
				+ ", reserv_price=" + reserv_price + ", name=" + name + ", h_name=" + h_name + "]";
	}

}
