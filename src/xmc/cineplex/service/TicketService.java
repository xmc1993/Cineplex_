package xmc.cineplex.service;

import xmc.cineplex.model.TicketManage;

public interface TicketService {
	/**
	 * 创建新的票务管理
	 * @param pid
	 */
	public void createTicketManage(TicketManage ticketManage);
	/**
	 * 得到放映计划对应的票务管理
	 * @param pid
	 * @return
	 */
	public TicketManage getTicketMange(int pid);	/**
	 * 销售电影票 
	 * @param pid
	 * @param amount
	 */
	public void soldTicket(int pid,int amount);
	/**
	 * 
	 * @param id
	 * @param row
	 * @param col
	 */
	public void setbook(int id,int row,int col);
	
}
