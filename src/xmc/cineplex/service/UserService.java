package xmc.cineplex.service;

import xmc.cineplex.model.User;

public interface UserService {
	/**
	 * 注册新用户
	 * @return
	 */
	public boolean register(User user);
	/**
	 * 用户登录
	 * @return
	 */
	public User login(String name,String password);
	/**
	 * 修改个人资料
	 * @param user
	 */
	public void modifyProfile(User user);
	/**
	 * 会员向系统提出取消会员
	 * @param user
	 */
	public void cancelMember(User user);
	/**
	 * 
	 * @param id
	 * @return
	 */
	public User getUserById(Integer id);
}
