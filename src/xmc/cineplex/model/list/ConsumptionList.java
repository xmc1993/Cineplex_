package xmc.cineplex.model.list;

import java.util.List;

import xmc.cineplex.model.Consumption;

public class ConsumptionList {
	private List consumptionList;

	public List getConsumptionList() {
		return consumptionList;
	}

	public void setConsumptionList(List consumptionList) {
		this.consumptionList = consumptionList;
	}
	
	public Consumption getConsumptionList(int index){
		return (Consumption)consumptionList.get(index);
	}
}
