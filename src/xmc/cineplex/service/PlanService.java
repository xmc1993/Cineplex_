package xmc.cineplex.service;

import java.util.List;

import xmc.cineplex.model.Plan;

public interface PlanService {
	/**
	 * 管理员创建新的放映计划
	 * @param plan
	 */
	public void createNewPlan(Plan plan);
	/**
	 * 经理审核确认发布放映计划
	 * @param id
	 */
	public void publishPlan(Integer id);
	/**
	 * 管理员修改放映计划
	 * @param plan
	 */
	public void modifyPlan(Plan plan);
	/**
	 * 经理审核否决某放映计划
	 * @param id
	 */
	public void vetoPlan(Integer id);
	/**
	 * 管理员删除无效的放映计划
	 * @param id
	 */
	public void abandonPlan(Integer id);
	
	/**
	 * 获得已经审核通过的放映计划
	 * @return
	 */
	public List<Object> getPassedPlan();
	/**
	 * 获得未通过审核的放映计划
	 * @return
	 */
	public List<Object> getUnpassedPlan();
	/**
	 * 获得待审核的放映计划
	 * @return
	 */
	public List<Object> getUncheckedPlan();
	/**
	 * 根据放映计划的id获得计划的详细信息
	 * @param id
	 * @return
	 */
	public Plan getPlanInfo(Integer id);
	/**
	 * 得到正在上映的电影列表
	 * @return
	 */
	public List getFilmList();
	/**
	 * 返回某部电影的将要上映的计划
	 * @param title
	 * @return
	 */
	public List getCurrentPlan(String title);
	/**
	 * 返回还没上映的上映计划ID
	 * @return
	 */
	public List getCurrentPlanId();
		
}
