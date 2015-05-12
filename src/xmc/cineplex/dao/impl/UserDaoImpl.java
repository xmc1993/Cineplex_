package xmc.cineplex.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.UserDao;
import xmc.cineplex.model.Account;
import xmc.cineplex.model.User;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	public void Save(User user) {
		getSession().save(user);
	}

	
	public User getUser(String name, String password) {
		
		String hql="from User u  where name=? and password=?";
			
		Query query=getSession().createQuery(hql);
		query.setString(0,name);
		query.setString(1, password);
		List list=query.list();
		
		if(list.size()!=0){
			User user=(User)list.get(0);
			return user;
		}
		return null;
	}

	
	public User geyUserById(Integer id) {
		return (User)getSession().get(User.class, id);
	}

	
	public void modifyProfile(User user) {
		User user_=(User)getSession().get(User.class, user.getId());
		user_.setBirthday(user.getBirthday());
		user_.setCity(user.getCity());
		user_.setEmail(user.getEmail());
		user_.setGendar(user.getGendar());
		getSession().update(user_);
	}


}
