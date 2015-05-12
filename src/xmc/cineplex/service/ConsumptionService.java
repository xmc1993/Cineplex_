package xmc.cineplex.service;

import java.util.List;

import xmc.cineplex.model.Plan;

public interface ConsumptionService {
	/**
	 * 买票
	 */
	public void buyTicket(Plan plan,int amount,int uid, double afterCount);
	/**
	 * 返回用户所有的消费记录
	 * @param uid
	 * @return
	 */
	public List getAllRecord(Integer uid);
}
