package xmc.cineplex.dao;

import xmc.cineplex.model.*;

public interface SeatDao {
	/**
	 * 创建计划时新建一个新的Seat管理
	 * @param pid
	 */
	public void addNewSeat(int pid);
	/**
	 * 根据计划ID返回对应Seat
	 * @param pid
	 * @return
	 */
	public Seat getSeat(Integer pid);
	/**
	 * 
	 * @param id
	 * @param row
	 * @param col
	 */
	public void setbook(int id,int row,int col);
}
