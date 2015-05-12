package xmc.cineplex.dao;

import xmc.cineplex.model.Film;

public interface FilmDao {
	/**
	 * 根据电影名得到电影的信息
	 * @param title
	 * @return
	 */
	public Film getFilm(String title);
	/**
	 * 添加新的电影入数据库
	 * @param film
	 */
	public void addNewFilm(Film film);
	/**
	 * 判断某影片是否已经在数据库中了
	 * @param title
	 * @return
	 */
	public boolean searchFilm(String title);
}
