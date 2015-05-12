package xmc.cineplex.model.list;

import java.util.List;

import xmc.cineplex.model.Plan;

public class PlanIdList {
	private List planIdList;

	public List getPlanIdList() {
		return planIdList;
	}

	public void setPlanIdList(List planIdList) {
		this.planIdList = planIdList;
	}
	
	public int getPlanIdList(int index){
		return (Integer)planIdList.get(index);
	}
}
