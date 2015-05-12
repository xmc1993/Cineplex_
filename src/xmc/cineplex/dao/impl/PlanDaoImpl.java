package xmc.cineplex.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.PlanDao;
import xmc.cineplex.model.Plan;

@Repository
public class PlanDaoImpl implements PlanDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void addPlan(Plan plan) {
		getSession().save(plan);
	}

	
	public void publishPlan(Integer id) {    //发布计划
		String hql="update Plan p set p.state=1 where p.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,id);
		query.executeUpdate();

	}

	
	public void vetoPlan(Integer id) {  //否决计划
		String hql="update Plan p set p.state=-1 where p.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0,id);
		query.executeUpdate();

	}

	
	public void modifyPlan(Plan plan) {
		String hql="update Plan p set p.airTime=?,p.endTime=?,p.hallNumber=?,p.title=?,p.price=?,p.state=? where p.id=?";
		Query query=getSession().createQuery(hql);
		query.setTimestamp(0, plan.getAirTime());
		query.setTimestamp(1, plan.getEndTime());
		query.setInteger(2, plan.getHallNumber());
		query.setString(3, plan.getTitle());
		query.setDouble(4, plan.getPrice());
		query.setInteger(5, 0);
		query.setInteger(6, plan.getId());
		query.executeUpdate();

	}

	
	public void abandonPlan(Integer id) {
		/**
		Plan p=(Plan)getSession().get(Plan.class,id);
		if(p!=null){
			getSession().delete(p);
		}
		**/
		String hql="delete from Plan p where p.id=?";
		Query query=getSession().createQuery(hql);
		query.setInteger(0, id);
		query.executeUpdate();
	}

	
	public void overduePlan() {
		/**得到当前的时间戳*/
		Timestamp d= new Timestamp(System.currentTimeMillis());
		String hql="update Plan p set p.state=2 where p.airTime<?";
		Query query=getSession().createQuery(hql);
		query.setTimestamp(0, d);
		query.executeUpdate();
	}

	
	public List<Object> getPassedPlan() {
		String hql="from Plan p where p.state=1";
		Query query=getSession().createQuery(hql);
		List list=query.list();
		return list;
	}

	
	public List<Object> getUnpassedPlan() {
		String hql="from Plan p where p.state=-1";
		Query query=getSession().createQuery(hql);
		List list=query.list();
		return list;
	}

	
	public List<Object> getUncheckedPlan() {
		String hql="from Plan p where p.state=0";
		Query query=getSession().createQuery(hql);
		List list=query.list();
		return list;
	}

	
	public Plan getPlanInfo(Integer id) {
		Plan plan=(Plan)getSession().get(Plan.class,id);
		return plan;
	}

	
	public List getFilmList() {
		//overduePlan();
		String hql="select distinct p.title from Plan p where p.state=1";
		Query query=getSession().createQuery(hql);
		List list=query.list();
		return list;
	}

	
	public List getCurrentPlan(String title) {
		String hql="from Plan p where p.title=? and p.state=1";
		Query query=getSession().createQuery(hql);
		query.setString(0, title);
		List list=query.list();
		return list;
	}

	
	public List getCurrentPlanId() {
		String hql="select p.id from Plan p";
		Query query=getSession().createQuery(hql);
		List list=query.list();
		return list;
	}

}
