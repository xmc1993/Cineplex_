package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.PaymentDao;
import xmc.cineplex.model.Account;
import xmc.cineplex.model.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void payFee(Account account, double fee) {
		Payment payment=new Payment();
		payment.setFee(fee);
		payment.setBankAccount(account.getBankAccount());
		payment.setMid(account.getUid());
		getSession().save(payment);
	}

	
	public List getAllRecords(Integer uid) {
		String hql="from Payment p where p.mid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, uid);
		List list=query.list();
		return list;
	}



}
