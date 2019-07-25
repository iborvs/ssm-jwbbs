package com.uj.ssm.service;

import com.uj.ssm.pojo.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	public int userLogin(User loginUser);
	public int userRegister(User newUser);
	public User userFind(User findUser);
	public int userInfoUpdate(User login);
	public boolean legalUser(HttpServletRequest request, User requestUser);
	public boolean ifLoggedin(HttpServletRequest request);
	public boolean ifAdmin(HttpServletRequest request);
	public boolean banUser(User banneduser);
	public boolean releaseUser(User banneduser);
}
