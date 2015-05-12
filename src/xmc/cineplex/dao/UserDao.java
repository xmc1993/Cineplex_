package xmc.cineplex.dao;

import xmc.cineplex.model.Account;
import xmc.cineplex.model.User;

public interface UserDao {
	
	/**
	 * 保存新的用户
	 * @param user
	 */
	public void Save(User user);
	/**
	 * 登录使用
	 * @param id
	 * @param password
	 * @return
	 */
	public User getUser(String id,String password);
	/**
	 * 根据用户Id返回id
	 * @param id
	 * @return
	 */
	public User geyUserById(Integer id);
	/**
	 * 
	 * @param user
	 */
	public void modifyProfile(User user);
	
}
