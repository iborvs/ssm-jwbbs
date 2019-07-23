package com.uj.ssm.service;

import com.uj.ssm.pojo.User;

public interface UserService {

	public int userLogin(User loginUser);
	public int userRegister(User newUser);
	public int userFind(User findUser);
	public int userInfoUpdate(User login);
}
