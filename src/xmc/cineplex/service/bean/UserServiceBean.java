package xmc.cineplex.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.AccountDao;
import xmc.cineplex.dao.UserDao;
import xmc.cineplex.model.Account;
import xmc.cineplex.model.User;
import xmc.cineplex.service.UserService;
@Service
public class UserServiceBean implements UserService{
	@Autowired
	private UserDao userDaoImpl;
	@Autowired
	private AccountDao accountDaoImpl;
	
	public UserDao getUserDaoImpl() {
		return userDaoImpl;
	}
	public void setUserDaoImpl(UserDao userDaoImpl) {
		this.userDaoImpl = userDaoImpl;
	}

	public boolean register(User user) {
		this.userDaoImpl.Save(user);
		User atUser=this.userDaoImpl.getUser(user.getName(), user.getPassword());
		Account account=new Account();
		account.setUid(atUser.getId());
		account.setRank(0);
		account.setBalance(0.00);
		account.setBankAccount("");
		account.setIsValid(0);
		account.setLastTime(null);
		account.setIntegration(0);
		this.accountDaoImpl.addNewAccount(account);
		return true;
	}
	
	public User login(String name, String password) {
		return this.userDaoImpl.getUser(name, password);
	}
	
	public void modifyProfile(User user) {
		userDaoImpl.modifyProfile(user);
		
	}
	@Override
	public void cancelMember(User user) {
		// TODO Auto-generated method stub
		
	}
	
	public User getUserById(Integer id) {
		return userDaoImpl.geyUserById(id);
	}
}
