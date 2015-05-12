package xmc.cineplex.dao;

import java.util.List;

import xmc.cineplex.model.Plan;

public interface ConsumptionDao {
	/**
	 * 买票
	 */
	public void buyTicket(Plan plan,int amount,int uid,double afterCount);
	/**
	 * 返回用户所有的消费记录
	 * @param uid
	 * @return
	 */
	public List getAllRecord(Integer uid);
	/**
	 * 根据用户的id返回他所有购买过票的放映计划
	 * @return
	 */
	public List getAllPlanId(Integer uid);
}
