package xmc.cineplex.service;

import java.util.List;

import xmc.cineplex.model.Answer;

public interface AnswerService {
	/**
	 * 用户购票后添加对应的活动问题记录
	 * @param uid
	 * @param pid
	 */
	public void addAnswerMap(Integer uid,Integer pid);
	/**
	 * 返回用户参加活动要回答的问题
	 * @param uid
	 * @return
	 */
	public List getQuestionList(Integer uid);
	/**
	 * 用户作答题目后向数据库添加信息
	 * @param answer
	 */
	public void saveAnswer(Answer answer);
	
	public void deleteAnswerMap(Integer uid,Integer qid);
}
