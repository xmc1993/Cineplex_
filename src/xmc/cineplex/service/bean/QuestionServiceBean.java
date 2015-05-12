package xmc.cineplex.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.MapDao;
import xmc.cineplex.dao.QuestionDao;
import xmc.cineplex.model.Question;
import xmc.cineplex.model.QuestionMap;
import xmc.cineplex.service.QuestionService;

@Service
public class QuestionServiceBean implements QuestionService {
	@Autowired
	private QuestionDao questionDaoImpl;
	@Autowired
	private MapDao mapDaoImpl;
	
	public int addNewQuestion(Question question) {
		return questionDaoImpl.addNewQuestion(question);

	}

	public Question getQuestion(int id) {
		return questionDaoImpl.getQuestion(id);
	}

	
	public List getQuestionList(int pid) {
		return questionDaoImpl.getQuestionListByPid(pid);
	}

	
	public void saveMap(QuestionMap questionMap) {
		mapDaoImpl.addNewMap(questionMap);	
	}

}
