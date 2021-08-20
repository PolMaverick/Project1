package hotel_reserv.DTO;

public class HotelInfoDTO {
	String h_id;
	int h_rank;
	String h_name;
	String h_out_img;
	int hr_std_price;
	int hr_pre_price;
	int hr_std_qty;
	int hr_pre_qty;
	String hr_std_img1;
	String hr_std_img2;
	String hr_pre_img1;
	String hr_pre_img2;
	double hl_lat;
	double hl_har;
	String hl_place;
	int hf_wifi;
	int hf_swim;
	int hf_fitness;
	String h_call;
	
	
	public String getH_call() {
		return h_call;
	}
	public void setH_call(String h_call) {
		this.h_call = h_call;
	}
	public String getH_id() {
		return h_id;
	}
	public void setH_id(String h_id) {
		this.h_id = h_id;
	}
	public int getH_rank() {
		return h_rank;
	}
	public void setH_rank(int h_rank) {
		this.h_rank = h_rank;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_out_img() {
		return h_out_img;
	}
	public void setH_out_img(String h_out_img) {
		this.h_out_img = h_out_img;
	}
	public int getHr_std_price() {
		return hr_std_price;
	}
	public void setHr_std_price(int hr_std_price) {
		this.hr_std_price = hr_std_price;
	}
	public int getHr_pre_price() {
		return hr_pre_price;
	}
	public void setHr_pre_price(int hr_pre_price) {
		this.hr_pre_price = hr_pre_price;
	}
	public int getHr_std_qty() {
		return hr_std_qty;
	}
	public void setHr_std_qty(int hr_std_qty) {
		this.hr_std_qty = hr_std_qty;
	}
	public int getHr_pre_qty() {
		return hr_pre_qty;
	}
	public void setHr_pre_qty(int hr_pre_qty) {
		this.hr_pre_qty = hr_pre_qty;
	}
	public String getHr_std_img1() {
		return hr_std_img1;
	}
	public void setHr_std_img1(String hr_std_img1) {
		this.hr_std_img1 = hr_std_img1;
	}
	public String getHr_std_img2() {
		return hr_std_img2;
	}
	public void setHr_std_img2(String hr_std_img2) {
		this.hr_std_img2 = hr_std_img2;
	}
	public String getHr_pre_img1() {
		return hr_pre_img1;
	}
	public void setHr_pre_img1(String hr_pre_img1) {
		this.hr_pre_img1 = hr_pre_img1;
	}
	public String getHr_pre_img2() {
		return hr_pre_img2;
	}
	public void setHr_pre_img2(String hr_pre_img2) {
		this.hr_pre_img2 = hr_pre_img2;
	}
	public double getHl_lat() {
		return hl_lat;
	}
	public void setHl_lat(double hl_lat) {
		this.hl_lat = hl_lat;
	}
	public double getHl_har() {
		return hl_har;
	}
	public void setHl_har(double hl_har) {
		this.hl_har = hl_har;
	}
	public String getHl_place() {
		return hl_place;
	}
	public void setHl_place(String hl_place) {
		this.hl_place = hl_place;
	}
	public int getHf_wifi() {
		return hf_wifi;
	}
	public void setHf_wifi(int hf_wifi) {
		this.hf_wifi = hf_wifi;
	}
	public int getHf_swim() {
		return hf_swim;
	}
	public void setHf_swim(int hf_swim) {
		this.hf_swim = hf_swim;
	}
	public int getHf_fitness() {
		return hf_fitness;
	}
	public void setHf_fitness(int hf_fitness) {
		this.hf_fitness = hf_fitness;
	}
	
	
	@Override
	public String toString() {
		return "HotelInfoDTO [h_id=" + h_id + ", h_rank=" + h_rank + ", h_name=" + h_name + ", h_out_img=" + h_out_img
				+ ", hr_std_price=" + hr_std_price + ", hr_pre_price=" + hr_pre_price + ", hr_std_qty=" + hr_std_qty
				+ ", hr_pre_qty=" + hr_pre_qty + ", hr_std_img1=" + hr_std_img1 + ", hr_std_img2=" + hr_std_img2
				+ ", hr_pre_img1=" + hr_pre_img1 + ", hr_pre_img2=" + hr_pre_img2 + ", hl_lat=" + hl_lat + ", hl_har="
				+ hl_har + ", hl_place=" + hl_place + ", hf_wifi=" + hf_wifi + ", hf_swim=" + hf_swim + ", hf_fitness="
				+ hf_fitness + "]";
	}
	

	
}
