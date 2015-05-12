package xmc.cineplex.action;

import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.Action;

public class AdminLogoutAction extends BaseAction implements Action{

	
	public String execute() throws Exception {
		if(session instanceof SessionMap){
			((SessionMap)session).invalidate();
		}
		return SUCCESS;
	}

}
