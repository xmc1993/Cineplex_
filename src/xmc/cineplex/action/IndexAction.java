package xmc.cineplex.action;

import org.springframework.stereotype.Repository;

import com.opensymphony.xwork2.Action;

@Repository
public class IndexAction extends BaseAction implements Action{

	
	public String execute() throws Exception {
		
		return SUCCESS;
	}

}
