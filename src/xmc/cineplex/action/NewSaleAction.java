package xmc.cineplex.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.Plan;
import xmc.cineplex.model.Seat;
import xmc.cineplex.model.TicketManage;
import xmc.cineplex.service.PlanService;
import xmc.cineplex.service.SeatService;
import xmc.cineplex.service.TicketService;

import com.opensymphony.xwork2.Action;

@Repository
public class NewSaleAction extends BaseAction implements Action{

	@Autowired
	private TicketService ticketService;
	@Autowired
	private PlanService planServiceBean;
	@Autowired
	private SeatService seatServiceBean;
	
	private int planId;	
	
	private int amount;
	private String info;
	
	public String execute() throws Exception {
		session.put("amount", amount);
		session.put("info", info);
		
		Plan plan=(Plan)session.get("plan");
		double total=plan.getPrice()*amount;
		session.put("total", total);
		return SUCCESS;
	}
	
	public String enterNewSale(){
		/**向session中加入售票管理信息和放映计划*/
		TicketManage ticketManage=ticketService.getTicketMange(planId);
		Plan plan=planServiceBean.getPlanInfo(planId);
		Seat seat=seatServiceBean.getSeat(planId);
		session.put("ticketManage", ticketManage);
		session.put("plan", plan);
		session.put("seat", seat);
		
		String s=seat.getBooked();
		session.put("book", s);
		session.put("price",plan.getPrice());
		
		
		return SUCCESS;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
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
