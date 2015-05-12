package xmc.cineplex.model.list;

import java.util.List;

import xmc.cineplex.model.Payment;

public class PaymentList {
	private List paymentList;

	public List getPaymentList() {
		return paymentList;
	}

	public void setPaymentList(List paymentList) {
		this.paymentList = paymentList;
	}
	
	public Payment getPaymentList(int index){
		return (Payment)paymentList.get(index);
	}
}
