package xmc.cineplex.service.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import xmc.cineplex.dao.AccountDao;
import xmc.cineplex.model.Account;
import xmc.cineplex.service.AccountService;

@Service
public class AccountServiceBean implements AccountService{
	@Autowired
	private AccountDao accountDaoImpl;
	
	public Account getAccount(Integer uid) {
		return accountDaoImpl.getAccount(uid);
	}

	
	public void bindBankCard(Account account, String cardNumber) {
		accountDaoImpl.bindBankCard(account, cardNumber);	
	}

	
	public void recharge(Account account, double amount) {
		accountDaoImpl.recharge(account, amount);
	}



	public void getIntegration(Integer id, int credit) {
		accountDaoImpl.getIntegration(id, credit);
	}



	public void exchangeCredit(Integer id) {
		accountDaoImpl.exchangeCredit(id);
	}



	public boolean consume(Integer id, double amount) {
		return accountDaoImpl.consume(id, amount);
	}



	public boolean ifCardBeBinded(Integer id) {
		return accountDaoImpl.ifCardBeBinded(id);
	}



	public boolean isValid(Integer uid) {
		return accountDaoImpl.isValid(uid);
	}



	public void overDueAccount(Integer uid) {
		accountDaoImpl.overDueAccount(uid);
	}

}
