package xmc.cineplex.dao.impl;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xmc.cineplex.dao.BaseDao;
import xmc.cineplex.dao.FilmDao;
import xmc.cineplex.model.Film;


@Repository
public class FilmDaoImpl implements FilmDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.openSession();
	}
	
	
	
	public Film getFilm(String title) {
		String hql="from Film f where f.title=?";
		Query query=(Query) getSession().createQuery(hql);
		query.setString(0, title);
		List list=query.list();
		Film film=(Film)list.get(0);
		return film;
	}

	
	public void addNewFilm(Film film) {
		getSession().save(film);

	}

	
	public boolean searchFilm(String title) {
		String hql="from Film f where f.title=?";
		Query query=(Query) getSession().createQuery(hql);
		query.setString(0, title);
		List list=query.list();
		if(list.size()==0){
			return false;
		}
		return true;
	}

}
