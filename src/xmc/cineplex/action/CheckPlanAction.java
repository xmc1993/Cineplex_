package xmc.cineplex.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.TicketManage;
import xmc.cineplex.model.list.PlanList;
import xmc.cineplex.service.PlanService;
import xmc.cineplex.service.TicketService;

@Repository
public class CheckPlanAction extends BaseAction{
	@Autowired
	private PlanService planServiceBean;
	@Autowired
	private TicketService ticketServiceBean;
	
	private int planId;
	private int sub;

	public String execute(){
		PlanList planList=new PlanList();
		planList.setPlanList(planServiceBean.getUncheckedPlan());
		session.put("planList", planList);
		return "checkPlan";
	}
	
	public String processPlan(){
		System.out.println(sub+"--------------------------------");
		
		if(sub==0){
			System.out.println("废弃计划"+"~~~~~~~~~~");
			planServiceBean.vetoPlan(planId);   //说明否决了计划
		}else{
			
			planServiceBean.publishPlan(planId);   
			
			/**创建新的售票管理*/
			TicketManage ticketManage=new TicketManage();
			ticketManage.setPid(planId);
			ticketManage.setLeft(100);
			ticketManage.setSold(0);
			ticketManage.setTotal(100);
			
			ticketServiceBean.createTicketManage(ticketManage);
			
		}
		
		/**更新要显示的待审核列表*/
		PlanList planList=new PlanList();
		planList.setPlanList(planServiceBean.getUncheckedPlan());
		session.put("planList", planList);
		
		return SUCCESS;
	}
	
	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public int getSub() {
		return sub;
	}

	public void setSub(int sub) {
		this.sub = sub;
	}
	
	
}
