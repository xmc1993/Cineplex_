package xmc.cineplex.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.ConsumptionDao;
import xmc.cineplex.model.Plan;
import xmc.cineplex.service.ConsumptionService;

@Service
public class ConsumptionServiceBean implements ConsumptionService{
	@Autowired
	private ConsumptionDao consumptionDaoImpl;
	
	public void buyTicket(Plan plan, int amount, int uid, double afterCount) {
		consumptionDaoImpl.buyTicket(plan, amount, uid,afterCount);
		
	}

	
	public List getAllRecord(Integer uid) {
		return consumptionDaoImpl.getAllRecord(uid);
	}

}
