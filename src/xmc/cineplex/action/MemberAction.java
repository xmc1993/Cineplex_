package xmc.cineplex.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.Account;
import xmc.cineplex.model.User;
import xmc.cineplex.model.list.ConsumptionList;
import xmc.cineplex.model.list.FilmList;
import xmc.cineplex.model.list.PaymentList;
import xmc.cineplex.service.AccountService;
import xmc.cineplex.service.ConsumptionService;
import xmc.cineplex.service.PaymentService;
import xmc.cineplex.service.PlanService;

import com.opensymphony.xwork2.Action;
@Repository
public class MemberAction extends BaseAction  implements Action{
	@Autowired
	private ConsumptionService consumptionServiceBean;
	@Autowired
	private PaymentService paymentServiceBean;
	@Autowired
	private AccountService accountServiceBean;
	@Autowired
	private PlanService planServiceBean;
	
	
	public String execute() throws Exception {
		User user=(User)session.get("user");
		Account account=accountServiceBean.getAccount(user.getId());
		List list=consumptionServiceBean.getAllRecord(user.getId());
		ConsumptionList consumptionList=new ConsumptionList();
		consumptionList.setConsumptionList(list);
		List pay_list=paymentServiceBean.getAllRecords(user.getId());
		PaymentList paymentList=new PaymentList();
		paymentList.setPaymentList(pay_list);
		
		session.put("account", account);
		session.put("consumptionList", consumptionList);
		session.put("paymentList", paymentList);
		return SUCCESS;
	}
	
	public String personInfo(){
		User user=(User)session.get("user");
		Account account=accountServiceBean.getAccount(user.getId());
		session.put("account", account);
		return SUCCESS;
	}
	
	public String exchange(){
		User user=(User)session.get("user");
		Account account=accountServiceBean.getAccount(user.getId());
		accountServiceBean.exchangeCredit(account.getId());
		account=accountServiceBean.getAccount(user.getId());
		session.put("account", account);
		return SUCCESS;
	}
	
	public String enterHomePage(){
		FilmList filmList=new FilmList();
		filmList.setFilmList(planServiceBean.getFilmList());
		session.put("filmList", filmList);
		return SUCCESS;
	}

	
}
