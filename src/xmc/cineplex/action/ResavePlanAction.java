package xmc.cineplex.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.Action;

import xmc.cineplex.model.Plan;
import xmc.cineplex.model.list.PlanList;
import xmc.cineplex.service.PlanService;

@Repository
public class ResavePlanAction extends BaseAction implements Action{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private PlanService planService;
	private Plan plan;
	private String airTime;
	private String endTime;
	private String hall;
	private String price;



	public String execute() throws Exception {
		
		Plan plan_=(Plan)session.get("plan");
		plan.setId(plan_.getId());
		/**
		 * 将输入结果进行一些转换
		 */
		SimpleDateFormat sim= new SimpleDateFormat("yyyy-mm-dd HH:mm:00");
		Date t=sim.parse(airTime);
		plan.setAirTime(t);
		t=sim.parse(endTime);
		plan.setEndTime(t);
		Double iPrice=Double.parseDouble(price);
		plan.setPrice(iPrice);
		plan.setPosturl("");
		int iHallNumber=Integer.parseInt(hall);
		plan.setHallNumber(iHallNumber);
		plan.setState(0);
		
		planService.modifyPlan(plan);
		
		
		
		List list=planService.getUnpassedPlan();
		PlanList planList=new PlanList();
		planList.setPlanList(list);
		session.put("planList", planList);
		return SUCCESS;
	}
	
	
	public String getAirTime() {
		return airTime;
	}


	public void setAirTime(String airTime) {
		this.airTime = airTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public String getHall() {
		return hall;
	}


	public void setHall(String hall) {
		this.hall = hall;
	}



	public Plan getPlan() {
		return plan;
	}


	public void setPlan(Plan plan) {
		this.plan = plan;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}
	
	
}
