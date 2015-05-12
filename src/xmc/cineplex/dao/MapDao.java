package xmc.cineplex.dao;

import java.util.List;

import xmc.cineplex.model.*;

public interface MapDao {
	/**
	 * 保存新的映射关系
	 * @param map
	 */
	public void addNewMap(QuestionMap map);
	/**
	 * 根据放映计划的id获得匹配的问题
	 * @param pid
	 * @return
	 */
	public List getQuestion(int pid);
}
