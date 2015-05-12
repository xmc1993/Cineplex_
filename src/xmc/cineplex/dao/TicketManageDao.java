package xmc.cineplex.dao;

import xmc.cineplex.model.TicketManage;

public interface TicketManageDao {
	/**
	 * 根据放映计划的id返回票务情况
	 * @param pid
	 * @return
	 */
	public TicketManage getTicketManage(Integer pid);
	/**
	 * 销售电影票
	 * @param pid
	 * @param amount
	 */
	public void soldTicket(int pid,int amount);
	/**
	 * 当放映计划通过审核的时候创建相应的售票管理
	 * @param pid
	 */
	public void createTicketManage(TicketManage ticketManage);
}
