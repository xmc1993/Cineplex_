package xmc.cineplex.dao;

import java.util.List;

import xmc.cineplex.model.Account;

public interface PaymentDao {
	/**
	 * 充值
	 * @param fee
	 */
	public void payFee(Account account,double fee);
	/**
	 * 返回所有的消费记录
	 * @param uid
	 * @return
	 */
	public List getAllRecords(Integer uid);
}
