package xmc.cineplex.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.Account;
import xmc.cineplex.model.Plan;
import xmc.cineplex.model.Seat;
import xmc.cineplex.model.User;
import xmc.cineplex.model.list.PlanList;
import xmc.cineplex.service.AccountService;
import xmc.cineplex.service.AnswerService;
import xmc.cineplex.service.ConsumptionService;
import xmc.cineplex.service.PlanService;
import xmc.cineplex.service.SeatService;
import xmc.cineplex.service.TicketService;

import com.opensymphony.xwork2.Action;

@Repository
public class BuyTicketAction extends BaseAction implements Action{
	@Autowired
	private PlanService planServiceBean;
	@Autowired
	private ConsumptionService consumptionServiceBean;
	@Autowired
	private TicketService ticketServiceBean;	
	@Autowired
	private AnswerService answerServiceBean;
	@Autowired
	private AccountService accountServiceBean;
	@Autowired
	private SeatService seatServiceBean;	
	
	private String filmName;
	private int amount;
	private String info;
	
	public String execute() throws Exception {
		List list=planServiceBean.getCurrentPlan(filmName);
		PlanList planList=new PlanList();
		planList.setPlanList(list);
		session.put("planList",planList);
		return SUCCESS;
	}
	
	
	
	public String buyTicket(){
		User user=(User)session.get("user");
		int uid=user.getId();
		Account account=accountServiceBean.getAccount(uid);
		int val=account.getRank();
		double count=10.0;
		switch(val){
		case 1: count=9.5; break;
		case 2: count=9.0; break;
		case 3: count=8.5; break;
		case 4: count=8.0; break;
		}
		
		Plan plan=(Plan)session.get("plan");
		/**计算折扣后总价*/
		double afterCount=plan.getPrice()*amount*count/10;
		
		
		session.put("count", count);
		session.put("afterCount", afterCount);
		session.put("amount",amount );
		session.put("total", amount*plan.getPrice());
		session.put("info", info);

		
		return SUCCESS;
	}

	
	public String afterCount(){
		User user=(User)session.get("user");
		Plan plan_=(Plan)session.get("plan");
		int amount=(int)session.get("amount");
		int uid_=user.getId();
		int planId_=plan_.getId();
		double afterCount=(Double)session.get("afterCount");
		Account account=accountServiceBean.getAccount(uid_);
		
		boolean boo=accountServiceBean.consume(account.getId(), afterCount);      //改变用户账户中的记录
		
		if(!boo){
			return "nsf";
		}
		
			
		Plan plan=planServiceBean.getPlanInfo(planId_);
		consumptionServiceBean.buyTicket(plan, amount, uid_,afterCount);
		
		/**更新票务信息*/
		ticketServiceBean.soldTicket(planId_, amount);
		/**添加活动信息*/
		answerServiceBean.addAnswerMap(uid_, planId_);
		
		/**更新座位信息*/
		Seat seat=seatServiceBean.getSeat(planId_);
		
		String info=(String)session.get("info");
		System.out.println(info);
		String[]  infos=info.split(",");
		
		for(int i=0;i<amount;i++){
			String[] s1=infos[i].split("排");
			int row=Integer.parseInt(s1[0]);
			String[] s2=s1[1].split("座");
			int col=Integer.parseInt(s2[0]);
			seatServiceBean.setbook(seat.getId(), row, col);
		}
		
		
		return SUCCESS;
	}
	
	
	public String getFilmName() {
		return filmName;
	}

	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}

	public PlanService getPlanServiceBean() {
		return planServiceBean;
	}

	public void setPlanServiceBean(PlanService planServiceBean) {
		this.planServiceBean = planServiceBean;
	}


	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
