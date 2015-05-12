package xmc.cineplex.model.list;

import java.io.Serializable;
import java.util.List;

import xmc.cineplex.model.Film;

public class FilmList implements Serializable{
	private List filmList;

	public List getFilmList() {
		return filmList;
	}

	public void setFilmList(List filmList) {
		this.filmList = filmList;
	}
	
	public Film getFilmList(int index){
		return (Film)filmList.get(index);
	}
}
