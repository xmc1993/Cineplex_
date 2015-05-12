package xmc.cineplex.dao;

import java.util.List;

import xmc.cineplex.model.*;

public interface AnswerDao {
/**
 * 添加新的答案
 * @param answer
 */
	public void saveAnswer(Answer answer);
/**
 * 根据用户的ID返回改用户待回答的问题
 * @param uid
 * @return
 */
	public List getQuestion(Integer uid);
/**
 * 用户买票时添加用户要回答的问题
 * @param uid
 * @param pid
 */
	public void addAnswerMap(AnswerMap am);
/**
 * 用户答题后消除对应的记录	
 * @param id
 */
	public void deleteAnswerMap(Integer uid,Integer qid);
	/**
	 * 记录是否已经存在
	 * @param uid
	 * @param qid
	 * @return
	 */
	public boolean isIn(Integer uid,Integer qid);
	
	
}
