package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.AnswerDao;
import xmc.cineplex.model.Answer;
import xmc.cineplex.model.AnswerMap;
@Repository
public class AnswerDaoImpl implements AnswerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	
	public void saveAnswer(Answer answer) {
		getSession().save(answer);

	}

	
	public List getQuestion(Integer uid) {
		String hql="select q from AnswerMap a,Question q where a.uid=? and q.id=a.qid";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		List list=query.list();
		return list;
	}

	
	public void addAnswerMap(AnswerMap am) {
		getSession().save(am);
	}

	
	public void deleteAnswerMap(Integer uid,Integer qid) {
		String hql="delete from AnswerMap a where a.uid=? and a.qid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		query.setInteger(1, qid);
		query.executeUpdate();
		
	}

	
	public boolean isIn(Integer uid, Integer qid) {
		String hql="from AnswerMap a where a.uid=? and a.qid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		query.setInteger(1, qid);
		List list=query.list();
		if(list.size()!=0){
			return true;
		}
		return false;
	}

}
