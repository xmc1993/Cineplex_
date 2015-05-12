package xmc.cineplex.service;

import java.util.List;

import xmc.cineplex.model.Account;

public interface PaymentService {
	/**
	 * 添加新的充值记录
	 * @param account
	 * @param fee
	 */
	public void addNewPayment(Account account,double fee);
	/**
	 * 得到一个用户所有的消费记录
	 * @param uid
	 */
	public List getAllRecords(Integer uid);
	
}
