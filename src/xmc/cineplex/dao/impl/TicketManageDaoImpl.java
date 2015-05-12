package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.BaseDao;
import xmc.cineplex.dao.TicketManageDao;
import xmc.cineplex.model.TicketManage;

@Repository
public class TicketManageDaoImpl extends BaseDaoImpl implements TicketManageDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public TicketManage getTicketManage(Integer pid) {
		String hql="from TicketManage t where t.pid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, pid);
		List list=query.list();
		return (TicketManage)list.get(0);
	}

	
	public void soldTicket(int pid, int amount) {
		String hql="from TicketManage t where t.pid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, pid);
		List list=query.list();
		TicketManage ticketManage=(TicketManage)list.get(0);
		
		hql="update TicketManage m set m.sold=? , m.left=? where m.pid=?";
		query=getSession().createQuery(hql);
		query.setInteger(0, ticketManage.getSold()+amount);
		query.setInteger(1,ticketManage.getLeft()-amount );
		query.setInteger(2, pid);
		query.executeUpdate();
	}

	
	public void createTicketManage(TicketManage ticketManage) {
		
		getSession().save(ticketManage);
	}

}
