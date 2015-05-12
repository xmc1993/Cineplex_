package xmc.cineplex.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import xmc.cineplex.model.User;
import xmc.cineplex.service.UserService;

import com.opensymphony.xwork2.Action;

public class ModifyProfileAction extends BaseAction implements Action{

	@Autowired
	private UserService userService;
	private User user;
	private String birthday;
	
	public String execute() throws Exception {
		SimpleDateFormat sim= new SimpleDateFormat("yyyy-mm-dd");
		
		Date t=sim.parse(birthday);
		
		user.setBirthday(t);
		
		User user_=(User)session.get("user");
		user.setId(user_.getId());
		user.setName(user_.getName());
		user.setPassword(user_.getPassword());
		
		userService.modifyProfile(user);
		
		session.put("user", user);
		
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String enterModifyProfile(){
		
		return SUCCESS;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

}
