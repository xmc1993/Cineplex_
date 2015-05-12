package xmc.cineplex.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.Account;
import xmc.cineplex.model.User;
import xmc.cineplex.model.list.FilmList;
import xmc.cineplex.service.AccountService;
import xmc.cineplex.service.PlanService;
import xmc.cineplex.service.UserService;
import xmc.cineplex.service.bean.UserServiceBean;

import com.opensymphony.xwork2.Action;

@Repository
public class LoginAction implements Action,SessionAware{
	@Autowired
	private UserService userService;
	@Autowired
	private PlanService planServiceBean;
	@Autowired
	private AccountService accountServiceBean;

	private Map<String,Object> sessionMap;
	


	private String name;
	private String password;
	private int sub;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 登录成功
	 * 登录失败
	 */
	public String execute() throws Exception {
		
		
		if(sub==0){
			return "register";
		}
		
		
		

		User user=userService.login(name, password);
		
		if(user==null){
			return "failure";
		}
		
		sessionMap.put("user", user);
		
		Account account=accountServiceBean.getAccount(user.getId());
		sessionMap.put("account", account);
		boolean boo=accountServiceBean.isValid(user.getId());
		
		if(!boo){
			return "invalid";
		}
		
		FilmList filmList=new FilmList();
		filmList.setFilmList(planServiceBean.getFilmList());
		sessionMap.put("filmList", filmList);
		
		return "success";
	}

	
	public void setSession(Map<String, Object> arg0) {
		this.sessionMap=arg0;
		
	}

	public int getSub() {
		return sub;
	}

	public void setSub(int sub) {
		this.sub = sub;
	}
	


}
