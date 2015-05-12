package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.QuestionDao;
import xmc.cineplex.model.Question;
import xmc.cineplex.model.QuestionMap;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public int addNewQuestion(Question question) {
		getSession().save(question);
		
		String hql="select q.id from Question q where q.content=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, question.getContent());
		List list=query.list();
		int result=(Integer)list.get(0);
		return result;
	}

	
	public Question getQuestion(int id) {
		return (Question)getSession().get(Question.class, id);
	}

	
	public List getQuestionListByPid(int pid) {
		String hql="select q from QuestionMap qm,Question q where qm.pid=? and qm.qid=q.id";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,pid);
		List list=query.list();
		if(list.size()!=0){
			return list;
		}
		return null;
	}
	
	

}
