package xmc.cineplex.model.list;

import java.io.Serializable;
import java.util.List;

import xmc.cineplex.model.Plan;

public class PlanList  implements Serializable{
	private List planList;

	public List getPlanList() {
		return planList;
	}

	public void setPlanList(List planList) {
		this.planList = planList;
	}
	
	public Plan getPlanList(int index){
		return (Plan)planList.get(index);
	}
}
