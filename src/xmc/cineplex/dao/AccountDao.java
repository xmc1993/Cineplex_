package xmc.cineplex.dao;

import xmc.cineplex.model.Account;

public interface AccountDao {
	/**
	 * 新的用户注册
	 * @param id
	 */
	public void addNewAccount(Account account);
	/**
	 * 用户绑定银行卡
	 * @param id
	 * @param bankAccount
	 */
	public void bindBankCard(Account account,String bankAccount);
	/**
	 * 用户获得积分
	 * @param id
	 * @param credit
	 */
	public void getIntegration(Integer id,int credit);
	/**
	 * 将用户的积分兑换为卡金额
	 * @param id
	 */
	public void exchangeCredit(Integer id);  //5个积分兑换1元RMB
	/**
	 * 用户消费
	 * @param amount
	 * @return
	 */
	public boolean consume(Integer id,double amount);  //如果卡里余额不足返回false
	/**
	 * 判断账号是否已经绑定银行卡
	 * @param id
	 * @return
	 */
	public boolean ifCardBeBinded(Integer id);
	/**
	 * 用户向会员卡中充值
	 * @param id
	 * @param amount
	 */
	public void recharge(Account account,double amount);
	/**
	 * 返回会员的账户信息
	 * @param id
	 * @return
	 */
	public Account getAccount(Integer uid);
	/**
	 * 判断会员号是否到期
	 * @param uid
	 * @return
	 */
	public boolean isValid(Integer uid);
	/**
	 * 过期账户
	 * @param uid
	 */
	public void overDueAccount(Integer uid);
}









