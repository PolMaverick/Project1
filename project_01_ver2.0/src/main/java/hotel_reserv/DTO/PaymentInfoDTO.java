package hotel_reserv.DTO;

public class PaymentInfoDTO {	
	private int paymentId;
	private String mId;
	private String paymentData;
	private String paymentDatetime;
	private int paymentTotal;
	
	public int getPaymentId() {
		return paymentId;
	}


	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getPaymentData() {
		return paymentData;
	}


	public void setPaymentData(String paymentData) {
		this.paymentData = paymentData;
	}


	public String getPaymentDatetime() {
		return paymentDatetime;
	}


	public void setPaymentDatetime(String paymentDatetime) {
		this.paymentDatetime = paymentDatetime;
	}


	public int getPaymentTotal() {
		return paymentTotal;
	}


	public void setPaymentTotal(int paymentTotal) {
		this.paymentTotal = paymentTotal;
	}
	
	@Override
	public String toString() {
		return "PaymentInfoDTO [paymentId=" + paymentId + ", mId=" + mId + ", paymentData=" + paymentData + ", paymentDatetime="
				+ paymentDatetime + ", paymentTotal=" + paymentTotal + "]";
	}


	public static void main(String[] args) {
		PaymentInfoDTO dto = new PaymentInfoDTO();
		dto.setPaymentId(1000);
		dto.setmId("주문자 ID");
		dto.setPaymentData("결제 내용");
		dto.setPaymentDatetime("결제 일시");
		dto.setPaymentTotal(10000);
		System.out.println(dto);

	}
	
}
