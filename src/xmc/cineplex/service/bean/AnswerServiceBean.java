package xmc.cineplex.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.AnswerDao;
import xmc.cineplex.dao.QuestionDao;
import xmc.cineplex.model.Answer;
import xmc.cineplex.model.AnswerMap;
import xmc.cineplex.model.Question;
import xmc.cineplex.service.AnswerService;

@Service
public class AnswerServiceBean implements AnswerService {
	@Autowired
	private AnswerDao answerDaoImpl;
	@Autowired
	private QuestionDao questionDaoImpl;
	
	
	public void addAnswerMap(Integer uid, Integer pid) {
		List list=questionDaoImpl.getQuestionListByPid(pid);
		for(int i=0;i<list.size();i++){
			Question question=(Question)list.get(i);		
			
			if(!answerDaoImpl.isIn(uid, question.getId())){
			AnswerMap am=new AnswerMap();
			am.setQid(question.getId());
			am.setUid(uid);
			answerDaoImpl.addAnswerMap(am);
			}			
		}	
	}

	public List getQuestionList(Integer uid) {
		return answerDaoImpl.getQuestion(uid);
	}

	
	public void saveAnswer(Answer answer) {
		answerDaoImpl.saveAnswer(answer);
		
	}

	
	public void deleteAnswerMap(Integer uid, Integer qid) {
		answerDaoImpl.deleteAnswerMap(uid, qid);
		
	}
	
}
