package xmc.cineplex.service;

import java.util.List;

import xmc.cineplex.model.Question;
import xmc.cineplex.model.QuestionMap;

public interface QuestionService {
	/**
	 * 添加新的问题
	 * @param question
	 */
	public int addNewQuestion(Question question);
	/**
	 * 根据id得到问题
	 * @param id
	 * @return
	 */
	public Question getQuestion(int id);
	/**
	 * 根据放映计划的id获得匹配的问题
	 * @param pid
	 * @return
	 */
	public List getQuestionList(int pid);
	/**
	 * 添加新的问题与放映计划的映射
	 * @param questionMap
	 */
	public void saveMap(QuestionMap questionMap);
}
