package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.SeatDao;
import xmc.cineplex.model.Seat;

@Repository
public class SeatDaoImpl implements SeatDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void addNewSeat(int pid) {
		Seat seat=new Seat();
		seat.setPid(pid);
		seat.initState();
		getSession().save(seat);

	}

	
	public Seat getSeat(Integer pid) {
		String hql="from Seat s where s.pid=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, pid);
		List list=query.list();
		Seat seat=(Seat)list.get(0);
		return seat;
	}

	public void setbook(int id, int row, int col) {
		Seat seat=(Seat)getSession().get(Seat.class, id);
		seat.setBook(row, col);
		String hql="update Seat s set s.state=? where s.id=?";
		Query query=getSession().createQuery(hql);
		query.setString(0, seat.getState());
		query.setInteger(1, id);
		query.executeUpdate();
	}

}
