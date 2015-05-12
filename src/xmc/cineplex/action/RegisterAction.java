package xmc.cineplex.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.model.User;
import xmc.cineplex.service.UserService;

import com.opensymphony.xwork2.Action;


@Repository
public class RegisterAction extends BaseAction implements Action{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;
	private User user;
	private String birthday;

	

	public String execute() throws Exception {
		
		SimpleDateFormat sim= new SimpleDateFormat("yyyy-mm-dd");
		
		Date t=sim.parse(birthday);
		
		user.setBirthday(t);
		
		System.out.println(user.getName());
		
		userService.register(user);
		
		
		return SUCCESS;
	}

	public String enterRegister(){
		return SUCCESS;
	}


	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}
	
	
	public String getBirthday() {
		return birthday;
	}



	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
