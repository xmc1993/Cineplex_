package xmc.cineplex.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.AccountDao;
import xmc.cineplex.model.Account;

@Repository
public class AccountDaoImpl implements AccountDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void addNewAccount(Account account) {
		getSession().save(account);
	}

	
	public void bindBankCard(Account account, String bankAccount) {
		String hql="update Account a set a.bankAccount=? where a.id=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, bankAccount);
		query.setInteger(1, account.getId());
		query.executeUpdate();
	}

	/**用户获得积分*/
	public void getIntegration(Integer id, int integration) {
		Account account=(Account)getSession().get(Account.class, id);
		int total=integration+account.getIntegration();
		String hql="update Account a set a.integration=? where a.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, total);
		query.setInteger(1, id);
		query.executeUpdate();

	}

	/**将积分转换为消费金额*/
	public void exchangeCredit(Integer id) {
		Account account=(Account)getSession().get(Account.class, id);
		double amount=account.getIntegration()/10;
		account.setIntegration(0);
		account.setBalance(account.getBalance()+amount);
		String hql="update Account a set a.integration=0,a.balance=? where a.id=?";
		Query query=getSession().createQuery(hql);
		query.setDouble(0, account.getBalance());
		query.setInteger(1, id);
		query.executeUpdate();
	}

	
	public boolean consume(Integer id, double amount) {
		Account account=(Account)getSession().get(Account.class, id);
		if(account.getBalance()<amount){
			return false;
		}
		
		int integration=(int)amount;
		account.setIntegration(account.getIntegration()+integration);
		account.setBalance(account.getBalance()-amount);
		String hql="update Account a set a.integration=?,a.balance=? where a.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, account.getIntegration());
		query.setDouble(1, account.getBalance());
		query.setInteger(2, id);
		query.executeUpdate();
		
		
		return true;
	}

	
	public boolean ifCardBeBinded(Integer id) {
		
		return false;
	}

	
	public void recharge(Account account, double amount) {
		Account iAccount=(Account)getSession().get(Account.class, account.getId());
		/**
		 * 更新会员账号的金额
		 */
		iAccount.setBalance(iAccount.getBalance()+amount);
		if(amount>=200.0){
			/**
			 * 激活会员号
			 */
			iAccount.setIsValid(1);
			/**
			 * 根据用户交纳金额度设置用户等级
			 */
			int rank=iAccount.getRank();
			if(amount<=300.0){
				iAccount.setRank(Math.max(rank, 1));
			}else if(amount<=500.0){
				iAccount.setRank(Math.max(rank, 2));
			}else if(amount<=1000.0){
				iAccount.setRank(Math.max(rank, 3));
			}else{
				iAccount.setRank(Math.max(rank, 4));
			}
			/**
			 * 更新会员上一次有效缴费时间
			 */
			Timestamp d=new Timestamp(System.currentTimeMillis());			
			iAccount.setLastTime(d);
		}
		
		String hql="update Account a set a.isValid=?,a.rank=?,a.lastTime=?,a.balance=? where a.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, iAccount.getIsValid());
		query.setInteger(1, iAccount.getRank());
		query.setTimestamp(2, iAccount.getLastTime());
		query.setDouble(3,  iAccount.getBalance());
		query.setInteger(4, account.getId());
		query.executeUpdate();	
		
	}

	
	public Account getAccount(Integer uid) {
		String hql="from Account a where a.uid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		List list=query.list();
		if(list.size()==0){
			return null;
		}
		Account account=(Account)list.get(0);
		return account;
	}

	
	public boolean isValid(Integer uid) {
		overDueAccount(uid);
		String hql="from Account a where a.uid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		List list=query.list();
		Account account=(Account)list.get(0);
		
		if(account.getIsValid()==0){
			return false;
		}
		return true;
	}

	
	public void overDueAccount(Integer uid) {
		String hql="from Account a where a.uid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		List list=query.list();
		Account account=(Account)list.get(0);
		if(account.getIsValid()==1){
			Timestamp d1=new Timestamp(System.currentTimeMillis());	
			Timestamp d2=account.getLastTime();
			if(((d1.getTime()-d2.getTime())/1000/60/60/24/365)>=1){
					hql="update Account a set a.isValid=0 where a.uid=?";
					query=getSession().createQuery(hql);
					query.setInteger(0, uid);
					query.executeUpdate();
			}
		}
		
	}

}
