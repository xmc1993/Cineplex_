package xmc.cineplex.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.PaymentDao;
import xmc.cineplex.model.Account;
import xmc.cineplex.service.PaymentService;

@Service
public class PaymentServiceBean implements PaymentService {
	@Autowired
	private PaymentDao paymentDaoImpl;
	
	
	public void addNewPayment(Account account, double fee) {
		paymentDaoImpl.payFee(account, fee);

	}

	public List getAllRecords(Integer uid) {
		return paymentDaoImpl.getAllRecords(uid);

	}

}
